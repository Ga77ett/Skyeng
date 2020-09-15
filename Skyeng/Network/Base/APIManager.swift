//
//  APIManager.swift
//
//  Created by Kirill Shalankin on 18/06/2019.
//

import Alamofire

class APIManager {
    
    // MARK: - Vars & Lets
    
    private let sessionManager: Session
    static let networkEnviroment: NetworkEnvironment = .stage
    
    
    // MARK: - Public methods
    
    func makeRequest(type: EndPointType, params: Parameters? = nil, handler: @escaping (Swift.Result<(), AlertMessage>) -> Void) {
        self.sessionManager.request(type.url,
                                    method: type.httpMethod,
                                    parameters: params,
                                    encoding: type.encoding,
                                    headers: nil).validate().responseJSON { (data) in
                                        switch data.result {
                                        case .success(_):
                                            handler(.success(()))
                                            break
                                        case .failure(_):
                                            handler(.failure(self.parseApiError(data: data.data)))
                                            break
                                        }
        }
    }
    
    func makeRequest<T>(type: EndPointType, params: Parameters? = nil, handler: @escaping (Swift.Result<T, AlertMessage>) -> Void) where T: Codable {
        self.sessionManager.request(type.url,
                                    method: type.httpMethod,
                                    parameters: params,
                                    encoding: type.encoding,
                                    headers: nil).validate().responseJSON { (data) in
                                        #if DEBUG
                                            print("request - \(type.url), response - \(data)")
                                        #endif
                                        
                                        do {
                                            guard let jsonData = data.data else {
                                                throw AlertMessage(title: "Error", body: "No data")
                                            }
                                            let result = try JSONDecoder().decode(T.self, from: jsonData)
                                            handler(.success(result))
                                            self.resetNumberOfRetries()
                                            
                                        } catch {
                                            if let error = error as? AlertMessage {
                                                return handler(.failure(error))
                                            }
                                            
                                            handler(.failure(self.parseApiError(data: data.data)))
                                        }
        }
    }
    
    
    // MARK: - Private methods
    
    private func resetNumberOfRetries() {
    }
    
    private func parseApiError(data: Data?) -> AlertMessage {
        let decoder = JSONDecoder()
        if let jsonData = data, let error = try? decoder.decode(NetworkError.self, from: jsonData) {
            return AlertMessage(title: "Что-то пошло не так", body: error.key ?? error.message)
        }
        return AlertMessage(title: "Что-то пошло не так", body: "Неизвестная ошибка")
    }
    
    
    // MARK: - Initialization
    
    init(sessionManager: Session) {
        self.sessionManager = sessionManager
        self.sessionManager.session.configuration.timeoutIntervalForRequest = 15
    }
    
}

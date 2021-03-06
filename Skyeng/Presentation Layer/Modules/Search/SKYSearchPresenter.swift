//
//  SKYSearchPresenter.swift
//  Skyeng
//
//  Created Kirill Shalankin on 15.09.2020.
//  Copyright © 2020 Kirill Shalankin. All rights reserved.
//
//  Template generated by Kirill Shalankin
//

import UIKit

class SKYSearchPresenter: NSObject, SKYSearchModuleInput, SKYSearchViewOutput, SKYSearchInteractorOutput {

    // MARK: - Public vars & lets
    
    weak var view: SKYSearchViewInput?
    var interactor: SKYSearchInteractorInput?
    var router: SKYSearchRouterInput?
    
    
    // MARK: - Private vars & lets
    
    
    // MARK: - SKYSearchViewOutput
    
    func viewDidLoad() {
        
    }
    
    func textDidChange(text: String) {
        interactor?.doRequest(text: text)
    }
    
    func wordDidSelected(word: APIResponse.SKYWord) {
        router?.showWord(word: word)
    }
    
    
    // MARK: - SKYSearchInteractorOutput
    
    func response(data: [APIResponse.SKYWord]) {
        view?.configure(data: data)
    }
    
    func error(error: String) {
        // Вывод текста ошибки
    }

}

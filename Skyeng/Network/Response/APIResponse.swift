//
//  APIResponse.swift
//  Skyeng
//
//  Created by Kirill Shalankin on 15.09.2020.
//  Copyright © 2020 Kirill Shalankin. All rights reserved.
//

import UIKit

enum APIResponse {

    struct SKYWord: Codable {
        let id: Int
        let text: String
        let meanings: [Meaning]

        struct Meaning: Codable {
            let translation: Translation
            let imageUrl: String
            
            struct Translation: Codable {
                let text: String
            }
        }
    }
    
}

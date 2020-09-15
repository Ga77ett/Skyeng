//
//  SKYWordPresenter.swift
//  Skyeng
//
//  Created Kirill Shalankin on 15.09.2020.
//  Copyright © 2020 Kirill Shalankin. All rights reserved.
//
//  Template generated by Kirill Shalankin
//

import UIKit

class SKYWordPresenter: NSObject, SKYWordModuleInput, SKYWordViewOutput, SKYWordInteractorOutput {

    // MARK: - Public vars & lets
    
    weak var view: SKYWordViewInput?
    var interactor: SKYWordInteractorInput?
    var router: SKYWordRouterInput?
    
    
    // MARK: - Private vars & lets
    
    private var word: APIResponse.SKYWord?
    
    
    // MARK: - SKYWordModuleInput
    
    func configure(word: APIResponse.SKYWord) {
        self.word = word
    }
    
    
    // MARK: - SKYWordViewOutput
    
    func viewDidLoad() {
        view?.configure(word: word!)
    }

}

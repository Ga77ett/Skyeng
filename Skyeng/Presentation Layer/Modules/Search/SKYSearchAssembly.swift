//
//  SKYSearchAssembly.swift
//  Skyeng
//
//  Created Kirill Shalankin on 15.09.2020.
//  Copyright © 2020 Kirill Shalankin. All rights reserved.
//
//  Template generated by Kirill Shalankin
//

import UIKit

class SKYSearchAssembly: NSObject {
        
    class func createModule(viewController: SKYSearchViewController) {
        let presenter = SKYSearchPresenter()
        let interactor = SKYSearchInteractor()
        let router = SKYSearchRouter()
        let dataManager = SKYSearchDataManager()
        
        viewController.output = presenter
        viewController.dataManager = dataManager
        dataManager.view = viewController
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        router.viewController = viewController
    }
}
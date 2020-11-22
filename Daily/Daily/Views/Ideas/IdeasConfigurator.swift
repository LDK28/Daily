//
//  IdeasConfigurator.swift
//  Daily
//
//  Created by julie on 21.11.2020.
//

import UIKit

class IdeasModule {
    static func build() -> IdeasVC {
        
        let dataSource = [IdeasCellViewModel(title: "Notes", hasStatistics: false)]
        
        let viewController = IdeasVC()
        let presenter = IdeasPresenter(viewController: viewController)
        let interactor = IdeasInteractor(presenter: presenter, dataSource: dataSource)
        let router = IdeasRouter(viewController: viewController, dataStore: interactor)
        
        
        //presenter.dataSource = dataSource
        //presenter.viewController = viewController
        
        //let router = IdeasRouter()
        //router.viewController = viewController
        viewController.router = router
        
        //interactor.dataSource = dataSource
        //interactor.presenter = presenter
        //router.dataStore = interactor
        viewController.interactor = interactor
        
        return viewController
    }
}

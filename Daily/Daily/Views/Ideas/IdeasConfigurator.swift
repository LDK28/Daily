//
//  IdeasConfigurator.swift
//  Daily
//
//  Created by julie on 21.11.2020.
//

import UIKit

class IdeasModule {
    static func build() -> IdeasVC {
        
        let dataSource = [IdeasCellViewModel(title: "Notes"), IdeasCellViewModel(title: "Projects", hasStatistics: true)]
        
        let viewController = IdeasVC()
        let presenter = IdeasPresenter(viewController: viewController)
        let interactor = IdeasInteractor(presenter: presenter, dataSource: dataSource)
        let router = IdeasRouter(viewController: viewController, dataStore: interactor)
        
        viewController.router = router
        viewController.interactor = interactor
        
        return viewController
    }
}

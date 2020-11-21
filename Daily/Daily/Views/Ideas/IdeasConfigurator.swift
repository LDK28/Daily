//
//  IdeasConfigurator.swift
//  Daily
//
//  Created by julie on 21.11.2020.
//

import UIKit

class IdeasModule {
    static func build() -> IdeasVC {
        
        let dataSource = IdeasDataSource(ideasCellViewModels: [
                                            IdeasCellViewModel(title: "Notes", hasStatistics: false),
                                            IdeasCellViewModel(title: "Projects", hasStatistics: false) ])
        
        let viewController = IdeasVC()
        let interactor = IdeasInteractor()
        
        let presenter = IdeasPresenter()
        presenter.dataSource = dataSource
        presenter.viewController = viewController
        
        let router = IdeasRouter()
        router.viewController = viewController
        viewController.router = router
        
        interactor.dataSource = dataSource
        interactor.presenter = presenter
        router.dataStore = interactor
        viewController.interactor = interactor
        
        
        
        return viewController
    }
}

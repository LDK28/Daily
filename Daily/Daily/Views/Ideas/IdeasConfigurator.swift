//
//  IdeasConfigurator.swift
//  Daily
//
//  Created by julie on 21.11.2020.
//

import UIKit

class IdeasModule {
    static func build() -> IdeasVC {
        
        let doneProjects: Int = 2
        let missedProjects: Int = 1
        
        let dataSource = [IdeasCellViewModel(title: "Notes"),
                          IdeasCellViewModel(title: "Projects", doneProjects: doneProjects, missedProjects: missedProjects)]
        
        let viewController = IdeasVC()
        let presenter = IdeasPresenter(viewController: viewController)
        let interactor = IdeasInteractor(presenter: presenter, dataSource: dataSource)
        let router = IdeasRouter(viewController: viewController, dataStore: interactor)
        
        viewController.router = router
        viewController.interactor = interactor
        
        return viewController
    }
}

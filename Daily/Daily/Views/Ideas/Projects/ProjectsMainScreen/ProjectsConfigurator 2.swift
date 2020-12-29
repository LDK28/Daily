//
//  ProjectsConfigurator.swift
//  Daily
//
//  Created by julie on 08.12.2020.
//

import UIKit

class ProjectsModule {
	static func build() -> ProjectsVC {
        
        let viewController = ProjectsVC()
        let presenter = ProjectsPresenter(viewController: viewController)
        let interactor = ProjectsInteractor(presenter: presenter)
        let router = ProjectsRouter(viewController: viewController, dataStore: interactor)
        
        viewController.router = router
        viewController.interactor = interactor
        
        return viewController
	}
}

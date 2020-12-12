//
//  EditProjectConfigurator.swift
//  Daily
//
//  Created by julie on 12.12.2020.
//

import UIKit

class EditProjectModule {
    static func build() -> EditProjectVC {
        
        let viewController = EditProjectVC()
        let presenter = EditProjectPresenter(viewController: viewController)
        let interactor = EditProjectInteractor(presenter: presenter)
        let router = EditProjectRouter()
        
        viewController.router = router
        viewController.interactor = interactor
        
        return viewController
	}
}

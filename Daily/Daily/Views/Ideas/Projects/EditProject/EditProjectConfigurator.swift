//
//  EditProjectConfigurator.swift
//  Daily
//
//  Created by julie on 12.12.2020.
//

import UIKit

class EditProjectModule {
	static func build() -> EditProjectVC {
		//let dataSource = ...
		let viewController = EditProjectVC()
		let interactor = EditProjectInteractor()
		
		let presenter = EditProjectPresenter()
		//presenter.dataSource = dataSource
		presenter.viewController = viewController
		
		let router = EditProjectRouter()
		router.viewController = viewController
		viewController.router = router
		
		//interactor.dataSource = dataSource
		interactor.presenter = presenter
		router.dataStore = interactor
		viewController.interactor = interactor
		
		
		
		return viewController
	}
}

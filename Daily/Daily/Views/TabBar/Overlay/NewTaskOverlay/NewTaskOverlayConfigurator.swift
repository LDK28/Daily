//
//  NewTaskOverlayConfigurator.swift
//  Daily
//
//  Created by Арсений Токарев on 17.11.2020.
//

import UIKit

class NewTaskOverlayModule {
	static func build() -> NewTaskOverlayVC {
		let dataSource = NewTaskOverlayDataSource(sectionViewModels: [
			DateAndAssignableTimeSectionViewModel(),
			RemindViewModel(),
			RepeatViewModel()
		])
		
		let viewController = NewTaskOverlayVC()
		let interactor = NewTaskOverlayInteractor()
		
		let presenter = NewTaskOverlayPresenter()
		presenter.dataSource = dataSource
		presenter.viewController = viewController
		
		let router = NewTaskOverlayRouter()
		router.viewController = viewController
		viewController.router = router
		
		interactor.dataSource = dataSource
		interactor.presenter = presenter
		router.dataStore = interactor
		viewController.interactor = interactor
		
		
		
		return viewController
	}
}

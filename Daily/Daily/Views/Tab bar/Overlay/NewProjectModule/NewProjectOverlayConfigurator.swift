//
//  NewProjectOverlayConfigurator.swift
//  Daily
//
//  Created by Арсений Токарев on 08.11.2020.
//

import UIKit

class NewProjectModule {
	static func build() -> UIViewController {
		let dataSource = NewProjectOverlayDataSource(items: [
			NewProjectViewModelTeamProjectItem(),
			NewProjectViewModelDateAndTimeItem()
		])
		
		let viewController = NewProjectOverlayVC()
		let presenter = NewProjectOverlayPresenter(dataSource: dataSource, view: viewController)
		let interactor = NewProjectOverlayInteractor(dataSource: dataSource, presenter: presenter)
	
		viewController.interactor = interactor
		
		return viewController
		
	}
}

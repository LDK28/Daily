//
//  NewTaskConfigurator.swift
//  Daily
//
//  Created by Арсений Токарев on 05.11.2020.
//

import UIKit

class NewTaskOverlayModule {
	static func build() -> UIViewController {
		let dataSource = NewTaskOverlayDataSource(items: [
			NewTaskViewModelDateAndTimeItem(),
			NewTaskViewModelRemindAlertItem(),
			NewTaskViewModelRepeatSelectorItem()
		])
		
		let viewController = NewTaskOverlayVC()
		let presenter = NewTaskOverlayPresenter(dataSource: dataSource, view: viewController)
		let interactor = NewTaskOverlayInteractor(dataSource: dataSource, presenter: presenter)
	
		viewController.interactor = interactor
		
		return viewController
		
	}
}

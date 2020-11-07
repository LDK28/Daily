//
//  NewTaskConfigurator.swift
//  Daily
//
//  Created by Арсений Токарев on 05.11.2020.
//

import UIKit

class NewTaskOverlayModule {
	static func build() -> UIViewController {
		let model = NewTaskModel()
		
		let viewController = NewTaskOverlayVC()
		
		let presenter = NewTaskOverlayPresenter()
		presenter.view = viewController
		
		let interactor = NewTaskOverlayInteractor()
		interactor.presenter = presenter
		
		viewController.interactor = interactor
		
		return viewController
		
	}
}

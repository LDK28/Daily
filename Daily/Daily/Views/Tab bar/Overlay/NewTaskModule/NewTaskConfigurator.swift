//
//  NewTaskConfigurator.swift
//  Daily
//
//  Created by Арсений Токарев on 05.11.2020.
//

import UIKit

class NewTaskOverlayModule {
	static func build() -> UIViewController {
		let model = NewTaskViewModel()
		let viewController = NewTaskOverlayVC()
		let presenter = NewTaskOverlayPresenter(model: model, view: viewController)
		let interactor = NewTaskOverlayInteractor(model: model, presenter: presenter)
		
		viewController.interactor = interactor
		
		return viewController
		
	}
}

//
//  OverlayConfigurator.swift
//  Daily
//
//  Created by Арсений Токарев on 17.11.2020.
//

import UIKit

class OverlayModule {
	static func build() -> OverlayVC {
		let viewController = OverlayVC()
		let interactor = OverlayInteractor()
		
		let presenter = OverlayPresenter()
		presenter.viewController = viewController
		
		interactor.presenter = presenter
		viewController.interactor = interactor
		
		return viewController
	}
}

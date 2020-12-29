//
//  CalendarConfigurator.swift
//  Daily
//
//  Created by julie on 28.12.2020.
//

import UIKit

class CalendarModule {
	static func build() -> CalendarVC {
        
        let viewController = CalendarVC()
        let presenter = CalendarPresenter(viewController)
        let interactor = CalendarInteractor(presenter)
        let router = CalendarRouter(viewController, interactor)
        
        viewController.router = router
        viewController.interactor = interactor
        
        return viewController
	}
}

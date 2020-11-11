//
//  NewNoteOverlayConfigurator.swift
//  Daily
//
//  Created by Арсений Токарев on 08.11.2020.
//

import UIKit

class NewNoteOverlayModule {
	static func build() -> UIViewController {
		
		let viewController = NewNoteOverlayVC()
		let dataSource = NewNoteOverlayDataSource()
		let presenter = NewNoteOverlayPresenter(view: viewController)
		let interactor = NewNoteOverlayInteractor(dataSource: dataSource, presenter: presenter)
		viewController.interactor = interactor
		
		return viewController
	}
}

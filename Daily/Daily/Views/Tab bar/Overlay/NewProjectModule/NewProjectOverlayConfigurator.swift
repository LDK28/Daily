//
//  NewProjectOverlayConfigurator.swift
//  Daily
//
//  Created by Арсений Токарев on 08.11.2020.
//

import UIKit

class NewProjectOverlayModule {
	static func build() -> UIViewController {
		let dataSource = NewProjectOverlayDataSource(
			sectionViewModels: [
				TeamProjectSectionViewModel(),
				AssignableDateAndTimeSectionViewModel()
		])
		
		let viewController = NewProjectOverlayVC()
		let presenter = NewProjectOverlayPresenter(view: viewController, dataSource: dataSource)
		let interactor = NewProjectOverlayInteractor(dataSource: dataSource, presenter: presenter)
	
		viewController.interactor = interactor
		
		return viewController
		
	}
}

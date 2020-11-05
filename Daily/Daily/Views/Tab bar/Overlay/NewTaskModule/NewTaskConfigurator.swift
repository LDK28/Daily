//
//  NewTaskConfigurator.swift
//  Daily
//
//  Created by Арсений Токарев on 05.11.2020.
//

import UIKit

class NewNoteOverlayModule {
	static func build() -> UIViewController {
		let model = NewTaskOverlayModel(with: "Create new task")
		
		let viewController = NewTaskOverlayVC()
		//let presenter =
		//let interactor =
		
		return viewController
	}
}

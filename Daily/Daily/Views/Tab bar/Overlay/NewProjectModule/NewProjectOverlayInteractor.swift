//
//  NewProjectOverlayInteractor.swift
//  Daily
//
//  Created by Арсений Токарев on 08.11.2020.
//

import UIKit

protocol NewProjectOverlayBusinessLogic: OverlayBusinessLogic {
	func didToggleDateSwitcher()
}

class NewProjectOverlayInteractor: OverlayInteractor {
}



extension NewProjectOverlayInteractor: NewProjectOverlayBusinessLogic {
	func didToggleDateSwitcher() {
	}	
}

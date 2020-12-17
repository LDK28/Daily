//
//  NewTaskOverlayRouter.swift
//  Daily
//
//  Created by Арсений Токарев on 17.11.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

class NewTaskOverlayRouter: NewTaskOverlayDataPassing {
	
  weak var viewController: NewTaskOverlayVC?
  weak var dataStore: OverlayDataStore?
  
}

extension NewTaskOverlayRouter: NewTaskOverlayRoutingLogic {
    func navigateToDiary() {
        guard let tabBarController = viewController?.tabBarController else { return }
        tabBarController.selectedIndex = 0
        return
    }
}

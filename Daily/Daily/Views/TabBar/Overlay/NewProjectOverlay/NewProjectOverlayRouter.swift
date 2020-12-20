//
//  NewProjectOverlayRouter.swift
//  Daily
//
//  Created by Арсений Токарев on 17.11.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

class NewProjectOverlayRouter: NewProjectOverlayDataPassing {
    
  weak var viewController: NewProjectOverlayVC?
  weak var dataStore: OverlayDataStore?
  
}

extension NewProjectOverlayRouter: NewProjectOverlayRoutingLogic {
    func navigateToProjects() {
//        guard let tabBarController = viewController?.tabBarController else { return }
//        if tabBarController.selectedIndex == 1 {
//            tabBarController.selectedIndex = 0
//            tabBarController.selectedIndex = 2
//            return
//        }
//        tabBarController.selectedIndex = 2
    }
}

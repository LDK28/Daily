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
	
}

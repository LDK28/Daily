//
//  NewNoteOverlayRouter.swift
//  Daily
//
//  Created by Арсений Токарев on 17.11.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

class NewNoteOverlayRouter: NewNoteOverlayDataPassing {
	
  weak var viewController: NewNoteOverlayVC?
  weak var dataStore: OverlayDataStore?
  
}

extension NewNoteOverlayRouter: NewNoteOverlayRoutingLogic {
	
}

//
//  CalendarRouter.swift
//  Daily
//
//  Created by julie on 28.12.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit

class CalendarRouter: CalendarDataPassing {
	
	weak var viewController: CalendarVC?
	weak var dataStore: CalendarDataStore?
  
}

extension CalendarRouter: CalendarRoutingLogic {
	
}

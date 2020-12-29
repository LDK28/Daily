//
//  CalendarPresenter.swift
//  Daily
//
//  Created by julie on 28.12.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit

class CalendarPresenter: CalendarDataStore {
	weak var viewController: CalendarDisplayLogic?
    
    init(_ viewController: CalendarDisplayLogic?) {
        self.viewController = viewController
    }
	
}

extension CalendarPresenter: CalendarPresentationLogic {
	func presentSomething() {
		
	}
}

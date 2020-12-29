//
//  CalendarInteractor.swift
//  Daily
//
//  Created by julie on 28.12.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit

class CalendarInteractor: CalendarDataStore {
	var presenter: CalendarPresentationLogic?
    
    init(_ presenter: CalendarPresentationLogic?) {
        self.presenter = presenter
    }
}

extension CalendarInteractor: CalendarBusinessLogic {
	func doSomething() {
		
	}
}

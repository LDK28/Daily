//
//  CalendarProtocols.swift
//  Daily
//
//  Created by julie on 28.12.2020.
//

import UIKit

protocol CalendarDisplayLogic: AnyObject {
  func displaySomething()
}

protocol CalendarBusinessLogic {
  func doSomething()
}

protocol CalendarDataStore: AnyObject {
	
}

protocol CalendarPresentationLogic {
  func presentSomething()
}

protocol CalendarRoutingLogic {
	
}

protocol CalendarDataPassing {
	var dataStore: CalendarDataStore? { get }
}

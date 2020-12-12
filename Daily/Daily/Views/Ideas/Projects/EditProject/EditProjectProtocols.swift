//
//  EditProjectProtocols.swift
//  Daily
//
//  Created by julie on 12.12.2020.
//

import UIKit

protocol EditProjectDisplayLogic: AnyObject {
  func displaySomething()
}

protocol EditProjectBusinessLogic {
  func doSomething()
}

protocol EditProjectDataStore: AnyObject {
	
}

protocol EditProjectPresentationLogic {
  func presentSomething()
}

protocol EditProjectRoutingLogic {
	
}

protocol EditProjectDataPassing {
	var dataStore: EditProjectDataStore? { get }
}

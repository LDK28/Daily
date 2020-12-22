//
//  EditTaskProtocols.swift
//  Daily
//
//  Created by Владимир Проценко on 23.12.2020.
//

import UIKit

protocol EditTaskDisplayLogic: AnyObject {
  func displaySomething()
}

protocol EditTaskBusinessLogic {
  func doSomething()
}

protocol EditTaskDataStore: AnyObject {
	
}

protocol EditTaskPresentationLogic {
  func presentSomething()
}

protocol EditTaskRoutingLogic {
	
}

protocol EditTaskDataPassing {
	var dataStore: EditTaskDataStore? { get }
}

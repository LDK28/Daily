//
//  ProjectsProtocols.swift
//  Daily
//
//  Created by julie on 08.12.2020.
//

import UIKit

protocol ProjectsDisplayLogic: class {
  func displaySomething()
}

protocol ProjectsBusinessLogic {
  func doSomething()
}

protocol ProjectsDataStore {
	
}

protocol ProjectsPresentationLogic {
  func presentSomething()
}

protocol ProjectsRoutingLogic {
	//func navigateTo()
}

protocol ProjectsDataPassing {
	//variable to transfer between screens
	var dataStore: ProjectsDataStore? { get }
}

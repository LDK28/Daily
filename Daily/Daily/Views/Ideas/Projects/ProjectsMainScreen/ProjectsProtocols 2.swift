//
//  ProjectsProtocols.swift
//  Daily
//
//  Created by julie on 08.12.2020.
//

import UIKit

protocol ProjectsDisplayLogic: class {
    func display()
    var cellsToDisplay: [MainCellViewModel] { get set }
}

protocol ProjectsBusinessLogic {
    func fetchCells()
}

protocol ProjectsDataStore {
	
}

protocol ProjectsPresentationLogic {
    func present()
}

protocol ProjectsRoutingLogic {
	//func navigateTo()
}

protocol ProjectsDataPassing {
	//variable to transfer between screens
	var dataStore: ProjectsDataStore? { get }
}

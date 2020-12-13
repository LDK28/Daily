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
    func fetchLatestData()
    func fetchCells()
}

protocol ProjectsDataStore {
	
}

protocol ProjectsPresentationLogic {
    func present(projects: [ProjectBackendModel])
}

protocol ProjectsRoutingLogic {
    func navigateTo(project: ProjectBackendModel)
}

protocol ProjectsDataPassing {
	//variable to transfer between screens
	var dataStore: ProjectsDataStore? { get }
}

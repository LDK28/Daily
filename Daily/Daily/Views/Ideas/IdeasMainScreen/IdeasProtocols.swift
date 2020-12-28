//
//  IdeasProtocols.swift
//  Daily
//
//  Created by julie on 21.11.2020.
//

import UIKit

enum IdeasNavigationDestination {
    case notes, projects
}

protocol IdeasBusinessLogic {
    func fetchCells()
    func getProjectInfo()
}

protocol IdeasPresentationLogic {
    func present(doneProjects: Int, missedProjects: Int, recents: [String])
}

protocol IdeasDisplayLogic: AnyObject {
    var cellsToDisplay: [MainCellViewModel] { get set }
    func display()
}

protocol IdeasDataStore: AnyObject {
}

protocol IdeasRoutingLogic {
    func navigateTo(_ destination: IdeasNavigationDestination)
}

protocol IdeasDataPassing {
    var dataStore: IdeasDataStore? { get }
}

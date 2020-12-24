//
//  EditProjectProtocols.swift
//  Daily
//
//  Created by julie on 12.12.2020.
//

import UIKit

protocol EditProjectDisplayLogic: AnyObject {
    func display()
    func getProject(_ project: ProjectBackendModel)
    var cellsToDisplay: [MainCellViewModel] { get set }
}

protocol EditProjectBusinessLogic {
    func fetchProjectData()
    func askPresenterToAddNewItem()
    func updateItem(projectItemViewModel: ProjectItemViewModel, index: Int)
    func updateProjectName(projectName: String)
    func deleteProject()
}

protocol EditProjectDataStore: AnyObject {
    var projectBackendModel: ProjectBackendModel? { get set }
    var index: Int? { get set }
}

protocol EditProjectPresentationLogic {
    func presentProject(_ project: ProjectBackendModel)
}

protocol EditProjectRoutingLogic {
}

protocol EditProjectDataPassing {
    var dataStore: EditProjectDataStore? { get }
    func getProjectModel(project: ProjectBackendModel, index: Int)
}

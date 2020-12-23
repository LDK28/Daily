//
//  EditProjectInteractor.swift
//  Daily
//
//  Created by julie on 12.12.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit

class EditProjectInteractor: EditProjectDataStore {
    
    var projectBackendModel: ProjectBackendModel?
    var presenter: EditProjectPresentationLogic?
    var index: Int?
    
    init(_ presenter: EditProjectPresenter) {
        self.presenter = presenter
    }
    
}

extension EditProjectInteractor: EditProjectBusinessLogic {
    
    func fetchProjectData() {
        guard let project = projectBackendModel else { return }
        presenter?.presentProject(project)
    }
    
    func askPresenterToAddNewItem() {
        projectBackendModel?.items.append(ProjectItem(headerTitle: "",
                                         isDone: false))
        updateProject()
        fetchProjectData()
    }
    
    func updateItem(projectItemViewModel: ProjectItemViewModel, index: Int) {
        projectBackendModel?.items[index].headerTitle = projectItemViewModel.headerTitle
        projectBackendModel?.items[index].isDone = projectItemViewModel.isDone
        updateProject()
    }
    
    func updateProjectName(projectName: String) {
        projectBackendModel?.title = projectName
        updateProject()
    }
    
    func updateProject() {
        if let project = projectBackendModel,
           let projectIndex = self.index {
            UserRequest.shared.update(project,
                                      at: projectIndex) { result in
                switch result {
                case .failure(let error):
                    debugPrint(error.localizedDescription)
                default:
                    return
                }
            }
        }
    }
    
}

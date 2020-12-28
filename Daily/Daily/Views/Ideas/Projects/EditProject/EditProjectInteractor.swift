//
//  EditProjectInteractor.swift
//  Daily
//
//  Created by julie on 12.12.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit

class EditProjectInteractor: EditProjectDataStore {
    
    var projectBackendModels = [ProjectBackendModel]()
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
    
    func deleteProjectItems(index: Int) {
        if let project = projectBackendModel {
            project.items.remove(at: index)
            updateProject()
            presenter?.presentProject(project)
        }
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
    
    func deleteProject() {
        UserRequest.shared.getProjects { result in
            switch result {
            case .success(let projects):
                self.projectBackendModels = projects
            default:
                return
            }
        }
        if let projectIndex = self.index {
            UserRequest.shared.update(projectBackendModels.remove(at: [projectIndex])) { [weak self] result in
               guard let self = self else { return }
               switch result {
               case .success(()):
                return
               case .failure(let error):
                   debugPrint(error.localizedDescription)
               }
           }
            presenter?.removeProject()
        }
    }
    
}

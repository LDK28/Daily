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
        if let project = projectBackendModel,
           let projectIndex = index {
            project.items.append(ProjectItem(headerTitle: "new item",
                                             isDone: false,
                                             subItems: []))
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
        fetchProjectData()
    }
    
    func updateItem(_ projectItemViewModel: ProjectItemViewModel) {
        
        let itemID = projectItemViewModel.itemID
        
        for item in projectBackendModel?.items ?? [] {
            if item.itemID == itemID {
                item.headerTitle = projectItemViewModel.headerTitle
                item.isDone = projectItemViewModel.isDone
                item.subItems = projectItemViewModel.subItems
            }
        }
        
        if let project = projectBackendModel,
           let projectIndex = index {
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

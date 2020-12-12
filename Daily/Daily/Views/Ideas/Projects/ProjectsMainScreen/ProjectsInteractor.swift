//
//  ProjectsInteractor.swift
//  Daily
//
//  Created by julie on 08.12.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

class ProjectsInteractor: ProjectsDataStore {
    
    var projectBackendModels = [ProjectBackendModel]()
    var presenter: ProjectsPresentationLogic?
    
    init(presenter: ProjectsPresentationLogic?) {
        self.presenter = presenter
    }
}

extension ProjectsInteractor: ProjectsBusinessLogic {
    func fetchLatestData() {
        UserRequest.shared.getProjects { result in
            switch result {
            case .success(let projects):
                self.projectBackendModels = projects
            default:
                /* handle errors lateron if needed */
                return
            }
        }
    }
    
	func fetchCells() {
        presenter?.present()
	}
}

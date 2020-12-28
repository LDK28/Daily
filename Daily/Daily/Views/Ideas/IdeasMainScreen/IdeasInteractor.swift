//
//  IdeasInteractor.swift
//  Daily
//
//  Created by julie on 21.11.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

class IdeasInteractor: IdeasDataStore {
    
    var doneProjects = 0
    var missedProjects = 0
    var doneProjectNames = [String]()
    var projects = [ProjectBackendModel]()
    private var presenter: IdeasPresentationLogic?
        
    init(presenter: IdeasPresentationLogic?) {
        self.presenter = presenter
    }
}

extension IdeasInteractor: IdeasBusinessLogic {
    func fetchCells() {
        presenter?.present(doneProjects: doneProjects, missedProjects: missedProjects, recents: doneProjectNames)
    }
    func getProjectInfo() {
        UserRequest.shared.getProjects { result in
            switch result {
            case .success(let projects):
                self.projects = projects
            default:
                return
            }
        }
        doneProjects = 0
        missedProjects = 0
        doneProjectNames = []
        for project in projects {
            let projectIsDone = project.items.allSatisfy( {$0.isDone == true })
            if projectIsDone {
                doneProjects += 1
                doneProjectNames.append(project.title)
            } else {
                missedProjects += 1
            }
        }
    }
}

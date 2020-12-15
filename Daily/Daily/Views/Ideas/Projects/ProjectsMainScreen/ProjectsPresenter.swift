//
//  ProjectsPresenter.swift
//  Daily
//
//  Created by julie on 08.12.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

class ProjectsPresenter: ProjectsDataStore {
    
    weak var viewController: ProjectsDisplayLogic?
    var projectTitles = [String]()
	
    init(viewController: ProjectsDisplayLogic?) {
        self.viewController = viewController
    }
}

extension ProjectsPresenter: ProjectsPresentationLogic {
    func present(projects: [ProjectBackendModel]) {
        viewController?.cellsToDisplay.removeAll()
        
        for project in projects {
            viewController?.cellsToDisplay.append(ProjectsCellViewModel(cellType: ProjectsCell.self,
                                                                        model: project))
        }
        
        viewController?.display()
	}
}

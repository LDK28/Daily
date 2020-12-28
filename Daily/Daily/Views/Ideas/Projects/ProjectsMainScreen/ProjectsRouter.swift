//
//  ProjectsRouter.swift
//  Daily
//
//  Created by julie on 08.12.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

class ProjectsRouter: ProjectsDataPassing {
    
  weak var viewController: ProjectsVC?
  var dataStore: ProjectsDataStore?
    
    init(viewController: ProjectsVC?, dataStore: ProjectsDataStore?) {
            self.dataStore = dataStore
            self.viewController = viewController
        }
}

extension ProjectsRouter: ProjectsRoutingLogic {
    func navigateTo(project: ProjectBackendModel, index: Int) {
        let vc = EditProjectModule.build()
        vc.router?.getProjectModel(project: project, index: index)
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
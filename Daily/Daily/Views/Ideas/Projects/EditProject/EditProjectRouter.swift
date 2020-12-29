//
//  EditProjectRouter.swift
//  Daily
//
//  Created by julie on 12.12.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit

class EditProjectRouter: EditProjectDataPassing {
    
    weak var viewController: EditProjectVC?
    weak var dataStore: EditProjectDataStore?
    
    init(viewController: EditProjectVC?, dataStore: EditProjectDataStore?) {
            self.dataStore = dataStore
            self.viewController = viewController
        }
  
}

extension EditProjectRouter: EditProjectRoutingLogic {
    func getProjectModel(project: ProjectBackendModel, index: Int) {
        dataStore?.projectBackendModel = project
        dataStore?.index = index
    }
}

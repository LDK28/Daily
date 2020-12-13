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
    
    init(_ presenter: EditProjectPresenter) {
        self.presenter = presenter
        
    }
    
}

extension EditProjectInteractor: EditProjectBusinessLogic {
    func fetchProjectData() {
        guard let project = projectBackendModel else { return }
        presenter?.presentProject(project)
    }
}

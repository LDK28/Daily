//
//  ProjectsInteractor.swift
//  Daily
//
//  Created by julie on 08.12.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

class ProjectsInteractor: ProjectsDataStore {
  var presenter: ProjectsPresentationLogic?
    
    init(presenter: ProjectsPresentationLogic?) {
        self.presenter = presenter
    }
}

extension ProjectsInteractor: ProjectsBusinessLogic {
	func doSomething() {
		
	}
}

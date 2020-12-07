//
//  ProjectsPresenter.swift
//  Daily
//
//  Created by julie on 08.12.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

class ProjectsPresenter: ProjectsDataStore {
  weak var viewController: ProjectsDisplayLogic?
	
    init(viewController: ProjectsDisplayLogic?) {
        self.viewController = viewController
    }
}

extension ProjectsPresenter: ProjectsPresentationLogic {
	func presentSomething() {
		
	}
}

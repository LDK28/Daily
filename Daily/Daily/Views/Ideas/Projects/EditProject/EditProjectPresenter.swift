//
//  EditProjectPresenter.swift
//  Daily
//
//  Created by julie on 12.12.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit

class EditProjectPresenter {
	weak var viewController: EditProjectDisplayLogic?
    
    init(_ viewController: EditProjectDisplayLogic?) {
        self.viewController = viewController
    }
}

extension EditProjectPresenter: EditProjectPresentationLogic {
	func presentProject(_ project: ProjectBackendModel) {
        viewController?.display(project: project)
	}
}

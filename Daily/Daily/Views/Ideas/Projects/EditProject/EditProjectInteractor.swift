//
//  EditProjectInteractor.swift
//  Daily
//
//  Created by julie on 12.12.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit

class EditProjectInteractor: EditProjectDataStore {
    //var project: ProjectBackendModel
	var presenter: EditProjectPresentationLogic?
    
    init(presenter: EditProjectPresentationLogic?) {
        self.presenter = presenter
        //project = 
    }
}

extension EditProjectInteractor: EditProjectBusinessLogic {
	func doSomething() {
		
	}
}

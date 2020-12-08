//
//  IdeasInteractor.swift
//  Daily
//
//  Created by julie on 21.11.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

class IdeasInteractor: IdeasDataStore {
    
    private var presenter: IdeasPresentationLogic?
        
    init(presenter: IdeasPresentationLogic?) {
        self.presenter = presenter
    }
}

extension IdeasInteractor: IdeasBusinessLogic {
    func fetchCells() {
        presenter?.present()
    }
}
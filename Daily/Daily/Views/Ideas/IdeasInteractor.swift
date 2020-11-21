//
//  IdeasInteractor.swift
//  Daily
//
//  Created by julie on 21.11.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

class IdeasInteractor: IdeasDataStore {
    var dataSource = IdeasDataSource()
    var presenter: IdeasPresentationLogic?
}

extension IdeasInteractor: IdeasBusinessLogic {
    func fetchCells() {
            presenter?.present()
        }
}

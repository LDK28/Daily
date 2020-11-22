//
//  IdeasInteractor.swift
//  Daily
//
//  Created by julie on 21.11.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

class IdeasInteractor: IdeasDataStore {
    internal var dataSource: [IdeasCellViewModel]
    private var presenter: IdeasPresentationLogic?
        
    init(presenter: IdeasPresentationLogic?, dataSource: [IdeasCellViewModel]) {
        self.dataSource = dataSource
        self.presenter = presenter
    }
}

extension IdeasInteractor: IdeasBusinessLogic {
    func fetchCells() {
        presenter?.present(ideasCells: dataSource)
    }
}

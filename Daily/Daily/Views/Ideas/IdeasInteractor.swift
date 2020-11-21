//
//  IdeasInteractor.swift
//  Daily
//
//  Created by julie on 21.11.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol IdeasBusinessLogic {
  func getCellTitles()
}

class IdeasInteractor: IdeasDataStore {
    var presenter: IdeasPresentationLogic?
}

extension IdeasInteractor: IdeasBusinessLogic {
    func getCellTitles() {
        
        var cellTitles = [String]()
        cellTitles.append(IdeasCells.notesCell)
        cellTitles.append(IdeasCells.projectsCell)
        
        presenter?.present(data: cellTitles)
    }
}

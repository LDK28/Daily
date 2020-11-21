//
//  IdeasPresenter.swift
//  Daily
//
//  Created by julie on 21.11.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol IdeasPresentationLogic {
  func present(data: [String])
}

class IdeasPresenter: IdeasDataStore {
    weak var viewController: IdeasDisplayLogic?
    
}

extension IdeasPresenter: IdeasPresentationLogic {
    func present(data: [String]) {
        viewController?.display(cellTitles: data)
    }
}

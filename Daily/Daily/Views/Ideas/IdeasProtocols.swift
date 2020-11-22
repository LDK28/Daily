//
//  IdeasProtocols.swift
//  Daily
//
//  Created by julie on 21.11.2020.
//

import UIKit

protocol IdeasBusinessLogic {
    func fetchCells()
}

protocol IdeasPresentationLogic {
    func present(ideasCells: [IdeasCellViewModel])
}

protocol IdeasDisplayLogic: AnyObject {
    var cellsToDisplay: [IdeasCell] { get set }
    func display()
}

protocol IdeasDataStore: AnyObject {
    var dataSource: [IdeasCellViewModel] { get set }
}

protocol IdeasRoutingLogic {
    
}

protocol IdeasDataPassing {
    var dataStore: IdeasDataStore? { get }
}

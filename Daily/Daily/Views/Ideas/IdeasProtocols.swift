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
    func present()
}

protocol IdeasDisplayLogic: class {
    func display()
    var cellsToDisplay: [IdeasCell] { get set }
}

protocol IdeasDataStore: AnyObject {
    var dataSource: IdeasDataSource { get set }
}

protocol IdeasRoutingLogic {
    
}

protocol IdeasDataPassing {
    var dataStore: IdeasDataStore? { get }
}

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
    func present(buttonCells: [IdeasCellViewModel], recentActions: RecentActionsViewModel)
}

protocol IdeasDisplayLogic: AnyObject {
    var buttonsCells: [IdeasCell] { get set }
    var recentActionsCell: RecentActionsCell { get set }
    func display()
}

protocol IdeasDataStore: AnyObject {
    var ideasCells: [IdeasCellViewModel] { get set }
    var recentActionsCell: RecentActionsViewModel { get set }
}

protocol IdeasRoutingLogic {
    
}

protocol IdeasDataPassing {
    var dataStore: IdeasDataStore? { get }
}

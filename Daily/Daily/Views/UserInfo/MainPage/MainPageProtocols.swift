//
//  MainPageProtocols.swift
//  Daily
//
//  Created by Арсений Токарев on 08.12.2020.
//

import UIKit

protocol MainPageDisplayLogic: AnyObject {
	var cellsToDisplay: [MainCellViewModel] { get set }
	
	func displayCells()
}

protocol MainPageBusinessLogic {
	func fetchCells()
}

protocol MainPageDataStore: AnyObject {
	
}

protocol MainPagePresentationLogic {
	func prepareCells()
}

protocol MainPageRoutingLogic {
	func navigateTo(viewController: UIViewController)
	
	func logOut()
}

protocol MainPageDataPassing {
	var dataStore: MainPageDataStore? { get }
}

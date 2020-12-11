//
//  MainPageProtocols.swift
//  Daily
//
//  Created by Арсений Токарев on 08.12.2020.
//

import UIKit

protocol MainPageDisplayLogic: ProfileDisplayLogic {
}

protocol MainPageBusinessLogic: ProfileBusinessLogic {
}

protocol MainPageDataStore: AnyObject {
	
}

protocol MainPagePresentationLogic: ProfilePresentationLogic {
	func prepareUserInfo(_ userCard: (UIImage?, Name?))
}

protocol MainPageRoutingLogic: ProfileRoutingLogic {
	func logOut()
}

protocol MainPageDataPassing {
	var dataStore: MainPageDataStore? { get }
}

//
//  NotificationsProtocols.swift
//  Daily
//
//  Created by Арсений Токарев on 09.12.2020.
//

import UIKit

protocol NotificationsDisplayLogic: ProfileDisplayLogic {
}

protocol NotificationsBusinessLogic: ProfileBusinessLogic {
}

protocol NotificationsDataStore: AnyObject {
}

protocol NotificationsPresentationLogic: ProfilePresenter {
}

protocol NotificationsRoutingLogic: ProfileRouter {	
}

protocol NotificationsDataPassing {
	var dataStore: NotificationsDataStore? { get }
}

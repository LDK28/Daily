//
//  NotificationsRouter.swift
//  Daily
//
//  Created by Арсений Токарев on 09.12.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit

class NotificationsRouter: ProfileRouter, NotificationsDataPassing {
	weak var dataStore: NotificationsDataStore?
  
	init(viewController: NotificationsVC?, dataStore: NotificationsDataStore?) {
		super.init(viewController: viewController)
		self.dataStore = dataStore
	}
}

extension NotificationsRouter: NotificationsRoutingLogic {
	
}

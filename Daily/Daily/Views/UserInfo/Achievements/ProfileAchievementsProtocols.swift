//
//  ProfileAchievementsProtocols.swift
//  Daily
//
//  Created by Арсений Токарев on 08.12.2020.
//

import UIKit

protocol ProfileAchievementsDisplayLogic: AnyObject {
  func displaySomething()
}

protocol ProfileAchievementsBusinessLogic {
  func doSomething()
}

protocol ProfileAchievementsDataStore: AnyObject {
	
}

protocol ProfileAchievementsPresentationLogic {
  func presentSomething()
}

protocol ProfileAchievementsRoutingLogic {
	
}

protocol ProfileAchievementsDataPassing {
	var dataStore: ProfileAchievementsDataStore? { get }
}

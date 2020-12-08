//
//  ProfileSettingsProtocols.swift
//  Daily
//
//  Created by Арсений Токарев on 08.12.2020.
//

import UIKit

protocol ProfileSettingsDisplayLogic: AnyObject {
  func displaySomething()
}

protocol ProfileSettingsBusinessLogic {
  func doSomething()
}

protocol ProfileSettingsDataStore: AnyObject {
	
}

protocol ProfileSettingsPresentationLogic {
  func presentSomething()
}

protocol ProfileSettingsRoutingLogic {
	
}

protocol ProfileSettingsDataPassing {
	var dataStore: ProfileSettingsDataStore? { get }
}

//
//  ProfileSettingsProtocols.swift
//  Daily
//
//  Created by Арсений Токарев on 08.12.2020.
//

import UIKit

protocol SettingsDisplayLogic: ProfileDisplayLogic {
}

protocol SettingsBusinessLogic: ProfileBusinessLogic {
}

protocol SettingsDataStore: AnyObject {
	
}

protocol SettingsPresentationLogic: ProfilePresentationLogic {
}

protocol SettingsRoutingLogic: ProfileRouter {
	
}

protocol SettingsDataPassing: ProfileRouter {
	var dataStore: SettingsDataStore? { get }
}

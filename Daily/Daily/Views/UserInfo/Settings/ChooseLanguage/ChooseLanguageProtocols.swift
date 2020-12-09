//
//  ChooseLanguageProtocols.swift
//  Daily
//
//  Created by Арсений Токарев on 09.12.2020.
//

import UIKit

protocol ChooseLanguageDisplayLogic: ProfileDisplayLogic {
}

protocol ChooseLanguageBusinessLogic: ProfileBusinessLogic {
}

protocol ChooseLanguageDataStore: AnyObject {
	
}

protocol ChooseLanguagePresentationLogic: ProfilePresentationLogic {
}

protocol ChooseLanguageRoutingLogic: ProfileRoutingLogic {
	
}

protocol ChooseLanguageDataPassing {
	var dataStore: ChooseLanguageDataStore? { get }
}

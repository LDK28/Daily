//
//  ChooseLanguageProtocols.swift
//  Daily
//
//  Created by Арсений Токарев on 09.12.2020.
//

import UIKit

protocol ChooseLanguageDisplayLogic: AnyObject {
  func displaySomething()
}

protocol ChooseLanguageBusinessLogic {
  func doSomething()
}

protocol ChooseLanguageDataStore: AnyObject {
	
}

protocol ChooseLanguagePresentationLogic {
  func presentSomething()
}

protocol ChooseLanguageRoutingLogic {
	
}

protocol ChooseLanguageDataPassing {
	var dataStore: ChooseLanguageDataStore? { get }
}

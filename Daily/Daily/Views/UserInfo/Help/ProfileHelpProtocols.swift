//
//  ProfileHelpProtocols.swift
//  Daily
//
//  Created by Арсений Токарев on 08.12.2020.
//

import UIKit

protocol ProfileHelpDisplayLogic: AnyObject {
  func displaySomething()
}

protocol ProfileHelpBusinessLogic {
  func doSomething()
}

protocol ProfileHelpDataStore: AnyObject {
	
}

protocol ProfileHelpPresentationLogic {
  func presentSomething()
}

protocol ProfileHelpRoutingLogic {
	
}

protocol ProfileHelpDataPassing {
	var dataStore: ProfileHelpDataStore? { get }
}

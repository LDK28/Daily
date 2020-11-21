//
//  NotesVC.swift
//  Daily
//
//  Created by Арсений Токарев on 19.11.2020.
//  Copyright (c) 2020. All rights reserved.
//

import UIKit

class NotesVC: MainTableVC {
	var interactor: NotesBusinessLogic?
	var router: (NotesRoutingLogic & NotesDataPassing)?
  
	override func viewDidLoad() {
    super.viewDidLoad()
	
	}
  
}
extension NotesVC: NotesDisplayLogic {
	func displaySomething() {
	  
	}
}

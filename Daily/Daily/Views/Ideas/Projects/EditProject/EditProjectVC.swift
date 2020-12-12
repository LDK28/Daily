//
//  EditProjectVC.swift
//  Daily
//
//  Created by julie on 12.12.2020.
//  Copyright (c) 2020. All rights reserved.
//

import UIKit

class EditProjectVC: UIViewController {
	var interactor: EditProjectBusinessLogic?
	var router: (EditProjectRoutingLogic & EditProjectDataPassing)?
  
	override func viewDidLoad() {
    super.viewDidLoad()
	
	}
  
}
extension EditProjectVC: EditProjectDisplayLogic {
	func displaySomething() {
	  
	}
}

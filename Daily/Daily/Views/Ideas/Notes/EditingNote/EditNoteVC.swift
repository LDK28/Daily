//
//  EditNoteVC.swift
//  Daily
//
//  Created by Арсений Токарев on 03.12.2020.
//  Copyright (c) 2020. All rights reserved.
//

import UIKit

class EditNoteVC: UIViewController {
	var interactor: EditNoteBusinessLogic?
	var router: (EditNoteRoutingLogic & EditNoteDataPassing)?
  
	override func viewDidLoad() {
    super.viewDidLoad()
	
	}
  
}
extension EditNoteVC: EditNoteDisplayLogic {
	func displaySomething() {
	  
	}
}

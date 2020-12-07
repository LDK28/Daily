//
//  ProjectsViewController.swift
//  Daily
//
//  Created by julie on 08.12.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class ProjectsVC: MainTableVC {
  var interactor: ProjectsBusinessLogic?
  var router: (ProjectsRoutingLogic & ProjectsDataPassing)?
  
  override func viewDidLoad() {
    super.viewDidLoad()
	
  }
  
}
extension ProjectsVC: ProjectsDisplayLogic {
	func displaySomething() {
	  
	}
}

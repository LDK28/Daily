//
//  EditProjectVC.swift
//  Daily
//
//  Created by julie on 12.12.2020.
//  Copyright (c) 2020. All rights reserved.
//

import UIKit

class EditProjectVC: MainTableVC {
    
	var interactor: EditProjectBusinessLogic?
	var router: (EditProjectRoutingLogic & EditProjectDataPassing)?
  
	override func loadView() {
        super.loadView()
        
        configureTableView()
        styleTableViewTitle()
        styleTableView()
        registerCells()
	}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func styleTableViewTitle() {
        let titleView = EditProjectTitleView(title: "Project Title")
        tableView.tableHeaderView = titleView
        titleView.frame.size.height = 80
    }
    
    func styleTableView() {
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.scrollsToTop = true
        tableView.alwaysBounceVertical = false
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
    }
    
    func registerCells() {
        
    }
  
}

extension EditProjectVC: EditProjectDisplayLogic {
	func displaySomething() {
	  
	}
}

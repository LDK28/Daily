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
  
    override func loadView() {
            super.loadView()
        
        configureTableView()
        styleTableView()
        registerCells()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.fetchCells()
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func styleTableView() {
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.scrollsToTop = true
        tableView.alwaysBounceVertical = false
        let titleView = TitleView(title: "Projects")
        tableView.tableHeaderView = titleView
        titleView.frame.size.height = 80
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
    }
    
    func registerCells() {
        tableView.register(ProjectsCell.self, forCellReuseIdentifier: ProjectsCell.cellIdentifier)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedCellModel = cellsToDisplay[indexPath.row] as? ProjectsCellViewModel else { return }
    }
  
}
extension ProjectsVC: ProjectsDisplayLogic {
	func display() {
        tableView.reloadData()
	}
}

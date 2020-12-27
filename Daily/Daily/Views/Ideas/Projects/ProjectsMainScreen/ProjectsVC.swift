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
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor?.fetchLatestData()
        interactor?.fetchCells()
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
        guard let selectedCellModel = cellsToDisplay[indexPath.row] as? ProjectBackendModel else { return }
        router?.navigateTo(project: selectedCellModel, index: indexPath.row)
    }
  
}
extension ProjectsVC: ProjectsDisplayLogic {
    func display() {
        tableView.reloadData()
    }
}

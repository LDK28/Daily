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
    
    var project: ProjectBackendModel?
  
    let optionsImage = UIImage(systemName: "ellipsis")
    
    override func loadView() {
        super.loadView()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        styleTableView()
        registerCells()
        
        interactor?.fetchProjectData()
        
        styleTableViewTitles()
        
        
    }
    
    @objc func didTapAddButton(sender: UIButton) {
        interactor?.askPresenterToAddNewItem()
    }
    
    @objc func didTapOptions(sender: UIBarButtonItem) {
        
    }
  
}

extension EditProjectVC {
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func styleTableViewTitles() {
        let headerView = EditProjectHeaderView(title: project?.title ?? "Project title")
        tableView.tableHeaderView = headerView
        headerView.frame.size.height = 100
        let footerView = EditProjectFooterView(title: "Add new item")
        tableView.tableFooterView = footerView
        footerView.frame.size.height = 50
        footerView.addButton.addTarget(self, action: #selector(didTapAddButton), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "...", style: .plain, target: self, action: #selector(didTapOptions))
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
        tableView.register(ProjectItemCell.self, forCellReuseIdentifier: ProjectItemCell.cellIdentifier)
    }
    
}

extension EditProjectVC: ItemCellDelegate {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = cellsToDisplay[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "\(cellViewModel.cellType)") as? ProjectItemCell {
            (cell as? ProjectItemCell)?.itemIndex = indexPath.row
            cell.setViewModel(cellViewModel)
            cell.delegate = self
            return cell
        }
        return UITableViewCell()
    }
    
    func itemDidChange(projectItemViewModel: ProjectItemViewModel, index: Int) {
        interactor?.updateItem(projectItemViewModel: projectItemViewModel, index: index)
    }

}

extension EditProjectVC: EditProjectDisplayLogic {
    
    func getProject(_ project: ProjectBackendModel) {
        self.project = project
    }
    func display() {
        tableView.reloadData()
    }
}

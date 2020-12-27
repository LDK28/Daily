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
  
    var optionsImage = UIImage(systemName: "ellipsis",
                               withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
    
//    var optionsVCIsOpened: Bool = false
    let optionsVC = OptionsOverlayVC()
    
    override func loadView() {
        super.loadView()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        styleNavigationBar()
        styleTableView()
        registerCells()
        addTargets()
        
        interactor?.fetchProjectData()
        
        styleTableViewTitles()
        
    }
    
    
    @objc func didTapDeleteProject (sender: UIButton) {
        
        let deleteAlert = UIAlertController(title: "Are you sure?",
                                             message: "This project will be deleted",
                                             preferredStyle: UIAlertController.Style.alert)
        deleteAlert.addAction(UIAlertAction(title: "Delete",
                                            style: .default,
                                             handler: { (action: UIAlertAction!) in
                                                self.interactor?.deleteProject()
        }))
        deleteAlert.addAction(UIAlertAction(title: "Cancel",
                                             style: .cancel,
                                             handler: { (action: UIAlertAction!) in
                                                return
        }))
        present(deleteAlert, animated: true, completion: nil)
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func didTapCancel (sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func didTapDeleteItems (sender: UIButton) {
        //delete items
    }
    
    @objc func didTapAddButton(sender: UIButton) {
        tableView.reloadData()
        interactor?.askPresenterToAddNewItem()
    }
    
    @objc func didTapOptions(sender: UIBarButtonItem) {
        self.optionsVC.modalPresentationStyle = .overCurrentContext
        self.present(self.optionsVC, animated: true, completion: nil)
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        interactor?.updateProjectName(projectName: textView.text ?? "")
        tableView.reloadData()
    }
    
}

extension EditProjectVC: UITextViewDelegate {
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func styleNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: optionsImage,
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(didTapOptions))
    }
    
    func styleTableViewTitles() {
        let headerView = EditProjectHeaderView(title: project?.title ?? "Project title")
        tableView.tableHeaderView = headerView
        headerView.frame.size.height = 100  //   idk what to do about this
        headerView.titleTextView.delegate = self
        let footerView = EditProjectFooterView(title: "Add new item")
        tableView.tableFooterView = footerView
        footerView.frame.size.height = 50
        footerView.addButton.addTarget(self,
                                       action: #selector(didTapAddButton),
                                       for: .touchUpInside)
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
        tableView.register(ProjectItemCell.self,
                           forCellReuseIdentifier: ProjectItemCell.cellIdentifier)
    }
    
    func addTargets() {
        optionsVC.deleteProjectButton.addTarget(self, action: #selector(didTapDeleteProject), for: .touchUpInside)
        optionsVC.cancelButton.addTarget(self, action: #selector(didTapCancel), for: .touchUpInside)
        optionsVC.deleteProjectItems.addTarget(self, action: #selector(didTapDeleteItems), for: .touchUpInside)
        optionsVC.backgroundButton.addTarget(self, action: #selector(didTapCancel), for: .touchUpInside)
    }
    
}

extension EditProjectVC: ItemCellDelegate {
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = cellsToDisplay[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "\(cellViewModel.cellType)") as? ProjectItemCell {
            cell.itemIndex = indexPath.row
            cell.setViewModel(cellViewModel)
            cell.delegate = self
            return cell
        }
        return UITableViewCell()
    }
    
    func itemDidChange(projectItemViewModel: ProjectItemViewModel, index: Int) {
        interactor?.updateItem(projectItemViewModel: projectItemViewModel, index: index)
        tableView.reloadData()
    }

}

extension EditProjectVC: EditProjectDisplayLogic {
    
    func getProject(_ project: ProjectBackendModel) {
        self.project = project
    }
    
    func display() {
        tableView.reloadData()
    }
    
    func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
}

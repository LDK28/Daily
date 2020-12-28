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
    var trashImage = UIImage(systemName: "trash.circle",
                             withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
    var cancelImage = UIImage(systemName: "xmark.circle",
                              withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
    
    let optionsVC = OptionsOverlayVC()
    
    var deletionModeIsOn: Bool = false
    var itemsToDelete = [ProjectItemCell]()
    
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
    }
    
    @objc func didTapCancel (sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func didTapDeleteItems (sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        deletionModeIsOn = true
        let cancel = UIBarButtonItem(image: cancelImage,
                                      style: .plain,
                                      target: self,
                                      action: #selector(didTapCancelWhileEditing))
        let delete = UIBarButtonItem(image: trashImage,
                                     style: .plain,
                                     target: self,
                                     action: #selector(didTapDeleteWhileEditing))
        navigationItem.rightBarButtonItems = [cancel, delete]
        for cell in tableView.visibleCells {
            cell.contentView.isUserInteractionEnabled = false
        }
        
    }
    
    @objc func didTapAddButton(sender: UIButton) {
        tableView.reloadData()
        interactor?.askPresenterToAddNewItem()
    }
    
    @objc func didTapOptions(sender: UIBarButtonItem) {
        self.optionsVC.modalPresentationStyle = .overCurrentContext
        self.present(self.optionsVC, animated: true, completion: nil)
    }
    
    @objc func didTapDeleteWhileEditing(sender: UIBarButtonItem) {
        for item in itemsToDelete {
            guard let index = item.itemIndex else { return }
            interactor?.deleteProjectItems(index: index)
        }
        didEndEditingProject()
    }
    
    @objc func didTapCancelWhileEditing(sender: UIBarButtonItem) {
        didEndEditingProject()
    }
    
    func didEndEditingProject() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        deletionModeIsOn = false
        navigationItem.rightBarButtonItem = nil
        styleNavigationBar()
        for cell in tableView.visibleCells {
            cell.contentView.isUserInteractionEnabled = true
            guard let itemCell = cell as? ProjectItemCell else { return }
            itemCell.unselectForDeletion()
        }
        
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        interactor?.updateProjectName(projectName: textView.text ?? "")
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if deletionModeIsOn {
            guard let cell = tableView.cellForRow(at: indexPath) as? ProjectItemCell else { return }
            if cell.isSelectedForDeletion {
                cell.unselectForDeletion()
                itemsToDelete = itemsToDelete.filter { $0 !== cell }
            } else {
                cell.selectForDeletion()
                itemsToDelete.append(cell)
            }
            
        }
        
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
        let headerView = EditProjectHeaderView(title: project?.title ?? "")
        tableView.tableHeaderView = headerView
        let constraintRect = CGSize(width: UIScreen.main.bounds.width,
                                    height: .greatestFiniteMagnitude)
        let boundingBox = headerView.titleTextView.text.boundingRect(with: constraintRect,
                                                                     options: .usesLineFragmentOrigin,
                                                                     attributes: [NSAttributedString.Key.font: UIFont(name: "Stolzl-Bold",
                                                                                                                      size: 28)],
                                                                     context: nil)
        tableView.tableHeaderView?.frame.size = CGSize(width: tableView.frame.width,
                                                       height: boundingBox.height + 70)
        headerView.titleTextView.delegate = self
        headerView.textChanged {[weak tableView] (_) in
                    tableView?.beginUpdates()
                    tableView?.endUpdates()
        }
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
            cell.textChanged {[weak tableView] (_) in
                        tableView?.beginUpdates()
                        tableView?.endUpdates()
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func itemDidChange(projectItemViewModel: ProjectItemViewModel, index: Int) {
        interactor?.updateItem(projectItemViewModel: projectItemViewModel, index: index)
//        tableView.reloadData()
    }

}

extension EditProjectVC: EditProjectDisplayLogic {
    
    func getProject(_ project: ProjectBackendModel) {
        self.project = project
    }
    
    func display() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func goBack() {
        self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
    
}

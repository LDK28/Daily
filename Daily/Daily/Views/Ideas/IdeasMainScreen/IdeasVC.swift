//
//  IdeasView.swift
//  Daily
//
//  Created by Арсений Токарев on 23.10.2020.
//

import UIKit

class IdeasVC: MainTableVC {
    
    var interactor: IdeasBusinessLogic?
    var router: (IdeasRoutingLogic & IdeasDataPassing)?

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
        let titleView = TitleView(title: "Ideas")
        tableView.tableHeaderView = titleView
        titleView.frame.size.height = 100
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
    }
    
    func registerCells() {
        tableView.register(IdeasCell.self, forCellReuseIdentifier: IdeasCell.cellIdentifier)
        tableView.register(RecentActionsCell.self, forCellReuseIdentifier: RecentActionsCell.cellIdentifier)
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let selectedCellModel = cellsToDisplay[indexPath.row] as? IdeasCellViewModel else { return }
        switch selectedCellModel.buttonType {
        case .notes:
            router?.navigateTo(.notes)
        case .projects:
            return
        }
        
    }

}

extension IdeasVC: IdeasDisplayLogic {
    func display() {
        tableView.reloadData()
    }
}




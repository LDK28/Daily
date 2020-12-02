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
    
    var buttonsCells: [IdeasCell] = []
    var recentActionsCell = RecentActionsCell()

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

}

extension IdeasVC {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
//        var rowCount = 0
//            if section == 0 {
//                rowCount = buttonsCells.count
//            }
//            if section == 1 {
//                rowCount = recentActionsCell.count
//            }
//            return rowCount
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 || indexPath.row == 1 {
            return buttonsCells[indexPath.row]
        }
        else {
            return recentActionsCell
        }
        
    }
 
}

extension IdeasVC: IdeasDisplayLogic {
    func display() {
        tableView.reloadData()
    }
}


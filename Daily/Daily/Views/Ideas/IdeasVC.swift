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
    
    var cellsToDisplay: [IdeasCell] = []

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
    }
    
    func registerCells() {
        tableView.register(IdeasCell.self, forCellReuseIdentifier: IdeasCell.cellIdentifier)
    }

}

extension IdeasVC {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellsToDisplay.count //is nil
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard
//            let cell = tableView.dequeueReusableCell(withIdentifier: IdeasCell.cellIdentifier) as? IdeasCell
//            else { return UITableViewCell() }
//        return cell
        
        return cellsToDisplay[indexPath.section] //doesn't work (cellsToDisplay is nil)
        
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return UITableView.automaticDimension
        } else {
            return 40
        }
    }
}

extension IdeasVC: IdeasDisplayLogic {
    func display() {
        tableView.reloadData()
    }
}

//
//  IdeasView.swift
//  Daily
//
//  Created by Арсений Токарев on 23.10.2020.
//

import UIKit

protocol IdeasDisplayLogic: class {
  func display(cellTitles: [String])
}

class IdeasVC: MainVC {
    
    var interactor: IdeasBusinessLogic?
    var router: (IdeasRoutingLogic & IdeasDataPassing)?
    
    var cellTitles = [String]()
    
    let headerLabel = UILabel()
    let ideasTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableViewDelegate()
        
        view.addSubview(headerLabel)
        view.addSubview(ideasTableView)
        
        configureHeaderLabel()
        configureIdeasTableView()
        
        styleHeaderLabel()
        styleIdeasTableView()
        
    }
    
    func setTableViewDelegate() {
        ideasTableView.delegate = self
        ideasTableView.dataSource = self
        
    }
    
    func configureHeaderLabel() {
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 32),
            headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headerLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
        ])
    }
    
    func configureIdeasTableView() {
        ideasTableView.register(IdeasCell.self, forCellReuseIdentifier: IdeasCell.cellIdentifier)
        NSLayoutConstraint.activate([
            ideasTableView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 16),
            ideasTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            ideasTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            ideasTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func styleHeaderLabel() {
        if let headerLabelFont = UIFont(name: "Stolzl-Bold", size: 36) {
            headerLabel.styleLabel(font: headerLabelFont, text: "Ideas", textAlignment: .center, textColor: .dailyTitleTextColor)
            headerLabel.addShadow()
        }
    }
    
    func styleIdeasTableView() {
        ideasTableView.translatesAutoresizingMaskIntoConstraints = false
        ideasTableView.rowHeight = 150
        ideasTableView.tableFooterView = UIView(frame: .zero)
        ideasTableView.isUserInteractionEnabled = false
        ideasTableView.separatorStyle = .none
        ideasTableView.backgroundColor = .clear
    }

}

extension IdeasVC: IdeasDisplayLogic {
    func display(cellTitles: [String]) {
        self.cellTitles.append(contentsOf: cellTitles)
        ideasTableView.reloadData()
        
    }
}

extension IdeasVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = ideasTableView.dequeueReusableCell(withIdentifier: IdeasCell.cellIdentifier) as? IdeasCell
            else { return UITableViewCell() }
        
//        cell.configureCell(cellTitle: cellTitles[indexPath.row]) // causes an error: Index out of range (cellTitles = 0 values)
        
        return cell
    }
}

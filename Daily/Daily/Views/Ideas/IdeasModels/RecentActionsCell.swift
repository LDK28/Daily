//
//  RecentActionsCell.swift
//  Daily
//
//  Created by julie on 25.11.2020.
//

import UIKit

class RecentActionsCell: UITableViewCell {
    
    static let cellIdentifier = "RecentActionsCell"
    
    let recentActionsView = UIView()
    let headerLabel = UILabel()
    
    var viewModel: RecentActionsViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            headerLabel.text = viewModel.headerLabelText
            
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(recentActionsView)
        contentView.addSubview(headerLabel)
        
        configureRecentActionsView()
        configureHeaderLabel()
        
        styleCell()
        styleRecentActionsView()
        styleHeaderLabel()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureRecentActionsView() {
        NSLayoutConstraint.activate([
            recentActionsView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            recentActionsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            recentActionsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            recentActionsView.heightAnchor.constraint(equalToConstant: 200),
            recentActionsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    func configureHeaderLabel() {
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: recentActionsView.topAnchor, constant: 10),
            headerLabel.leadingAnchor.constraint(equalTo: recentActionsView.leadingAnchor, constant: 20),
            headerLabel.trailingAnchor.constraint(equalTo: recentActionsView.trailingAnchor, constant: -10)
        ])
    }
    
    func styleCell() {
        selectionStyle = .none
        backgroundColor = .clear
    }
    
    func styleRecentActionsView() {
        recentActionsView.styleView(backgroundColor: .dailyProjectTaskTileColor, cornerRadius: 10) 
    }
    
    func styleHeaderLabel() {
        if let labelFont = UIFont(name: "Stolzl-Regular", size: 24) {
            headerLabel.styleLabel(font: labelFont, text: headerLabel.text ?? "header", textAlignment: .left, textColor: .dailyRecentActionsTextColor)
        }
    }
}

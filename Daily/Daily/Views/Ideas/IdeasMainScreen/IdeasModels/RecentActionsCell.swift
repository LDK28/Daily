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
    
    var actionLabelsTexts = [String]()
    var actionLabels = [UILabel]()
    let singleActionImageView = UIImageView()
    
    var viewModel: RecentActionsViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            headerLabel.text = viewModel.headerLabelText
            actionLabelsTexts.append(contentsOf: viewModel.recentActions)
            setUpCell()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpCell(){
        
        contentView.addSubview(recentActionsView)
        recentActionsView.addSubview(headerLabel)
        
        for action in actionLabelsTexts {
            let actionLabel = UILabel()
            actionLabel.text = action
            actionLabels.append(actionLabel)
        }
        
        for actionLabel in actionLabels {
            recentActionsView.addSubview(actionLabel)
        }
        
        configureRecentActionsView()
        configureHeaderLabel()
        configureActionLabels()
        
        styleCell()
        styleRecentActionsView()
        styleHeaderLabel()
        styleActionLabels()
        
    }
    
    func configureRecentActionsView() {
        NSLayoutConstraint.activate([
            recentActionsView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
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
    
    func configureActionLabels() {
        let heightConstant: CGFloat = 19
        var topAnchorConstant: CGFloat = 10
        for actionLabel in actionLabels {
            NSLayoutConstraint.activate([
                actionLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: topAnchorConstant),
                actionLabel.heightAnchor.constraint(equalToConstant: heightConstant),
                actionLabel.leadingAnchor.constraint(equalTo: headerLabel.leadingAnchor),
                actionLabel.trailingAnchor.constraint(equalTo: headerLabel.trailingAnchor)
            ])
            topAnchorConstant += heightConstant + 10
        }
    }
    
    func styleCell() {
        selectionStyle = .none
        backgroundColor = .clear
    }
    
    func styleRecentActionsView() {
        recentActionsView.styleView(backgroundColor: .dailyRecentActionsPadColor, cornerRadius: 10)
    }
    
    func styleHeaderLabel() {
        if let labelFont = UIFont(name: "Stolzl-Regular", size: 22) {
            headerLabel.styleLabel(font: labelFont, text: headerLabel.text ?? "header", textAlignment: .left, textColor: .dailyRecentActionsTextColor)
        }
    }
    
    func styleActionLabels() {
        for actionLabel in actionLabels {
            actionLabel.styleLabel(font: .systemFont(ofSize: 18), text: actionLabel.text ?? "action", textAlignment: .left, textColor: .dailyRecentActionsTextColor)
        }
    }
}

//
//  RecentActionsCell.swift
//  Daily
//
//  Created by julie on 25.11.2020.
//

import UIKit

class RecentActionsCell: UITableViewCell, MainCellProtocol {
    
    func setViewModel(_ viewModel: MainCellViewModel?) {
        guard let viewModel = viewModel as? RecentActionsViewModel else { return }
        headerLabel.text = viewModel.headerLabelText
        actionLabelsTexts.append(contentsOf: viewModel.recentActions)
        setUpCell()
    }
    
    static let cellIdentifier = "RecentActionsCell"
    
    let recentActionsView = UIView()
    let headerLabel = UILabel()
    
    //let isGroupProject = Bool()
    var actionLabelsTexts = [String]()
    var actionLabels = [UILabel]()
    var recentActionsViewHeight: CGFloat = 0.0
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RecentActionsCell {
    
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
            recentActionsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    func configureHeaderLabel() {
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: recentActionsView.topAnchor, constant: 10),
            headerLabel.leadingAnchor.constraint(equalTo: recentActionsView.leadingAnchor, constant: 20),
            headerLabel.trailingAnchor.constraint(equalTo: recentActionsView.trailingAnchor, constant: -10)
        ])
        recentActionsViewHeight += headerLabel.font.pointSize + headerLabel.fs_bottom + headerLabel.fs_top
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
        recentActionsViewHeight += heightConstant + topAnchorConstant
    }
    
    func styleCell() {
        selectionStyle = .none
        backgroundColor = .clear
        contentView.sizeToFit()
    }
    
    func styleRecentActionsView() {
        recentActionsView.styleView(backgroundColor: .dailyRecentActionsPadColor, cornerRadius: 10)
        recentActionsView.heightAnchor.constraint(equalToConstant: recentActionsViewHeight).isActive = true
    }
    
    func styleHeaderLabel() {
        if let labelFont = UIFont(name: "Stolzl-Regular", size: 22) {
            headerLabel.styleLabel(font: labelFont, text: headerLabel.text ?? "", textAlignment: .left, textColor: .dailyRecentActionsTextColor)
        }
    }
    
    func styleActionLabels() {
        for actionLabel in actionLabels {
            if let singleActionImage = UIImage(systemName: "person.fill") {
                actionLabel.styleLabelWithImage(text: actionLabel.text ?? "", with: .systemFont(ofSize: 18), in: .dailyRecentActionsTextColor, image: singleActionImage, imageFirst: true, textAlignment: .left)
            }
        }
    }
}

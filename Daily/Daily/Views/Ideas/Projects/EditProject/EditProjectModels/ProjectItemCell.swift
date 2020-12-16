//
//  ItemCell.swift
//  Daily
//
//  Created by julie on 13.12.2020.
//

import UIKit

class ProjectItemCell: UITableViewCell, MainCellProtocol {
    
    func setViewModel(_ viewModel: MainCellViewModel?) {
        guard let viewModel = viewModel as? ProjectItemViewModel else { return }
        itemLabel.text = viewModel.headerTitle
        //viewModel.subItems
    }
    
    static let cellIdentifier = "ProjectItemCell"
    
    var isDone: Bool = false
    
    let labelBackgroundView = UIView()
    let itemLabel = UILabel()
    let statusButton = UIButton()
    let missedItemImage = UIImage(systemName: "circle",
                                  withConfiguration: UIImage.SymbolConfiguration(pointSize: 50))
    let doneItemImage = UIImage(systemName: "circle.fill",
                                withConfiguration: UIImage.SymbolConfiguration(pointSize: 50))
    let dividerView = UIView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(labelBackgroundView)
        labelBackgroundView.addSubview(statusButton)
        labelBackgroundView.addSubview(itemLabel)
        labelBackgroundView.addSubview(dividerView)
        
        configureCell()
        configureLabelBackgroundView()
        configureItemLabel()
        configureStatusButton()
        configureDividerView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    @objc func didTapStatusButton(sender: UIButton) {
        if isDone {
            statusButton.setImage(missedItemImage, for: .normal)
            isDone = false
        } else {
            statusButton.setImage(doneItemImage, for: .normal)
            isDone = true
        }
     }
}

extension ProjectItemCell {
    
    func configureCell() {
        selectionStyle = .none
        backgroundColor = .clear
        heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func configureLabelBackgroundView() {
        NSLayoutConstraint.activate([
            labelBackgroundView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            labelBackgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            labelBackgroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            labelBackgroundView.heightAnchor.constraint(equalToConstant: 80),
            labelBackgroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
        labelBackgroundView.styleView(backgroundColor: .dailyProjectTaskTileColor, cornerRadius: 10)
    }
    
    func configureStatusButton() {
        NSLayoutConstraint.activate([
            statusButton.topAnchor.constraint(equalTo: labelBackgroundView.topAnchor, constant: 16),
            statusButton.leadingAnchor.constraint(equalTo: labelBackgroundView.leadingAnchor, constant: 16),
            statusButton.heightAnchor.constraint(equalToConstant: 25),
            statusButton.widthAnchor.constraint(equalTo: statusButton.heightAnchor)
        ])
        statusButton.styleButton()
        statusButton.setImage(missedItemImage, for: .normal)
        statusButton.addTarget(self, action: #selector(didTapStatusButton), for: .touchUpInside)
    }
    
    func configureItemLabel() {
        NSLayoutConstraint.activate([
            itemLabel.centerYAnchor.constraint(equalTo: statusButton.centerYAnchor),
            itemLabel.leadingAnchor.constraint(equalTo: statusButton.trailingAnchor, constant: 10)
        ])
        if let labelFont = UIFont(name: "Stolzl-Book", size: 22) {
            itemLabel.styleLabel(font: labelFont, text: itemLabel.text, textAlignment: .left)
        }
    }
    
    func configureDividerView() {
        NSLayoutConstraint.activate([
            dividerView.topAnchor.constraint(equalTo: itemLabel.bottomAnchor, constant: 10),
            dividerView.leadingAnchor.constraint(equalTo: statusButton.leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: labelBackgroundView.trailingAnchor, constant: -10), //change later for ...
            dividerView.heightAnchor.constraint(equalToConstant: 0.5)
        ])
        dividerView.styleView(backgroundColor: .dailyTextColor, cornerRadius: 0)
    }
}

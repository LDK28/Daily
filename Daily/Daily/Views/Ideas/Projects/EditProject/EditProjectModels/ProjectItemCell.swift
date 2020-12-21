//
//  ItemCell.swift
//  Daily
//
//  Created by julie on 13.12.2020.
//

import UIKit

protocol ItemCellDelegate {
    func itemDidChange(projectItemViewModel: ProjectItemViewModel, index: Int)
}

class ProjectItemCell: UITableViewCell, MainCellProtocol {
    
    func setViewModel(_ viewModel: MainCellViewModel?) {
        guard let viewModel = viewModel as? ProjectItemViewModel else { return }
        itemTextField.text = viewModel.headerTitle
        isDone = viewModel.isDone
        //viewModel.subItems
        setUpCell()
    }
    
    static let cellIdentifier = "ProjectItemCell"
    
    let labelBackgroundView = UIView()
    let itemTextField = UITextField()
    let statusButton = UIButton()
    let missedItemImage = UIImage(systemName: "circle",
                                  withConfiguration: UIImage.SymbolConfiguration(pointSize: 50))
    let doneItemImage = UIImage(systemName: "circle.fill",
                                withConfiguration: UIImage.SymbolConfiguration(pointSize: 50))
    let dividerView = UIView()
    
    var isDone: Bool = false
    var itemIndex: Int?
    
    var delegate: ItemCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(labelBackgroundView)
        labelBackgroundView.addSubview(statusButton)
        labelBackgroundView.addSubview(itemTextField)
        labelBackgroundView.addSubview(dividerView)
        
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
        
        guard let index = itemIndex else { return }
        delegate?.itemDidChange(projectItemViewModel: ProjectItemViewModel(cellType: ProjectItemCell.self, headerTitle: itemTextField.placeholder ?? "", isDone: isDone, subItems: []), index: index)
     }
    
    @objc func didEndEditing(sender: UITextField) {
        
        guard let index = itemIndex else { return }
        delegate?.itemDidChange(projectItemViewModel: ProjectItemViewModel(cellType: ProjectItemCell.self, headerTitle: itemTextField.text ?? "", isDone: isDone, subItems: []), index: index)
    }
    
    func setUpCell() {
        configureCell()
        configureLabelBackgroundView()
        configureItemLabel()
        configureStatusButton()
        configureDividerView()
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
        if isDone {
            statusButton.setImage(doneItemImage, for: .normal)
        } else {
            statusButton.setImage(missedItemImage, for: .normal)
        }
        statusButton.addTarget(self, action: #selector(didTapStatusButton), for: .touchUpInside)
    }
    
    func configureItemLabel() {
        NSLayoutConstraint.activate([
            itemTextField.centerYAnchor.constraint(equalTo: statusButton.centerYAnchor),
            itemTextField.leadingAnchor.constraint(equalTo: statusButton.trailingAnchor, constant: 10)
        ])
        if let itemFont = UIFont(name: "Stolzl-Book", size: 22) {
            itemTextField.styleProjectItemTextField(font: itemFont, text: itemTextField.text ?? "item")
        }
        itemTextField.placeholder = "To do"
        itemTextField.addTarget(self, action: #selector(didEndEditing), for: .editingDidEnd)
    }
    
    func configureDividerView() {
        NSLayoutConstraint.activate([
            dividerView.topAnchor.constraint(equalTo: itemTextField.bottomAnchor, constant: 10),
            dividerView.leadingAnchor.constraint(equalTo: statusButton.leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: labelBackgroundView.trailingAnchor, constant: -10), //change later for ...
            dividerView.heightAnchor.constraint(equalToConstant: 0.5)
        ])
        dividerView.styleView(backgroundColor: .dailyTextColor, cornerRadius: 0)
    }
}

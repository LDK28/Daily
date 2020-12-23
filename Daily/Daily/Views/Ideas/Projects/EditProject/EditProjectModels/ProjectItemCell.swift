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
        setUpCell()
    }
    
    static let cellIdentifier = "ProjectItemCell"
    
    let labelBackgroundView = UIView()
    let itemTextField = UITextView()
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
        delegate?.itemDidChange(projectItemViewModel: ProjectItemViewModel(cellType: ProjectItemCell.self,
                                                                           headerTitle: itemTextField.text ?? "",
                                                                           isDone: isDone),
                                index: index)
     }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        guard let index = itemIndex else { return }
        delegate?.itemDidChange(projectItemViewModel: ProjectItemViewModel(cellType: ProjectItemCell.self,
                                                                           headerTitle: itemTextField.text ?? "",
                                                                           isDone: isDone),
                                index: index)
    }
    
    func setUpCell() {
        configureCell()
        configureLabelBackgroundView()
        configureItemLabel()
        configureStatusButton()
    }
}

extension ProjectItemCell: UITextViewDelegate {
    
    func configureCell() {
        selectionStyle = .none
        backgroundColor = .clear
    }
    
    func configureLabelBackgroundView() {
        NSLayoutConstraint.activate([
            labelBackgroundView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            labelBackgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            labelBackgroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            labelBackgroundView.heightAnchor.constraint(equalToConstant: 50),
            labelBackgroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
        labelBackgroundView.styleView(backgroundColor: .dailyProjectTaskTileColor, cornerRadius: 10)
    }
    
    func configureStatusButton() {
        NSLayoutConstraint.activate([
            statusButton.centerYAnchor.constraint(equalTo: labelBackgroundView.centerYAnchor),
            statusButton.leadingAnchor.constraint(equalTo: labelBackgroundView.leadingAnchor, constant: 16),
            statusButton.heightAnchor.constraint(equalToConstant: 20),
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
            itemTextField.leadingAnchor.constraint(equalTo: statusButton.trailingAnchor, constant: 10),
            itemTextField.trailingAnchor.constraint(equalTo: labelBackgroundView.trailingAnchor, constant: -10),
            itemTextField.heightAnchor.constraint(equalTo: labelBackgroundView.heightAnchor, multiplier: 0.8)
        ])
        if let itemFont = UIFont(name: "Stolzl-Book", size: 20) {
            itemTextField.styleClearTextView(font: itemFont,
                                             text: itemTextField.text ?? "",
                                             textColor: .dailyTextColor,
                                             textAlignment: .left)
        }
        itemTextField.delegate = self
    }
    
}

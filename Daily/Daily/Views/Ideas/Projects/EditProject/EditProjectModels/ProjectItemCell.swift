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
        itemTextView.text = viewModel.headerTitle
        isDone = viewModel.isDone
        setUpCell()
    }
    
    static let cellIdentifier = "ProjectItemCell"
    
    let labelBackgroundView = UIView()
    let itemTextView = UITextView()
    let statusButton = UIButton()
    let missedItemImage = UIImage(systemName: "circle",
                                  withConfiguration: UIImage.SymbolConfiguration(pointSize: 50))
    let doneItemImage = UIImage(systemName: "circle.fill",
                                withConfiguration: UIImage.SymbolConfiguration(pointSize: 50))
    
    var isDone: Bool = false
    var itemIndex: Int?
    
    var delegate: ItemCellDelegate?
    
    var isSelectedForDeletion: Bool = false
    
    var textChanged: ((String) -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(labelBackgroundView)
        labelBackgroundView.addSubview(statusButton)
        labelBackgroundView.addSubview(itemTextView)
        
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
                                                                           headerTitle: itemTextView.text ?? "",
                                                                           isDone: isDone),
                                index: index)
     }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        guard let index = itemIndex else { return }
        delegate?.itemDidChange(projectItemViewModel: ProjectItemViewModel(cellType: ProjectItemCell.self,
                                                                           headerTitle: itemTextView.text ?? "",
                                                                           isDone: isDone),
                                index: index)
        reloadInputViews()
    }
    
    func setUpCell() {
        configureCell()
        configureLabelBackgroundView()
        configureItemLabel()
        configureStatusButton()
    }
    
    func selectForDeletion() {
        isSelectedForDeletion = true
        labelBackgroundView.layer.borderWidth = 2
        labelBackgroundView.layer.borderColor = UIColor.dailyTextColor.cgColor
    }
    
    func unselectForDeletion() {
        isSelectedForDeletion = false
        labelBackgroundView.layer.borderWidth = 0
    }
    
}

extension ProjectItemCell: UITextViewDelegate {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        itemTextView.delegate = self
    }
        
    func textChanged(action: @escaping (String) -> Void) {
        self.textChanged = action
    }
        
    func textViewDidChange(_ textView: UITextView) {
        textChanged?(textView.text)
    }
    
    func configureCell() {
        selectionStyle = .none
        backgroundColor = .clear
    }
    
    func configureLabelBackgroundView() {
        NSLayoutConstraint.activate([
            labelBackgroundView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            labelBackgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            labelBackgroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
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
            itemTextView.centerYAnchor.constraint(equalTo: statusButton.centerYAnchor),
            itemTextView.leadingAnchor.constraint(equalTo: statusButton.trailingAnchor, constant: 10),
            itemTextView.trailingAnchor.constraint(equalTo: labelBackgroundView.trailingAnchor, constant: -10),
            itemTextView.heightAnchor.constraint(equalTo: labelBackgroundView.heightAnchor, multiplier: 0.8)
        ])
        if let itemFont = UIFont(name: "Stolzl-Book", size: 20) {
            itemTextView.styleClearTextView(font: itemFont,
                                             text: itemTextView.text ?? "",
                                             textColor: .dailyTextColor,
                                             textAlignment: .left)
        }
        itemTextView.delegate = self
        itemTextView.isScrollEnabled = false
    }
    
}

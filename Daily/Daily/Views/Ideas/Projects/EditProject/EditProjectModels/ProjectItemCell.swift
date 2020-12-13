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
    }
    
    static let cellIdentifier = "ProjectItemCell"
    
    var isDone = Bool()
    
    let labelBackgroundView = UIView()
    let itemLabel = UILabel()
    let missedItemImage = UIImage(systemName: "circle")
    let doneItemImage = UIImage(systemName: "circle.fill")
    var itemImageView = UIImageView(image: UIImage(systemName: "circle"))
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(labelBackgroundView)
        labelBackgroundView.addSubview(itemImageView)
        labelBackgroundView.addSubview(itemLabel)
        
        styleCell()
        
        configureLabelBackgroundView()
        configureItemImageView()
        configureItemLabel()
        
        styleLabel()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        if selected {
            itemImageView = UIImageView(image: doneItemImage)
        }
    } //doesn't work
    
    func configureLabelBackgroundView() {
        NSLayoutConstraint.activate([
            labelBackgroundView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            labelBackgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            labelBackgroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            labelBackgroundView.heightAnchor.constraint(equalToConstant: 80),
            labelBackgroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
        labelBackgroundView.styleView(backgroundColor: .dailyProjectTileColor, cornerRadius: 10)
    }
    
    func configureItemImageView() {
        //itemImageView = UIImageView(image: missedItemImage)
        itemImageView.styleImageView(color: .dailyTextColor)
        NSLayoutConstraint.activate([
            itemImageView.centerYAnchor.constraint(equalTo: labelBackgroundView.centerYAnchor),
            itemImageView.leadingAnchor.constraint(equalTo: labelBackgroundView.leadingAnchor, constant: 10),
            itemImageView.heightAnchor.constraint(equalToConstant: 20),
            itemImageView.widthAnchor.constraint(equalTo: itemImageView.heightAnchor)
        ])
    }
    
    func configureItemLabel() {
        NSLayoutConstraint.activate([
            itemLabel.centerYAnchor.constraint(equalTo: itemImageView.centerYAnchor),
            itemLabel.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: 10),
            itemLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            itemLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    func styleCell() {
        selectionStyle = .none
        backgroundColor = .clear
        heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func styleLabel() {
        if let labelFont = UIFont(name: "Stolzl-Book", size: 18) {
            itemLabel.styleLabel(font: labelFont, text: itemLabel.text, textAlignment: .left)
        }
    }
    
}

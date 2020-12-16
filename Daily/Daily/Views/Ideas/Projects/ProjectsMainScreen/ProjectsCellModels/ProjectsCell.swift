//
//  ProjectsCell.swift
//  Daily
//
//  Created by julie on 08.12.2020.
//

import UIKit

class ProjectsCell: UITableViewCell, MainCellProtocol {
    
    func setViewModel(_ viewModel: MainCellViewModel?) {
        guard let viewModel = viewModel as? ProjectsCellViewModel else { return }
        titleLabel.text = viewModel.title
    }
    
    static let cellIdentifier = "ProjectsCell"
    
    let titleLabel = UILabel()
    let labelBackgroundView = UIView()
    
    let singleProjectImageView = UIImageView(image: UIImage(systemName: "person.fill",
                                            withConfiguration: UIImage.SymbolConfiguration(pointSize: 30, weight: .regular, scale: .medium)))
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(labelBackgroundView)
        labelBackgroundView.addSubview(titleLabel)
        labelBackgroundView.addSubview(singleProjectImageView)
        
        configureLabelBackgroundView()
        configureProjectImageView()
        configureTitleLabel()
        
        styleCell()
        styleLabelBackgroundView()
        styleProjectImageView()
        styleTitleLabel()
        
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)

        if highlighted {
            labelBackgroundView.backgroundColor = .dailyIdeasTileColor
        } else {
            labelBackgroundView.backgroundColor = .dailyDiaryTileColor
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ProjectsCell {
    
    func configureLabelBackgroundView() {
        NSLayoutConstraint.activate([
            labelBackgroundView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            labelBackgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            labelBackgroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            labelBackgroundView.heightAnchor.constraint(equalToConstant: 80),
            labelBackgroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    func configureProjectImageView() {
        NSLayoutConstraint.activate([
            singleProjectImageView.centerYAnchor.constraint(equalTo: labelBackgroundView.centerYAnchor),
            singleProjectImageView.leadingAnchor.constraint(equalTo: labelBackgroundView.leadingAnchor, constant: 20),
            singleProjectImageView.heightAnchor.constraint(equalToConstant: 30),
            singleProjectImageView.widthAnchor.constraint(equalTo: singleProjectImageView.heightAnchor)
        ])
    }
    
    func configureTitleLabel() {
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: labelBackgroundView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: singleProjectImageView.trailingAnchor, constant: 20)
        ])
    }
    
    func styleCell() {
        selectionStyle = .none
        backgroundColor = .clear
    }
    
    func styleLabelBackgroundView() {
        labelBackgroundView.styleView(backgroundColor: .dailyDiaryTileColor, cornerRadius: 10)
        labelBackgroundView.addShadow()
    }
    
    func styleProjectImageView() {
        singleProjectImageView.styleImageView(color: .dailyTextColor)
    }
    
    func styleTitleLabel() {
        if let labelFont = UIFont(name: "Stolzl-Book", size: 24) {
            titleLabel.styleLabel(font: labelFont, text: titleLabel.text ?? "", textAlignment: .left)
            titleLabel.addShadow()
        }
    }
    
}



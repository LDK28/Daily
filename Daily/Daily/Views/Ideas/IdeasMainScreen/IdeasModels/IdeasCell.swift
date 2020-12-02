//
//  IdeasCell.swift
//  Daily
//
//  Created by julie on 21.11.2020.
//

import UIKit

enum IdeasCellType {
    case notes, projects
}

class IdeasCell: UITableViewCell, MainCellProtocol {
    
    func setViewModel(_ viewModel: MainCellViewModel?) {
        guard let viewModel = viewModel as? IdeasCellViewModel else { return }
        titleLabel.text = viewModel.title
        if viewModel.hasStatistics {
            configureStatisticsLabels()
            doneProjectsLabel.text = String(viewModel.doneProjects ?? 0)
            missedProjectsLabel.text = String(viewModel.missedProjects ?? 0)
//            cellType = .projects
//        } else {
//            cellType = .notes
        }
    }
    
    static let cellIdentifier = "IdeasCell"
    
    //var cellType: IdeasCellType

    let titleLabel = UILabel()
    let labelBackgroundView = UIView()
    
    var hasStatistics = false
    
    let doneProjectsLabel = UILabel()
    let missedProjectsLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(labelBackgroundView)
        contentView.addSubview(titleLabel)
        
        configureLabelBackgroundView()
        configureTitleLabel()
        
        styleCell()
        styleLabelBackgroundView()
        styleTitleLabel()
        
    }

    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)

        if highlighted {
            labelBackgroundView.backgroundColor = .dailyIdeasTileColor
        }

        else {
            labelBackgroundView.backgroundColor = .dailyDiaryTileColor
        }

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension IdeasCell {
    func configureLabelBackgroundView() {
        NSLayoutConstraint.activate([
            labelBackgroundView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            labelBackgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            labelBackgroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            labelBackgroundView.heightAnchor.constraint(equalToConstant: 100),
            labelBackgroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    func configureTitleLabel() {
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: labelBackgroundView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: labelBackgroundView.leadingAnchor, constant: 30)
        ])
    }
    
    func configureStatisticsLabels() {
        labelBackgroundView.addSubview(missedProjectsLabel)
        labelBackgroundView.addSubview(doneProjectsLabel)
        let statisticsLabelSize: CGFloat = 25
        NSLayoutConstraint.activate([
            missedProjectsLabel.centerYAnchor.constraint(equalTo: labelBackgroundView.centerYAnchor),
            missedProjectsLabel.trailingAnchor.constraint(equalTo: labelBackgroundView.trailingAnchor, constant: -30),
            missedProjectsLabel.heightAnchor.constraint(equalToConstant: statisticsLabelSize),
            missedProjectsLabel.widthAnchor.constraint(equalTo: missedProjectsLabel.heightAnchor),
            doneProjectsLabel.centerYAnchor.constraint(equalTo: missedProjectsLabel.centerYAnchor),
            doneProjectsLabel.trailingAnchor.constraint(equalTo: missedProjectsLabel.leadingAnchor, constant: -10),
            doneProjectsLabel.heightAnchor.constraint(equalTo: missedProjectsLabel.heightAnchor),
            doneProjectsLabel.widthAnchor.constraint(equalTo: doneProjectsLabel.heightAnchor)
        ])
        if let labelFont = UIFont(name: "Stolzl-Regular", size: 13) {
            missedProjectsLabel.styleLabelWithBackground(font: labelFont, text: String(0),
                                           backgroundColor: .systemRed, cornerRadius: statisticsLabelSize / 2)
            doneProjectsLabel.styleLabelWithBackground(font: labelFont, text: String(0),
                                         backgroundColor: .systemGreen, cornerRadius: statisticsLabelSize / 2)
            
        }
    }
    
    func styleCell() {
        selectionStyle = .none
        backgroundColor = .clear
    }
    
    func styleLabelBackgroundView() {
        labelBackgroundView.styleView(backgroundColor: .dailyDiaryTileColor, cornerRadius: 10)
        labelBackgroundView.addShadow()
    }
    
    func styleTitleLabel() {
        if let labelFont = UIFont(name: "Stolzl-Regular", size: 30) {
            titleLabel.styleLabel(font: labelFont, text: titleLabel.text ?? "", textAlignment: .left)
            titleLabel.addShadow()
        }
    }
}

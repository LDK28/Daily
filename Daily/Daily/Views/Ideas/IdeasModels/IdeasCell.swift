//
//  IdeasCell.swift
//  Daily
//
//  Created by julie on 21.11.2020.
//

import UIKit

class IdeasCell: UITableViewCell {
    
    static let cellIdentifier = "IdeasCell"

    let titleLabel = UILabel()
    let labelBackgroundView = UIView()
    
    var hasStatistics = false
    
    var viewModel: IdeasCellViewModel? {
            didSet {
                guard let viewModel = viewModel else { return }
                titleLabel.text = viewModel.title
                hasStatistics = viewModel.hasStatistics
            }
    }
    
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

//    override var isHighlighted: Bool {
//        didSet {
//            return
//        }
//    }

    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
//
//        if highlighted {
//            labelBackgroundView.backgroundColor = .systemGray5
//        }
//
//        else {
//            labelBackgroundView.backgroundColor = .dailyDiaryTileColor
//        }
//
        guard isHighlighted != highlighted else {
            return
        }
        if animated {
            labelBackgroundView.backgroundColor = .systemGray5
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
    
    func styleCell() {
        selectionStyle = .none
        backgroundColor = .clear
    }
    
    func styleLabelBackgroundView() {
        labelBackgroundView.styleView(backgroundColor: .dailyDiaryTileColor, cornerRadius: 10)
    }
    
    func styleTitleLabel() {
        if let labelFont = UIFont(name: "Stolzl-Regular", size: 30) {
            titleLabel.styleLabel(font: labelFont, text: titleLabel.text ?? "", textAlignment: .left)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        setHighlighted(true, animated: true)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        setHighlighted(false, animated: true)
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        setHighlighted(false, animated: true)
    }
}

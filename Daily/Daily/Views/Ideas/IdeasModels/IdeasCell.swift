//
//  IdeasCell.swift
//  Daily
//
//  Created by julie on 21.11.2020.
//

import UIKit

class IdeasCell: UITableViewCell {
    
    static let cellIdentifier = "IdeasCell"
    
    var buttonTitle = String()
    let button = UIButton()
    
    var viewModel: IdeasCellViewModel? {
            didSet {
                guard let viewModel = viewModel else { return }
                buttonTitle = viewModel.title
            }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(button)
        configureButton()
        styleButton()
        styleCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureButton() {
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            button.heightAnchor.constraint(equalToConstant: 100),
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }
    
    func styleCell() {
        selectedBackgroundView = nil //doesn't work
        backgroundColor = .clear
    }
    
    func styleButton() {
        button.styleButton(title: buttonTitle, backgroundColor: .dailyDiaryTileColor)
    }
    
}

//
//  IdeasCell.swift
//  Daily
//
//  Created by julie on 21.11.2020.
//

import UIKit

class IdeasCell: UITableViewCell {
    
    static let cellIdentifier = "IdeasCell"
    
    var button = UIButton()
    
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
    
    func configureCell(cellTitle: String) {
        button.setTitle(cellTitle, for: .normal)
    }
    
    func configureButton() {
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }
    
    func styleCell() {
        backgroundColor = .clear
    }
    
    func styleButton() {
        button.styleButton(backgroundColor: .dailyDiaryTileColor)
    }
    
}

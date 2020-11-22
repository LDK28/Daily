//
//  IdeasCell.swift
//  Daily
//
//  Created by julie on 21.11.2020.
//

import UIKit

class IdeasCell: UITableViewCell {
    
    static let cellIdentifier = "IdeasCell"

    let label = UILabel()
    
    var viewModel: IdeasCellViewModel? {
            didSet {
                guard let viewModel = viewModel else { return }
                label.text = viewModel.title
            }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        styleCell()
        
        contentView.addSubview(label)
        configureLabel()
        styleLabel()
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            label.heightAnchor.constraint(equalToConstant: 100),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    func styleCell() {
        selectedBackgroundView = nil //doesn't work
        backgroundColor = .clear
    }
    
    func styleLabel() {
        //label.styleLabel()
    }
}

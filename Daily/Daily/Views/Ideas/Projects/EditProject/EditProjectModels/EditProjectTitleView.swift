//
//  EditProjectTitleView.swift
//  Daily
//
//  Created by julie on 12.12.2020.
//

import UIKit

class EditProjectTitleView: UIView {
    
    let titleImageView = UIImageView(image: UIImage(systemName: "person.fill"))
    let titleLabel = UILabel()
    
    init(title: String) {
        super.init(frame: .zero)
        
        titleImageView.styleImageView(color: .dailyTitleTextColor)
        
        if let headerLabelFont = UIFont(name: "Stolzl-Bold", size: 30) {
            titleLabel.styleLabel(font: headerLabelFont, text: title, textAlignment: .center, textColor: .dailyTitleTextColor)
            titleLabel.addShadow()
        }
        
        addSubview(titleImageView)
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleImageView.heightAnchor.constraint(equalToConstant: 30),
            titleImageView.widthAnchor.constraint(equalTo: titleImageView.heightAnchor),
            titleImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: titleImageView.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

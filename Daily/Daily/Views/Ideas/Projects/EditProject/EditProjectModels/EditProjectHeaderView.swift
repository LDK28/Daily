//
//  EditProjectHeaderView.swift
//  Daily
//
//  Created by julie on 15.12.2020.
//

import UIKit

class EditProjectHeaderView: UIView {
    
    let titleImageView = UIImageView(image: UIImage(systemName: "person.fill"))
    let titleLabel = UILabel()
    
    init(title: String) {
        super.init(frame: .zero)
        
        addSubview(titleImageView)
        addSubview(titleLabel)
        
        titleImageView.styleImageView(color: .dailyTitleTextColor)
        
        if let headerLabelFont = UIFont(name: "Stolzl-Bold", size: 30) {
            titleLabel.styleLabel(font: headerLabelFont, text: title, textAlignment: .center, textColor: .dailyTitleTextColor)
            titleLabel.addShadow()
        }
        
        NSLayoutConstraint.activate([
            titleImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleImageView.heightAnchor.constraint(equalToConstant: 30),
            titleImageView.widthAnchor.constraint(equalTo: titleImageView.heightAnchor),
            titleImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: titleImageView.bottomAnchor, constant: 8),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

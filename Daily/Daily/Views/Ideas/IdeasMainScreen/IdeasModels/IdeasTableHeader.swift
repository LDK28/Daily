//
//  IdeasTableHeader.swift
//  Daily
//
//  Created by julie on 21.11.2020.
//

import UIKit

class TitleView: UIView {
    private let titleLabel = UILabel()
    
    init(title: String) {
        super.init(frame: .zero)
        
        if let headerLabelFont = UIFont(name: "Stolzl-Bold", size: 36) {
            titleLabel.styleLabel(font: headerLabelFont, text: title, textAlignment: .center, textColor: .dailyTitleTextColor)
            titleLabel.addShadow()
        }
        
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

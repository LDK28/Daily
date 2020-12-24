//
//  EditProjectHeaderView.swift
//  Daily
//
//  Created by julie on 15.12.2020.
//

import UIKit

class EditProjectHeaderView: UIView {
    
    let titleImageView = UIImageView(image: UIImage(systemName: "person.fill"))
    let titleTextView = UITextView()
    
    init(title: String) {
        super.init(frame: .zero)
        
        addSubview(titleImageView)
        addSubview(titleTextView)
        
        titleImageView.styleImageView(color: .dailyTitleTextColor)
        
        if let headerFont = UIFont(name: "Stolzl-Bold", size: 28) {
            titleTextView.styleClearTextView(font: headerFont, text: title, textColor: .dailyTitleTextColor, textAlignment: .center)
            titleTextView.textContainer.maximumNumberOfLines = 2
            titleTextView.textContainer.lineBreakMode = .byTruncatingTail
//            titleTextView.isScrollEnabled = false
        }
        
        NSLayoutConstraint.activate([
            titleImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            titleImageView.heightAnchor.constraint(equalToConstant: 30),
            titleImageView.widthAnchor.constraint(equalTo: titleImageView.heightAnchor),
            titleImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleTextView.topAnchor.constraint(equalTo: titleImageView.bottomAnchor, constant: 8),
            titleTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            titleTextView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


//
//  EditProjectHeaderView.swift
//  Daily
//
//  Created by julie on 15.12.2020.
//

import UIKit

class EditProjectHeaderView: UIView {
    
    let titleImageView = UIImageView(image: UIImage(systemName: "person.fill"))
    let titleTextFiels = UITextField()
    
    init(title: String) {
        super.init(frame: .zero)
        
        addSubview(titleImageView)
        addSubview(titleTextFiels)
        
        titleImageView.styleImageView(color: .dailyTitleTextColor)
        
        if let headerFont = UIFont(name: "Stolzl-Bold", size: 30) {
            titleTextFiels.styleProjectItemTextField(font: headerFont, text: "Project", textColor: .dailyTitleTextColor, textAlignment: .center)
            titleTextFiels.text = title
            titleTextFiels.addShadow()
        }
        
        NSLayoutConstraint.activate([
            titleImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleImageView.heightAnchor.constraint(equalToConstant: 30),
            titleImageView.widthAnchor.constraint(equalTo: titleImageView.heightAnchor),
            titleImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleTextFiels.topAnchor.constraint(equalTo: titleImageView.bottomAnchor, constant: 8),
            titleTextFiels.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

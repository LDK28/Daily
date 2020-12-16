//
//  EditProjectFooterView.swift
//  Daily
//
//  Created by julie on 15.12.2020.
//

import UIKit

class EditProjectFooterView: UIView {
    
    let addButton = UIButton()
    
    init(title: String) {
        super.init(frame: .zero)
        
        addSubview(addButton)
        
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            addButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            addButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
        
        if let buttonFont = UIFont(name: "Stolzl-Book", size: 20),
           let buttonImage = UIImage(systemName: "plus") {
            addButton.setTitleWithImage(text: title,
                                          with: buttonFont,
                                          in: .dailyTextColor,
                                          image: buttonImage,
                                          for: .normal,
                                          imageFirst: true)
            addButton.setTitleWithImage(text: title,
                                          with: buttonFont,
                                          in: .systemGray,
                                          image: buttonImage,
                                          for: .highlighted,
                                          imageFirst: true)
            addButton.styleButton(title: addButton.titleLabel?.text ?? "",
                                    backgroundColor: .clear,
                                    textAlignment: .center)
        }
        addButton.addTarget(self, action: #selector(didTapAddButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didTapAddButton(sender: UIButton) {
        
    }
}

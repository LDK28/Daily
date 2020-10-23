//
//  PlusButton.swift
//  Daily
//
//  Created by Арсений Токарев on 23.10.2020.
//

import UIKit


class PlusButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setBackgroundImage(UIImage(systemName: "plus"), for: .normal)
        self.titleLabel?.textColor = .white
        self.backgroundColor = .dailyTabBarColor
        self.layer.cornerRadius = frame.height/2
        self.layer.borderWidth = 4
        self.layer.borderColor = UIColor.white.cgColor
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
}

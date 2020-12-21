//
//  OptionsOverlayViewController.swift
//  Daily
//
//  Created by julie on 21.12.2020.
//

import UIKit

class OptionsOverlayVC: UIViewController {
    
    var buttonTopAnchorConstant: CGFloat = 0
    
    let changeProjectNameButton = UIButton()
    let deleteProjectButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        view.edgesIgnoringSafeArea(.all)
        
        view.backgroundColor = .dailyPlusButtonBlackoutColor
        
        view.addSubview(changeProjectNameButton)
        view.addSubview(deleteProjectButton)
        
        configureOverlayButton(title: "Change project name", button: changeProjectNameButton)
        configureOverlayButton(title: "Delete project", button: deleteProjectButton)
        
    }
    
    func configureOverlayButton(title: String, button: UIButton) {
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: buttonTopAnchorConstant),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            button.widthAnchor.constraint(equalToConstant: view.frame.width * 0.7)
        ])
        button.styleButton(title: title, backgroundColor: .dailyTabBarColor, textAlignment: .center)
        buttonTopAnchorConstant += 50
    }
    
}

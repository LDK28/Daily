//
//  OptionsOverlayViewController.swift
//  Daily
//
//  Created by julie on 21.12.2020.
//

import UIKit

class OptionsOverlayVC: UIViewController {
    
    var buttonTopAnchorConstant: CGFloat = 10
    var buttonBottomAnchorConstant: CGFloat = -10
    
    let backgroundButton = UIButton()
    let deleteProjectItems = UIButton()
    let deleteProjectButton = UIButton()
    let cancelButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.frame.size.height = 100
        
        buttonBottomAnchorConstant -= view.frame.size.height / 2
        
        view.addSubview(backgroundButton)
        view.addSubview(deleteProjectItems)
        view.addSubview(deleteProjectButton)
        view.addSubview(cancelButton)
        
        configureBackgroundButton()
        configureOverlayButton(title: "Cancel", button: cancelButton)
        configureOverlayButton(title: "Delete items", button: deleteProjectItems)
        configureOverlayButton(title: "Delete project", button: deleteProjectButton)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func configureBackgroundButton() {
        NSLayoutConstraint.activate([
            backgroundButton.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundButton.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        backgroundButton.translatesAutoresizingMaskIntoConstraints = false
        backgroundButton.backgroundColor = .dailyPlusButtonBlackoutColor
    }
    
    func configureOverlayButton(title: String, button: UIButton) {
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: buttonBottomAnchorConstant),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: view.frame.width * 0.6),
            button.heightAnchor.constraint(equalTo: button.widthAnchor, multiplier: 0.2)
        ])
        button.styleButton(title: title, backgroundColor: .dailyTabBarColor, textAlignment: .center)
        buttonBottomAnchorConstant -= (view.frame.width * 0.12 + 10)
    }
    
}

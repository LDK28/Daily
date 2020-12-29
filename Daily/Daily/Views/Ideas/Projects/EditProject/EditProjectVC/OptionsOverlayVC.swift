//
//  OptionsOverlayViewController.swift
//  Daily
//
//  Created by julie on 21.12.2020.
//

import UIKit

class OptionsOverlayVC: UIViewController {
    
	private var buttonTopAnchorConstant: CGFloat = 10
	private var buttonBottomAnchorConstant: CGFloat = -10
    
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
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.view?.subviews.forEach {
			$0.alpha = 0
		}
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		UIView.animate(withDuration: 0.3,
					   delay: 0,
					   options: .curveEaseOut,
					   animations: { [weak self] in
			guard let self = self else { return }
						self.view?.subviews.forEach {
							$0.alpha = 1
							$0.frame.origin.y -= 15
						}
						self.backgroundButton.backgroundColor = .dailyMoreButtonBlackoutColor
		})
	}
    
    override func viewDidDisappear(_ animated: Bool) {
		self.dismiss(animated: false, completion: nil)
    }
    
    func configureBackgroundButton() {
        NSLayoutConstraint.activate([
            backgroundButton.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundButton.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        backgroundButton.translatesAutoresizingMaskIntoConstraints = false
        backgroundButton.backgroundColor = .clear
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

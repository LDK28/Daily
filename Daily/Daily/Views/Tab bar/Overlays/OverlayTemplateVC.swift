//
//  OverlayTemplateVC.swift
//  Daily
//
//  Created by Арсений Токарев on 04.11.2020.
//

import UIKit

class OverlayTemplateVC: UIViewController {

	internal let addButton = UIButton(type: .system)
	internal let cancelButton = UIButton(type: .system)
	internal let titleLabel = UILabel()
	
	
	override func loadView() {
		super.loadView()
		
		view.addSubview(titleLabel)
		view.addSubview(addButton)
		view.addSubview(cancelButton)
		
		addButton.styleOverlayButton(buttonType: .save)
		cancelButton.styleOverlayButton(buttonType: .cancel)
		
		configureLabel()
		configureButtons()
		
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = .dailyTabBarColor
		
		cancelButton.addTarget(self, action: #selector(didTapCancelButton), for: .touchUpInside)
    }
	
	@objc func didTapCancelButton() {
		self.remove()
	}

	func configureLabel() {
		NSLayoutConstraint.activate([
			titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
			titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
			titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -view.bounds.height / 10)
		])
	}
	
	func configureButtons() {
		NSLayoutConstraint.activate([
			addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
			addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
			
			cancelButton.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -5),
			cancelButton.bottomAnchor.constraint(equalTo: addButton.bottomAnchor),
		])
	}
}

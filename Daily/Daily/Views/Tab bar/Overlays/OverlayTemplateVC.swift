//
//  OverlayTemplateVC.swift
//  Daily
//
//  Created by Арсений Токарев on 04.11.2020.
//

import UIKit

class OverlayTemplateVC: UIViewController {

	internal let saveButton = UIButton(type: .system)
	internal let cancelButton = UIButton(type: .system)
	internal let titleLabel = UILabel()
	internal let headerTextField = UITextField()
	
	
	override func loadView() {
		super.loadView()
		
		view.addSubview(titleLabel)
		view.addSubview(saveButton)
		view.addSubview(cancelButton)
		view.addSubview(headerTextField)
		
		configureLabel()
		configureButtons()
		configureTitleTextField()
		
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
	
	func configureTitleTextField() {
		NSLayoutConstraint.activate([
			headerTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
			headerTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
			headerTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
			headerTextField.heightAnchor.constraint(equalToConstant: 40)
		])
	}
	
	func configureButtons() {
		NSLayoutConstraint.activate([
			saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
			saveButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
			
			cancelButton.trailingAnchor.constraint(equalTo: saveButton.leadingAnchor, constant: -5),
			cancelButton.bottomAnchor.constraint(equalTo: saveButton.bottomAnchor),
		])
	}
	
	func styleElements() {
		saveButton.styleOverlayButton(buttonType: .save)
		cancelButton.styleOverlayButton(buttonType: .cancel)
		headerTextField.styleOverlayTextField(placeholder: "Title")
	}
}

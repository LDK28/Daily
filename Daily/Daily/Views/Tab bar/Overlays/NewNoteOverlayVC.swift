//
//  NewNoteOverlayVC.swift
//  Daily
//
//  Created by Арсений Токарев on 02.11.2020.
//

import UIKit

class NewNoteOverlayVC: UIViewController {
	private let writeNewMemoLabel = UILabel()
	private let titleTextField = UITextField()
	private let descriptionTextField = UITextField()
	private let addButton = UIButton()
	private let cancelButton = UIButton()
	
	override func loadView() {
		super.loadView()
		
		view.addSubview(writeNewMemoLabel)
		view.addSubview(titleTextField)
		view.addSubview(descriptionTextField)
		view.addSubview(addButton)
		view.addSubview(cancelButton)
		
		styleElements()
		
		configureLabel()
		configureTitleTextField()
		configureDescriptionTextField()
		configureButtons()
		
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

		view.backgroundColor = .dailyTabBarColor
    }
    
	func configureLabel() {
		NSLayoutConstraint.activate([
			writeNewMemoLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
			writeNewMemoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
			writeNewMemoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -view.bounds.height / 10)
		])
	}
	
	func configureTitleTextField() {
		NSLayoutConstraint.activate([
			titleTextField.topAnchor.constraint(equalTo: writeNewMemoLabel.bottomAnchor, constant: 30),
			titleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
			titleTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
			titleTextField.heightAnchor.constraint(equalToConstant: 40)
		])
	}
	
	func configureDescriptionTextField() {
		NSLayoutConstraint.activate([
			descriptionTextField.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 15),
			descriptionTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
			descriptionTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
			//descriptionTextField.bottomAnchor.constraint(equalTo: addButton.topAnchor, constant: -30)
			descriptionTextField.heightAnchor.constraint(equalToConstant: 200)
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
	
	func styleElements() {
		writeNewMemoLabel.styleOverlayLabel(text: "Write new memo")
		titleTextField.styleOverlayTextField(placeholder: "Title")
		descriptionTextField.styleOverlayTextField(placeholder: "Description")
		addButton.styleOverlayButton(buttonType: .save)
		cancelButton.styleOverlayButton(buttonType: .cancel)
	}
}

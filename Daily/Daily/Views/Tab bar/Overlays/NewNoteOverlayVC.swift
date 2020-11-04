//
//  NewNoteOverlayVC.swift
//  Daily
//
//  Created by Арсений Токарев on 02.11.2020.
//

import UIKit

class NewNoteOverlayVC: OverlayTemplateVC {
	private let titleTextField = UITextField()
	private let descriptionTextView = UITextView()
	
	override func loadView() {
		super.loadView()
		
		view.addSubview(titleTextField)
		view.addSubview(descriptionTextView)
		
		styleElements()
		
		configureTitleTextField()
		configureDescriptionTextField()
		
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		descriptionTextView.delegate = self
		textViewDidBeginEditing(descriptionTextView)
		textViewDidEndEditing(descriptionTextView)
    }
	
	func configureTitleTextField() {
		NSLayoutConstraint.activate([
			titleTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
			titleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
			titleTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
			titleTextField.heightAnchor.constraint(equalToConstant: 40)
		])
	}
	
	func configureDescriptionTextField() {
		NSLayoutConstraint.activate([
			descriptionTextView.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 15),
			descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
			descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
			descriptionTextView.bottomAnchor.constraint(equalTo: addButton.topAnchor, constant: -30)
		])
	}
	
	func styleElements() {
		titleLabel.styleOverlayLabel(text: "Write new memo")
		titleTextField.styleOverlayTextField(placeholder: "Title")
		descriptionTextView.styleMultiLineTextView(placeholder: "Details")
	}
}

extension NewNoteOverlayVC: UITextViewDelegate {
	
	func textViewDidBeginEditing(_ textView: UITextView) {
		if textView.textColor != .dailyTextFieldTextColor {
			textView.text = nil
			textView.textColor = .dailyTextFieldTextColor
		}
	}
	
	func textViewDidEndEditing(_ textView: UITextView) {
		if textView.text.isEmpty {
			textView.text = "Details"
			textView.textColor = UIColor.systemGray2
		}
	}
}

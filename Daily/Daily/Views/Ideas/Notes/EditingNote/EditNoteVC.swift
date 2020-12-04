//
//  EditNoteVC.swift
//  Daily
//
//  Created by Арсений Токарев on 03.12.2020.
//  Copyright (c) 2020. All rights reserved.
//

import UIKit

protocol NoteTransferDelegate {
	func didChangeContentIn(note: NotesCellViewBackendModel)
}

class EditNoteVC: MainVC {
	var interactor: EditNoteBusinessLogic?
	var router: (EditNoteRoutingLogic & EditNoteDataPassing)?
	var delegate: NoteTransferDelegate?
	
	private let textField = UITextField()
	private let textView = UITextView()
  
	override func loadView() {
		super.loadView()
		configureTextField()
		configureTextView()
	}
  
}
extension EditNoteVC: EditNoteDisplayLogic {
	func displaySomething() {
	  
	}
}

extension EditNoteVC: UITextViewDelegate {
	func configureTextField() {
		view.addSubview(textField)
		textField.styleNoteTextField(placeholder: "Title")
		
		NSLayoutConstraint.activate([
			textField.topAnchor.constraint(equalTo: view.topAnchor, constant: 35),
			textField.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			textField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			textField.heightAnchor.constraint(equalToConstant: 45)
		])
	}
	
	func configureTextView() {
		view.addSubview(textView)
		textView.delegate = self
		textView.styleMultiLineTextView(placeholder: "Description of your note", backgroundColor: .clear)
		
		NSLayoutConstraint.activate([
			textView.topAnchor.constraint(equalTo: textField.bottomAnchor),
			textView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
			textView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			textView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
		])
	}
}

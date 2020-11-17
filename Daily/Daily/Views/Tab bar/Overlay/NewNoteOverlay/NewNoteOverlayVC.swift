//
//  NewNoteOverlayVC.swift
//  Daily
//
//  Created by Арсений Токарев on 17.11.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class NewNoteOverlayVC: OverlayVC {
	var router: (NewNoteOverlayRoutingLogic & NewNoteOverlayDataPassing)?
  
	private let noteTitleTextField = UITextField()
	let descriptionTextView = UITextView()

	override func loadView() {
		super.loadView()
		configureTableView()
		view.addSubview(descriptionTextView)
		configureDescriptionTextView()
		styleUI()
	}

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	func configureDescriptionTextView() {
		descriptionTextView.delegate = self
		textViewDidBeginEditing(descriptionTextView)
		textViewDidEndEditing(descriptionTextView)
		
		NSLayoutConstraint.activate([
			descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
			descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
			descriptionTextView.bottomAnchor.constraint(equalTo: tableView.bottomAnchor),
			descriptionTextView.topAnchor.constraint(equalTo: tableView.tableHeaderView?.bottomAnchor ?? titleLabel.topAnchor, constant: 20)
		])
	}

	override func styleUI() {
		super.styleUI()
		titleLabel.styleOverlayLabel(text: "Write new memo")
		descriptionTextView.styleMultiLineTextView(placeholder: "Details")
		tableView.separatorStyle = .none
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
		
	func textViewDidChange(_ textView: UITextView) {
		(interactor as? NewNoteOverlayInteractor)?.didEndEditingNote(text: textView.text)
	}
}


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
	private let descriptionTextView = UITextView()

	override func loadView() {
		super.loadView()
		
		view.addSubview(descriptionTextView)
		configureDescriptionTextView()
		
		styleUI()
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		saveButton.addTarget(self, action: #selector(tappedSaveButton), for: .touchUpInside)
	}
	
	override func styleUI() {
		super.styleUI()
		titleLabel.styleOverlayLabel(text: "Write new memo")
		tableView.separatorStyle = .none
		descriptionTextView.styleMultiLineTextView(placeholder: "Details",
												   fontSize: 18,
												   backgroundColor: .dailyOverlayTextFieldColor,
												   cornerRadius: 10)
	}
	
	@objc func tappedSaveButton() {
		saveButton.tapAnimation { [weak self] in
			guard let self = self else { return }
			self.tableView.endEditing(true)
			(self.interactor as? NewNoteOverlayInteractor)?.didTapSaveButton()
			self.remove()
			NotificationCenter.default.post(name: Notification.Name("Close Overlay"), object: nil)
		}
	}
}

// MARK: - UITextViewDelegate
extension NewNoteOverlayVC: UITextViewDelegate {
	
	func textViewDidBeginEditing(_ textView: UITextView) {
		if textView.textColor != .dailyOverlayTextFieldTextColor {
			textView.text = nil
			textView.textColor = .dailyOverlayTextFieldTextColor
		}
	}

	func textViewDidEndEditing(_ textView: UITextView) {
		if textView.text.isEmpty {
			textView.text = NSLocalizedString("Details", comment: "")
			textView.textColor = UITextView.placeholderColor
		}
	}
	
	func textViewDidChange(_ textView: UITextView) {
		(interactor as? NewNoteOverlayInteractor)?.didEndEditingNote(text: textView.text)
	}
	
	func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
		UIView.animate(withDuration: 0.2, animations: {
			self.view.frame.origin.y -= 40
		})
		return true
	}
	
	func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
		UIView.animate(withDuration: 0.2, animations: {
			self.view.frame.origin.y += 40
		})
		self.resignFirstResponder()
		return true
	}
}

extension NewNoteOverlayVC {
	func configureDescriptionTextView() {
		descriptionTextView.delegate = self
		
		NSLayoutConstraint.activate([
			descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
			descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
			descriptionTextView.bottomAnchor.constraint(equalTo: tableView.bottomAnchor),
			descriptionTextView.topAnchor.constraint(equalTo: tableView.tableHeaderView?.bottomAnchor ?? titleLabel.topAnchor, constant: 20)
		])
	}
}


extension NewNoteOverlayVC: NewNoteOverlayDisplayLogic {
	func askRouterToNavigateToNotes() {
		router?.navigateToNotes()
	}
}

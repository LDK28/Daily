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
		headerView = OverlayHeader(title: "Write new memo")
		super.loadView()
		view.addSubview(descriptionTextView)
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		saveButton.addTarget(self, action: #selector(tappedSaveButton), for: .touchUpInside)
	}
	
	@objc func tappedSaveButton() {
		saveButton.tapAnimation { [weak self] in
			guard let self = self else { return }
			self.tableView.endEditing(true)
			(self.interactor as? NewNoteOverlayInteractor)?.didTapSaveButton()
		}
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return tableView.frame.height
	}
}

extension NewNoteOverlayVC: DescriptionTextViewCellDelegate {
	func didChangeDescription(_ text: String?) {
		(interactor as? NewNoteOverlayBusinessLogic)?.didEndEditingNote(text: text)
	}
}


extension NewNoteOverlayVC: NewNoteOverlayDisplayLogic {
	
	func askRouterToNavigateToNotes() {
		router?.navigateToNotes()
	}
}

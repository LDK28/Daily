//
//  NewNoteOverlayInteractor.swift
//  Daily
//
//  Created by Арсений Токарев on 17.11.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit
import Firebase

class NewNoteOverlayInteractor: OverlayInteractor {
  
}

extension NewNoteOverlayInteractor: NewNoteOverlayBusinessLogic {
	override func fetchCells() {
		presenter?.present([
			DescriptionSectionViewModel()
		])
	}

	func didTapSaveButton() {
		guard let dataSource = dataSource as? NewNoteOverlayDataSource else { return }
		UserRequest.shared.append(NoteBackendModel(isPinned: false,
												   title: dataSource.title ?? "",
												   details: dataSource.noteContent,
												   assignedDateAndTime:
												   dataSource.assignedDay)) { result in
			switch result {
			case .success(()):
				(self.presenter as? NewNoteOverlayPresentationLogic)?.prepareViewForRoutingToNotes()
			case .failure(let error):
				debugPrint(error)
			}
		}
	}
	
	func didEndEditingNote(text: String?) {
		(dataSource as? NewNoteOverlayDataSource)?.noteContent = text ?? ""
	}	
}

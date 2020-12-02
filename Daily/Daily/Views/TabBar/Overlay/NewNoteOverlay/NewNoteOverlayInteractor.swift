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
	func didTapSaveButton() {
		guard let dataSource = dataSource as? NewNoteOverlayDataSource else { return }
		UserRequest.shared.add(note: NotesCellViewBackendModel(isPinned: false,
															   title: dataSource.title ?? "",
															   details: dataSource.noteContent,
															   assignedDateAndTime:
																dataSource.assignedDay)) {
			(self.presenter as? NewNoteOverlayPresentationLogic)?.prepareViewForRoutingToNotes()
		}
	}
	
	func didEndEditingNote(text: String) {
		(dataSource as? NewNoteOverlayDataSource)?.noteContent = text
	}	
}

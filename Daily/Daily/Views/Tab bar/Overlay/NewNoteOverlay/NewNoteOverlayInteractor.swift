//
//  NewNoteOverlayInteractor.swift
//  Daily
//
//  Created by Арсений Токарев on 17.11.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

class NewNoteOverlayInteractor: OverlayInteractor {
  
}

extension NewNoteOverlayInteractor: NewNoteOverlayBusinessLogic {
	
	func didEndEditingNote(text: String) {
		(dataSource as? NewNoteOverlayDataSource)?.noteContent = text
	}
	
}

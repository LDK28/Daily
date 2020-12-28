//
//  EditNotePresenter.swift
//  Daily
//
//  Created by Арсений Токарев on 03.12.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit

class EditNotePresenter {
	weak var viewController: EditNoteDisplayLogic?
	
}

extension EditNotePresenter: EditNotePresentationLogic {
	func present(title: String?, description: String?) {
		let viewModels: [MainCellViewModel] = [
			TextViewViewModel(cellType: TitleTextViewCell.self,
							  text: title,
							  fontSize: 36,
							  backgroundColor: .clear,
							  cornerRadius: 0),
			
			TextViewViewModel(cellType: EditNoteDescriptionTextViewCell.self,
							  text: description,
							  fontSize: 24,
							  backgroundColor: .clear,
							  cornerRadius: 0)
		]
		
		viewController?.cellsToDisplay = viewModels
	}
	
	func handleCellChange() {
		viewController?.updateCells()
	}
}

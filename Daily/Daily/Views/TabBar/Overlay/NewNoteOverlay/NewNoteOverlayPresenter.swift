//
//  NewNoteOverlayPresenter.swift
//  Daily
//
//  Created by Арсений Токарев on 23.11.2020.
//

import UIKit

class NewNoteOverlayPresenter: OverlayPresenter {
}

extension NewNoteOverlayPresenter: NewNoteOverlayPresentationLogic {
	func prepareViewForRoutingToNotes() {
		(viewController as? NewNoteOverlayDisplayLogic)?.askRouterToNavigateToNotes()
	}
}

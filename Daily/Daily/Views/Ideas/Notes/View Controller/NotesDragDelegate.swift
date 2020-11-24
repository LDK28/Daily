//
//  NotesDropDelegate.swift
//  Daily
//
//  Created by Арсений Токарев on 24.11.2020.
//

import UIKit

extension NotesVC: UITableViewDragDelegate {
	func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
		UIImpactFeedbackGenerator(style: .medium).impactOccurred()
		return interactor?.dragItems(for: indexPath) ?? []
	}
	func tableView(_ tableView: UITableView, dragPreviewParametersForRowAt indexPath: IndexPath) -> UIDragPreviewParameters? {
		let parametr = UIDragPreviewParameters()
		parametr.visiblePath = UIBezierPath(roundedRect: cellsToDisplay[indexPath.row].containerView.frame, cornerRadius: 5)
		parametr.backgroundColor = .clear
		return parametr
	}
}

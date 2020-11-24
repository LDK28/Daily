//
//  NoteDragDelegate.swift
//  Daily
//
//  Created by Арсений Токарев on 24.11.2020.
//

import UIKit

extension NotesVC: UITableViewDropDelegate {
	
	func tableView(_ tableView: UITableView, canHandle session: UIDropSession) -> Bool {
		return interactor?.canHandle(session) ?? false
	}

	func tableView(_ tableView: UITableView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UITableViewDropProposal {
		var dropProposal = UITableViewDropProposal(operation: .cancel)
		
		guard session.items.count == 1 else { return dropProposal }
		
		if tableView.hasActiveDrag {
			dropProposal = UITableViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
		}

		return dropProposal
	}
	
	func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) {
		let destinationIndexPath: IndexPath
		
		if let indexPath = coordinator.destinationIndexPath {
			destinationIndexPath = indexPath
		} else {
			// Get last index path of table view.
			let section = tableView.numberOfSections - 1
			let row = tableView.numberOfRows(inSection: section)
			destinationIndexPath = IndexPath(row: row, section: section)
		}
		
		coordinator.session.loadObjects(ofClass: NSString.self) { items in
			// Consume drag items.
			guard let stringItems = items as? [String] else { return }
			
			var indexPaths = [IndexPath]()
			for (index, _) in stringItems.enumerated() {
				let indexPath = IndexPath(row: destinationIndexPath.row + index, section: destinationIndexPath.section)
				//self.model.addItem(item, at: indexPath.row)
				indexPaths.append(indexPath)
			}
			tableView.insertRows(at: indexPaths, with: .automatic)
		}
	}
	
	func tableView(_ tableView: UITableView, dropPreviewParametersForRowAt indexPath: IndexPath) -> UIDragPreviewParameters? {
		let parametr = UIDragPreviewParameters()
		parametr.visiblePath = UIBezierPath(roundedRect: cellsToDisplay[indexPath.row].containerView.frame, cornerRadius: 5)
		parametr.backgroundColor = .clear
		return parametr
	}
}

//
//  InteractionWithElements.swift
//  Daily
//
//  Created by Арсений Токарев on 30.11.2020.
//

import UIKit

extension NotesVC: UISearchBarDelegate {
	func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
		isSearching = false
	}
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		searchBar.resignFirstResponder()
	}
	
	func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
		/* filter cells */
	}
}

extension NotesVC {
		
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if isEditingNotes {
			guard let selectedCell = (tableView.cellForRow(at: indexPath) as? NotesCell) else { return }
			selectedCell.isChosen.toggle()
			if selectedCell.isChosen {
				selectedIndexPaths.append(indexPath)
			} else {
				selectedIndexPaths.removeAll(where: { $0 == indexPath })
			}
		} else {
			/* navigate to selected note view */
		}
	}
	
	@objc func searchIconTapped() {
		isSearching = true
	}
		
	@objc func cancelIconTapped() {
		UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
		guard
			let selectedCells =
				self.selectedIndexPaths
					.map ({ self.tableView.cellForRow(at: $0) }) as? [NotesCell]
		else { return }
		selectedCells.forEach( { $0.isChosen = false })
		selectedIndexPaths = []
	}
	
	@objc func trashIconTapped() {
		UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
		trashIcon.tapAnimation { [weak self] in
			guard let self = self else { return }
			let rowsToDelete = self.selectedIndexPaths.map { $0.row }
			self.interactor?.deleteModels(at: rowsToDelete) {
				self.tableView.beginUpdates()
				self.tableView.deleteRows(at: self.selectedIndexPaths, with: .fade)
				self.tableView.endUpdates()
				self.selectedIndexPaths = []
			}
		}
	}
	
	@objc func pinIconTapped() {
		UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
		pinIcon.tapAnimation { [weak self] in
			guard
				let self = self,
				let cellViewModels = self.cellsToDisplay as? [NotesCellTableViewModel]
			else { return }
			
			let unpinAll = cellViewModels.filter { $0.isPinned }.count == self.selectedIndexPaths.count ? true : false
			let rowsToUpdate = unpinAll ?
				self.selectedIndexPaths
					.map { $0.row } :
				self.selectedIndexPaths
					.map { $0.row }
					.filter {
						!cellViewModels[$0].isPinned
					}
			self.interactor?.updateModels(unpinAll ? .unpin : .pin, at: rowsToUpdate.sorted(by: >)) {
				self.tableView.beginUpdates()
				self.tableView.reloadRows(at: self.selectedIndexPaths, with: .automatic)
				self.tableView.endUpdates()
				self.selectedIndexPaths = []
			}
		}
	}
	
	@objc func longPressed(sender: UILongPressGestureRecognizer) {
		let locationInView = sender.location(in: tableView)
		guard
			let indexPath = tableView.indexPathForRow(at: locationInView),
			let cell = tableView.cellForRow(at: indexPath) as? NotesCell,
			isEditingNotes != true
		else { return }
		UIImpactFeedbackGenerator(style: .medium).impactOccurred()
		cell.tapAnimation { [weak self] in
			if sender.state == .began {
				guard let self = self else { return }
				cell.isChosen = true
				self.selectedIndexPaths.append(indexPath)
				self.isEditingNotes = true
			}
		}
	}
}


// MARK: - Nav bar items change
extension NotesVC {
	internal func didToggleSearchingMode() {
		
		if isSearching {
			searchBar.showsCancelButton = true
			UIView.animate(withDuration: 0.2, delay: 0.01,
						   options: .curveEaseOut,
						   animations: { [weak self] in
				
							guard let self = self else { return }
							self.searchIcon.alpha = 0
							
			}) { [weak self] _ in
				guard let self = self else { return }
				self.setSearchBarItem()
				UIView.animate(withDuration: 0.2, delay: 0.01,
							   options: .curveEaseOut,
							   animations: { [weak self] in
								
								guard let self = self else { return }
								self.searchBar.alpha = 1
				}) { _ in
					self.searchBar.becomeFirstResponder()
				}
			}
		} else {
			searchBar.showsCancelButton = false
			searchBar.resignFirstResponder()
			
			UIView.animate(withDuration: 0.2, delay: 0.01,
						   options: .curveEaseOut,
						   animations: { [weak self] in
				
							guard let self = self else { return }
							self.searchBar.alpha = 0
							
			}) { [weak self] _ in
				guard let self = self else { return }
				self.setDefaultItems()
				UIView.animate(withDuration: 0.2, delay: 0.01,
							   options: .curveEaseOut,
							   animations: { [weak self] in
								
								guard let self = self else { return }
								self.searchIcon.alpha = 1
				})
			}
		}
		
	}
	
	internal func didToggleEditingNotesMode() {
		if isEditingNotes {
			UIView.animate(withDuration: 0.1, delay: 0.01,
						   options: .curveEaseOut,
						   animations: { [weak self] in
				
							guard let self = self else { return }
							self.searchIcon.alpha = 0
							
			}) { [weak self] _ in
				guard let self = self else { return }
				self.setEditingItems()
				UIView.animate(withDuration: 0.1, delay: 0.01,
							   options: .curveEaseOut,
							   animations: { [weak self] in
								
								guard let self = self else { return }
								self.trashIcon.alpha = 1
								self.cancelIcon.alpha = 1
								self.pinIcon.alpha = 1
								self.cancelIcon.transform = CGAffineTransform(rotationAngle: .pi)
				})
			}

		} else {
			UIView.animate(withDuration: 0.1, delay: 0.01,
						   options: .curveEaseOut,
						   animations: { [weak self] in
			
							guard let self = self else { return }
							self.trashIcon.alpha = 0
							self.cancelIcon.alpha = 0
							self.pinIcon.alpha = 0
							self.cancelIcon.transform = CGAffineTransform(rotationAngle: -0.01)
							
			}) { [weak self] _ in
				guard let self = self else { return }
				self.setDefaultItems()
				UIView.animate(withDuration: 0.1, delay: 0.01,
							   options: .curveEaseOut,
							   animations: { [weak self] in
								
								guard let self = self else { return }
								self.searchIcon.alpha = 1
				})
			}
			
		}
	}
	
	
	fileprivate func setEditingItems() {
		navigationItem.rightBarButtonItems = [
			UIBarButtonItem(customView: trashIcon),
			UIBarButtonItem(customView: UIView(frame: CGRect(origin: .zero, size: CGSize(width: 10, height: 30)))),
			UIBarButtonItem(customView: pinIcon)]
		
		navigationItem.leftBarButtonItem = UIBarButtonItem(customView: cancelIcon)
		navigationItem.hidesBackButton = true
	}
	
	fileprivate func setDefaultItems() {
		navigationController?.navigationBar.topItem?.titleView = nil
		navigationItem.leftBarButtonItems = nil
		navigationItem.hidesBackButton = false
		navigationItem.rightBarButtonItem = UIBarButtonItem(customView: searchIcon)
	}
	
	fileprivate func setSearchBarItem() {
		navigationItem.rightBarButtonItems = nil
		navigationItem.leftBarButtonItems = nil
		navigationItem.hidesBackButton = true
		navigationController?.navigationBar.topItem?.titleView = self.searchBar
	}
}

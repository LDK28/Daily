//
//  NotesVC.swift
//  Daily
//
//  Created by Арсений Токарев on 19.11.2020.
//  Copyright (c) 2020. All rights reserved.
//

import UIKit

final class NotesVC: MainTableVC, UIGestureRecognizerDelegate {
	var interactor: NotesBusinessLogic?
	var router: (NotesRoutingLogic & NotesDataPassing)?
	
	internal let trashIcon = UIImageView()
	internal let cancelIcon = UIImageView()
	internal let pinIcon = UIImageView()
	internal let searchIcon = UIImageView()
	internal let searchBar = UISearchBar()
	
	internal var isSearching = false {
		didSet {
			didToggleSearchingMode()
		}
	}
	
	internal var isEditingNotes = false {
		didSet {
			didToggleEditingNotesMode()
		}
	}
	
	internal var selectedIndexPaths: [IndexPath] = [] {
		didSet {
			if selectedIndexPaths.count == 0 {
				isEditingNotes = false
			}
		}
	}

	override func loadView() {
		super.loadView()
		configureTableView()
		configureInteractionIcons()
		configureSearchBar()
		configureLongPressGesture()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		searchBar.delegate = self
		interactor?.fetchCells()
		navigationItem.backButtonTitle = NSLocalizedString("Notes", comment: "")
		navigationItem.rightBarButtonItem = UIBarButtonItem(customView: searchIcon)
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		if let selectedCells =
			selectedIndexPaths
				.map({ tableView.cellForRow(at: $0)}) as? [NotesCell] {
			selectedCells
				.forEach{ $0.isChosen = false }
		}
		selectedIndexPaths = []
	}
	
	override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
		return UIView()
	}
	
	override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
		return .none
	}

	override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
		return false
	}
}

extension NotesVC: NotesDisplayLogic {
	func displayCells() {
		DispatchQueue.main.async {
			self.tableView.reloadData()
		}
	}
	
	func updateViewModelForCell(at indexPaths: [IndexPath]) {
		indexPaths
			.forEach {
				(tableView.cellForRow(at: $0) as? NotesCell)?.setViewModel(cellsToDisplay[$0.row])
			}
	}
}

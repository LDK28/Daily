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
	var cellsToDisplay: [NotesCell] = []
	
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
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		selectedIndexPaths = []
		cellsToDisplay.forEach( { $0.isChosen = false })
		isSearching = false
		searchBar.text = nil
		interactor?.fetchCells()
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return cellsToDisplay.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return cellsToDisplay[indexPath.row]
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
	func finishDisplayingCells() {
		DispatchQueue.main.async {
			self.tableView.reloadData()
		}
	}
}




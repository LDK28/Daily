//
//  NotesVC.swift
//  Daily
//
//  Created by Арсений Токарев on 19.11.2020.
//  Copyright (c) 2020. All rights reserved.
//

import UIKit

class NotesVC: MainTableVC, UIGestureRecognizerDelegate {
	var interactor: NotesBusinessLogic?
	var router: (NotesRoutingLogic & NotesDataPassing)?
	var cellsToDisplay: [NotesCell] = []
	var dragInitialIndexPath: IndexPath?
	var dragCellSnapshot: UIView?
	
	private let trashIcon = UIImageView()
	private let cancelIcon = UIImageView()
	private let pinIcon = UIImageView()
	private var isEditingNotes = false {
		didSet {
			if isEditingNotes {
				UIView.animate(withDuration: 0.2, delay: 0.01, options: .curveEaseOut, animations: {
					self.trashIcon.alpha = 1
					self.cancelIcon.alpha = 1
					self.pinIcon.alpha = 1
					self.cancelIcon.transform = CGAffineTransform(rotationAngle: .pi)
				})
			} else {
				UIView.animate(withDuration: 0.3, delay: 0.01, options: .curveEaseOut, animations: {
					self.trashIcon.alpha = 0
					self.cancelIcon.alpha = 0
					self.pinIcon.alpha = 0
					self.cancelIcon.transform = CGAffineTransform(rotationAngle: -0.01)
				})
			}
		}
	}
	private var selectedIndexPaths: [IndexPath] = [] {
		didSet {
			if selectedIndexPaths.count == 0 {
				isEditingNotes = false
			}
		}
	}
	
	override func loadView() {
		super.loadView()
		configureTableView()
		configureNavigationBarItems()
		configureLongPressGesture()
	}
  
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		interactor?.fetchCells()
	}
	
	override func viewDidDisappear(_ animated: Bool) {
		super.viewDidDisappear(animated)
		selectedIndexPaths = []
		cellsToDisplay.forEach( { $0.isChosen = false })
	}
}

extension NotesVC: NotesDisplayLogic {
	func finishDisplayingCells() {
		DispatchQueue.main.async {
			self.tableView.reloadData()
		}
	}
}

// MARK: - Cells Selection

extension NotesVC {
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if isEditingNotes {
			cellsToDisplay[indexPath.row].isChosen.toggle()
			if cellsToDisplay[indexPath.row].isChosen {
				selectedIndexPaths.append(indexPath)
			} else {
				selectedIndexPaths.removeAll(where: { $0 == indexPath })
			}
		} else {
			/* navigate to selected note view */
		}
	}
	
	private func configureNavigationBarItems() {
		trashIcon.styleNavBarImageView(withImageName: "trash", color: .systemRed)
		trashIcon.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(trashIconTapped)))
		
		pinIcon.styleNavBarImageView(withImageName: "pinIcon")
		pinIcon.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(pinIconTapped)))
		
		cancelIcon.styleNavBarImageView(withImageName: "cancel")
		cancelIcon.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cancelIconTapped)))
		
		navigationItem.rightBarButtonItems = [
			UIBarButtonItem(customView: trashIcon),
			UIBarButtonItem(customView: UIView(frame: CGRect(origin: .zero, size: CGSize(width: 10, height: 30)))),
			UIBarButtonItem(customView: pinIcon)]
		
		navigationItem.leftBarButtonItem = UIBarButtonItem(customView: cancelIcon)
	}
	
	@objc func cancelIconTapped() {
		UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
		cellsToDisplay.forEach( { $0.isChosen = false })
		selectedIndexPaths = []
	}
	
	@objc func trashIconTapped() {
		UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
		trashIcon.tapAnimation { [weak self] in
			guard let self = self else { return }
			let rowsToDelete = self.selectedIndexPaths.map { $0.row }
			let pinnedIndices =
				self.cellsToDisplay
					.enumerated()
					.filter { rowsToDelete.contains($0.offset) && $0.element.isPinned }
					.map { $0.offset}
			
			let unpinnedIndices =
				rowsToDelete
					.filter { !pinnedIndices.contains($0) }
			
			self.interactor?.deleteModels(pinnedNotesIndices: pinnedIndices, unpinnedNotesIndices: unpinnedIndices) {
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
			guard let self = self else { return }
			let unpinAll = self.cellsToDisplay.filter({ $0.isPinned && $0.isChosen }).count == self.selectedIndexPaths.count ? true : false
			self.cellsToDisplay.filter({ $0.isChosen }).forEach({
				$0.isPinned = !unpinAll
				$0.isChosen = false
			})
			self.selectedIndexPaths = []
		}
	}
	
	func configureLongPressGesture() {
		let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPressed))
		longPressRecognizer.minimumPressDuration = 0.5
		tableView.addGestureRecognizer(longPressRecognizer)
	}
	
	@objc func longPressed(sender: UILongPressGestureRecognizer) {
		let locationInView = sender.location(in: tableView)
		guard
			let indexPath = tableView.indexPathForRow(at: locationInView),
			isEditingNotes != true
		else { return }
		UIImpactFeedbackGenerator(style: .medium).impactOccurred()
		cellsToDisplay[indexPath.row].tapAnimation { [weak self] in
			if sender.state == .began {
				guard let self = self else { return }
				self.cellsToDisplay[indexPath.row].isChosen = true
				self.selectedIndexPaths.append(indexPath)
				self.isEditingNotes = true
			}
		}
	}
}


// MARK: - Table view configuration
extension NotesVC {
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
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
	
	private func configureTableView() {
		tableView.delegate = self
		tableView.dataSource = self
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.separatorStyle = .none
		tableView.scrollsToTop = true
		tableView.alwaysBounceVertical = false
		tableView.showsVerticalScrollIndicator = false
		tableView.showsHorizontalScrollIndicator = false
		
		let titleView = TitleView(title: "Notes")
		titleView.frame.size.height = 100
		let addView = AddNewNoteFooterView()
		addView.frame.size.height = 50
		tableView.tableFooterView = addView
		tableView.tableHeaderView = titleView
		
		tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: addView.frame.size.height, right: 0)
		
		tableView.register(NotesCell.self, forCellReuseIdentifier: NotesCell.cellIdentifier)
	}
}

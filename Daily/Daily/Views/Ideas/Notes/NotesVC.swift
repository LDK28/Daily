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
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		selectedIndexPaths.removeAll()
		cellsToDisplay.forEach( { $0.isChosen = false })
	}
}

extension NotesVC: NotesDisplayLogic {
	func delete(at indexPath: IndexPath) {
		tableView.beginUpdates()
		tableView.deleteRows(at: [indexPath], with: .fade)
		tableView.endUpdates()
	}
	
	func insert(at: IndexPath) {
		tableView.beginUpdates()
		tableView.insertSections(IndexSet(at), with: .automatic)
		tableView.endUpdates()
	}
	
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
		pinIcon.styleNavBarImageView(withImageName: "pinIcon")
		navigationItem.rightBarButtonItems = [
			UIBarButtonItem(customView: trashIcon),
			UIBarButtonItem(customView: UIView(frame: CGRect(origin: .zero, size: CGSize(width: 10, height: 30)))),
			UIBarButtonItem(customView: pinIcon)]
		
		cancelIcon.styleNavBarImageView(withImageName: "cancel")
		cancelIcon.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cancelIconTapped)))
		navigationItem.leftBarButtonItem = UIBarButtonItem(customView: cancelIcon)
	}
	
	@objc func cancelIconTapped() {
		UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
		cellsToDisplay.forEach( { $0.isChosen = false })
		isEditingNotes = false
	}
	
	func configureLongPressGesture() {
		let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPressed))
		longPressRecognizer.minimumPressDuration = 0.5
		tableView.addGestureRecognizer(longPressRecognizer)
	}
	
	@objc func longPressed(sender: UILongPressGestureRecognizer) {
		let locationInView = sender.location(in: tableView)
		guard let indexPath = tableView.indexPathForRow(at: locationInView) else { return }
		if sender.state == .began {
			UIImpactFeedbackGenerator(style: .medium).impactOccurred()
			cellsToDisplay[indexPath.row].isChosen = true
			selectedIndexPaths.append(indexPath)
			isEditingNotes = true
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

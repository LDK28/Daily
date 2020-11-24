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
	
	override func loadView() {
		super.loadView()
		configureTableView()
		configureTrashIcon()
		
		let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPressed))
		longPressRecognizer.minimumPressDuration = 0.5
		tableView.addGestureRecognizer(longPressRecognizer)
	}
  
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		interactor?.fetchCells()
	}
	
	@objc func longPressed(sender: UILongPressGestureRecognizer) {
		let locationInView = sender.location(in: tableView)
		let indexPath = tableView.indexPathForRow(at: locationInView)
		cellsToDisplay[indexPath?.row ?? 0].containerView.layer.borderColor = UIColor.blue.cgColor
		cellsToDisplay[indexPath?.row ?? 0].containerView.layer.borderWidth = 4
		trashIcon.isHidden = false
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
			for cell in self.cellsToDisplay {
				cell.delegate = self
			}
			self.tableView.reloadData()
		}
	}
}

extension NotesVC: TripletButtonDelegate {
	func tappedTripletButton(_ sender: UIButton) {
		
	}
}

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
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
	
	override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
		return .none
	}

	override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
		return false
	}

	override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
		interactor?.moveRowAt(sourceRow: sourceIndexPath.row, destinationRow: destinationIndexPath.row)
		cellsToDisplay.insert(cellsToDisplay.remove(at: sourceIndexPath.row), at: destinationIndexPath.row)
	}
	
}

extension NotesVC: UITableViewDragDelegate {
	func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
		UIImpactFeedbackGenerator(style: .medium).impactOccurred()
		trashIcon.isHidden = false
		return interactor?.dragItems(for: indexPath) ?? []
	}
	func tableView(_ tableView: UITableView, dragPreviewParametersForRowAt indexPath: IndexPath) -> UIDragPreviewParameters? {
		let parametr = UIDragPreviewParameters()
		parametr.visiblePath = UIBezierPath(roundedRect: cellsToDisplay[indexPath.row].containerView.frame, cornerRadius: 5)
		parametr.backgroundColor = .clear
		return parametr
	}
	func tableView(_ tableView: UITableView, dragSessionDidEnd session: UIDragSession) {
		trashIcon.isHidden = true
	}
}


extension NotesVC {
	private func configureTrashIcon() {

		trashIcon.image = UIImage(systemName: "trash.fill")?.withTintColor(UIColor.dailyAdaptiveRed.withAlphaComponent(0.5)).withRenderingMode(.alwaysOriginal)
		trashIcon.isHidden = true
		navigationItem.rightBarButtonItem = UIBarButtonItem(customView: trashIcon)
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

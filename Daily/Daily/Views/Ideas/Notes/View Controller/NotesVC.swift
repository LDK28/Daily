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
	
	override func loadView() {
		super.loadView()
		configureTableView()
	}
  
	override func viewDidLoad() {
		super.viewDidLoad()
		let longpress = UILongPressGestureRecognizer(target: self, action: #selector(longPressGestureRecognized))
		longpress.minimumPressDuration = 0.5
		tableView.addGestureRecognizer(longpress)
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		interactor?.fetchCells()
	}
	
	fileprivate func firstThing(_ gestureRecognizer: UIGestureRecognizer) {
		guard let longPress = gestureRecognizer as? UILongPressGestureRecognizer else { return }

		let state = longPress.state
		let locationInView = longPress.location(in: tableView)
		let indexPath = tableView.indexPathForRow(at: locationInView)
		struct CellSnapshot {
			static var cellSnapshot : UIView? = nil
			static var cellIsAnimating : Bool = false
			static var cellNeedToShow : Bool = false
		}
		struct InitialPath {
			static var initialIndexPath : IndexPath? = nil
		}
		
		switch state {
		case UIGestureRecognizerState.began:
			UIImpactFeedbackGenerator(style: .medium).impactOccurred()
			guard
				let indexPath = indexPath,
				let cell = tableView.cellForRow(at: indexPath)
			else { return }
			
			var currentCellCenter = cell.center
			InitialPath.initialIndexPath = indexPath
			CellSnapshot.cellSnapshot = snapshotOfCell(cell)
			guard let snapShot = CellSnapshot.cellSnapshot else { return }
			snapShot.center = currentCellCenter
			snapShot.alpha = 0.0
			tableView.addSubview(snapShot)
			UIView.animate(withDuration: 0.25, animations: {
				CellSnapshot.cellIsAnimating = true
				currentCellCenter.y = locationInView.y
				snapShot.center = currentCellCenter
				snapShot.transform = CGAffineTransform(scaleX: 1.01, y: 1.01)
				snapShot.alpha = 0.9
				cell.alpha = 0.0
			}){ _ in
				CellSnapshot.cellIsAnimating = false
				cell.isHidden = true
			}
		case UIGestureRecognizerState.changed:
			guard
				let indexPath = indexPath,
				let initialIndexPath = InitialPath.initialIndexPath,
				let initialIndexPathRow = InitialPath.initialIndexPath?.row,
				let snapShot = CellSnapshot.cellSnapshot
			else {
				return
			}
			snapShot.center = locationInView
			
			guard
				indexPath != InitialPath.initialIndexPath
			else {
				return
			}
			cellsToDisplay.insert(cellsToDisplay.remove(at: initialIndexPathRow), at: indexPath.row)
			tableView.moveRow(at: initialIndexPath, to: indexPath)
			InitialPath.initialIndexPath = indexPath
		case .ended:
			if InitialPath.initialIndexPath != nil {
				guard let cell = tableView.cellForRow(at: InitialPath.initialIndexPath!),
					  let snapShot = CellSnapshot.cellSnapshot
				else { return }
				
				if CellSnapshot.cellIsAnimating {
					CellSnapshot.cellNeedToShow = true
				} else {
					cell.isHidden = false
					cell.alpha = 0.0
				}
				UIView.animate(withDuration: 0.25, animations: { () -> Void in
					snapShot.center = cell.center
					snapShot.transform = CGAffineTransform.identity
					snapShot.alpha = 0.0
					cell.alpha = 1.0
				}){ _ in
					InitialPath.initialIndexPath = nil
					snapShot.removeFromSuperview()
					CellSnapshot.cellSnapshot = nil
				}
			}
		default:
			return
		}
	}
		
	@objc func longPressGestureRecognized(_ gestureRecognizer: UIGestureRecognizer) {
		firstThing(gestureRecognizer)
	}
	
	func snapshotOfCell(_ inputView: UIView) -> UIView {
		UIGraphicsBeginImageContextWithOptions(inputView.bounds.size, false, 0.0)
		guard let context = UIGraphicsGetCurrentContext() else { return UIView()}
		inputView.layer.render(in: context)
		guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return UIView() }
		UIGraphicsEndImageContext()
		let cellSnapshot = UIImageView(image: image)
		cellSnapshot.layer.masksToBounds = false
		return cellSnapshot
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
		let movedObject = cellsToDisplay[sourceIndexPath.row]
		cellsToDisplay.remove(at: sourceIndexPath.row)
		cellsToDisplay.insert(movedObject, at: destinationIndexPath.row)
	}
}

extension NotesVC {
	private func configureTableView() {
		tableView.delegate = self
		tableView.dataSource = self
		//tableView.dragDelegate = self
		//tableView.dropDelegate = self
		//tableView.dragInteractionEnabled = true
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
		tableView.register(NotesCell.self, forCellReuseIdentifier: NotesCell.cellIdentifier)
	}
}

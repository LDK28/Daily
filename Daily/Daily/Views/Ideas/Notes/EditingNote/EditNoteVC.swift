//
//  EditNoteVC.swift
//  Daily
//
//  Created by Арсений Токарев on 03.12.2020.
//  Copyright (c) 2020. All rights reserved.
//

import UIKit

class EditNoteVC: MainTableVC {
	var interactor: EditNoteBusinessLogic?
	var router: (EditNoteRoutingLogic & EditNoteDataPassing)?
  
	override func loadView() {
		super.loadView()
		
		tableView.delegate = self
		tableView.dataSource = self
		tableView.register(TitleTextViewCell.self,
						   forCellReuseIdentifier: TitleTextViewCell.cellIdentifier)
		tableView.register(EditNoteDescriptionTextViewCell.self,
						   forCellReuseIdentifier: EditNoteDescriptionTextViewCell.cellIdentifier)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		interactor?.fetchCells()
		tableView.reloadData()
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		tableView.endEditing(true)
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cellViewModel = cellsToDisplay[indexPath.row]
		if let cell = tableView.dequeueReusableCell(withIdentifier: "\(cellViewModel.cellType)") as? TextViewCell {
			cell.setViewModel(cellViewModel)
			cell.delegate = self
			return cell
		}
		return UITableViewCell()
	}
}

extension EditNoteVC: EditNoteDisplayLogic {
	func updateCells() {
		DispatchQueue.main.async {
			self.tableView?.beginUpdates()
			self.tableView?.endUpdates()
		}
	}
}

extension EditNoteVC: TitleTextViewCellDelegate {
	func didChangeTitle(_ text: String?) {
		interactor?.didChange(title: text,
							  details: nil)
	}
}

extension EditNoteVC: DescriptionTextViewCellDelegate {
	func didChangeDescription(_ text: String?) {
		interactor?.didChange(title: nil,
							  details: text)
	}
}


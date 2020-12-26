//
//  EditNoteVC.swift
//  Daily
//
//  Created by Арсений Токарев on 03.12.2020.
//  Copyright (c) 2020. All rights reserved.
//

import UIKit

protocol NoteTransferDelegate {
	func didChangeContentIn(note: NoteBackendModel)
}

class EditNoteVC: MainTableVC {
	var interactor: EditNoteBusinessLogic?
	var router: (EditNoteRoutingLogic & EditNoteDataPassing)?
	//var delegate: NoteTransferDelegate?
	
//	private let textField = UITextField()
//	private let textView = UITextView()
  
	override func loadView() {
		super.loadView()
		
		tableView.delegate = self
		tableView.dataSource = self
		tableView.register(TitleTextViewCell.self,
						   forCellReuseIdentifier: TitleTextViewCell.cellIdentifier)
		tableView.register(DescriptionTextViewCell.self,
						   forCellReuseIdentifier: DescriptionTextViewCell.cellIdentifier)
//		configureTextField()
//		configureTextView()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		interactor?.fetchCells()
//		textView.delegate = self
//		textField.delegate = self
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		tableView.reloadData()
		interactor?.fetchNoteData()
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		tableView.endEditing(true)
		//textField.resignFirstResponder()
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

//MARK: - DisplayLogic
extension EditNoteVC: EditNoteDisplayLogic {
	func fillFieldsWithNoteContent(_ data: NoteBackendModel) {
	//	textField.text = data.title
		
		if data.details.isEmpty {
			//textViewDidEndEditing(textView)
			return
		}
		
		//textView.text = data.details
		//textView.textColor = .dailyNoteTextFieldTextColor
	}
}

// MARK: - TextView and TextField delegates
//extension EditNoteVC: UITextViewDelegate {
//	func textViewDidBeginEditing(_ textView: UITextView) {
//		if textView.textColor != .dailyNoteTextFieldTextColor {
//			textView.textColor = .dailyNoteTextFieldTextColor
//			textView.text = nil
//		}
//	}
//
//	func textViewDidEndEditing(_ textView: UITextView) {
//		if textView.text.isEmpty {
//			textView.text = NSLocalizedString("Tap here to edit", comment: "")
//			textView.textColor = UITextView.placeholderColor
//		}
//	}
//
//	func textViewDidChange(_ textView: UITextView) {
//		interactor?.didChange(title: nil,
//							  details: textView.text)
//	}
//}

extension EditNoteVC: TitleTextViewCellDelegate {
	func didChangeTitle(_ text: String?) {
//		interactor?.didChange(title: text,
//							  details: nil)
	}
}

extension EditNoteVC: DescriptionTextViewCellDelegate {
	func didChangeDescription(_ text: String?) {
//		interactor?.didChange(title: nil,
//							  details: text)
	}
}

//extension EditNoteVC: UITextFieldDelegate {
//	func textFieldDidEndEditing(_ textField: UITextField) {
//		interactor?.didChange(title: textField.text,
//							  details: nil)
//	}
//
//	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//		textField.resignFirstResponder()
//		return true
//	}
//}

// MARK: - UIElements Configuration
extension EditNoteVC {
//	func configureTextField() {
//		view.addSubview(textField)
//		textField.styleEditingTextField(placeholder: "Title",
//										fontSize: 36,
//										textColor: .dailyTextColor,
//										borderStyle: .none)
//
//		NSLayoutConstraint.activate([
//			textField.topAnchor.constraint(equalTo: view.topAnchor, constant: 35),
//			textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
//			textField.trailingAnchor.constraint(equalTo: view.trailingAnchor)
//		])
//	}
//
//	func configureTextView() {
//		view.addSubview(textView)
//		textView.delegate = self
//		textView.styleMultiLineTextView(placeholder: "Tap here to edit",
//										fontSize: 20,
//										backgroundColor: .clear,
//										cornerRadius: 0)
//
//		NSLayoutConstraint.activate([
//			textView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 15),
//			textView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
//			textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
//			textView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//		])
//	}
}

//
//  NewNoteOverlayVC.swift
//  Daily
//
//  Created by Арсений Токарев on 02.11.2020.
//

import UIKit

class NewNoteOverlayVC: OverlayTemplateVC {
	private let noteTitleTextField = UITextField()
	//private let descriptionTextView = UITextView()
	
	override func loadView() {
		super.loadView()
	
		//view.addSubview(descriptionTextView)
		
		styleElements()
		
		tableView.tableFooterView = tableView.dequeueReusableCell(withIdentifier: DescriptionCell.cellIdentifier)
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
//		descriptionTextView.delegate = self
//		textViewDidBeginEditing(descriptionTextView)
//		textViewDidEndEditing(descriptionTextView)
    }
	
	override func styleElements() {
		super.styleElements()
		titleLabel.styleOverlayLabel(text: "Write new memo")
		//descriptionTextView.styleMultiLineTextView(placeholder: "Details")
	}
	
	
}

//extension NewNoteOverlayVC: UITextViewDelegate {
//
//	func textViewDidBeginEditing(_ textView: UITextView) {
//		if textView.textColor != .dailyTextFieldTextColor {
//			textView.text = nil
//			textView.textColor = .dailyTextFieldTextColor
//		}
//	}
//
//	func textViewDidEndEditing(_ textView: UITextView) {
//		if textView.text.isEmpty {
//			textView.text = "Details"
//			textView.textColor = UIColor.systemGray2
//		}
//	}
//}

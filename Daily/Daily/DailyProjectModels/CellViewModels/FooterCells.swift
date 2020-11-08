//
//  FooterCells.swift
//  Daily
//
//  Created by Арсений Токарев on 08.11.2020.
//

import UIKit

class DescriptionCell: UITableViewCell {
	static let cellIdentifier = "DecriptionCell"
	
	let descriptionTextView = UITextView()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		descriptionTextView.styleMultiLineTextView(placeholder: "Details")
		contentView.backgroundColor = .clear
		
		descriptionTextView.delegate = self
		textViewDidBeginEditing(descriptionTextView)
		textViewDidEndEditing(descriptionTextView)
		
		contentView.addSubview(descriptionTextView)
		NSLayoutConstraint.activate([
			descriptionTextView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
			descriptionTextView.heightAnchor.constraint(equalToConstant: contentView.frame.height)
		])
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension DescriptionCell: UITextViewDelegate {

	func textViewDidBeginEditing(_ textView: UITextView) {
		if textView.textColor != .dailyTextFieldTextColor {
			textView.text = nil
			textView.textColor = .dailyTextFieldTextColor
		}
	}

	func textViewDidEndEditing(_ textView: UITextView) {
		if textView.text.isEmpty {
			textView.text = "Details"
			textView.textColor = UIColor.systemGray2
		}
	}
}
 

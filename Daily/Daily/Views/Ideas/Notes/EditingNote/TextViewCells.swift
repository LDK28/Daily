//
//  TextViewCell.swift
//  Daily
//
//  Created by Арсений Токарев on 26.12.2020.
//

import UIKit

struct TextViewViewModel: MainCellViewModel {
	var cellType: UITableViewCell.Type
	var text: String?
}

class TextViewCell: UITableViewCell, MainCellProtocol {
	internal let textView = UITextView()
	weak var delegate: UIViewController?
	
	func setViewModel(_ viewModel: MainCellViewModel?) {
		guard let viewModel = viewModel as? TextViewViewModel else { return }
		textView.text = viewModel.text
	}
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		textView.delegate = self
		textView.isScrollEnabled = false
		backgroundColor = .clear
		selectedBackgroundView = UIView()
		contentView.addSubview(textView)
		
		NSLayoutConstraint.activate([
			textView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
			textView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
			textView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
			textView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
		])
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension TextViewCell: UITextViewDelegate {
	func textViewDidBeginEditing(_ textView: UITextView) {
		if textView.textColor != .dailyNoteTextFieldTextColor {
			textView.textColor = .dailyNoteTextFieldTextColor
			textView.text = nil
		}
	}

	func textViewDidEndEditing(_ textView: UITextView) {
		if textView.text.isEmpty {
			textView.text = NSLocalizedString("Tap here to edit", comment: "")
			textView.textColor = UITextView.placeholderColor
		}
	}
	
}

protocol TitleTextViewCellDelegate: AnyObject {
	func didChangeTitle(_ text: String?)
}

class TitleTextViewCell: TextViewCell {
	static let cellIdentifier = "TitleTextViewCell"
	
	func textViewDidChange(_ textView: UITextView) {
		(delegate as? TitleTextViewCellDelegate)?.didChangeTitle(textView.text)
	}
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		textView.styleMultiLineTextView(placeholder: NSLocalizedString("Title", comment: ""),
										fontSize: 36,
										backgroundColor: .clear,
										cornerRadius: 0)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

protocol DescriptionTextViewCellDelegate: AnyObject {
	func didChangeDescription(_ text: String?)
}


class DescriptionTextViewCell: TextViewCell {
	static let cellIdentifier = "DescriptionTextViewCell"
	
	func textViewDidChange(_ textView: UITextView) {
		(delegate as? DescriptionTextViewCellDelegate)?.didChangeDescription(textView.text)
	}
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		textView.styleMultiLineTextView(placeholder: NSLocalizedString("Tap here to edit",
																	   comment: ""),
										fontSize: 24,
										backgroundColor: .clear,
										cornerRadius: 0)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}


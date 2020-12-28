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
	var fontSize: CGFloat
	var backgroundColor: UIColor
	var cornerRadius: CGFloat
}

class TextViewCell: UIElementContainerCell {
	
	internal let textView = UITextView()
	internal var placeholder: String = "Tap here to edit"
	
	override func setViewModel(_ viewModel: MainCellViewModel?) {
		guard let viewModel = viewModel as? TextViewViewModel else { return }
		textView.styleMultiLineTextView(placeholder: placeholder,
										fontSize: viewModel.fontSize,
										backgroundColor: viewModel.backgroundColor,
										cornerRadius: viewModel.cornerRadius)
		if !(viewModel.text ?? "").isEmpty {
			textView.text = viewModel.text
			textView.textColor = .dailyNoteTextFieldTextColor
		}
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
			textView.text = NSLocalizedString(placeholder, comment: "")
			textView.textColor = UITextView.placeholderColor
		}
	}
}

protocol TitleTextViewCellDelegate: AnyObject {
	func didChangeTitle(_ text: String?)
}

final class TitleTextViewCell: TextViewCell {
	static let cellIdentifier = "TitleTextViewCell"
	
	func textViewDidChange(_ textView: UITextView) {
		(delegate as? TitleTextViewCellDelegate)?.didChangeTitle(textView.text)
	}
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		placeholder = "Title"
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

protocol DescriptionTextViewCellDelegate: AnyObject {
	func didChangeDescription(_ text: String?)
}

class DescriptionTextViewCell: TextViewCell {
	
	func textViewDidChange(_ textView: UITextView) {
		(delegate as? DescriptionTextViewCellDelegate)?.didChangeDescription(textView.text)
	}
}

final class EditNoteDescriptionTextViewCell: DescriptionTextViewCell {
	static let cellIdentifier = "EditNoteDescriptionTextViewCell"
}

final class OverlayDescriptionTextViewCell: DescriptionTextViewCell {
	static let cellIdentifier = "OverlayDescriptionTextViewCell"
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		textView.leadingAnchor.constraint(equalTo:  leadingAnchor).isActive = true
		textView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}


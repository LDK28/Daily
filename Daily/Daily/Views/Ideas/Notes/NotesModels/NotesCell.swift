//
//  NoteCell.swift
//  Daily
//
//  Created by Арсений Токарев on 21.11.2020.
//

import UIKit

class NotesCell: UITableViewCell {
	static let cellIdentifier = "NotesCell"
	
	private let titleLabel = UILabel()
	private let detailsTextView =  UILabel()
	private let addToDiaryButton = UIButton()
	private let tripletButton = UIButton()
	
	var viewModel: NotesCellViewModel? {
		didSet {
			guard let viewModel = viewModel else { return }
			titleLabel.text = viewModel.title
			detailsTextView.text = viewModel.details
		}
	}

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		backgroundColor = .dailyNoteTileColor
		layer.cornerRadius = 5
		
		let selectedView = UIView()
		selectedView.backgroundColor = backgroundColor
		selectedBackgroundView = selectedView
		
		contentView.addSubview(addToDiaryButton)
		addToDiaryButton.setImage(UIImage(systemName: "calendar.badge.clock"), for: .normal)
		addToDiaryButton.translatesAutoresizingMaskIntoConstraints = false
		
		contentView.addSubview(tripletButton)
		tripletButton.setImage(UIImage(systemName: "ellipsis"), for: .normal)
		tripletButton.translatesAutoresizingMaskIntoConstraints = false
		
		contentView.addSubview(titleLabel)
		titleLabel.styleLabel(font: UIFont(name: "Stolzl-Regular", size: 18),
							  text: nil,
							  textAlignment: .justified,
							  textColor: .dailyTextColor,
							  numberOfLines: 2)
		
		
		contentView.addSubview(detailsTextView)
		detailsTextView.styleLabel(font: UIFont(name: "Stolzl-Book", size: 14),
								   text: nil,
								   textAlignment: .justified,
								   textColor: titleLabel.textColor,
								   numberOfLines: 4)
		
		
		NSLayoutConstraint.activate([
			tripletButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
			tripletButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
			tripletButton.widthAnchor.constraint(equalToConstant: 30),
			tripletButton.heightAnchor.constraint(equalTo: tripletButton.widthAnchor),
			
			addToDiaryButton.trailingAnchor.constraint(equalTo: tripletButton.leadingAnchor, constant: -5),
			addToDiaryButton.topAnchor.constraint(equalTo: tripletButton.topAnchor),
			addToDiaryButton.widthAnchor.constraint(equalTo: tripletButton.widthAnchor),
			addToDiaryButton.heightAnchor.constraint(equalTo: tripletButton.heightAnchor),
			
			titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
			titleLabel.trailingAnchor.constraint(equalTo: addToDiaryButton.leadingAnchor, constant: -40),
			titleLabel.topAnchor.constraint(equalTo: tripletButton.topAnchor),
			
			detailsTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
			detailsTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -25),
			detailsTextView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
			detailsTextView.trailingAnchor.constraint(equalTo: tripletButton.trailingAnchor)
		])
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

//
//  NoteCell.swift
//  Daily
//
//  Created by Арсений Токарев on 21.11.2020.
//

import UIKit

protocol TripletButtonDelegate {
	func tappedTripletButton(_ sender: UIButton)
}

class NotesCell: UITableViewCell {
	static let cellIdentifier = "NotesCell"
	
	private let titleLabel = UILabel()
	private let detailsTextView =  UILabel()
	private let addToDiaryButton = UIButton()
	private let tripletButton = UIButton()
	private let containerView = UIView()
	var delegate: TripletButtonDelegate?
	
	var viewModel: NotesCellViewModel? {
		didSet {
			guard let viewModel = viewModel else { return }
			titleLabel.text = viewModel.title
			detailsTextView.text = viewModel.details
		}
	}
	
	@objc func tappedTripletButton() {
		delegate?.tappedTripletButton(tripletButton)
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		containerView.layer.cornerRadius = 5
	}

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		backgroundColor = .clear
		containerView.backgroundColor = .dailyNoteTileColor

		let selectedView = UIView()
		selectedView.backgroundColor = backgroundColor
		selectedBackgroundView = selectedView
		
		addToDiaryButton.translatesAutoresizingMaskIntoConstraints = false
		if let addToDiaryImage =
			UIImage(systemName: "calendar.badge.clock")?
				.withTintColor(UIColor.dailyTextColor
				.withAlphaComponent(0.5))
				.withRenderingMode(.alwaysOriginal) {
			addToDiaryButton.setImage(addToDiaryImage, for: .normal)
		}
		
		tripletButton.translatesAutoresizingMaskIntoConstraints = false
		tripletButton.addTarget(self, action: #selector(tappedTripletButton), for: .touchUpInside)
		if let tripletImage =
			UIImage(systemName: "ellipsis")?
				.withTintColor(.dailyTextColor)
				.withRenderingMode(.alwaysOriginal)
				.withConfiguration(UIImage.SymbolConfiguration(pointSize: 24)) {
			tripletButton.setImage(tripletImage, for: .normal)
		}
		
		titleLabel.styleLabel(font: UIFont(name: "Stolzl-Regular", size: 18),
							  text: nil,
							  textAlignment: .justified,
							  textColor: .dailyTextColor,
							  numberOfLines: 2)
	
		detailsTextView.styleLabel(font: UIFont(name: "Stolzl-Book", size: 14),
								   text: nil,
								   textAlignment: .justified,
								   textColor: titleLabel.textColor,
								   numberOfLines: 4)
		
		
		containerView.translatesAutoresizingMaskIntoConstraints = false
		containerView.clipsToBounds = true
		
		[
			tripletButton,
			addToDiaryButton,
			titleLabel,
			detailsTextView
		].forEach({
			self.containerView.addSubview($0)
		})
		
		contentView.addSubview(containerView)
		
		NSLayoutConstraint.activate([
			containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
			containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
			containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
			containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -25),
			
			tripletButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15),
			tripletButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 15),
			tripletButton.widthAnchor.constraint(equalToConstant: 30),
			tripletButton.heightAnchor.constraint(equalTo: tripletButton.widthAnchor),
			
			addToDiaryButton.trailingAnchor.constraint(equalTo: tripletButton.leadingAnchor, constant: -10),
			addToDiaryButton.topAnchor.constraint(equalTo: tripletButton.topAnchor),
			addToDiaryButton.widthAnchor.constraint(equalTo: tripletButton.widthAnchor),
			addToDiaryButton.heightAnchor.constraint(equalTo: tripletButton.heightAnchor),
			
			titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
			titleLabel.trailingAnchor.constraint(equalTo: addToDiaryButton.leadingAnchor, constant: -40),
			titleLabel.topAnchor.constraint(equalTo: tripletButton.topAnchor),
			
			detailsTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
			detailsTextView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -25),
			detailsTextView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
			detailsTextView.trailingAnchor.constraint(equalTo: tripletButton.trailingAnchor)
		])
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

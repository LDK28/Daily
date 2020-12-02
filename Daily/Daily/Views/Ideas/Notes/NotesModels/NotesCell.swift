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
	private let pinIcon = UIImageView()
	private(set) var containerView = UIView()
	
	var viewModel: NotesCellViewModel? {
		didSet {
			guard let viewModel = viewModel else { return }
			titleLabel.text = viewModel.title
			isPinned = viewModel.isPinned
			detailsTextView.text = viewModel.details
		}
	}
	
	var isPinned: Bool = false {
		didSet {
			if isPinned {
				containerView.backgroundColor = .dailyPinnedNoteTileColor
				pinIcon.isHidden = false
			} else {
				containerView.backgroundColor = .dailyUnpinnedNoteTileColor
				pinIcon.isHidden = true
			}
		}
	}
	
	var isChosen: Bool = false {
		didSet {
			containerView.layer.borderWidth = isChosen ? 2 : 0
		}
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		containerView.layer.cornerRadius = 5
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
		isChosen = false
	}

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		containerView.backgroundColor = .dailyUnpinnedNoteTileColor
		containerView.layer.borderColor = UIColor.dailyTextColor.withAlphaComponent(0.8).cgColor
		backgroundColor = .clear

		let selectedView = UIView()
		selectedView.backgroundColor = backgroundColor
		selectedBackgroundView = selectedView
		
		addToDiaryButton.translatesAutoresizingMaskIntoConstraints = false
		addToDiaryButton.contentMode = .scaleAspectFill
		if let addToDiaryImage =
			UIImage(systemName: "calendar.badge.clock")?
				.withTintColor(UIColor.dailyTextColor
				.withAlphaComponent(0.5))
				.withConfiguration(UIImage.SymbolConfiguration(pointSize: 18))
				.withRenderingMode(.alwaysOriginal) {
			addToDiaryButton.setImage(addToDiaryImage, for: .normal)
		}
		
		pinIcon.translatesAutoresizingMaskIntoConstraints = false
		pinIcon.isHidden = true
		pinIcon.contentMode = .scaleAspectFit
		pinIcon.image = UIImage(named: "pinIcon")?.withTintColor(.dailyTextColor).withRenderingMode(.alwaysOriginal)
		
		
		titleLabel.styleLabel(font: UIFont(name: "Stolzl-Regular", size: 18),
							  text: nil,
							  textAlignment: .left,
							  textColor: .dailyTextColor,
							  numberOfLines: 2)
		
		detailsTextView.styleLabel(font: UIFont(name: "Stolzl-Book", size: 14),
								   text: nil,
								   textAlignment: .left,
								   textColor: titleLabel.textColor,
								   numberOfLines: 4)
		
		
		containerView.translatesAutoresizingMaskIntoConstraints = false
		containerView.clipsToBounds = true
		
		[
			pinIcon,
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
			containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12.5),
			containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12.5),
			
			addToDiaryButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
			addToDiaryButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
			addToDiaryButton.widthAnchor.constraint(equalToConstant: 30),
			addToDiaryButton.heightAnchor.constraint(equalTo: addToDiaryButton.widthAnchor),
			
			titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15),
			titleLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 2 / 3),
			titleLabel.topAnchor.constraint(equalTo: addToDiaryButton.topAnchor),
			
			detailsTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
			detailsTextView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -25),
			detailsTextView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
			detailsTextView.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 3 / 4),
			//detailsTextView.trailingAnchor.constraint(equalTo: pinIcon.leadingAnchor, constant: -20),
			
			pinIcon.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -15),
			pinIcon.centerXAnchor.constraint(equalTo: addToDiaryButton.centerXAnchor),
			//pinIcon.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
			pinIcon.widthAnchor.constraint(equalToConstant: 20),
			pinIcon.heightAnchor.constraint(equalTo: pinIcon.widthAnchor)
		])
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

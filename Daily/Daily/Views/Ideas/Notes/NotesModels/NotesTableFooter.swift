//
//  NotesTableFooter.swift
//  Daily
//
//  Created by Арсений Токарев on 21.11.2020.
//

import UIKit


class AddNewNoteFooterView: UIView {
	private let addButton = UIButton(type: .system)
	
	init() {
		super.init(frame: .zero)
		addButton.translatesAutoresizingMaskIntoConstraints = false
		addButton.setImage(
			UIImage(systemName: "plus")?
				.withRenderingMode(.alwaysOriginal)
				.withTintColor(.dailyTextColor)
			, for: .normal)
		addButton.setTitle("Add new note", for: .normal)
		addButton.setTitleColor(.dailyTextColor, for: .normal)
		addSubview(addButton)
		NSLayoutConstraint.activate([
			addButton.topAnchor.constraint(equalTo: topAnchor, constant: 5),
			addButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
			addButton.centerXAnchor.constraint(equalTo: centerXAnchor)
		])
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

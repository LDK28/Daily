//
//  NotesVCConfigurations.swift
//  Daily
//
//  Created by Арсений Токарев on 30.11.2020.
//

import UIKit

// MARK: - Table view configuration
extension NotesVC {
	
	internal func configureSearchBar() {
		searchBar.sizeToFit()
		searchBar.placeholder = "Find note"
		searchBar.barTintColor = .dailyOverlayButtonTileColor
		searchBar.tintColor = .dailyOverlayButtonTextColor
		searchBar.alpha = 0
	}
	
	internal func configureInteractionIcons() {
		
		searchIcon.styleNavBarImageView(withImageName: "search", color: .dailyTextColor)
		searchIcon.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(searchIconTapped)))
		
		trashIcon.styleNavBarImageView(withImageName: "trash", color: .systemRed)
		trashIcon.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(trashIconTapped)))
		
		pinIcon.styleNavBarImageView(withImageName: "pinIcon")
		pinIcon.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(pinIconTapped)))
		
		cancelIcon.styleNavBarImageView(withImageName: "cancel")
		cancelIcon.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cancelIconTapped)))
	}
	
	internal func configureLongPressGesture() {
		let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPressed))
		longPressRecognizer.minimumPressDuration = 0.5
		tableView.addGestureRecognizer(longPressRecognizer)
	}
	
	internal func configureTableView() {
		tableView.delegate = self
		tableView.dataSource = self
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.separatorStyle = .none
		tableView.scrollsToTop = true
		tableView.alwaysBounceVertical = false
		tableView.showsVerticalScrollIndicator = false
		tableView.showsHorizontalScrollIndicator = false
		
		let titleView = TitleView(title: "Notes")
		titleView.frame.size.height = 100
		let addView = AddNewNoteFooterView()
		addView.frame.size.height = 50
		tableView.tableFooterView = addView
		tableView.tableHeaderView = titleView
		
		tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: addView.frame.size.height, right: 0)
		
		tableView.register(NotesCell.self, forCellReuseIdentifier: NotesCell.cellIdentifier)
	}
}

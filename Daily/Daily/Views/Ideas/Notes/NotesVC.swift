//
//  NotesVC.swift
//  Daily
//
//  Created by Арсений Токарев on 19.11.2020.
//  Copyright (c) 2020. All rights reserved.
//

import UIKit

class NotesVC: MainTableVC {
	var interactor: NotesBusinessLogic?
	var router: (NotesRoutingLogic & NotesDataPassing)?
	
	var cellsToDisplay: [NotesCell] = []
	
	override func loadView() {
		super.loadView()
		configureTableView()
	}
  
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		interactor?.fetchCells()
	}
  
}

extension NotesVC {
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return cellsToDisplay.count
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return cellsToDisplay[indexPath.section]
	}
	
	override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
		return UIView()
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
}

extension NotesVC: NotesDisplayLogic {
	func insert(at: IndexPath) {
		tableView.beginUpdates()
		tableView.insertSections(IndexSet(at), with: .automatic)
		tableView.endUpdates()
	}
	
	func displaySomething() {
		DispatchQueue.main.async {
			self.tableView.reloadData()
		}
	}
}

extension NotesVC {
	private func configureTableView() {
		tableView.delegate = self
		tableView.dataSource = self
		tableView.separatorStyle = .none
		tableView.translatesAutoresizingMaskIntoConstraints = false
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
		tableView.register(NotesCell.self, forCellReuseIdentifier: NotesCell.cellIdentifier)
	}
}

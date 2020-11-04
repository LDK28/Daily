//
//  NewTaskOverlayVC.swift
//  Daily
//
//  Created by Арсений Токарев on 02.11.2020.
//

import UIKit

class NewTaskOverlayVC: OverlayTemplateVC {
	private let tableView: UITableView = {
		let table = UITableView()
		table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
		return table
	}()
	
	override func loadView() {
		super.loadView()
		
		view.addSubview(tableView)
		tableView.translatesAutoresizingMaskIntoConstraints = false
		
		styleElements()
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		tableView.delegate = self
		tableView.dataSource = self
    }
	
	override func styleElements() {
		super.styleElements()
		titleLabel.styleOverlayLabel(text: "Make new task")

	}
}


extension NewTaskOverlayVC: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		//more code to come
		return 3
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		//more code to come
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		
		return cell
	}
	
	
}

//
//  NewNoteOverlayVC.swift
//  Daily
//
//  Created by Арсений Токарев on 02.11.2020.
//

import UIKit

class NewNoteOverlayVC: OverlayTemplateVC {
	private let noteTitleTextField = UITextField()
	
	override func loadView() {
		super.loadView()
		
		styleElements()
		
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
    }
	
	override func styleElements() {
		super.styleElements()
		titleLabel.styleOverlayLabel(text: "Write new memo")
	}
	
	//DescriptionCell
}

// MARK: - Table View Delegate and DataSource

extension NewNoteOverlayVC {

	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionCell.cellIdentifier) as? DescriptionCell {
			return cell
		}
		return UITableViewCell()
	}

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 300
	}
}

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
	
}


extension NewNoteOverlayVC {
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return tableView.dequeueReusableCell(withIdentifier: DescriptionCell.cellIdentifier) ?? UITableViewCell()
	}
}

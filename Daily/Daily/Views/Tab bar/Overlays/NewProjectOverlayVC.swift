//
//  NewProjectOverlayVC.swift
//  Daily
//
//  Created by Арсений Токарев on 02.11.2020.
//

import UIKit

class NewProjectOverlayVC: OverlayTemplateVC {

	override func loadView() {
		super.loadView()
		
		styleElements()
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

    }
	
	
	func styleElements() {
		titleLabel.styleOverlayLabel(text: "Create new project")
	}

}

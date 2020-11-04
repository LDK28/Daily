//
//  NewTaskOverlayVC.swift
//  Daily
//
//  Created by Арсений Токарев on 02.11.2020.
//

import UIKit

class NewTaskOverlayVC: OverlayTemplateVC {
	
	override func loadView() {
		super.loadView()
		
		styleElements()
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
    }
	
	
	func styleElements() {
		titleLabel.styleOverlayLabel(text: "Make new task")
	}
}

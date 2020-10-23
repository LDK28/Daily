//
//  DiaryView.swift
//  Daily
//
//  Created by Арсений Токарев on 21.10.2020.
//

import UIKit

class DiaryVC: UIViewController {

	weak var plusButton: PlusButton!
	
	override func loadView() {
		super.loadView()
	}
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		view.backgroundColor = UIColor("E5E5E5")
		view.lightLG()
        
    }

}

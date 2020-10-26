//
//  MainVC.swift
//  Daily
//
//  Created by Арсений Токарев on 25.10.2020.
//

import UIKit

class MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		
		view.backgroundColor = UIColor("E5E5E5")
    }
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		view.addBackgroundGradient()
		
	}
	


}

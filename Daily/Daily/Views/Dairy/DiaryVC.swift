//
//  DiaryView.swift
//  Daily
//
//  Created by Арсений Токарев on 21.10.2020.
//

import UIKit

class DiaryVC: UIViewController {

    let plusButton = PlusButton(frame: CGRect(x: 32, y: 32, width: 50, height: 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()
		
		view.backgroundColor = UIColor("E5E5E5")
		view.lightLG()
        
        view.addSubview(plusButton)
    }

}

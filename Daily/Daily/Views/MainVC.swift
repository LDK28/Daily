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
		view.addBackgroundGradient()
	}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

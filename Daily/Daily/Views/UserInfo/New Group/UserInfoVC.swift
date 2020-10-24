//
//  UserInfoVCViewController.swift
//  Daily
//
//  Created by Арсений Быков on 24.10.2020.
//

import UIKit

class UserInfoVC: UIViewController {
   
    

    var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableview()
        // Do any additional setup after loading the view.
    }
    
    func configureTableview() {
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.rowHeight = 50
        tableView.pin(to: view)
    }

    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }

}


extension UserInfoVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}



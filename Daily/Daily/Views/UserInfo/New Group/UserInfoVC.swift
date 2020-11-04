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
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 200))

            let headerLabel = UILabel()
            
        
            headerView.backgroundColor = UIColor.colorForTheme(light: UIColor.dailyProjectTileColor, dark: UIColor.dailyProjectTileColor)
            headerLabel.text = "Vladimir"
            headerLabel.font = UIFont(name:"Stolzl-Book",size:24)
            headerLabel.textColor = UIColor.dailyTitleTextColor
            headerLabel.textAlignment = NSTextAlignment.center
        
            headerView.addSubview(headerLabel)
        
            return headerView
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 200
        }
}



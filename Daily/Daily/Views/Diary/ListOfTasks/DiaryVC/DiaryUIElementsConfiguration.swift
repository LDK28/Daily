import Foundation
import UIKit

extension DiaryVC {
    internal func configureHeaderLabel() {
        // MARK: - Header style
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.font = UIFont(name: "Stolzl-Bold", size: 36)
        headerLabel.textColor = .dailyTitleTextColor
        addShadow(to: headerLabel)
        headerLabel.textAlignment = .right
		let formatter = DateFormatter()
		formatter.dateFormat = "EEEE"
		headerLabel.text = formatter.string(from: Date()).capitalized
        
        // MARK: - Header constraints
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 16),
            headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headerLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
        ])
    }
    
    internal func configureSubheaderLabel() {
        // MARK: - Subheader style
        subheaderLabel.translatesAutoresizingMaskIntoConstraints = false
        subheaderLabel.font = UIFont(name: "Stolzl-Bold", size: 18)
        subheaderLabel.textColor = .dailyTitleTextColor
        addShadow(to: subheaderLabel)
        subheaderLabel.textAlignment = .right
        subheaderLabel.text = Date().asString(style: .long)
        
        // MARK: - Subheader constraints
        NSLayoutConstraint.activate([
            subheaderLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 56),
            subheaderLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subheaderLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
        ])
    }
    
    internal func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.scrollsToTop = true
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        
        // MARK: - Incorrect work with automaticDimension; will be fixed in future
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 150.0
        tableView.sectionFooterHeight = 20.0
        
        tableView.register(DiaryCell.self, forCellReuseIdentifier: DiaryCell.identifier)
        tableView.register(DiaryHeader.self, forHeaderFooterViewReuseIdentifier: DiaryHeader.identifier)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 90),
            tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    internal func configureNavigationController() {
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .dailyMainBackgroundColor
        navigationController?.navigationBar.tintColor = .dailyTextColor
        navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        navigationItem.backButtonTitle = NSLocalizedString("Diary", comment: "")

    }
    
    internal func addShadow(to view: UIView){
        view.layer.shadowOpacity = 0.05
        view.layer.shadowOffset = CGSize(width: 0, height: 10)
        view.layer.shadowRadius = 4
    }
}

// MARK: - Date -> String
extension Date {
  func asString(style: DateFormatter.Style) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = style
    return dateFormatter.string(from: self)
  }
}

//
//  UserInfoCellTableViewCell.swift
//  Daily
//
//  Created by Арсений Быков on 24.10.2020.
//

import UIKit

class UserInfoCell: UITableViewCell {

    var UserInfoView = UIImageView()
    var UserInfoLabel = UILabel()
    
    
    override init (style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(UserInfoView)
        addSubview(UserInfoLabel)
        setImageConstraints()
        setTitleLabelConstraints()
        
        configureUserInfoView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureUserInfoView() {
        UserInfoView.layer.cornerRadius = 10
        UserInfoView.clipsToBounds = true
    }
    
    func setImageConstraints() {
        UserInfoView.translatesAutoresizingMaskIntoConstraints = false
        UserInfoView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        UserInfoView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 7.5).isActive = true
        UserInfoView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        UserInfoView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    func setTitleLabelConstraints() {
        UserInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        UserInfoLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        UserInfoLabel.leadingAnchor.constraint(equalTo: UserInfoView.trailingAnchor, constant: 10).isActive = true
        UserInfoLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        UserInfoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 200).isActive = true
        
    }
    
    
       
}

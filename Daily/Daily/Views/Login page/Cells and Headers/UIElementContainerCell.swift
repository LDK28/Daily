//
//  LoginStandartCell.swift
//  Daily
//
//  Created by Арсений Токарев on 19.12.2020.
//

import UIKit

class UIElementContainerCell: UITableViewCell, MainCellProtocol {
	weak var delegate: UIViewController?
	
	func setViewModel(_ viewModel: MainCellViewModel?) {
		
	}
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		backgroundColor = .clear
		selectedBackgroundView = UIView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

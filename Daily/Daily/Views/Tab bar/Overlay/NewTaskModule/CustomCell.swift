//
//  CustomCell.swift
//  Daily
//
//  Created by Арсений Токарев on 06.11.2020.
//

import UIKit

class CustomCell: UITableViewCell {

	var textView = UIView()
	var icon = UIView()
	
	
	var component: DailyCellComponent? {
		didSet {
			guard let component = component else { return }
			
			self.icon.backgroundColor = component.icon.tileColor
			self.icon.subviews.forEach { $0.removeFromSuperview() }
			self.icon.addSubview(UIImageView(image: component.icon.symbol))
			
			//self.textView = component.textView
		}
	}
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		textView.translatesAutoresizingMaskIntoConstraints = false
		icon.translatesAutoresizingMaskIntoConstraints = false
		
		contentView.addSubview(textView)
		contentView.addSubview(icon)
		
		icon.layer.cornerRadius = 5
		
		NSLayoutConstraint.activate([
			icon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
			textView.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 10)
		])
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

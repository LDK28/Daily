//
//  OtherLoginOptionsView.swift
//  Daily
//
//  Created by Арсений Токарев on 19.12.2020.
//

import UIKit

struct OtherLoginOptionsCellViewModel: MainCellViewModel {
	var cellType: UITableViewCell.Type
	var text: String
}

class OtherLoginOptionsCell: UITableViewCell, MainCellProtocol {
	static let cellIdentifier = "OtherLoginOptionsCell"
	private let titleLabel = UILabel()
	
	func setViewModel(_ viewModel: MainCellViewModel?) {
		guard let viewModel = viewModel as? OtherLoginOptionsCellViewModel else { return }
		titleLabel.styleLabel(font: UIFont(name: "Stolzl-Book", size: 18),
							  text: viewModel.text)
	}

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		backgroundColor = .clear
		selectedBackgroundView = UIView()
		contentView.addSubview(titleLabel)
		
		let leftLineView = UIView()
		let rightLineView = UIView()
		[leftLineView, rightLineView].forEach {
			$0.translatesAutoresizingMaskIntoConstraints = false
			$0.backgroundColor = .dailySeparatorColor
			contentView.addSubview($0)
		}
		NSLayoutConstraint.activate([
			titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
			titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
			titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
			
			leftLineView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
			leftLineView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
			leftLineView.trailingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: -10),
			leftLineView.heightAnchor.constraint(equalToConstant: 2),
			
			rightLineView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
			rightLineView.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 10),
			rightLineView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
			rightLineView.heightAnchor.constraint(equalTo: leftLineView.heightAnchor)
		])
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

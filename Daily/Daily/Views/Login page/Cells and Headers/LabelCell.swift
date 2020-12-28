//
//  LabelCell.swift
//  Daily
//
//  Created by Арсений Токарев on 28.12.2020.
//

import UIKit

struct LabelCellViewModel: MainCellViewModel {
	var cellType: UITableViewCell.Type
	var text: String?
}

class LabelCell: AuthorizationCell {
	override func setViewModel(_ viewModel: MainCellViewModel?) {
		guard let viewModel = viewModel as? LabelCellViewModel else { return }
		label.text = viewModel.text
	}
	
	internal var label = UILabel()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		contentView.addSubview(label)
		NSLayoutConstraint.activate([
			label.topAnchor.constraint(equalTo: contentView.topAnchor),
			label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
			label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
			label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant:  -10)
		])
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

final class ErrorLabelCell: LabelCell {
	static let cellIdentifier = "ErrorLabelCell"
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		label.styleLabel(font: UIFont(name: "Stolzl-Book",
									  size: 18),
						 text: " ",
						 textAlignment: .left,
						 textColor: .dailyAdaptiveRed,
						 numberOfLines: 0)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

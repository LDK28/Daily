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
	
	private func createPath() -> UIBezierPath {
		let path = UIBezierPath()
		path.move(to: CGPoint(x: 10,
							  y: contentView.center.y))
		
		path.addLine(to: CGPoint(x: 50,
								 y: contentView.center.y))
		
		path.move(to: CGPoint(x: 150,
							  y: contentView.center.y))
		
		path.addLine(to: CGPoint(x: -10,
								 y: contentView.center.y))
		
		return path
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		addLineLayer()
	}
	
	private func addLineLayer() {
		let shapeLayer = CAShapeLayer()
		shapeLayer.path = createPath().cgPath
		shapeLayer.strokeColor = UIColor.dailySeparatorColor.cgColor
		shapeLayer.lineWidth = 2
		
		contentView.layer.addSublayer(shapeLayer)
	}

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		backgroundColor = .clear
		selectedBackgroundView = UIView()
		contentView.addSubview(titleLabel)
		NSLayoutConstraint.activate([
			titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
			titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
			titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
		])
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

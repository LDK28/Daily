//
//  UIImageViewExtension.swift
//  Daily
//
//  Created by julie on 04.11.2020.
//

import UIKit

extension UIImageView {
    
    func styleImageView(color: UIColor) {
        translatesAutoresizingMaskIntoConstraints = false
        tintColor = color
    }
	
	func styleNavBarImageView(withImageName imageName: String, color: UIColor = .lightGray) {
		guard let image =
				UIImage(named: imageName)?
					.withTintColor(color)
					.withRenderingMode(.alwaysOriginal)
		else { return }
		translatesAutoresizingMaskIntoConstraints = false
		backgroundColor = .clear
		contentMode = .scaleAspectFit
		let size = CGSize(width: 33, height: 33)
		UIGraphicsBeginImageContextWithOptions(size, false, image.scale)
		image.draw(in: CGRect(origin: .zero, size: size))
		let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		self.image = resizedImage
		isUserInteractionEnabled = true
	}
}

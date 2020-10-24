//
//  LinearGradientFromCSS.swift
//  Daily
//
//  Created by Арсений Токарев on 20.10.2020.
//

import UIKit

extension UIView {
	 func lightLG() {
		let gradientLayer = CAGradientLayer()

		gradientLayer.colors = [

			UIColor("FFFFFF", alpha: 0.57).cgColor,

			UIColor("B6E9FF", alpha: 0.57).cgColor

		]
		gradientLayer.locations = [0.21, 1]

		gradientLayer.startPoint = CGPoint(x: 0.25, y: 0.5)

		gradientLayer.endPoint = CGPoint(x: 0.75, y: 0.5)

		gradientLayer.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: 1.35, c: -1.35, d: 0, tx: 1.17, ty: -0.35))

		gradientLayer.bounds = self.bounds.insetBy(dx: -0.5*self.bounds.size.width, dy: -0.5*self.bounds.size.height)

		gradientLayer.position = self.center
		
		self.layer.addSublayer(gradientLayer)
		
	}
	
	
	func darkLG() {
		let gradientLayer = CAGradientLayer()

		gradientLayer.colors = [

		  UIColor("030506", alpha: 0.97).cgColor,

		  UIColor("0B3954", alpha: 0.89).cgColor,

		  UIColor("0E79AB", alpha: 0.83).cgColor

		]

		gradientLayer.locations = [0.15, 0.64, 0.98]

		gradientLayer.startPoint = CGPoint(x: 0.25, y: 0.5)

		gradientLayer.endPoint = CGPoint(x: 0.75, y: 0.5)

		gradientLayer.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: 1, c: -1, d: 0, tx: 1, ty: 0))

		gradientLayer.bounds = self.bounds.insetBy(dx: -0.5*self.bounds.size.width, dy: -0.5*self.bounds.size.height)

		gradientLayer.position = self.center

		self.layer.addSublayer(gradientLayer)
   }
	
	
	func addBackgroundGradient() {
		if #available(iOS 13, *) {
			UIScreen.main.traitCollection.userInterfaceStyle == .dark ? darkLG() : lightLG()
		} else {
			lightLG()
		}
	}
		
}

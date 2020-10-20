//
//  Theme.swift
//  Daily
//
//  Created by Арсений Токарев on 20.10.2020.
//

import UIKit

extension UIColor {
	static var dailyBackgroundColor: UIColor {
		colorForTheme(light: UIColor("0B3954", alpha: 0.0), dark: UIColor("82C1DF", alpha: 0.0))
	}


	
	
	static func colorForTheme(light: UIColor, dark: UIColor) -> UIColor {
		if #available(iOS 13, *) {
			return UIColor.init { traitCollection in
				return traitCollection.userInterfaceStyle == .dark ? dark : light
			}
		} else {
			return light
		}
	}
}

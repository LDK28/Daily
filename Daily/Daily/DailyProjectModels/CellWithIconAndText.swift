//
//  CellWithIconAndText.swift
//  Daily
//
//  Created by Арсений Токарев on 08.11.2020.
//

import UIKit


struct Icon {
	let tileColor: UIColor
	let symbol: UIImage?
	let symbolColor: UIColor
	
	
	init(symbolName: String, tileColor: UIColor, symbolColor: UIColor = .white) {
		self.tileColor = tileColor
		self.symbolColor = symbolColor
		
		guard let symbol = UIImage(systemName: symbolName) else {
			self.symbol = nil
			return
		}
		
		self.symbol = symbol.withAlignmentRectInsets(UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
	}
}

struct DailyCellComponent {
	var titles = [String]()
	var icon: Icon
	
	init(titles: [String], icon: Icon) {
		self.icon = icon
		for title in titles {
			self.titles.append(title.trimmingCharacters(in: .whitespacesAndNewlines).capitalized)
		}
	}
}

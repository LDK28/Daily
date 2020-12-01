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

enum CellPosition {
	case first, last, within, theOnly
}

protocol MainCellViewModel {
	var cellType: UITableViewCell.Type { get }
}

class DailyCellViewModel: MainCellViewModel {
	var title: String?
	var icon: Icon?
	var cellType: UITableViewCell.Type
	var isToggable: Bool
	var cellPosition: CellPosition
	
	func determineCornerRadius(OfCellViewModelWithIndex row: Int,
							   inSectionWithRowIndices indices: Range<Array<DailyCellViewModel>.Index>) {
		switch (indices.contains(row - 1),indices.contains(row + 1)) {
		case (true, true):
			self.cellPosition = .within
		case (false, false):
			self.cellPosition = .theOnly
		case (true, false):
			self.cellPosition = .last
		case (false, true):
			self.cellPosition = .first
		}
	}
	
	init(title: String?, icon: Icon?, cellType: UITableViewCell.Type, isToggable: Bool, cellPosition: CellPosition) {
		if let title = title {
			self.title = title.trimmingCharacters(in: .whitespacesAndNewlines).capitalized
		}
		
		if let icon = icon {
			self.icon = icon
		}
		
		self.cellType = cellType
		self.isToggable = isToggable
		self.cellPosition = cellPosition
	}
}

class DailyDateAndTimeCellViewModel: DailyCellViewModel {
	var dateAndTime: Date?
}

class DailyRepeatCellViewModel: DailyCellViewModel {
	var repeatSchedule: RepeatSchedule = .never
}

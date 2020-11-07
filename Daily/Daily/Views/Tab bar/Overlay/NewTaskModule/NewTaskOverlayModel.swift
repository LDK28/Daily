//
//  NewTaskModel.swift
//  Daily
//
//  Created by Арсений Токарев on 05.11.2020.
//

import UIKit

/*

	Initializing models to configure table view cells
		
*/

struct Icon {
	var tileColor: UIColor
	var symbol: UIImage?
	
	init(symbolName: String, tileColor: UIColor, symbolColor: UIColor = .white) {
		self.tileColor = tileColor
		
		guard let symbol = UIImage(systemName: symbolName) else {
			self.symbol = nil
			return
		}
		
		self.symbol = symbol
		self.symbol = self.symbol!.withTintColor(symbolColor)
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

enum NewTaskViewModelItemType {
	case dateAndTime
	case remindAlert
	case repeatSelector
}

protocol NewTaskViewModelItem {
	var type: NewTaskViewModelItemType { get }
	var rowCount: Int { get }
	var components: [DailyCellComponent] { get }
	var isToggable: Bool { get }
	var isSelectable: Bool { get }
}

//Default values
extension NewTaskViewModelItem {
	var rowCount: Int {
		switch type {
		case .dateAndTime:
			return 2
		default:
			return 1
		}
	}
	
	var isToggable: Bool {
		switch type {
		case .repeatSelector:
			return false
		default:
			return true
		}
	}
	
	var isSelectable: Bool {
		switch type {
		case .repeatSelector:
			return true
		default:
			return false
		}
	}
}

//MARK: - Date and time

class NewTaskViewModelDateAndTimeItem: NewTaskViewModelItem {
	
	var type: NewTaskViewModelItemType {
		return .dateAndTime
	}
	
	var components = [
		DailyCellComponent(titles: ["Date","xx.xx.xx"], icon: Icon(symbolName: "calendar.badge.clock", tileColor: .dailyAdaptiveRed)),
		DailyCellComponent(titles: ["Time","xx.xx.xx"], icon: Icon(symbolName: "clock.fill", tileColor: .dailyAdaptiveBlue))
	]
}

//MARK: - Reminder (on or off)

class NewTaskViewModelRemindAlertItem: NewTaskViewModelItem {
	var type: NewTaskViewModelItemType {
		return .remindAlert
	}
	
	var components = [
		DailyCellComponent(titles: ["Remind"], icon: Icon(symbolName: "alarm.fill", tileColor: .dailyAdaptiveYellow))
	]
}

//MARK: - Repeat (never otherwise set interval)

class NewTaskViewModelRepeatSelectorItem: NewTaskViewModelItem {
	var type: NewTaskViewModelItemType {
		return .repeatSelector
	}
	
	var components = [
		DailyCellComponent(titles: [""], icon: Icon(symbolName: "repeat", tileColor: .dailyAdaptiveGreen))
	]
}

// MARK: - The main model that will hold all our table cells

class NewTaskModel {
	var items: [NewTaskViewModelItem] = [
		NewTaskViewModelDateAndTimeItem(),
		NewTaskViewModelRemindAlertItem(),
		NewTaskViewModelRepeatSelectorItem()
	]
}


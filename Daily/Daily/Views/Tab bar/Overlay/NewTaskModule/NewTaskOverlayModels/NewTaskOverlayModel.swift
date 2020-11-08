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
		DailyCellComponent(title: "Date", icon: Icon(symbolName: "calendar.badge.clock", tileColor: .dailyAdaptiveRed), cellType: .date),
		DailyCellComponent(title: "Time", icon: Icon(symbolName: "clock.fill", tileColor: .dailyAdaptiveBlue), cellType: .time)
	]
}

//MARK: - Reminder (on or off)

class NewTaskViewModelRemindAlertItem: NewTaskViewModelItem {
	var type: NewTaskViewModelItemType {
		return .remindAlert
	}
	
	var components = [
		DailyCellComponent(title: "Remind", icon: Icon(symbolName: "alarm.fill", tileColor: .dailyAdaptiveYellow), cellType: .remind)
	]
}

//MARK: - Repeat (never otherwise set interval)

class NewTaskViewModelRepeatSelectorItem: NewTaskViewModelItem {
	var type: NewTaskViewModelItemType {
		return .repeatSelector
	}
	
	var components = [
		DailyCellComponent(title: "Repeat", icon: Icon(symbolName: "repeat", tileColor: .dailyAdaptiveGreen), cellType: .repeatSchedule)
	]
}

// MARK: - The main model that will hold all our table sections with cells

class DailyDataSource {
	var items: [NewTaskViewModelItem]
	
	init(items: [NewTaskViewModelItem]) {
		self.items = items
	}
}

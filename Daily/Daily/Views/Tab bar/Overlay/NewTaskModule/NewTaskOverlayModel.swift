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


protocol NewTaskViewModelItem: DailyViewModelItem {
	var type: NewTaskViewModelItemType { get }
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
}

//MARK: - Date and time

class NewTaskViewModelDateAndTimeItem: NewTaskViewModelItem {
	
	var type: NewTaskViewModelItemType {
		return .dateAndTime
	}

	var components = [
		DailyCellComponent(title: "Date", icon: Icon(symbolName: "calendar.badge.clock", tileColor: .dailyAdaptiveRed), cellType: .newTaskDate),
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

class NewTaskOverlayDataSource {
	var items: [NewTaskViewModelItem]
	
	init(items: [NewTaskViewModelItem]) {
		self.items = items
	}
}

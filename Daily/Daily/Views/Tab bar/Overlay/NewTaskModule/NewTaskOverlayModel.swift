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
		return 1
	}
}

//MARK: - Date and time

class NewTaskViewModelDateAndTimeItem: NewTaskViewModelItem {
	
	var type: NewTaskViewModelItemType {
		return .dateAndTime
	}
	
	var rowCount: Int {
		return components.count
	}

	var components = [
		DailyCellComponent(title: "Date",
						   icon: Icon(symbolName: "calendar.badge.clock",
						   tileColor: .dailyAdaptiveRed),
						   cellType: .newTaskDate,
						   isToggable: false,
						   isSelectable: false),
		
		DailyCellComponent(title: "Time",
						   icon: Icon(symbolName: "clock.fill",
						   tileColor: .dailyAdaptiveBlue),
						   cellType: .time,
						   isToggable: true,
						   isSelectable: false),
		
		DailyCellComponent(title: nil,
						   icon: nil,
						   cellType: .timePicker,
						   isToggable: false,
						   isSelectable: false)
	]
}

//MARK: - Reminder (on or off)

class NewTaskViewModelRemindAlertItem: NewTaskViewModelItem {
	var type: NewTaskViewModelItemType {
		return .remindAlert
	}
	
	var components = [
		DailyCellComponent(title: "Remind",
						   icon: Icon(symbolName: "alarm.fill",
						   tileColor: .dailyAdaptiveYellow),
						   cellType: .remind,
						   isToggable: true,
						   isSelectable: false)
	]
}

//MARK: - Repeat (never otherwise set interval)

class NewTaskViewModelRepeatSelectorItem: NewTaskViewModelItem {
	var type: NewTaskViewModelItemType {
		return .repeatSelector
	}
	
	var components = [
		DailyCellComponent(title: "Repeat",
						   icon: Icon(symbolName: "repeat",
						   tileColor: .dailyAdaptiveGreen),
						   cellType: .repeatSchedule,
						   isToggable: false,
						   isSelectable: true)
	]
}

// MARK: - The main model that will hold all our table sections with cells

class NewTaskOverlayDataSource {
	var items: [NewTaskViewModelItem]
	var isAssignedToTime = false
	var shouldRemind = false
	var isRepetitive = false
	
	init(items: [NewTaskViewModelItem]) {
		self.items = items
	}
}

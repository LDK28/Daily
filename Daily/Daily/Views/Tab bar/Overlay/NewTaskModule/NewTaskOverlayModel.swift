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


enum NewTaskOverlaySectionType {
	case dateAndTime
	case remindAlert
	case repeatSelector
}

protocol NewTaskOverlaySectionViewModel: DailySectionViewModel {
	var type: NewTaskOverlaySectionType { get }
}

extension NewTaskOverlaySectionViewModel {
	var rowCount: Int {
		return 1
	}
}

//MARK: - Date and time

class NewTaskOverlayDateAndTimeSectionViewModel: NewTaskOverlaySectionViewModel {
	
	var type: NewTaskOverlaySectionType {
		return .dateAndTime
	}
	
	var rowCount: Int {
		return cellViewModels.count
	}

	var cellViewModels: [DailyCellViewModel] {
		return [
				DailyCellViewModel(title: "Date",
								   icon: Icon(symbolName: "calendar.badge.clock",
											  tileColor: .dailyAdaptiveRed),
								   cellType: .newTaskDate,
								   isToggable: false,
								   isSelectable: false),
				
				DailyCellViewModel(title: "Time",
								   icon: Icon(symbolName: "clock.fill",
											  tileColor: .dailyAdaptiveBlue),
								   cellType: .time,
								   isToggable: true,
								   isSelectable: false),
				
				DailyCellViewModel(title: nil,
								   icon: nil,
								   cellType: .timePicker,
								   isToggable: false,
								   isSelectable: false)
		]
	}
}

//MARK: - Reminder (on or off)

class NewTaskOverlayRemindViewModel: NewTaskOverlaySectionViewModel {
	var type: NewTaskOverlaySectionType {
		return .remindAlert
	}
	
	var cellViewModels: [DailyCellViewModel] {
		return [
				DailyCellViewModel(title: "Remind",
							   icon: Icon(symbolName: "alarm.fill",
										  tileColor: .dailyAdaptiveYellow),
							   cellType: .remind,
							   isToggable: true,
							   isSelectable: false)
		]
	}
}

//MARK: - Repeat (never otherwise set interval)

class NewTaskOverlayRepeatViewModel: NewTaskOverlaySectionViewModel {
	var type: NewTaskOverlaySectionType {
		return .repeatSelector
	}
	
	var cellViewModels: [DailyCellViewModel] {
		return [
				DailyCellViewModel(title: "Repeat",
								   icon: Icon(symbolName: "repeat",
											  tileColor: .dailyAdaptiveGreen),
								   cellType: .repeatSchedule,
								   isToggable: false,
								   isSelectable: true)
		]
	}
}

// MARK: - The main model that will hold all our table sections with cells

class NewTaskOverlayDataSource {
	var sectionViewModels: [NewTaskOverlaySectionViewModel]
	var isAssignedToTime = false
	var shouldRemind = false
	var isRepetitive = false
	
	init(sectionViewModels: [NewTaskOverlaySectionViewModel]) {
		self.sectionViewModels = sectionViewModels
	}
}

//
//  OverlaySectionViewModels.swift
//  Daily
//
//  Created by Арсений Токарев on 12.11.2020.
//

import UIKit

//MARK: - Date and time

class AssignableDateAndTimeSectionViewModel: DailySectionViewModel {
	
	var type: DailySectionType {
		return .dateAndTime
	}

	var cellViewModels: [DailyCellViewModel] =
		[
				DailyCellViewModel(title: "Date",
								   icon: Icon(symbolName: "calendar.badge.clock",
											  tileColor: .dailyAdaptiveRed),
								   cellType: .newProjectDate,
								   isToggable: true,
								   isSelectable: false),
				
				DailyCellViewModel(title: nil,
								   icon: nil,
								   cellType: .datePicker,
								   isToggable: false,
								   isSelectable: false),
				
				DailyCellViewModel(title: "Time",
								   icon: Icon(symbolName: "clock.fill",
											  tileColor: .dailyAdaptiveBlue),
								   cellType: .time,
								   isToggable: true,
								   isSelectable: false),
		]
}


class TeamProjectSectionViewModel: DailySectionViewModel {
	var type: DailySectionType {
		return .teamProject
	}

	var cellViewModels: [DailyCellViewModel] =
		[
				DailyCellViewModel(title: "Team project",
							   icon: Icon(symbolName: "person.2.fill",
										  tileColor: .dailyAdaptiveGreen),
							   cellType: .teamProject,
							   isToggable: true,
							   isSelectable: false),
		]
}




class DateAndAssignableTimeSectionViewModel: DailySectionViewModel {
	
	var type: DailySectionType {
		return .dateAndTime
	}

	var cellViewModels: [DailyCellViewModel] =
		[
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
								   isSelectable: false)
		]
}

//MARK: - Reminder (on or off)

class RemindViewModel: DailySectionViewModel {
	var type: DailySectionType {
		return .remindAlert
	}
	
	var cellViewModels: [DailyCellViewModel] =
		[
				DailyCellViewModel(title: "Remind",
							   icon: Icon(symbolName: "alarm.fill",
										  tileColor: .dailyAdaptiveYellow),
							   cellType: .remind,
							   isToggable: true,
							   isSelectable: false)
		]
}

//MARK: - Repeat (never otherwise set interval)

class RepeatViewModel: DailySectionViewModel {
	var type: DailySectionType {
		return .repeatSelector
	}
	
	var cellViewModels: [DailyCellViewModel] =
		[
				DailyCellViewModel(title: "Repeat",
								   icon: Icon(symbolName: "repeat",
											  tileColor: .dailyAdaptiveGreen),
								   cellType: .repeatSchedule,
								   isToggable: false,
								   isSelectable: true)
		]
}

// MARK: - The main model that will hold all our table sections with cells

class NewTaskOverlayDataSource {
	var sectionViewModels: [DailySectionViewModel]
	var isAssignedToTime = false
	var shouldRemind = false
	var isRepetitive = false
	
	init(sectionViewModels: [DailySectionViewModel]) {
		self.sectionViewModels = sectionViewModels
	}
}

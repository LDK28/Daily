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
			DailyDateAndTimeCellViewModel(title: "Date",
										  icon: Icon(symbolName: "calendar.badge.clock",
													 tileColor: .dailyAdaptiveRed),
										  cellType: DailyOptionalDateCell.self,
										  isToggable: true,
										  cellPosition: .first),
			
			DailyDateAndTimeCellViewModel(title: "Time",
										  icon: Icon(symbolName: "clock.fill",
													 tileColor: .dailyAdaptiveBlue),
										  cellType: DailyTimeCell.self,
										  isToggable: true,
										  cellPosition: .last)
				
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
							   cellType: DailyTeamProjectCell.self,
							   isToggable: true,
							   cellPosition: .theOnly),
		]
}




class DateAndAssignableTimeSectionViewModel: DailySectionViewModel {
	
	var type: DailySectionType {
		return .dateAndTime
	}

	var cellViewModels: [DailyCellViewModel] =
		[
			DailyDateAndTimeCellViewModel(title: "Date",
										  icon: Icon(symbolName: "calendar.badge.clock",
													 tileColor: .dailyAdaptiveRed),
										  cellType: DailyRequiredDateCell.self,
										  isToggable: false,
										  cellPosition: .first),
				
			DailyDateAndTimeCellViewModel(title: "Time",
										  icon: Icon(symbolName: "clock.fill",
													 tileColor: .dailyAdaptiveBlue),
										  cellType: DailyTimeCell.self,
										  isToggable: true,
										  cellPosition: .last)
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
							   cellType: DailyRemindCell.self,
							   isToggable: true,
							   cellPosition: .theOnly)
		]
}

//MARK: - Repeat (never otherwise set interval)

class RepeatViewModel: DailySectionViewModel {
	var type: DailySectionType {
		return .repeatSelector
	}
	
	var cellViewModels: [DailyCellViewModel] =
		[
			DailyRepeatCellViewModel(title: "Repeat",
								   icon: Icon(symbolName: "repeat",
											  tileColor: .dailyAdaptiveGreen),
								   cellType: DailyRepeatCell.self,
								   isToggable: false,
								   cellPosition: .theOnly)
		]
}

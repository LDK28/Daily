//
//  NewProjectOverlayModel.swift
//  Daily
//
//  Created by Арсений Токарев on 08.11.2020.
//

import UIKit

enum NewProjectOverlaySectionType {
	case dateAndTime
	case teamProject
}

protocol NewProjectOverlaySectionViewModel: DailySectionViewModel {
	var type: NewProjectOverlaySectionType { get }
}

extension NewProjectOverlaySectionViewModel {
	var rowCount: Int {
		return 1
	}
}

class NewProjectOverlayDateAndTimeSectionViewModel: NewProjectOverlaySectionViewModel {
	
	var type: NewProjectOverlaySectionType {
		return .dateAndTime
	}
	
	var rowCount: Int {
		return cellViewModels.count
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


class NewProjectOverlayTeamProjectSectionViewModel: NewProjectOverlaySectionViewModel {
	var type: NewProjectOverlaySectionType {
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

class NewProjectOverlayDataSource {
	var sectionViewModels: [NewProjectOverlaySectionViewModel]
	var isAssignedToTime = false
	
	init(sectionViewModels: [NewProjectOverlaySectionViewModel]) {
		self.sectionViewModels = sectionViewModels
	}
}

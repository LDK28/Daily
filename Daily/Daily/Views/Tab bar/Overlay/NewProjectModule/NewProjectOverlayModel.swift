//
//  NewProjectOverlayModel.swift
//  Daily
//
//  Created by Арсений Токарев on 08.11.2020.
//

import UIKit

enum NewProjectViewModelItemType {
	case dateAndTime
	case teamProject
}

protocol NewProjectViewModelItem: DailyViewModelItem {
	var type: NewProjectViewModelItemType { get }
}

//Default values
extension NewProjectViewModelItem {
	var rowCount: Int {
		return 1
	}
}

class NewProjectViewModelDateAndTimeItem: NewProjectViewModelItem {
	var type: NewProjectViewModelItemType {
		return .dateAndTime
	}
	
	var rowCount: Int {
		return components.count
	}

	var components = [
		DailyCellComponent(title: "Date",
						   icon: Icon(symbolName: "calendar.badge.clock",
						   tileColor: .dailyAdaptiveRed),
						   cellType: .newProjectDate,
						   isToggable: true,
						   isSelectable: false),
		
		DailyCellComponent(title: nil,
						   icon: nil,
						   cellType: .datePicker,
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


class NewProjectViewModelTeamProjectItem: NewProjectViewModelItem {
	var type: NewProjectViewModelItemType {
		return .teamProject
	}

	var components = [
		DailyCellComponent(title: "Team project",
						   icon: Icon(symbolName: "person.2.fill",
						   tileColor: .dailyAdaptiveGreen),
						   cellType: .teamProject,
						   isToggable: true,
						   isSelectable: false),
	]
}

class NewProjectOverlayDataSource {
	var items: [NewProjectViewModelItem]
	
	init(items: [NewProjectViewModelItem]) {
		self.items = items
	}
}

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
		switch type {
		case .dateAndTime:
			return 2
		default:
			return 1
		}
	}
}

class NewProjectViewModelDateAndTimeItem: NewProjectViewModelItem {
	var type: NewProjectViewModelItemType {
		return .dateAndTime
	}

	var components = [
		DailyCellComponent(title: "Date", icon: Icon(symbolName: "calendar.badge.clock", tileColor: .dailyAdaptiveRed), cellType: .newProjectDate),
		DailyCellComponent(title: "Time", icon: Icon(symbolName: "clock.fill", tileColor: .dailyAdaptiveBlue), cellType: .time)
	]
}


class NewProjectViewModelTeamProjectItem: NewProjectViewModelItem {
	var type: NewProjectViewModelItemType {
		return .teamProject
	}

	var components = [
		DailyCellComponent(title: "Team project", icon: Icon(symbolName: "person.2.fill", tileColor: .dailyAdaptiveGreen), cellType: .teamProject),
	]
}

class NewProjectOverlayDataSource {
	var items: [NewProjectViewModelItem]
	
	init(items: [NewProjectViewModelItem]) {
		self.items = items
	}
}

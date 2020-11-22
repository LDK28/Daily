//
//  NewTaskModel.swift
//  Daily
//
//  Created by Арсений Токарев on 05.11.2020.
//

import UIKit

enum RepeatSchedule: String, CaseIterable, Equatable {
	case never = "Never"
	case everyday = "Daily"
	case everyWeek = "Weekly"
	case everyMonth = "Monthly"
	case everyYear = "Yearly"

	mutating func nextCase() {
		let allCases = Self.allCases
		if let currentCaseIndex = allCases.firstIndex(of: self) {
			let nextCaseIndex = allCases.index(after: currentCaseIndex)
			self = allCases[nextCaseIndex == allCases.endIndex ? allCases.startIndex : nextCaseIndex]
		}
	}
}

class NewTaskOverlayDataSource: OverlayDataSource {
	var shouldRemind = false
	var repeatSchedule: RepeatSchedule = .never
	var userIsChoosingDate = false
}

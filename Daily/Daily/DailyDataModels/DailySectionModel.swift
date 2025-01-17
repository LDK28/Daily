//
//  ProjectModels.swift
//  Daily
//
//  Created by Арсений Токарев on 08.11.2020.
//

import Foundation

enum DailySectionType {
	case teamProject
	case dateAndTime
	case remindAlert
	case repeatSelector
	case profile
	case description
}

protocol DailySectionViewModel {
	var rowCount: Int { get }
	var cellViewModels: [MainCellViewModel] { get set }
	var type: DailySectionType { get }
}

extension DailySectionViewModel {
	var rowCount: Int {
		cellViewModels.count
	}
}

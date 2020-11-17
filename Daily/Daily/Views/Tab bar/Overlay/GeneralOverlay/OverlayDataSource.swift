//
//  OverlayDataSource.swift
//  Daily
//
//  Created by Арсений Токарев on 12.11.2020.
//

import UIKit


class OverlayDataSource {
	var title = ""
	var isAssignedToTime = false
	var assignedTime: Date?
	var assignedDay: Date?
	var sectionViewModels: [DailySectionViewModel]
	
	init(sectionViewModels: [DailySectionViewModel]) {
		self.sectionViewModels = sectionViewModels
	}
}

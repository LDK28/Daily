//
//  OverlayDataSource.swift
//  Daily
//
//  Created by Арсений Токарев on 12.11.2020.
//

import UIKit


class OverlayDataSource {
	var isAssignedToTime = false
	var sectionViewModels: [DailySectionViewModel]
	
	init(sectionViewModels: [DailySectionViewModel]) {
		self.sectionViewModels = sectionViewModels
	}
}
//
//  ProjectModels.swift
//  Daily
//
//  Created by Арсений Токарев on 08.11.2020.
//

import Foundation

protocol DailyViewModelItem {
	var rowCount: Int { get }
	var components: [DailyCellComponent] { get }
}


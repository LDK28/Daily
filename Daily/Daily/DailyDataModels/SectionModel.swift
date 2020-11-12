//
//  ProjectModels.swift
//  Daily
//
//  Created by Арсений Токарев on 08.11.2020.
//

import Foundation

protocol DailySectionViewModel {
	var rowCount: Int { get }
	var cellViewModels: [DailyCellViewModel] { get set }
}


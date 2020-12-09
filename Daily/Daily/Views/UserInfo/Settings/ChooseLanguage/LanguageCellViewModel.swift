//
//  LanguageCellViewModel.swift
//  Daily
//
//  Created by Арсений Токарев on 09.12.2020.
//

import UIKit

enum Language: String {
	case english = "en"
	case russian = "ru"
}

class LanguageCellViewModel: DailyCellViewModel {
	let language: Language
	
	init(language: Language, cellViewModel: DailyCellViewModel) {
		self.language = language
		super.init(cellViewModel: cellViewModel)
	}
}

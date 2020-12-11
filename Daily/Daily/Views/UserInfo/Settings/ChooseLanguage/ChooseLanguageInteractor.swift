//
//  ChooseLanguageInteractor.swift
//  Daily
//
//  Created by Арсений Токарев on 09.12.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit

class ChooseLanguageInteractor: ChooseLanguageDataStore {
	var presenter: ChooseLanguagePresentationLogic?
	
	init(presenter: ChooseLanguagePresentationLogic?) {
		self.presenter = presenter
	}
}

extension ChooseLanguageInteractor: ChooseLanguageBusinessLogic {
	func fetchCells() {
		let headerModel = ProfileModel(text: NSLocalizedString("Choose language",
															   comment: ""),
									   image: UIImage(systemName: "globe")?.withTintColor(.dailyTitleTextColor))
		let viewModels = [
			LanguageCellViewModel(language: .russian,
								  cellViewModel: DailyCellViewModel(title: "Russian",
																	icon: Icon(named: "Russia",
																			   tileColor: .clear),
																	cellType: DailyLanguageCell.self,
																	isToggable: false,
																	cellPosition: .within)),
			LanguageCellViewModel(language: .english,
								  cellViewModel: DailyCellViewModel(title: "English",
																	icon: Icon(named: "USA",
																			   tileColor: .clear),
																	cellType: DailyLanguageCell.self,
																	isToggable: false,
																	cellPosition: .within))
		]
		presenter?.present(viewModels: viewModels,
						   headerModel: headerModel)
	}
}

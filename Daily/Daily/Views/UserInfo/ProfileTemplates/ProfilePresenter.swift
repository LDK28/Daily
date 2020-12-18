//
//  ProfilePresenter.swift
//  Daily
//
//  Created by Арсений Токарев on 09.12.2020.
//

import UIKit

protocol ProfilePresentationLogic {
	func present(viewModels: [MainCellViewModel], headerModel: ProfileModel)
}

class ProfilePresenter {
	weak var viewController: ProfileDisplayLogic?
	
	init(viewController: ProfileDisplayLogic?) {
		self.viewController = viewController
	}
}

extension ProfilePresenter: ProfilePresentationLogic {
	func present(viewModels: [MainCellViewModel], headerModel: ProfileModel) {
		viewController?.headerView?.setHeader(withModel: headerModel)
		viewController?.cellsToDisplay = viewModels
	}
}

//
//  NewProjectOverlayPresenter.swift
//  Daily
//
//  Created by Арсений Токарев on 17.11.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

class NewProjectOverlayPresenter: OverlayPresenter {
}


// MARK: - Presenter Protocol
extension NewProjectOverlayPresenter: NewProjectOverlayPresentationLogic {
   
	override func updateDateInDateCell() {
		updateDateAndTimeCellViewModels(withCellOfType: DailyOptionalDateCell.self, withNewDateAndTime: dataSource.assignedDay)
	}
    
    func prepareViewForRoutingToProjects() {
        (viewController as? NewProjectOverlayDisplayLogic)?.askRouterToNavigateToProjects()
    }

}

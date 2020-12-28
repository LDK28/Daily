//
//  NewProjectOverlayVC.swift
//  Daily
//
//  Created by Арсений Токарев on 17.11.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class NewProjectOverlayVC: OverlayVC {
	var router: (NewProjectOverlayRoutingLogic & NewProjectOverlayDataPassing)?
  
    private let projectTitleTextField = UITextField()
    
	override func loadView() {
		headerView = OverlayHeader(title: "Create new project")
		super.loadView()
		styleUI()
	}

    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.addTarget(self, action: #selector(tappedAddButton), for: .touchUpInside)
    }
    
    @objc func tappedAddButton() {
        saveButton.tapAnimation { [weak self] in
            guard let self = self else { return }
            (self.interactor as? NewProjectOverlayInteractor)?.didTapAddButton()
            self.remove()
            NotificationCenter.default.post(name: Notification.Name("Close Overlay"), object: nil)
        }
    }
}

extension NewProjectOverlayVC: DailyOptionalDateCellDelegate {
	func didToggleDateSwitcher() {
		(interactor as? NewProjectOverlayInteractor)?.didToggleDateSwitcher()
	}
}

extension NewProjectOverlayVC: DailyTeamProjectCellDelegate {
	func didToggleTeamProjectState() {
		(interactor as? NewProjectOverlayInteractor)?.didToggleTeamProjectSwitcher()
	}
}

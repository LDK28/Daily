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
  
    override func loadView() {
        super.loadView()
        styleUI()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.addTarget(self, action: #selector(tappedSaveButton), for: .touchUpInside)
    }
    
    override func styleUI() {
        super.styleUI()
        titleLabel.styleOverlayLabel(text: "Create new project")
    }
    
    @objc func tappedSaveButton() {
        saveButton.tapAnimation { [weak self] in
            guard let self = self else { return }
            self.tableView.endEditing(true)
            (self.interactor as? NewProjectOverlayInteractor)?.didTapSaveButton()
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

extension NewProjectOverlayVC: NewProjectOverlayDisplayLogic {
    func askRouterToNavigateToProjects() {
        router?.navigateToProjects()
    }
}

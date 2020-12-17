//
//  NewTaskOverlayVC.swift
//  Daily
//
//  Created by Арсений Токарев on 17.11.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class NewTaskOverlayVC: OverlayVC {
	
	var router: (NewTaskOverlayRoutingLogic & NewTaskOverlayDataPassing)?
    
    private let taskTitleTextField = UITextField()
  
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
		titleLabel.styleOverlayLabel(text: "Add new task")
	}
	
	override func tableView(_ tableView: UITableView,
							didSelectRowAt indexPath: IndexPath) {
		super.tableView(tableView, didSelectRowAt: indexPath)
		if tableView.cellForRow(at: indexPath) as? DailyRepeatCell != nil {
			(interactor as? NewTaskOverlayInteractor)?.didTapRepeatCell(at: indexPath)
		}
		
		if tableView.cellForRow(at: indexPath) as? DailyRequiredDateCell != nil {
			(interactor as? NewTaskOverlayInteractor)?.didTapDateCell(at: indexPath)
		}
	}
    
    @objc func tappedSaveButton() {
        saveButton.tapAnimation { [weak self] in
            guard let self = self else { return }
            (self.interactor as? NewTaskOverlayInteractor)?.didTapSaveButton()
            self.remove()
            NotificationCenter.default.post(name: Notification.Name("Close Overlay"), object: nil)
        }
    }
}

extension NewTaskOverlayVC: DailyRemindCellDelegate {
    
	func didToggleRemindState() {
		(interactor as? NewTaskOverlayInteractor)?.didToggleRemindSwitcher()
	}
    
    func didToggleTimeState() {
        (interactor as? NewTaskOverlayInteractor)?.didToggleTimeSwitcher()
    }
}

extension NewTaskOverlayVC: NewTaskOverlayDisplayLogic {
    func askRouterToNavigateToDiary() {
        router?.navigateToDiary()
    }
}

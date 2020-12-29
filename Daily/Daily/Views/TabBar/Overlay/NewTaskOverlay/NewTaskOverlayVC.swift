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
		headerView = OverlayHeader(title: "Make new task")
		super.loadView()
	}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.addTarget(self, action: #selector(tappedSaveButton), for: .touchUpInside)
    }
	
	override func tableView(_ tableView: UITableView,
							didSelectRowAt indexPath: IndexPath) {
		super.tableView(tableView, didSelectRowAt: indexPath)
		switch cellsToDisplay[indexPath.section].cellViewModels[indexPath.row].cellType {
		case is DailyRepeatCell.Type:
			(interactor as? NewTaskOverlayInteractor)?.didTapRepeatCell(at: indexPath)
		case is DailyRequiredDateCell.Type:
			(interactor as? NewTaskOverlayInteractor)?.didTapDateCell(at: indexPath)
		default:
			return
		}
	}
    
    @objc func tappedSaveButton() {
        saveButton.tapAnimation { [weak self] in
            guard let self = self else { return }
            self.tableView.endEditing(true)
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

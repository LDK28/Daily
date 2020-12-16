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
		super.loadView()
		styleUI()
        configureTextView()
	}
	
	override func styleUI() {
		super.styleUI()
		titleLabel.styleOverlayLabel(text: "Create new project")
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

extension NewProjectOverlayVC: UITextViewDelegate {
    
    func configureTextView() {
        projectTitleTextField.delegate = self
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor != .dailyOverlayTextFieldTextColor {
            textView.text = nil
            textView.textColor = .dailyOverlayTextFieldTextColor
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = NSLocalizedString("Details", comment: "")
            textView.textColor = UITextView.placeholderColor
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        (interactor as? NewNoteOverlayInteractor)?.didEndEditingNote(text: textView.text)
    }
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        UIView.animate(withDuration: 0.2, animations: {
            self.view.frame.origin.y -= 40
        })
        return true
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        UIView.animate(withDuration: 0.2, animations: {
            self.view.frame.origin.y += 40
        })
        self.resignFirstResponder()
        return true
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

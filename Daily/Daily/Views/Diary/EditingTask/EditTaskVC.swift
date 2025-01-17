//
//  EditTaskVC.swift
//  Daily
//
//  Created by Владимир Проценко on 23.12.2020.
//

import Foundation
import UIKit

class EditTaskVC: MainVC {
    var interactor: EditTaskBusinessLogic?
    var router: (EditTaskRoutingLogic & EditTaskDataPassing)?
    
    private let textField = UITextField()
    private let textView = UITextView()
  
    override func loadView() {
        super.loadView()
        configureTextField()
        configureTextView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
        textField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor?.fetchTaskData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        textField.resignFirstResponder()
    }
}

//MARK: - DisplayLogic
extension EditTaskVC: EditTaskDisplayLogic {
    func fillFieldsWithNoteContent(_ data: DiaryBackendModel) {
        textField.text = data.title
        
        if data.description.isEmpty {
            textViewDidEndEditing(textView)
            return
        }
        
        textView.text = data.description
        textView.textColor = .dailyNoteTextFieldTextColor
    }
}


// MARK: - TextView and TextField delegates
extension EditTaskVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor != .dailyNoteTextFieldTextColor {
            textView.textColor = .dailyNoteTextFieldTextColor
            textView.text = nil
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = NSLocalizedString("Description", comment: "")
            textView.textColor = UITextView.placeholderColor
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        interactor?.didChange(title: nil,
                              description: textView.text)
    }
    
}

extension EditTaskVC: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        interactor?.didChange(title: textField.text,
                              description: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

// MARK: - UIElements Configuration
extension EditTaskVC {
    func configureTextField() {
        view.addSubview(textField)
        textField.styleEditingTextField(placeholder: "Title",
                                        fontSize: 36,
                                        textColor: .dailyTextColor,
                                        borderStyle: .none)
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.topAnchor, constant: 35),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            textField.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    func configureTextView() {
        view.addSubview(textView)
        textView.delegate = self
        textView.styleMultiLineTextView(placeholder: "Description",
                                        fontSize: 20,
                                        backgroundColor: .clear,
                                        cornerRadius: 0)
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 15),
            textView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}

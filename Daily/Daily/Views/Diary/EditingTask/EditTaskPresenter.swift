//
//  EditTaskPresenter.swift
//  Daily
//
//  Created by Владимир Проценко on 23.12.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit

class EditTaskPresenter {
	weak var viewController: EditTaskDisplayLogic?
	
}

extension EditTaskPresenter: EditTaskPresentationLogic {
    func transferTaskDataToView(_ data: DiaryBackendModel) {
        viewController?.fillFieldsWithNoteContent(data)
    }
}

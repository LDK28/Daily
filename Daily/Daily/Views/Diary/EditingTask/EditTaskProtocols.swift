//
//  EditTaskProtocols.swift
//  Daily
//
//  Created by Владимир Проценко on 23.12.2020.
//

import UIKit

protocol EditTaskDisplayLogic: AnyObject {
    func fillFieldsWithNoteContent(_ data: DiaryBackendModel)
}

protocol EditTaskBusinessLogic {
    func fetchTaskData()
    
    func didChange(title: String?,
                   description: String?)
}

protocol EditTaskDataStore: AnyObject {
    var taskCellViewBackendModel: DiaryBackendModel? { get set }
    
    var index: Int? { get set }
}

protocol EditTaskPresentationLogic {
    func transferTaskDataToView(_ task: DiaryBackendModel)
}

protocol EditTaskRoutingLogic {
	
}

protocol EditTaskDataPassing {
	var dataStore: EditTaskDataStore? { get }
    
    func integrateTaskInModule(_ note: DiaryBackendModel,
                               index: Int)
}

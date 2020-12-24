import Foundation
import UIKit

class EditTaskInteractor: EditTaskDataStore {
    var presenter: EditTaskPresentationLogic?
    var index: Int?
    var taskCellViewBackendModel: DiaryBackendModel?
}

extension EditTaskInteractor: EditTaskBusinessLogic {
    func fetchTaskData() {
        guard let taskData = taskCellViewBackendModel else { return }
        presenter?.transferTaskDataToView(taskData)
    }
    
    func didChange(title: String?,
                   description: String?) {
        guard
            let viewModel = taskCellViewBackendModel,
            let index = index
        else { return }
        
        if let description = description {
            viewModel.description = description
        }
        
        if let title = title {
            viewModel.title = title
        }
        
        UserRequest.shared.update(viewModel,
                                  at: index) { result in
            switch result {
            case .failure(let error):
                debugPrint(error.localizedDescription)
            default:
                return
            }
        }
    }
}

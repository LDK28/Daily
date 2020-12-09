import Foundation

class DiaryPresenter {
    
    // MARK: - External vars
    weak var viewController: DiaryDisplayLogic?
}

// MARK: - Presentation logic
extension DiaryPresenter: DiaryPresentationLogic {
    
    func present(data: [DiaryCellModel]) {
        let viewModel = data.map { model -> DiaryCellModel in
            let cellModel = DiaryCellModel(time: model.time, taskName: model.taskName, taskDescription: model.taskDescription, progress: model.progress, notification: model.notification)
            
            return cellModel
        }
        
        viewController?.display(data: viewModel)
    }
}

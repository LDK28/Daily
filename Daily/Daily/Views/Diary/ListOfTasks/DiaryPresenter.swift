import Foundation
import UIKit
class DiaryPresenter {
    
    // MARK: - External vars
    weak var viewController: DiaryDisplayLogic?
}

// MARK: - Presentation logic
extension DiaryPresenter: DiaryPresentationLogic {
    
    func present(data: [DiaryBackendModel]) {
        let viewModel = data.map { model -> DiaryCellViewModel in
            let cellModel = DiaryCellViewModel(time: model.assignedTime,
                                               title: model.title,
                                               description: model.description,
                                               isMade: model.isMade,
                                               shouldRemind: model.shouldRemind)
            
            return cellModel
//        var viewModel: [DiaryCellViewModel] = []
//        let formatter = DateFormatter()
//        formatter.timeStyle = .none
//        formatter.dateStyle = .long
//
//        for model in data {
//            if formatter.string(from: model.assignedDay ?? Date()) == formatter.string(from: Date()) {
//                let cellModel = DiaryCellViewModel(time: model.assignedDay,
//                                                   title: model.title,
//                                                   description: model.description,
//                                                   isMade: model.isMade,
//                                                   shouldRemind: model.shouldRemind)
//                viewModel.append(cellModel)
//            }
//        }
//
//        for i in 0...viewModel.count - 1 {
//            for j in 0...viewModel.count - 1 {
//                if viewModel[j].time ?? Date() > viewModel[i].time ?? Date() {
//                    viewModel.swapAt(i, j)
//                }
//            }
        }
        viewController?.dataToDisplay = viewModel
        viewController?.display(data: viewModel)
    }
}

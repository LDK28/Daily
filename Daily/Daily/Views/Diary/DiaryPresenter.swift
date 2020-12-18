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
            let cellModel = DiaryCellViewModel(time: model.time,
                                               title: model.title,
                                               description: model.description,
                                               isMade: model.isMade,
                                               shouldRemind: model.shouldRemind)
            
            return cellModel
        }
        
        viewController?.display(data: viewModel)
    }
}

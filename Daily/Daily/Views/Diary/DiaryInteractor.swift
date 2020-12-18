import Foundation
import UIKit
import Firebase

class DiaryInteractor {
    var presenter: DiaryPresentationLogic?
    internal var tasks = [DiaryBackendModel]()
    
    init(presenter: DiaryPresentationLogic?) {
        self.presenter = presenter
    }
}

// MARK: - Business logic
extension DiaryInteractor: DiaryBusinessLogic {
    
    func fetchLatestData() {
        UserRequest.shared.getTasks { result in
            switch result {
            case .success(let tasks):
                self.tasks = tasks
                self.presenter?.present(data: tasks)
            default:
                /* handle errors lateron if needed */
                return
            }
        }
    }
}

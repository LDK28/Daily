import Foundation
import UIKit

class DiaryInteractor {
    
    // MARK: - External vars
    var presenter: DiaryPresentationLogic?
}

// MARK: - Business logic
extension DiaryInteractor: DiaryBusinessLogic {
    
    func fetchDiary() {
        
        var backendResponce = [DiaryCellModel]()
        
        let model = DiaryCellModel(time: "2:28",
                                   taskName: "Task",
                                   taskDescription: "Loreum ipsum",
                                   progress: false,
                                   notification: true )
        
        backendResponce.append(model)
        backendResponce.append(model)
        backendResponce.append(model)
        backendResponce.append(model)
        backendResponce.append(model)

        presenter?.present(data: backendResponce)
    }
}

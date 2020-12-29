import UIKit

class DiaryRouter: DiaryDataPassing {
    
    private weak var viewController: DiaryVC?
    internal weak var dataStore: DiaryDataStore?
  
    init(viewController: DiaryVC?, dataStore: DiaryDataStore?) {
        self.dataStore = dataStore
        self.viewController = viewController
    }
}

extension DiaryRouter: DiaryRoutingLogic {
    func navigateToEditingTask(withViewModel viewModel: DiaryBackendModel,
                               withIndex index: Int) {
        let EditTaskViewController = EditTaskModule.build()
        EditTaskViewController.modalPresentationStyle = .fullScreen
        EditTaskViewController.router?.integrateTaskInModule(viewModel, index: index)
        
    }
}

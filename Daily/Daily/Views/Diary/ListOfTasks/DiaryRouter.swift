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
        let vc = EditTaskModule.build()
        vc.modalPresentationStyle = .fullScreen
        vc.router?.integrateTaskInModule(viewModel, index: index)
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}

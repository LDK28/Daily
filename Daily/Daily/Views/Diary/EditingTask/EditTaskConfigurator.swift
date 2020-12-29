import UIKit

class EditTaskModule {
    static func build() -> EditTaskVC {
        let viewController = EditTaskVC()
        let interactor = EditTaskInteractor()
        let presenter = EditTaskPresenter()
        let router = EditTaskRouter()
        
        interactor.presenter = presenter
        presenter.viewController = viewController as EditTaskDisplayLogic
        router.viewController = viewController
        router.dataStore = interactor
        viewController.router = router as EditTaskDataPassing & EditTaskRoutingLogic
        viewController.interactor = interactor as EditTaskBusinessLogic

        return viewController
    }
}

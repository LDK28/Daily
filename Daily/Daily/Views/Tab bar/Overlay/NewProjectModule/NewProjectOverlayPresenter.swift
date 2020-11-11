import UIKit

struct NewProjectOverlayViewModel: Equatable {

}

protocol NewProjectOverlayViewType: class {

    var interactor: NewProjectOverlayInteractorType? { get set }

    func updateView(with viewModel: NewProjectOverlayViewModel)
}

protocol NewProjectOverlayPresenterType: class {

}

class NewProjectOverlayPresenter: NewProjectOverlayPresenterType {

    private weak var view: NewProjectOverlayViewType?

    init(view: NewProjectOverlayViewType) {
        self.view = view
    }
}

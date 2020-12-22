import Foundation

protocol DiaryDisplayLogic: class {
    func display(data: [DiaryCellViewModel])
}

protocol DiaryPresentationLogic {
    func present(data: [DiaryBackendModel])
}

protocol DiaryBusinessLogic {
    func fetchLatestData()
}

// Зачем???
protocol DiaryDataStore: AnyObject {
    var tasks: [DiaryBackendModel] { get set }
}

protocol DiaryRoutingLogic {
    func navigateToEditingTask(withViewModel viewModel: DiaryBackendModel,
                               withIndex index: Int)
}

protocol DiaryDataPassing {
    var dataStore: DiaryDataStore? { get }
}

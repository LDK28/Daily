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

protocol DiaryDataPassing {
    var dataStore: DiaryDataStore? { get }
}

import Foundation

protocol DiaryDisplayLogic: class {
    func display(data: [DiaryCellModel])
}

protocol DiaryPresentationLogic {
    func present(data: [DiaryCellModel])
}

protocol DiaryBusinessLogic {
    func fetchDiary()
}

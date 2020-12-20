import Foundation
import UIKit

class DiaryBackendModel: Codable {
    var taskID = UUID()
    var time: Date
    var title: String
    var description: String
    var isMade: Bool
    var shouldRemind: Bool
    var isAssignedToTime: Bool
    var userIsChoosingDate: Bool
    var assignedTime: Date
    var assignedDay: Date
//    var repeatSchedule: RepeatSchedule
    
    init(time: Date, title: String, description: String, isMade: Bool, shouldRemind: Bool, isAssignedToTime: Bool, userIsChoosingDate: Bool, assignedTime: Date, assignedDay: Date, repeatSchedule: RepeatSchedule) {
        self.time = time
        self.title = title
        self.description = description
        self.isMade = isMade
        self.shouldRemind = shouldRemind
        self.isAssignedToTime = isAssignedToTime
        self.userIsChoosingDate = userIsChoosingDate
        self.assignedTime = assignedTime
        self.assignedDay = assignedDay
//        self.repeatSchedule = repeatSchedule
    }
    
    init(copiedModel: DiaryBackendModel) {
        self.time = copiedModel.time
        self.title = copiedModel.title
        self.description = copiedModel.description
        self.isMade = copiedModel.isMade
        self.shouldRemind = copiedModel.shouldRemind
        self.taskID = copiedModel.taskID
        self.isAssignedToTime = copiedModel.isAssignedToTime
        self.userIsChoosingDate = copiedModel.userIsChoosingDate
        self.assignedTime = copiedModel.assignedTime
        self.assignedDay = copiedModel.assignedDay
//        self.repeatSchedule = copiedModel.repeatSchedule
    }
    
    init(copiedModel: DiaryCellViewModel) {
        self.time = copiedModel.time
        self.title = copiedModel.title
        self.description = copiedModel.description
        self.isMade = copiedModel.isMade
        self.shouldRemind = copiedModel.shouldRemind
        self.taskID = copiedModel.taskID
        self.isAssignedToTime = false
        self.userIsChoosingDate = false
        self.assignedTime = Date()
        self.assignedDay = Date()
//        self.repeatSchedule = .never
    }
}

struct DiaryCellViewModel {
    var taskID = UUID()
    var time: Date
    var title: String
    var description: String
    var isMade: Bool
    var shouldRemind: Bool
}
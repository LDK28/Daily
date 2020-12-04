//
//  NoteCellViewModel.swift
//  Daily
//
//  Created by Арсений Токарев on 21.11.2020.
//

import UIKit

class NotesCellViewBackendModel: Codable {
	var isPinned: Bool
	var title: String
	var details: String
	var assignedDateAndTime: Date?
	
	static func ==(lhs: NotesCellViewBackendModel, rhs: NotesCellViewBackendModel) -> Bool {
		return lhs.isPinned == rhs.isPinned && lhs.assignedDateAndTime == rhs.assignedDateAndTime && lhs.details == rhs.details && lhs.title == rhs.title
	}
	
	init(isPinned: Bool, title: String, details: String, assignedDateAndTime: Date? = nil) {
		self.isPinned = isPinned
		self.title = title
		self.details = details
		self.assignedDateAndTime = assignedDateAndTime
	}
	
	init(copiedModel: NotesCellViewBackendModel) {
		self.isPinned = copiedModel.isPinned
		self.title = copiedModel.title
		self.details = copiedModel.details
		self.assignedDateAndTime = copiedModel.assignedDateAndTime
	}
	
	init(copiedModel: NotesCellTableViewModel) {
		self.isPinned = copiedModel.isPinned
		self.title = copiedModel.title
		self.details = copiedModel.details
		self.assignedDateAndTime = copiedModel.assignedDateAndTime
	}
}

final class NotesCellTableViewModel: NotesCellViewBackendModel, MainCellViewModel {
	var cellType: UITableViewCell.Type
	init(cellType: UITableViewCell.Type,
		 isPinned: Bool, title: String,
		 details: String,
		 assignedDateAndTime: Date? = nil) {
		self.cellType = cellType
		super.init(isPinned: isPinned, title: title, details: details, assignedDateAndTime: assignedDateAndTime)
	}
	
	init(cellType: UITableViewCell.Type, backendModel: NotesCellViewBackendModel) {
		self.cellType = cellType
		super.init(copiedModel: backendModel)
	}
	
	required init(from decoder: Decoder) throws {
		fatalError("init(from:) has not been implemented")
	}
}

extension Array where Element == NotesCellViewBackendModel {
	mutating func remove(at indices: [Int]) -> [NotesCellViewBackendModel] {
		self = self
			.enumerated()
			.filter { !indices.contains($0.offset) }
			.map { $0.element }
		return self
	}
}

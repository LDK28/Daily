//
//  NoteCellViewModel.swift
//  Daily
//
//  Created by Арсений Токарев on 21.11.2020.
//

import UIKit

class NoteBackendModel: Codable {
	var noteID = UUID()
	var isPinned: Bool
	var title: String
	var details: String
	var assignedDateAndTime: Date?
	
	static func ==(lhs: NoteBackendModel, rhs: NoteBackendModel) -> Bool {
		return lhs.noteID == rhs.noteID
	}
	
	init(isPinned: Bool, title: String, details: String, assignedDateAndTime: Date? = nil) {
		self.isPinned = isPinned
		self.title = title
		self.details = details
		self.assignedDateAndTime = assignedDateAndTime
	}
	
	init(copiedModel: NoteBackendModel) {
		self.isPinned = copiedModel.isPinned
		self.title = copiedModel.title
		self.details = copiedModel.details
		self.assignedDateAndTime = copiedModel.assignedDateAndTime
		self.noteID = copiedModel.noteID
	}
	
	init(copiedModel: NoteCellViewModel) {
		self.isPinned = copiedModel.isPinned
		self.title = copiedModel.title
		self.details = copiedModel.details
		self.assignedDateAndTime = copiedModel.assignedDateAndTime
		self.noteID = copiedModel.noteID
	}
}

final class NoteCellViewModel: NoteBackendModel, MainCellViewModel {
	var cellType: UITableViewCell.Type
	var isChosen = false
	init(cellType: UITableViewCell.Type,
		 isPinned: Bool, title: String,
		 details: String,
		 assignedDateAndTime: Date? = nil) {
		self.cellType = cellType
		super.init(isPinned: isPinned, title: title, details: details, assignedDateAndTime: assignedDateAndTime)
	}
	
	init(cellType: UITableViewCell.Type, backendModel: NoteBackendModel) {
		self.cellType = cellType
		super.init(copiedModel: backendModel)
	}
	
	required init(from decoder: Decoder) throws {
		fatalError("init(from:) has not been implemented")
	}
}

extension Array where Element == NoteBackendModel {
	mutating func remove(at indices: [Int]) -> [NoteBackendModel] {
		self = self
			.enumerated()
			.filter { !indices.contains($0.offset) }
			.map { $0.element }
		return self
	}
}

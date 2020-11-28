//
//  NoteCellViewModel.swift
//  Daily
//
//  Created by Арсений Токарев on 21.11.2020.
//

import UIKit

struct NotesCellViewModel: Codable {
	var isPinned = false
	var title: String
	var details: String
	var assignedDateAndTime: Date?
}

extension Array where Element == NotesCellViewModel {
	mutating func remove(at indices: [Int]) -> [NotesCellViewModel] {
		self = self
			.enumerated()
			.filter { !indices.contains($0.offset) }
			.map { $0.element }
		return self
	}
}

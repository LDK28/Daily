//
//  CurrentUser.swift
//  Daily
//
//  Created by Арсений Токарев on 22.11.2020.
//

import UIKit
import Firebase

struct CurrentUser: Codable {
	let id: String
	var name: Name
	var email: String?
	var password: String
	var notes: [NoteBackendModel]
	var projects: [ProjectBackendModel]
}

struct Name: Codable {
	var firstName: String
	var lastName: String
}



struct ProjectSubitem: Codable {
	var id: UUID
	var title: String
	var isChecked: Bool
	var assignedDate: [String : Date]
	
	init(title: String, isChecked: Bool, assignedDate: [String : Date]) {
		self.title = title
		self.isChecked = isChecked
		self.assignedDate = assignedDate
		self.id = UUID()
	}
	
	init(copiedSubItem: ProjectSubitem) {
		self.title = copiedSubItem.title
		self.isChecked = copiedSubItem.isChecked
		self.assignedDate = copiedSubItem.assignedDate
		self.id = copiedSubItem.id
	}
}

struct ProjectItem: Codable {
	var id: UUID
	var headerTitle: String
	var subItems: [ProjectSubitem]
	
	init(headerTitle: String, subItems: [ProjectSubitem]) {
		self.headerTitle = headerTitle
		self.subItems = subItems
		self.id = UUID()
	}
	
	init(copiedItem: ProjectItem) {
		self.headerTitle = copiedItem.headerTitle
		self.subItems = copiedItem.subItems
		self.id = copiedItem.id
	}
}


class ProjectBackendModel: Codable {
	var items: [ProjectItem] = [
		ProjectItem(headerTitle: "Test",
					subItems: [
						ProjectSubitem(title: "testwqdqwdqwdqwd",
									   isChecked: false,
									   assignedDate: [:])
					])
	]
}

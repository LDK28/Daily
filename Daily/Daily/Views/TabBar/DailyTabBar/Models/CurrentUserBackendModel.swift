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
	let name: Name
	let email: String?
	let password: String
	let notes: [NotesCellViewModel]?
}

struct Name: Codable {
	let firstName: String
	let lastName: String
}

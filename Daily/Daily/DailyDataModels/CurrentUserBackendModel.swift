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
	var notes: [NotesCellViewModel]
}

struct Name: Codable {
	var firstName: String
	var lastName: String
}

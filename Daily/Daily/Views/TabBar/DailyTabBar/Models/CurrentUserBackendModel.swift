//
//  CurrentUser.swift
//  Daily
//
//  Created by Арсений Токарев on 22.11.2020.
//

import UIKit

struct CurrentUser: Codable {
	let email: String?
	let userName: String
	let notes: [NotesCellViewModel]?
}

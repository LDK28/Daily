//
//  UserRequest.swift
//  Daily
//
//  Created by Арсений Токарев on 22.11.2020.
//

import UIKit
import Firebase
import FirebaseAuth

protocol DailyUserNetworkRequest {
	var userData: CurrentUser? { get set }
	func loadUserData(completion: @escaping (Bool) -> ())
	func getNotes() -> [NotesCellViewModel]
	func update(notes: [NotesCellViewModel])
}

final class UserRequest: DailyUserNetworkRequest {
	static var shared: DailyUserNetworkRequest = UserRequest()
	
	var userData: CurrentUser?
	
	func loadUserData(completion: @escaping (Bool) -> ()) {
		guard let currentUser = Auth.auth().currentUser else {
			completion(false)
			return
		}
		
		let db = Firestore.firestore()
		let userReference = db.collection("users").whereField("id", isEqualTo: currentUser.uid)
		
		userReference.getDocuments() { (querySnapshot, error) in
			guard error == nil, let document = querySnapshot?.documents.first, let jsonData = try? JSONSerialization.data(withJSONObject: document.data()) else {
				completion(false)
				return
			}
			UserRequest.shared.userData = try? JSONDecoder().decode(CurrentUser.self, from: jsonData)
			completion(true)
		}
	}
	
	func getNotes() -> [NotesCellViewModel] {
		return userData?.notes ?? []
	}
	
	func update(notes: [NotesCellViewModel]) {
		
	}
	
	private init() {}
}

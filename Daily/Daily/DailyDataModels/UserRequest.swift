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
	func getNotes(completion: @escaping ([NotesCellViewModel]) -> ())
	func add(note: NotesCellViewModel, completion: @escaping () -> ())
}

final class UserRequest: DailyUserNetworkRequest {
	static var shared: DailyUserNetworkRequest = UserRequest()
	
	var userData: CurrentUser?
	
	func loadUserData(completion: @escaping (Bool) -> ()) {
		guard let currentUser = Auth.auth().currentUser else {
			completion(false)
			return
		}

		let userReference = getUserReference(with: currentUser.uid)
		
		userReference.getDocuments() { (querySnapshot, error) in
			guard error == nil, let document = querySnapshot?.documents.first, let jsonData = try? JSONSerialization.data(withJSONObject: document.data()) else {
				completion(false)
				return
			}
			UserRequest.shared.userData = try? JSONDecoder().decode(CurrentUser.self, from: jsonData)
			completion(true)
		}
	}
	
	func getNotes(completion: @escaping ([NotesCellViewModel]) -> ()) {
		 completion(userData?.notes ?? [])
	}
	
	func add(note: NotesCellViewModel, completion: @escaping () -> ()) {
		UserRequest.shared.userData?.notes.append(note)
		guard let userID = Auth.auth().currentUser?.uid else {
			completion()
			return
		}
		let dataBase = Firestore.firestore()
		let documentReference = dataBase.collection("users").document(userID)
		if let encodedData = try? JSONEncoder().encode(UserRequest.shared.userData) {
			if let firestoreEncodedData = try? JSONSerialization.jsonObject(with: encodedData) as? [String : Any] {
				documentReference.setData(firestoreEncodedData, merge: true)
			}
		}
		
		completion()
	}
	
	
	private func getUserReference(with id: String) -> Query {
		let dataBase = Firestore.firestore()
		return dataBase.collection("users").whereField("id", isEqualTo: id)
	}
	
	private init() {}
}

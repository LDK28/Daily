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
	func getNotes(completion: @escaping ([NotesCellViewBackendModel]) -> ())
	func add(note: NotesCellViewBackendModel, completion: @escaping () -> ())
	func update(notes: [NotesCellViewBackendModel], completion: (() -> ())?)
	func update(note: NotesCellViewBackendModel, at index: Int, completion: (() -> ())?)
}

final class UserRequest: DailyUserNetworkRequest {
	static var shared: DailyUserNetworkRequest = UserRequest()
	private var userID: String?
	
	internal var userData: CurrentUser?
	
	func loadUserData(completion: @escaping (Bool) -> ()) {
		guard
			let currentUser = Auth.auth().currentUser
		else {
			completion(false)
			return
		}
		
		userID = currentUser.uid
		let userReference = getUserReference(with: userID ?? currentUser.uid)
		userReference.getDocuments() { (querySnapshot, error) in
			guard
				error == nil,
				let document = querySnapshot?.documents.first,
				let jsonData = try? JSONSerialization.data(withJSONObject: document.data())
			else {
				completion(false)
				return
			}
			
			guard
				let fetchedUserData = try? JSONDecoder().decode(CurrentUser.self, from: jsonData)
			else {
				completion(false)
				return
			}
			UserRequest.shared.userData = fetchedUserData
			completion(true)
		}
	}
	
	func getNotes(completion: @escaping ([NotesCellViewBackendModel]) -> ()) {
		completion(UserRequest.shared.userData?.notes ?? [])
	}
	
	func add(note: NotesCellViewBackendModel, completion: @escaping () -> ()) {
		guard
			let userID = userID,
			UserRequest.shared.userData != nil
		else {
			completion()
			return
		}
		let indexToInsertAt = userData?.notes.firstIndex(where: { !$0.isPinned }) ?? 0
		userData?.notes.insert(note, at: indexToInsertAt)
		updateServerData(withUserID: userID, completion: completion)
	}
	
	func update(notes: [NotesCellViewBackendModel], completion: (() -> ())?) {
		guard
			let userID = userID,
			UserRequest.shared.userData != nil
		else {
			completion?()
			return
		}
		
		UserRequest.shared.userData?.notes = notes
		updateServerData(withUserID: userID, completion: completion)
	}
	
	func update(note: NotesCellViewBackendModel, at index: Int, completion: (() -> ())?) {
		guard
			let userID = userID,
			UserRequest.shared.userData != nil,
			UserRequest.shared.userData?.notes.indices.contains(index) != false
		else {
			completion?()
			return
		}
		
		UserRequest.shared.userData?.notes[index] = note
		updateServerData(withUserID: userID, completion: completion)
	}
	
	private init() {}
}

//MARK: - Calls to dataBase (private!)
extension UserRequest {
	private func updateServerData(withUserID userID: String, completion: (() -> ())?) {
		let dataBase = Firestore.firestore()
		let documentReference = dataBase.collection("users").document(userID)
		if let encodedData = try? JSONEncoder().encode(UserRequest.shared.userData) {
			if let firestoreEncodedData = try? JSONSerialization.jsonObject(with: encodedData) as? [String : Any] {
				documentReference.setData(firestoreEncodedData, merge: true)
			}
		}
		completion?()
	}
	
	private func getLatestUserData(completion: @escaping (CurrentUser?) -> ()) {
		guard
			let userID = userID
		else {
			completion(nil)
			return
		}
		let dataBase = Firestore.firestore()
		let documentReference = dataBase.collection("users").document(userID)
		documentReference.getDocument() { result, error in
			guard
				error == nil,
				let data = try? JSONSerialization.data(withJSONObject: result?.data() as Any)
			else {
				completion(nil)
				return
			}
			
			guard
				let userNewData = try? JSONDecoder().decode(CurrentUser.self, from: data)
			else {
				completion(nil)
				return
			}
			self.userData = userNewData
			completion(self.userData)
		}
	}
	
	private func getUserReference(with id: String) -> Query {
		let dataBase = Firestore.firestore()
		return dataBase.collection("users").whereField("id", isEqualTo: id)
	}
}

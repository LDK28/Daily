//
//  UserRequest.swift
//  Daily
//
//  Created by Арсений Токарев on 22.11.2020.
//

import UIKit
import Firebase
import FirebaseAuth

enum DailyError: Error {
	case userDoesNotExist
	case badInternetConnection
	case couldnotFindUserData
	case notLoggedIn
	case documentNotFound
	case couldnotDecodeData
	case couldnotEncodeData
	case couldnotFetchData
	case wrongNoteIndex
}

final class UserRequest: DailyUserNetworkRequest {
	static var shared: DailyUserNetworkRequest = UserRequest()
	internal var userID: String?
	
	internal var userData: CurrentUser?
	
	func loadUserData(completion: @escaping (Result<Void, DailyError>) -> ()) {
		guard
			let currentUser = Auth.auth().currentUser
		else {
			completion(.failure(.notLoggedIn))
			return
		}
		
		userID = currentUser.uid
		let userReference = getUserReference(with: userID ?? currentUser.uid)
		userReference.getDocuments() { (querySnapshot, error) in
			guard error == nil else {
				completion(.failure(.badInternetConnection))
				return
			}
			guard let document = querySnapshot?.documents.first else {
				completion(.failure(.documentNotFound))
				return
			}
			guard let jsonData = try? JSONSerialization.data(withJSONObject: document.data()) else {
				completion(.failure(.couldnotFetchData))
				return
			}
			guard let decodedData = try? JSONDecoder().decode(CurrentUser.self, from: jsonData) else {
				completion(.failure(.couldnotDecodeData))
				return
			}
			UserRequest.shared.userData = decodedData
			completion(.success(()))
		}
	}
	
	private init() {}
}

//MARK: - Calls to dataBase (private!)
extension UserRequest {
	internal func updateServerData(withUserID userID: String,
								   completion: @escaping ((Result<Void, DailyError>) -> ())) {
		let dataBase = Firestore.firestore()
		let documentReference = dataBase.collection("users").document(userID)
		if let encodedData = try? JSONEncoder().encode(UserRequest.shared.userData) {
			if let firestoreEncodedData = try? JSONSerialization.jsonObject(with: encodedData) as? [String : Any] {
				documentReference.setData(firestoreEncodedData, merge: true)
				completion(.success(()))
				return
			}
		}
		completion(.failure(.couldnotEncodeData))
	}
	
	internal func getUserReference(with id: String) -> Query {
		let dataBase = Firestore.firestore()
		return dataBase.collection("users").whereField("id", isEqualTo: id)
	}
}
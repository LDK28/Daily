//
//  UserRequestNotes.swift
//  Daily
//
//  Created by Арсений Токарев on 07.12.2020.
//

import UIKit

extension UserRequest {
	func getNotes(completion: @escaping (Result<[NoteBackendModel], DailyError>) -> ()) {
		guard let userData = UserRequest.shared.userData else {
			completion(.failure(.couldnotFindUserData))
			return
		}
		completion(.success(userData.notes))
	}

	func append(_ note: NoteBackendModel, completion: @escaping (Result<Void, DailyError>) -> ()) {
		guard
			UserRequest.shared.userData != nil
		else {
			completion(.failure(.couldnotFindUserData))
			return
		}
		let indexToInsertAt = userData?.notes.firstIndex(where: { !$0.isPinned }) ?? 0
		userData?.notes.insert(note, at: indexToInsertAt)
		updateServerData() { result in
			switch result {
			case .success(()):
				completion(.success(()))
			case .failure(let error):
				completion(.failure(error))
			}
		}
	}

	func update(_ notes: [NoteBackendModel],
				completion: @escaping (Result<Void, DailyError>) -> ()) {
		guard
			UserRequest.shared.userData != nil
		else {
			completion(.failure(.couldnotFindUserData))
			return
		}
		UserRequest.shared.userData?.notes = notes
		updateServerData() { result in
			switch result {
			case .success(()):
				completion(.success(()))
			case .failure(let error):
				completion(.failure(error))
			}
		}
	}

	func update(_ note: NoteBackendModel,
				at index: Int,
				completion: @escaping (Result<Void, DailyError>) -> ()) {
		guard
			UserRequest.shared.userData != nil
		else {
			completion(.failure(.couldnotFindUserData))
			return
		}
		guard UserRequest.shared.userData?.notes.indices.contains(index) != false else {
			completion(.failure(.wrongNoteIndex))
			return
		}
		UserRequest.shared.userData?.notes[index] = note
		updateServerData() { result in
			switch result {
			case .success(()):
				completion(.success(()))
			case .failure(let error):
				completion(.failure(error))
			}
		}
	}

}

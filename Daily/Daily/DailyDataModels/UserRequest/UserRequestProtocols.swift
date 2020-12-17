//
//  UserRequestProtocols.swift
//  Daily
//
//  Created by Арсений Токарев on 07.12.2020.
//

import Foundation

protocol DailyUserNetworkRequest {
	//MARK: Initial values
	var userData: CurrentUser? { get set }
	func loadUserData(completion: @escaping (Result<Void, DailyError>) -> ())
	
	//MARK: - Notes
	func getNotes(completion: @escaping (Result<[NoteBackendModel], DailyError>) -> ())
	func append(_ note: NoteBackendModel, completion: @escaping (Result<Void, DailyError>) -> ())
	func update(_ notes: [NoteBackendModel], completion: @escaping (Result<Void, DailyError>) -> ())
	func update(_ note: NoteBackendModel, at index: Int, completion:  @escaping (Result<Void, DailyError>) -> ())
    
    //MARK: - Tasks
    func getTasks(completion: @escaping (Result<[DiaryBackendModel], DailyError>) -> ())
    func append(_ note: DiaryBackendModel, completion: @escaping (Result<Void, DailyError>) -> ())
    func update(_ notes: [DiaryBackendModel], completion: @escaping (Result<Void, DailyError>) -> ())
    func update(_ note: DiaryBackendModel, at index: Int, completion:  @escaping (Result<Void, DailyError>) -> ())
}

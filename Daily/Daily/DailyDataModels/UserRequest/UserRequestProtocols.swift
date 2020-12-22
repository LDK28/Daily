//
//  UserRequestProtocols.swift
//  Daily
//
//  Created by Арсений Токарев on 07.12.2020.
//

import UIKit

protocol DailyUserNetworkRequest {
	//MARK: Initial values
	var userData: CurrentUser? { get set }
  
	func loadUserData(completion: @escaping (Result<Void, DailyError>) -> ())
	
	func getName(completion: @escaping (Result<(UIImage?, Name?), DailyError>) -> ())
	
	//MARK: - Notes
	func getNotes(completion: @escaping (Result<[NoteBackendModel], DailyError>) -> ())
	
	func append(_ note: NoteBackendModel, completion: @escaping (Result<Void, DailyError>) -> ())
	
	func update(_ notes: [NoteBackendModel], completion: @escaping (Result<Void, DailyError>) -> ())
  
	func update(_ note: NoteBackendModel, at index: Int, completion:  @escaping (Result<Void, DailyError>) -> ())
    
    //MARK: - Tasks
    func getTasks(completion: @escaping (Result<[DiaryBackendModel], DailyError>) -> ())
    
    func append(_ task: DiaryBackendModel, completion: @escaping (Result<Void, DailyError>) -> ())
    
    func update(_ tasks: [DiaryBackendModel], completion: @escaping (Result<Void, DailyError>) -> ())
    
    func update(_ task: DiaryBackendModel, at index: Int, completion:  @escaping (Result<Void, DailyError>) -> ())
}

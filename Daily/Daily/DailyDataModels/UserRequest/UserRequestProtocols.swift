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
    
    //MARK: -Projects
    func getProjects(completion: @escaping (Result<[ProjectBackendModel], DailyError>) -> ())
    
    func append(_ project: ProjectBackendModel, completion: @escaping (Result<Void, DailyError>) -> ())
    
    func update(_ projects: [ProjectBackendModel], completion: @escaping (Result<Void, DailyError>) -> ())
  
    func update(_ project: ProjectBackendModel, at index: Int, completion:  @escaping (Result<Void, DailyError>) -> ())
    
}

//
//  UserRequestProjects.swift
//  Daily
//
//  Created by julie on 12.12.2020.
//

import UIKit

extension UserRequest {
    
    func getProjects(completion: @escaping (Result<[ProjectBackendModel], DailyError>) -> ()) {
        guard let userData = UserRequest.shared.userData else {
            completion(.failure(.couldnotFindUserData))
            return
        }
        completion(.success(userData.projects))
    }
    
    func append(_ project: ProjectBackendModel, completion: @escaping (Result<Void, DailyError>) -> ()) {
        guard
            UserRequest.shared.userData != nil
        else {
            completion(.failure(.couldnotFindUserData))
            return
        }
        userData?.projects.insert(project, at: 0)
        updateServerData() { result in
            switch result {
            case .success(()):
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func update(_ projects: [ProjectBackendModel], completion: @escaping (Result<Void, DailyError>) -> ()) {
        guard
            UserRequest.shared.userData != nil
        else {
            completion(.failure(.couldnotFindUserData))
            return
        }
        UserRequest.shared.userData?.projects = projects
        updateServerData() { result in
            switch result {
            case .success(()):
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func update(_ project: ProjectBackendModel, at index: Int, completion: @escaping (Result<Void, DailyError>) -> ()) {
        guard
            UserRequest.shared.userData != nil
        else {
            completion(.failure(.couldnotFindUserData))
            return
        }
        guard UserRequest.shared.userData?.projects.indices.contains(index) != false else {
            completion(.failure(.wrongProjectIndex))
            return
        }
        UserRequest.shared.userData?.projects[index] = project
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



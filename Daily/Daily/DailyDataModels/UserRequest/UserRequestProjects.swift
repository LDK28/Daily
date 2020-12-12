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
}



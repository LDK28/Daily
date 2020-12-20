import UIKit

extension UserRequest {
    func getTasks(completion: @escaping (Result<[DiaryBackendModel], DailyError>) -> ()) {
        guard let userData = UserRequest.shared.userData else {
            completion(.failure(.couldnotFindUserData))
            return
        }
        completion(.success(userData.tasks))
    }

    func append(_ task: DiaryBackendModel, completion: @escaping (Result<Void, DailyError>) -> ()) {
        guard
            let userID = userID,
            UserRequest.shared.userData != nil
        else {
            completion(.failure(.couldnotFindUserData))
            return
        }
        userData?.tasks.insert(task, at: 0)
        updateServerData(withUserID: userID) { result in
            switch result {
            case .success(()):
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func update(_ tasks: [DiaryBackendModel],
                completion: @escaping (Result<Void, DailyError>) -> ()) {
        guard
            let userID = userID,
            UserRequest.shared.userData != nil
        else {
            completion(.failure(.couldnotFindUserData))
            return
        }
        UserRequest.shared.userData?.tasks = tasks
        updateServerData(withUserID: userID) { result in
            switch result {
            case .success(()):
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func update(_ task: DiaryBackendModel,
                at index: Int,
                completion: @escaping (Result<Void, DailyError>) -> ()) {
        guard
            let userID = userID,
            UserRequest.shared.userData != nil
        else {
            completion(.failure(.couldnotFindUserData))
            return
        }
        guard UserRequest.shared.userData?.tasks.indices.contains(index) != false else {
            completion(.failure(.wrongTaskIndex))
            return
        }
        UserRequest.shared.userData?.tasks[index] = task
        updateServerData(withUserID: userID) { result in
            switch result {
            case .success(()):
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

}

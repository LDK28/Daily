//
//  ProjectsCellViewModel.swift
//  Daily
//
//  Created by julie on 08.12.2020.
//

import UIKit

class ProjectsCellViewModel: ProjectBackendModel, MainCellViewModel {
    var cellType: UITableViewCell.Type
    
    init(cellType: UITableViewCell.Type, model: ProjectBackendModel) {
        self.cellType = cellType
        super.init(model: model)
    }
    
    init(cellType: UITableViewCell.Type, title: String) {
        self.cellType = cellType
        super.init(title: title)
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}

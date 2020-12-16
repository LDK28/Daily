//
//  ProjectItemViewModel.swift
//  Daily
//
//  Created by julie on 13.12.2020.
//

import UIKit

class ProjectItemViewModel: ProjectItem, MainCellViewModel {
    
    var cellType: UITableViewCell.Type
    
    init(cellType: UITableViewCell.Type, copiedItem: ProjectItem) {
        self.cellType = cellType
        super.init(copiedItem: copiedItem)
    }
    
    init(cellType: UITableViewCell.Type, headerTitle: String, subItems: [ProjectSubitem]) {
        self.cellType = cellType
        super.init(headerTitle: headerTitle, subItems: subItems)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    
}

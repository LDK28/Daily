//
//  IdeasDataSource.swift
//  Daily
//
//  Created by julie on 21.11.2020.
//

import UIKit

class IdeasDataSource {
    var ideasCellViewModels: [IdeasCellViewModel]?
    
    init(ideasCellViewModels: [IdeasCellViewModel]? = nil) {
        self.ideasCellViewModels = ideasCellViewModels
    }
    
}

//
//  IdeasRouter.swift
//  Daily
//
//  Created by julie on 21.11.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

class IdeasRouter: IdeasDataPassing {
    
    private weak var viewController: IdeasVC?
    internal weak var dataStore: IdeasDataStore?
  
    init(viewController: IdeasVC?, dataStore: IdeasDataStore?) {
            self.dataStore = dataStore
            self.viewController = viewController
        }
}

extension IdeasRouter: IdeasRoutingLogic {
    
}

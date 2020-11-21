//
//  IdeasRouter.swift
//  Daily
//
//  Created by julie on 21.11.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

class IdeasRouter: IdeasDataPassing {
    
    weak var viewController: IdeasVC?
    weak var dataStore: IdeasDataStore?
  
}

extension IdeasRouter: IdeasRoutingLogic {
    
}

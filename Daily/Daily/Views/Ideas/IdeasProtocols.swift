//
//  IdeasProtocols.swift
//  Daily
//
//  Created by julie on 21.11.2020.
//

import UIKit

protocol IdeasDataStore: AnyObject {
    
}

protocol IdeasRoutingLogic {
    
}

protocol IdeasDataPassing {
    var dataStore: IdeasDataStore? { get }
}

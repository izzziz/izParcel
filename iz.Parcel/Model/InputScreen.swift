//
//  InputScreen.swift
//  iz.Parcel
//
//  Created by Izzat Jabali on 16/1/21.
//

import Foundation

class InputScreen {
    
    var name: String
    var address: String
    var status: Bool
    var trackingNumber: String
    
    init (name: String, address: String, status: Bool, trackingNumber: String) {
        
        self.name = name
        self.address = address
        self.status = status
        self.trackingNumber = trackingNumber
        
    }
    
}

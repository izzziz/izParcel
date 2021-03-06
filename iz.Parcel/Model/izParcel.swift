//
//  izParcel.swift
//  iz.Parcel
//
//  Created by Izzat Jabali on 5/1/21.
//

import Foundation

struct IzParcel: Codable {
    var name: String
    var address: String
    //var status: Bool
    var trackingNumber: String
    var notes: String
    
    var dateAndTime: Date
    var statusUpdated: Date
    
    static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("izParcel").appendingPathExtension("plist")
    
    static func loadIzParcel() -> [IzParcel]? {
        guard let codedIzparcels = try? Data(contentsOf: ArchiveURL) else { return nil }
        
        let propertyListDecoder = PropertyListDecoder()
        return try? propertyListDecoder.decode(Array<IzParcel>.self, from: codedIzparcels)
    }
    
    static func saveIzParcel(_ izParcel: [IzParcel]) {
        let propertyListEncoder = PropertyListEncoder()
        let codedIzparcel = try? propertyListEncoder.encode(izParcel)
        try? codedIzparcel?.write(to: ArchiveURL, options: .noFileProtection)
    }
}




//
//  Song.swift
//  HolidayMe
//
//  Created by Rushikesh on 25/09/18.
//  Copyright © 2018 Rushikesh. All rights reserved.
//

import UIKit

class Song: NSObject {
    var artistName = ""
    var collectionName = ""
    var artURL = ""
    var trackName = ""
    var imageData: NSData?
    
    override init() {
        
    }
    
    init(dictionary: NSDictionary!) {
        self.artistName = getValueFromDictionary(dictionary: dictionary, forKey: ENTITIES.artistName)
        self.collectionName = getValueFromDictionary(dictionary: dictionary, forKey: ENTITIES.collectionName)
        self.artURL = getValueFromDictionary(dictionary: dictionary, forKey: ENTITIES.artworkUrl60)
        self.trackName = getValueFromDictionary(dictionary: dictionary, forKey: ENTITIES.trackName)
        if let url = URL(string: self.artURL) {
            self.imageData = NSData(contentsOf: url)
        }
    }
    
    func dictioary() -> NSDictionary {
        let dictionary: NSDictionary = [
            ENTITIES.artistName: self.artistName,
            ENTITIES.collectionName: self.collectionName,
            ENTITIES.artworkUrl60: self.artURL,
            ENTITIES.trackName: self.trackName
        ]
        return dictionary
    }
}

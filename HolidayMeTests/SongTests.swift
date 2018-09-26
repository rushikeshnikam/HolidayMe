//
//  SongTests.swift
//  HolidayMeTests
//
//  Created by Rushikesh on 26/09/18.
//  Copyright © 2018 Rushikesh. All rights reserved.
//

import XCTest
@testable import HolidayMe

class SongTests: XCTestCase {

    var song1: Song!
    var song2: Song!
    var song3: Song!
    
    override func setUp() {
        super.setUp()
        
        self.song1 = Song(dictionary: [
            "artworkUrl60" : "https://is1-ssl.mzstatic.com/image/thumb/Music/v4/09/db/87/09db87c9-5817-d4a3-8d96-e8821c17e2ca/source/60x60bb.jpg",
            "artistName" : "Federico Scavo",
            "collectionName" : "KM / H",
            "trackName" : "Système 6"
            ])
        self.song2 = Song(dictionary: [
            "artworkUrl100" : "https://is4-ssl.mzstatic.com/image/thumb/Music/v4/46/42/49/4642499f-600b-36e9-7e0e-57bbc90ef81f/source/100x100bb.jpg",
            "artistName" : "I.O.S.",
            "collectionName" : "Open",
            "trackName" : "Open",
            ])
        self.song3 = Song(dictionary: [
            "artworkUrl60" : "https://is2-ssl.mzstatic.com/image/thumb/Music/v4/43/b6/bb/43b6bba5-c37b-458b-805f-133623edc420/source/60x60bb.jpg",
            "artistName" : "I.O.S.",
            "collectionName" : "KM / H",
            "trackName" : "Baghdad Betty (Radio Edit)",
            ])
   }

    override func tearDown() {
        super.tearDown()
        
        self.song1 = nil
        self.song2 = nil
        self.song3 = nil
    }

    func testExample() {
    }

    func testPerformanceExample() {
        self.measure {
        }
    }
}

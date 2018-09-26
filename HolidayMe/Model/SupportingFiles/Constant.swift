//
//  Constant.swift
//  HolidayMe
//
//  Created by Rushikesh on 25/09/18.
//  Copyright © 2018 Rushikesh. All rights reserved.
//

import UIKit

struct DEVICES {
    static let iPhoneSE: String = "iPhoneSE"
    static let iPhone6: String = "iPhone6"
    static let iPhonePlus: String = "iPhonePlus"
    static let iPhoneX: String = "iPhoneX"
    static let iPhoneXR: String = "iPhoneXR"
}

struct ENTITIES {
    static let artistName = "artistName"
    static let collectionName = "collectionName"
    static let artworkUrl60 = "artworkUrl60"
    static let trackName = "trackName"
    static let results = "results"
    static let artURL = "artURL"
    static let HMSong = "HMSong"
}
let screenHeight = UIScreen.main.bounds.height

let screenWidth = UIScreen.main.bounds.width

func safeAreaHeight() -> CGFloat {
    return (isDevice() == DEVICES.iPhoneX) ?667:751
}

func getCalculated(_ value: CGFloat) -> CGFloat {
    if isDevice() == DEVICES.iPhoneX || isDevice() == DEVICES.iPhoneXR {
        return safeAreaHeight() * (value / 568.0)
    } else {
        return screenHeight * (value / 568.0)
    }
}

func isDevice() -> String {
    if screenHeight == 896 {
        return DEVICES.iPhoneXR
    } else if screenHeight == 812 {
        return DEVICES.iPhoneX
    } else if screenHeight == 736 {
        return DEVICES.iPhonePlus
    } else if screenHeight == 667 {
        return DEVICES.iPhone6
    } else {
        return DEVICES.iPhoneSE
    }
}

func getValueFromDictionary(dictionary: NSDictionary, forKey key: String) -> String {
    var boolCheck: [String: Bool]?
    let object: AnyObject? = dictionary.object(forKey: key) as AnyObject
    
    if object == nil {
        return ""
    } else if object?.isKind(of: NSNull.classForCoder()) == true {
        return ""
    } else  if object?.isKind(of: NSArray.classForCoder()) == true {
        return ""
    } else if object?.isKind(of: NSNumber.classForCoder()) == true {
        let value: NSNumber = object as? NSNumber ?? 0
        return value.stringValue
    } else if object?.isKind(of: NSString.classForCoder()) == true {
        return object as? String ?? String()
    } else if boolCheck?[key] == true {
        return "true"
    } else if boolCheck?[key] == false {
        return "false"
    } else {
        return ""
    }
}

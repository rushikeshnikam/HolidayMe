//
//  WebService.swift
//  HolidayMe
//
//  Created by Rushikesh on 25/09/18.
//  Copyright © 2018 Rushikesh. All rights reserved.
//

import UIKit

typealias WebServiceCompletion = (_ response: AnyObject?, _ error: String?, _ errorCode: NSInteger?) -> Void

class WebService: NSObject {
    static func fetchSongDetails(completion: @escaping WebServiceCompletion) {
        if let url = URL(string: "https://itunes.apple.com/search/media=music&entity=song&term=ios") {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                do{
                    if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                        completion(jsonResult as AnyObject, "", 0)
                    } else {
                        completion(nil, "Parsing Error", 1)
                    }
                } catch {
                    completion(nil, error.localizedDescription, 2)
                }
            }
            task.resume()
        }
    }
}

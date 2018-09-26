//
//  HMCoreData.swift
//  HolidayMe
//
//  Created by Rushikesh on 25/09/18.
//  Copyright © 2018 Rushikesh. All rights reserved.
//

import UIKit
import CoreData

class HMCoreData: NSObject {
    // MARK: - iVars
    static let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    static let managedContext = appDelegate.persistentContainer.viewContext
    
    static func saveSongInCoreData(savingSong: Song, completion: @escaping (_ response: Bool, _ error: String) -> Void) {
         let entity = NSEntityDescription.entity(forEntityName: ENTITIES.HMSong, in: managedContext)!
        let song = NSManagedObject(entity: entity, insertInto: managedContext)
        song.setValue(savingSong.artistName, forKeyPath: ENTITIES.artistName)
        song.setValue(savingSong.collectionName, forKeyPath: ENTITIES.collectionName)
        song.setValue(savingSong.trackName, forKeyPath: ENTITIES.trackName)
        song.setValue(savingSong.imageData, forKey: ENTITIES.artURL)
        do {
            try managedContext.save()
            completion(true, "")
        } catch let error as NSError {
            completion(false, "Could not save. \(error), \(error.userInfo)")
        }
    }
    
    static func getSongInCoreData(completion: @escaping (_ songs: [Song], _ error: String) -> Void) {
         let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: ENTITIES.HMSong)
        do {
            let fetchedSongs = try HMCoreData.managedContext.fetch(fetchRequest)
            var songs: [Song] = []
            for item in fetchedSongs {
                let song = Song()
                song.artistName = item.value(forKey: ENTITIES.artistName) as! String
                song.collectionName = item.value(forKey: ENTITIES.collectionName) as! String
                song.trackName = item.value(forKey: ENTITIES.trackName) as! String
                song.imageData = item.value(forKey: ENTITIES.artURL) as? NSData
                songs.append(song)
            }
             completion(songs, "")
        } catch let error as NSError {
             completion([], "Could not save. \(error), \(error.userInfo)")
        }
    }
}

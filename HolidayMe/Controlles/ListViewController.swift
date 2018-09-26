//
//  ListViewController.swift
//  HolidayMe
//
//  Created by Rushikesh on 25/09/18.
//  Copyright © 2018 Rushikesh. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: - @IBOutlet
    @IBOutlet weak var tblViewSongs: UITableView!
    
    // MARK: - iVars
    var arrSongs: [Song] = []
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        HMCoreData.getSongInCoreData { (songs, error) in
            if songs.count > 0 {
                self.arrSongs = songs
                self.tblViewSongs.reloadData()
            } else {
                self.fetchSongDetails()
            }
        }
        
    }
    
    // MARK: - CustomFiles
    func setupView() {
        self.tblViewSongs.estimatedRowHeight = UITableView.automaticDimension
        self.tblViewSongs.rowHeight = getCalculated(60.0)
        self.tblViewSongs.tableFooterView = UIView()
    }
    
    func fetchSongDetails() {
         WebService.fetchSongDetails(completion: { (response: AnyObject?, error: String?, _) in
            if error == nil || error == "" {
                if let dictionary = response as? NSDictionary {
                    if let results = dictionary.value(forKey: ENTITIES.results) as? [NSDictionary]{
                        for item in results {
                            self.arrSongs.append(Song(dictionary: item))
                            HMCoreData.saveSongInCoreData(savingSong: Song(dictionary: item), completion: { (result, error) in
                                if !result {
                                    print("\(error), \(item)")
                                }
                            })
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
                            self.tblViewSongs.reloadData()
                        })
                    }
                }
            } else {
            }
        })
    }
    
    // MARK: - UITableViewDelegate, UITableViewDataSource
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrSongs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SongTableViewCell") as? SongTableViewCell {
            let song = self.arrSongs[indexPath.row]
            
            if let data = song.imageData as Data? {
                cell.imgSong.image = UIImage(data: data)
            } else if let url = URL(string: song.artURL) {
                cell.imgSong.sd_setImage(with: url) { (image: UIImage?, _, _, _) in
                    if let artImage = image {
                        cell.imgSong.image = artImage
                    }
                }
            }
            cell.imgSong.layoutIfNeeded()
            cell.imgSong.layer.cornerRadius = cell.imgSong.frame.size.height/2.0
            cell.imgSong.layer.masksToBounds = true
            cell.lblSongName.text = song.artistName
            cell.lblCollectionName.text = song.collectionName
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let viewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            viewController.selectedSong = self.arrSongs[indexPath.row]
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

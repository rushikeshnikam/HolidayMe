//
//  DetailViewController.swift
//  HolidayMe
//
//  Created by Rushikesh on 25/09/18.
//  Copyright © 2018 Rushikesh. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    // MARK: - @IBOutlet
    @IBOutlet weak var imgSong: UIImageView!
    
    @IBOutlet weak var lblArtistName: UILabel!
    @IBOutlet weak var lblCollectionName: UILabel!
    @IBOutlet weak var lblTrackName: UILabel!
    
    // MARK: - iVars
    var selectedSong = Song()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.seltupView()
    }
    
    // MARK: - Custom Functions
    func seltupView() {
        self.imgSong.layer.cornerRadius = self.imgSong.frame.size.height/2.0
        self.imgSong.layer.masksToBounds = true
        
        self.lblArtistName.text = self.selectedSong.artistName
        self.lblCollectionName.text = self.selectedSong.collectionName
        self.lblTrackName.text = self.selectedSong.trackName
        
        if let data = self.selectedSong.imageData as Data? {
            self.imgSong.image = UIImage(data: data)
        } else if let url = URL(string: self.selectedSong.artURL) {
            self.imgSong.sd_setImage(with: url) { (image: UIImage?, _, _, _) in
                if let artImage = image {
                    self.imgSong.image = artImage
                }
            }
        }
    }
}

//
//  PartyCell.swift
//  partyrocking
//
//  Created by James Mazurek on 4/15/17.
//  Copyright © 2017 James Mazurek. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {

    @IBOutlet weak var videoPreviewImg: UIImageView!
    
    @IBOutlet weak var videoTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func updateUI(partyRock: partyRock) {
        videoTitle.text = partyRock.videoTitle
        
        let url = URL(string: partyRock.imageURL)
        
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url!)
                DispatchQueue.global().sync {
                    self.videoPreviewImg.image = UIImage(data: data)
                }
            } catch {
                //error handling
            }
        }
    
    }
}

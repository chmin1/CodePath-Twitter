//
//  TweetCell.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/18/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit
import AlamofireImage

class TweetCell: UITableViewCell {
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var tweetTextLabel: UILabel!
    
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var screenNameLabel: UILabel!
    
    @IBOutlet weak var timeStampLabel: UILabel!
    
    @IBOutlet weak var RTButton: UIButton!
    
    @IBOutlet weak var RTLabel: UILabel!
    
    @IBOutlet weak var favButton: UIButton!
    
    @IBOutlet weak var favLabel: UILabel!
    
    var tweet: Tweet! {
        didSet {
            authorLabel.text = tweet.user.name
            
            screenNameLabel.text = "@\(tweet.user.screenName)"
            
            profileImage.af_setImage(withURL: URL(string: tweet.user.imageURL)!)
            
            timeStampLabel.text = tweet.createdAtString
            
            tweetTextLabel.text = tweet.text
            
            if (tweet.retweetCount == 0)
            {
                RTLabel.text = " "
            } else {
                RTLabel.text = String(tweet.retweetCount)
            }
            
            if (tweet.favoriteCount == 0)
            {
                favLabel.text = " "
            } else {
                favLabel.text = String(describing: tweet.favoriteCount)
            }
            
            if (tweet.retweeted == true)
            {
                RTButton.isSelected = true
            } else {
                RTButton.isSelected = false
            }
            
            if (tweet.favorited == true)
            {
                favButton.isSelected = true
            } else {
                favButton.isSelected = false
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileImage.layer.masksToBounds = true;
        profileImage.layer.cornerRadius = 30
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

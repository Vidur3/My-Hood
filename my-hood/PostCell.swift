//
//  PostCell.swift
//  my-hood
//
//  Created by Vidur Singh on 19/08/16.
//  Copyright © 2016 Vidur Singh. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        postImg.layer.cornerRadius = postImg.frame.width / 2
        postImg.clipsToBounds = true
        
    }

    
    func configureCell(post: Post) {
        
        titleLbl.text = post.title
        descLbl.text = post.postDesc
        postImg.image = DataService.instance.imageForPath(post.imagePath)
    }
    
}

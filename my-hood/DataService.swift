//
//  DataService.swift
//  my-hood
//
//  Created by Vidur Singh on 19/08/16.
//  Copyright © 2016 Vidur Singh. All rights reserved.
//

import Foundation
import UIKit

class DataService {
    
    static let instance = DataService()
    let KEY_POSTS = "posts"
    
    
    private var _loadedPosts = [Post]()
    
    var loadedPosts: [Post] {
        
        return _loadedPosts
    }
    
    func savePosts() {
        
        let postsData = NSKeyedArchiver.archivedDataWithRootObject(_loadedPosts)
        NSUserDefaults.standardUserDefaults().setObject(postsData, forKey: KEY_POSTS)
        NSUserDefaults.standardUserDefaults().synchronize()

    }
    
    func loadPosts() {
        
        if let postsData = NSUserDefaults.standardUserDefaults().objectForKey(KEY_POSTS) as? NSData {
            
            if let postsArray = NSKeyedUnarchiver.unarchiveObjectWithData(postsData) as? [Post] {
                
                _loadedPosts = postsArray
                
            }
            
        }
        
        NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "postsLoaded", object: nil))
        
    }
    
    func saveImageandCreatePath(image: UIImage) -> String {
        
        let imgData =   UIImagePNGRepresentation(image)
        let imgPath = "image\(NSDate.timeIntervalSinceReferenceDate()).png"
        let fullPath = documentsPathForFileName(imgPath)
        imgData?.writeToFile(fullPath, atomically: true)
        
        return imgPath
        
    }
    
    func imageForPath(path: String) -> UIImage? {
        
        let fullPath = documentsPathForFileName(path)
        let image = UIImage(named: fullPath)
        return image
        
    }
    
    func documentsPathForFileName(name: String) -> String {
        
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let fullpath = paths[0] as NSString
        return fullpath.stringByAppendingPathComponent(name)
        
    }
    
    
    func addPost(post: Post) {
        
        _loadedPosts.append(post)
        savePosts()
        loadPosts()
        
    }
    
}

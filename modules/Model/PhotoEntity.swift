//
//  PhotoModel.swift
//  Coon
//
//  Created by chan bill on 19/9/2017.
//  Copyright © 2017 CoonAndFriends. All rights reserved.
//

import Foundation

/// A photo with metadata
@objc class PhotoEntity : NSObject { // NOTE: if we drop Obj-c compatiblity, we can make this a struct
    
    /// The title of the photo
    let title : String
    
    /// The URL of the photo
    let url : URL
    
    @objc init(title: String, url: URL) {
        self.title = title
        self.url = url
        super.init()
    }
    
    override open var description : String {
        return "\(title) <\(url)>"
    }
}

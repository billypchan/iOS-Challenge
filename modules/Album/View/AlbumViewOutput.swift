//
//  AlbumViewOutput.swift
//  CoonApp-iOS
//
//  Created by Bill, Chan Yiu Por on 14/09/2017.
//  Copyright © 2017 com.billchan. All rights reserved.
//

protocol AlbumViewOutput {

    /**
        @author Bill, Chan Yiu Por
        Notify presenter that view is ready
    */

    func viewIsReady()

    /**
     @author Bill, Chan Yiu Por
     Notify presenter to refresh data
     */

    func refresh()
    
}

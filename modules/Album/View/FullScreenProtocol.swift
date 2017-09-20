//
//  FullScreenProtocol.swift
//  Coon
//
//  Created by chan bill on 20/9/2017.
//  Copyright © 2017 CoonAndFriends. All rights reserved.
//

import Foundation
import UIKit

@objc protocol FullScreenProtocol {
    func showFullScreenImageWhenTapped(sender: UITapGestureRecognizer, image: UIImage)
    func dismissFullscreenImage(sender: UITapGestureRecognizer)
}


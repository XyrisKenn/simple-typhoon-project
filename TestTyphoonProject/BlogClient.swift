//
//  BlogClient.swift
//  TestTyphoonProject
//
//  Created by Kenneth Mayfield on 2016-04-08.
//  Copyright © 2016 XyrisApps. All rights reserved.
//

import Foundation

@objc public protocol BlogClient {
    
    func loadBlogs() -> AnyObject
}
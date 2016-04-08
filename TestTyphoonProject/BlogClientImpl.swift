//
//  BlogClientImpl.swift
//  TestTyphoonProject
//
//  Created by Kenneth Mayfield on 2016-04-08.
//  Copyright © 2016 XyrisApps. All rights reserved.
//

import Foundation

public class BlogClientImpl: NSObject, BlogClient {
    
    var blogListData : AnyObject?
    
    
    public func loadBlogs() -> AnyObject {
        return self.blogListData!
    }
    
}

//
//  DataAssembly.swift
//  TestTyphoonProject
//
//  Created by Kenneth Mayfield on 2016-04-08.
//  Copyright © 2016 XyrisApps. All rights reserved.
//

import Typhoon

public class DataAssembly: TyphoonAssembly {
    
    public dynamic func dataClient() -> AnyObject {
        
        return TyphoonDefinition.withClass(BlogClientImpl.self) {
            (definition) in
            
            definition.injectProperty("blogListData", with: DataHandler.returMockBlogListJSON())
            
        }
    }

}

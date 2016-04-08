//
//  DataHandler.swift
//  TestTyphoonProject
//
//  Created by Kenneth Mayfield on 2016-04-08.
//  Copyright © 2016 XyrisApps. All rights reserved.
//

import SwiftyJSON

class DataHandler: NSObject {
    
    class dynamic func returMockBlogListJSON() -> AnyObject {
        let fileName = "MockFlickrBlogData"
        let tempData = self.loadFile(fileName, type: "json")
        return tempData
    }
    
    private class func loadFile(fileName:String, type:String) -> AnyObject {
        var jsonData: JSON = "{}"
        
        if let path = NSBundle.mainBundle().pathForResource(fileName, ofType: type) {
            
            do {
                let data = try NSData(contentsOfURL: NSURL(fileURLWithPath: path), options: NSDataReadingOptions.DataReadingMappedIfSafe)
                let jsonObj = JSON(data: data)
                if jsonObj != JSON.null {
                    print("loaded Mock JSON data for \(fileName): \(jsonObj)")
                    jsonData = jsonObj
                } else {
                    print("Could not load mock JSON file for \(fileName) - please check for valid JSON")
                }
                
            } catch let error as NSError {
                print(error.localizedDescription)
            }
            
        } else {
            print("Error: invalid name or path of NSBundle JSON file")
        }
        
        return jsonData.object
    }

}

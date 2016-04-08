//
//  ApplicationAssembly.swift
//  TestTyphoonProject
//
//  Created by Kenneth Mayfield on 2016-04-08.
//  Copyright © 2016 XyrisApps. All rights reserved.
//

import Typhoon

public class ApplicationAssembly: TyphoonAssembly {
    
    public var dataComponents : DataAssembly!
    
    // app delegate - inject root view controller
    public dynamic func appDelegate() -> AnyObject {
        return TyphoonDefinition.withClass(AppDelegate.self) {
            (definition) in
            
            definition.injectProperty("rootViewController", with: self.rootViewController())
        }
    }
    
    public dynamic func config() -> AnyObject {
        return TyphoonDefinition.configDefinitionWithName("Configuration.plist")
    }
    
    
    public dynamic func rootViewController() -> AnyObject {
        return TyphoonDefinition.withClass(RootViewController.self) {
            (definition) in
            definition.useInitializer("initWithMainContentViewContainer:assembly:") {
                (initializer) in
                
                // 1. Place here the first view controller you want to display.
                initializer.injectParameterWith(self.blogListViewController())
            
                // 2. then inject assembly
                initializer.injectParameterWith(self)
            }
            
            definition.scope = TyphoonScope.Singleton
        }
    }
    
    // view controllers
    public dynamic func blogListViewController() -> AnyObject {
        return TyphoonDefinition.withClass(BlogListViewController.self) {
            (definition) in
            
            definition.useInitializer("initWithView:dataClient:assembly:") {
                (initializer) in
                
                initializer.injectParameterWith(self.blogListView())
                initializer.injectParameterWith(self.dataComponents.dataClient())
                initializer.injectParameterWith(self)
            }
            
            definition.scope = TyphoonScope.Singleton
        }
    }
    
    // views
    public dynamic func blogListView() -> AnyObject {
        return TyphoonDefinition.withClass(BlogListView.self) {
            (definition) in
            
            definition.injectProperty("viewColor", with: UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0))
            definition.injectProperty("fontPointSize", with:TyphoonConfig("blogList.fontSize"))
            definition.injectProperty("fontName", with:TyphoonConfig("blogList.fontName"))
        }
    }

}

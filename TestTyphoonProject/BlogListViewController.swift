//
//  BlogListViewController.swift
//  TestTyphoonProject
//
//  Created by Kenneth Mayfield on 2016-04-08.
//  Copyright © 2016 XyrisApps. All rights reserved.
//

import UIKit
import SwiftyJSON

public class BlogListViewController: UIViewController {
    
    // add access to view 
    public var blogListView : BlogListView {
        get {
            return self.view as! BlogListView
        }
        set {
            self.view = newValue
        }
    }
    
    private var assembly : ApplicationAssembly!
    private var navigator: UINavigationController!
    
    public private(set) var dataClient : BlogClient
    
    
    public dynamic init(view: BlogListView, dataClient: BlogClient, assembly : ApplicationAssembly) {
        self.assembly = assembly
        self.dataClient = dataClient
        
        super.init(nibName: nil, bundle: nil)
        
        self.blogListView = view
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    public override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // load up display view data
    public override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let blogs : AnyObject = self.dataClient.loadBlogs() {
            self.blogListView.blogs = JSON(blogs)
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

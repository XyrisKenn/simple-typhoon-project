//
//  ViewController.swift
//  TestTyphoonProject
//
//  Created by Kenneth Mayfield on 2016-04-08.
//  Copyright © 2016 XyrisApps. All rights reserved.
//

import Foundation

public class RootViewController: UIViewController {
    
    private var assembly : ApplicationAssembly!
    private var navigator : UINavigationController!
    
    private var mainContentViewContainer : UIView!
    
    private var mainView : UIView {
        get {
            return self.view
        }
        set {
            self.view = newValue
        }
    }

    let lockQueue = dispatch_queue_create("typhoonproj.root.lockQueue", nil)
    

    public init(mainContentViewContainer: UIViewController, assembly: ApplicationAssembly) {
        super.init(nibName: nil, bundle: nil)
        
        self.assembly = assembly
        self.pushViewController(mainContentViewContainer, replaceRoot: true)
    }
    
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // views
    public override func loadView() {
        let screen = UIScreen.mainScreen().bounds
        
        self.mainView = UIView(frame: CGRectMake(0,0,screen.size.width, screen.size.height))
        self.view.autoresizingMask = [UIViewAutoresizing.FlexibleHeight, UIViewAutoresizing.FlexibleWidth]
        self.mainContentViewContainer = UIView(frame: CGRectMake(0,0,self.mainView.frame.size.width, self.mainView.frame.size.height))
        self.mainView.addSubview(self.mainContentViewContainer)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    // Navigation
    
    public func pushViewController(controller : UIViewController) {
        self.pushViewController(controller, replaceRoot: false)
    }
    
    public func pushViewController(controller: UIViewController, replaceRoot: Bool) {
        dispatch_sync(lockQueue)
        {
            if (self.navigator == nil) {
                self.makeNavigationControllerWithRoot(controller)
            }
            else if ( replaceRoot) {
                self.navigator.setViewControllers([controller], animated: true)
            }
            else {
                self.navigator.pushViewController(controller, animated: true)
            }
        }
    }
    
    public func popViewControllerAnimated(animated: Bool) {
        let lockQueue = dispatch_queue_create("typhoon.root.lockQueue", nil)
        dispatch_sync(lockQueue) {
            self.navigator.popViewControllerAnimated(animated)
            return
        }
    }
    
    
    // private functions
    private func makeNavigationControllerWithRoot(root: UIViewController) {
        self.navigator = UINavigationController(rootViewController: root)
        self.navigator.view.frame = self.view.bounds
        mainContentViewContainer.addSubview(self.navigator.view)
    }

}


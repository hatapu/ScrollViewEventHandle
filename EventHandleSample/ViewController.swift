//
//  ViewController.swift
//  EventHandleSample
//
//  Created by yusuke on 2016/05/03.
//  Copyright © 2016年 hatapu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let view = UIView(frame: CGRectMake(40, 40, 200, 200))
        view.backgroundColor = UIColor.redColor()
        self.view.addSubview(view)
        
        let scrollView = MyScrollView(frame: CGRectMake(40, 250, 200, 200))
        scrollView.contentSize = CGSizeMake(200, 500)
        scrollView.backgroundColor = UIColor.yellowColor()
        scrollView.delaysContentTouches = false
        scrollView.canCancelContentTouches = false
        scrollView.panGestureRecognizer.cancelsTouchesInView = false
        self.view.addSubview(scrollView)
        
        let button = UIButton(type: UIButtonType.System)
        button.setTitle("Button", forState: UIControlState.Normal)
        button.frame = CGRectMake(40, 460, 100, 40)
        self.view.addSubview(button)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let y_val = touches.first!.locationInView(self.view).y
        print("touchesBegan" + String(y_val))
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let y_val = touches.first!.locationInView(self.view).y
        print("touchesMoved" + String(y_val))
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("touchesEnded")
    }
    
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        print("touchesCancelled")
    }
}

class MyScrollView : UIScrollView {
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let y_val = touches.first!.locationInView(self.superview).y
        print("scroll touchesBegan" + String(y_val))
        super.nextResponder()?.touchesBegan(touches, withEvent: event)
    }

    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let y_val = touches.first!.locationInView(self.superview).y
        print("scroll touchesMoved" + String(y_val))
        super.nextResponder()?.touchesMoved(touches, withEvent: event)
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let y_val = touches.first!.locationInView(self.superview).y
        print("scroll touchesEnded" + String(y_val))
        super.nextResponder()?.touchesEnded(touches, withEvent: event)
    }
    
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        let y_val = touches!.first!.locationInView(self.superview).y
        print("scroll touchesCanceled" + String(y_val))
        super.nextResponder()?.touchesCancelled(touches, withEvent: event)
    }
}

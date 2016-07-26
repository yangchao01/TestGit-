//
//  ViewController.swift
//  TestAnimation
//
//  Created by tujia on 16/7/7.
//  Copyright © 2016年 杨超. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let aa = CircleProgressView()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.whiteColor()
        aa.frame = CGRectMake(100, 100, 100, 50)   // CircleProgressView(frame: CGRectMake(100,100,100,50))
        aa.backgroundColor = UIColor.redColor()
        self.view.addSubview(aa)
        aa.settrackColor(UIColor.blackColor())
        aa.setprogressColor(UIColor.orangeColor())
        aa.setprogress(0.5)
        aa.setProgressWidth(20)
        
        let button = UIButton(frame: CGRectMake(100,100,50,30))
        button.addTarget(self, action: #selector(ViewController.setProgress), forControlEvents: UIControlEvents.TouchUpInside)
        button.backgroundColor = UIColor.blueColor()
        self.view.addSubview(button)
    }
    
    func setProgress() {
        self.aa.setprogress(0.5)
        UIView.animateWithDuration(20.0) {
            self.aa.setprogress(1)
        }

        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


class CircleProgressView: UIView {
    
    var trackLayer : CAShapeLayer?
    var trackPath : UIBezierPath?
    var progressLayer : CAShapeLayer?
    var progressPath : UIBezierPath?
    var trackColor : UIColor?
    var progressColor : UIColor?
    var progress : CGFloat?
    var progressWidth : CGFloat?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        trackLayer = CAShapeLayer()
        self.layer.addSublayer(trackLayer!)
        trackLayer?.fillColor = nil
        trackLayer?.lineCap = kCALineCapRound
        trackLayer?.frame = self.bounds
        
        progressLayer = CAShapeLayer()
        self.layer.addSublayer(progressLayer!)
        progressLayer?.fillColor = nil
        progressLayer?.lineCap = kCALineCapRound
        progressLayer?.frame = self.bounds
        
        self.progressWidth = 5
        
    }
    
    func setTrack() {
        trackPath = UIBezierPath(arcCenter: self.center, radius: (self.bounds.size.width-progressWidth!)/2, startAngle: 0, endAngle:CGFloat(M_PI)*2, clockwise: true)
        print(self.center)
        trackLayer?.path = trackPath?.CGPath
    }
    
    func setProgress() {
        progressPath = UIBezierPath(arcCenter: self.center, radius: (self.bounds.size.width-progressWidth!)/2, startAngle: -CGFloat(M_PI_2), endAngle:CGFloat(M_PI)*2*progress!-CGFloat(M_PI_2), clockwise: true)
        progressLayer?.path = progressPath?.CGPath
    }
    
    func setProgressWidth(progressWidth:CGFloat) {
        
        self.progressWidth = progressWidth
        trackLayer?.lineWidth = self.progressWidth!
        self.progressLayer?.lineWidth = self.progressWidth!
        self.setTrack()
        self.setProgress()
        
    }
    
    func settrackColor(trackColor:UIColor) {
        self.trackLayer?.strokeColor = trackColor.CGColor
    }
    
    func setprogressColor(progressColor:UIColor) {
        progressLayer?.strokeColor = progressColor.CGColor
    }
    
    func setprogress(progress:CGFloat) {
        
        self.progress = progress
        //self.setProgress()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}






//
//  ViewController.swift
//  TestAnimation
//   git 并不会实时的跟踪你的文件 只有你明确让他记录你的文件时，他才会把指定的文件的当前状态记录到仓库中去，所有一般当我们修改完文件的时候需要先git add fileName1 fileName2 如果你嫌麻烦的话可以直接git add -A 添加所有的文件到暂存的区域 当添加完之后 你可以用 git commit 到编辑窗口里面输入备注完成提交  以上的步骤如果嫌麻烦的话可以直接git commit -am 备注 完成提交
//   其实git add 命令只是把指定的文件的当前状态添加到暂存区域，并不是代表一个文件一旦添加 就会一直存在于每个版本中 如果你添加一个文件后又对这个文件进行了修改 当你commit 的时候只会commit这个文件添加时候的状态 不会把之后的修改也commit进去 除非你再次添加 并提交
// 新加了一个备注

//  Created by tujia on 16/7/7.
//  Copyright © 2016年 杨超. All rights reserved.
//



import UIKit
//我是master分支
class ViewController: UIViewController {
    
    let aa = CircleProgressView()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //测试是否可以推到testBranch上面
        self.view.backgroundColor = UIColor.whiteColor()
        aa.frame = CGRectMake(100, 100, 100, 50)   // CircleProgressView(frame: CGRectMake(100,100,100,50))
        aa.backgroundColor = UIColor.redColor()
        self.view.addSubview(aa)
        aa.settrackColor(UIColor.blackColor())
        aa.setprogressColor(UIColor.orangeColor())
        aa.setprogress(0.5)
        aa.setProgressWidth(20)
        // 测试基于本地分支简历分支与其他分支的影响
        let button = UIButton(frame: CGRectMake(100,100,50,30))
        button.addTarget(self, action: #selector(ViewController.setProgress), forControlEvents: UIControlEvents.TouchUpInside)
        button.backgroundColor = UIColor.blueColor()
        self.view.addSubview(button)
    }
    
    func setProgress() { //我加了标记哈
        self.aa.setprogress(0.5)
        UIView.animateWithDuration(20.0) {
            self.aa.setprogress(1)
        }
    }
    
    
    override func didReceiveMemoryWarning() { //dshfsdfsdfsdf
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






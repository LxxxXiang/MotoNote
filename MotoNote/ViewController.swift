//
//  ViewController.swift
//  MotoNote
//
//  Created by 廖翔 on 2021/11/20.
//

import UIKit

class ViewController: UIViewController {
    
    var angle = CGPoint.init(x: 0, y: 0)
    let motoView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addmoto()
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(viewTransform))
        motoView.addGestureRecognizer(panGesture)
        
    }
    
    func addmoto() {
        
        let viewFrame = UIScreen.main.bounds
        var motoTransform = CATransform3DIdentity
        
        motoView.frame = CGRect(x: 0, y: viewFrame.maxY / 2 - 50, width: viewFrame.width, height: 100)
        
        // create moto 3D View
        let moto0 = UIImageView.init(image: UIImage(named: "moto-0"))
        moto0.frame = CGRect(x: viewFrame.maxX / 2 - 100, y: 0, width: 200, height: 200)
        motoTransform = CATransform3DTranslate(motoTransform, 0, 0, 100)
        moto0.layer.transform = motoTransform
        
        let moto1 = UIImageView.init(image: UIImage(named: "moto-1"))
        moto1.frame = CGRect(x: viewFrame.maxX / 2 - 100, y: 0, width: 200, height: 200)
        motoTransform = CATransform3DRotate(CATransform3DIdentity, (-CGFloat.pi / 2), 0, 1, 0)
        motoTransform = CATransform3DTranslate(motoTransform, 0, 0, 100)
        moto1.layer.transform = motoTransform
        
        let moto2 = UIImageView.init(image: UIImage(named: "moto-2"))
        moto2.frame = CGRect(x: viewFrame.maxX / 2 - 100, y: 0, width: 200, height: 200)
        motoTransform = CATransform3DTranslate(CATransform3DIdentity, 0, 0, -100)
        moto2.layer.transform = motoTransform
        
        let moto3 = UIImageView.init(image: UIImage(named: "moto-3"))
        moto3.frame = CGRect(x: viewFrame.maxX / 2 - 100, y: 0, width: 200, height: 200)
        motoTransform = CATransform3DRotate(CATransform3DIdentity, (CGFloat.pi / 2), 0, 1, 0)
        motoTransform = CATransform3DTranslate(motoTransform, 0, 0, 100)
        moto3.layer.transform = motoTransform
        
        motoView.addSubview(moto0)
        motoView.addSubview(moto1)
        motoView.addSubview(moto2)
        motoView.addSubview(moto3)
        
        view.addSubview(motoView)
    }
    
    @objc func viewTransform(sender: UIPanGestureRecognizer) {
        
        let point = sender.translation(in: motoView)
        let angleX = angle.x + (point.x/30)
        
        var transform = CATransform3DIdentity
        transform.m34 = -1 / 500
        transform = CATransform3DRotate(transform, angleX, 0, 1, 0)
        motoView.layer.sublayerTransform = transform
        
        if sender.state == .ended {
            angle.x = angleX
        }
    }
    
}

// 3D view moto-2  水平顛倒
// 觸控view可控制面積與圖片大小不一樣


// reference: https://www.appcoda.com.tw/catransform3d/

//
//  UIView+ShortCut.swift
//  WhatIsClock
//
//  Created by LyonTK on 11/26/15.
//  Copyright © 2015 LyonTK. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    var top:Double{
        return Double(self.frame.origin.y)
    }
    var bottom:Double{
        return Double(self.frame.origin.y+self.frame.size.height)
    }

    var left:Double{
        return Double(self.frame.origin.x)
    }

    var right:Double{
        return Double(self.frame.origin.x+self.frame.size.width)
    }

    var width:Double{
        return Double(self.frame.size.width)
    }

    var height:Double{
        return Double(self.frame.size.height)
    }
}

extension UIView
{
    class func initFromNib() -> UIView {
        //方法1
        let nib = UINib(nibName: NSStringFromClass(self).componentsSeparatedByString(".").last ?? "", bundle: nil)
        return nib.instantiateWithOwner(self, options: nil).first as! UIView
        //方法2
//        let mainBundle = NSBundle.mainBundle()
//        let className  = NSStringFromClass(self).componentsSeparatedByString(".").last ?? ""
//
//        if ( mainBundle.pathForResource(className, ofType: "nib") != nil ) {
//            let objects = mainBundle.loadNibNamed(className, owner: self, options: [:])
//            
//            for object in objects {
//                if let view = object as? UIView {
//                    return view
//                }
//            }
//        }
//        
//        return UIView(frame: CGRectZero)
    }
}


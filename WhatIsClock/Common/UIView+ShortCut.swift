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



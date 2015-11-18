//
//  WICTTS.swift
//  WhatIsClock
//
//  Created by LyonTK on 11/17/15.
//  Copyright © 2015 LyonTK. All rights reserved.
//

import Foundation


class WICTTS {
    
    static var isChinese: Bool = { ()->Bool in
        if AVSpeechSynthesisVoice.currentLanguageCode() == "zh-CN"{
            return true
        }else{
            return false
        }
    }()//懒初始化
    
    static var tts:AVSpeechSynthesizer = AVSpeechSynthesizer()

    class func speak(Txt txt:String){
        let utterance = AVSpeechUtterance(string: txt)
        tts.speakUtterance(utterance)
    }
    
    class func language(Chinese:String, English:String) -> String{
        if true == isChinese {
            return Chinese
        }else{
            return English
        }
    }
    
    
}



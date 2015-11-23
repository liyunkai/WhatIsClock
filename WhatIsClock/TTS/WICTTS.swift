//
//  WICTTS.swift
//  WhatIsClock
//
//  Created by LyonTK on 11/17/15.
//  Copyright © 2015 LyonTK. All rights reserved.
//

import Foundation


class WICTTS {
    
    static let tts:AVSpeechSynthesizer = AVSpeechSynthesizer()

    class func speak(Txt txt:String){
        let utterance = AVSpeechUtterance(string: txt)
        tts.speakUtterance(utterance)
    }
    
}



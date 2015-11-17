//
//  WICTTS.swift
//  WhatIsClock
//
//  Created by LyonTK on 11/17/15.
//  Copyright © 2015 LyonTK. All rights reserved.
//

import Foundation


class WICTTS {
    
    static var tts:AVSpeechSynthesizer = AVSpeechSynthesizer()

    class func speak(Txt txt:String){
        let localVoice = AVSpeechSynthesisVoice(language: "zh-CN")
        let utterance = AVSpeechUtterance(string: txt)
        utterance.voice = localVoice
        tts.speakUtterance(utterance)
    }
    
    
}



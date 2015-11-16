//
//  ViewController.m
//  WhatIsClock
//
//  Created by LyonTK on 11/16/15.
//  Copyright © 2015 LyonTK. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVSpeechSynthesis.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    AVSpeechSynthesizer *av = [[AVSpeechSynthesizer alloc]init];
    AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc] initWithString:@"你好"]; //需要转换的文本
    AVSpeechSynthesisVoice *zhVoice = [AVSpeechSynthesisVoice voiceWithLanguage:@"zh-CN"];
    utterance.voice = zhVoice;
    [av speakUtterance:utterance];
    for (AVSpeechSynthesisVoice *voice in [AVSpeechSynthesisVoice speechVoices]) {
        NSLog(@"%@", voice.language);
    }
    
//    AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc] initWithString:@"你好"]; //需要转换的文本
//    [av speakUtterance:utterance];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

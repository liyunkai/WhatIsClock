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
    
    NSDate *now = [NSDate date];
//    NSString *formatString = [NSDateFormatter dateFormatFromTemplate:@"YY-MM-DD HH:MM:SS" options:0 locale:[NSLocale currentLocale]];
    NSString *formatString = [NSDateFormatter localizedStringFromDate:now dateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterMediumStyle];
    NSLog(formatString?:@"");
}

//NSDate 2 NSString
- (NSString *)dateToString:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *strDate = [dateFormatter stringFromDate:date];
    return strDate;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

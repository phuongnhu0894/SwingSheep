//
//  SwingSheep.m
//  TechmasterApp
//
//  Created by student on 11/19/15.
//  Copyright © 2015 Techmaster. All rights reserved.
//

#import "SwingSheep.h"
#import <AVFoundation/AVFoundation.h>

@interface SwingSheep ()

@end

@implementation SwingSheep
{
    UIImageView *sheep;
    UIImageView *sea1, *sea2;
    AVAudioPlayer* audioPlayer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self drawSheepAndSea];
    [self animateSheep];
    [self animateSea];
}

- (void) drawSheepAndSea {
    sea1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sea1.jpg"]];
    sea1.frame = self.view.bounds;
    [self.view addSubview:sea1];
    
    sea2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sea2.jpg"]];
    sea2.frame = self.view.bounds;
    [self.view addSubview:sea2];
    
//    sea3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sea3.jpg"]];
//    sea3.frame = self.view.bounds;
//    [self.view addSubview:sea3];
//    
//    sea4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sea4.jpg"]];
//    sea4.frame = self.view.bounds;
//    [self.view addSubview:sea4];
    
    sheep = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"sheep.png"]];
    sheep.center = CGPointMake(100, 300);
    [self.view addSubview:sheep];
}


-(void) animateSheep {
    [UIView animateWithDuration:1 animations:^{
        sheep.transform = CGAffineTransformMakeRotation(-0.08);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1
                         animations:^{
                             sheep.transform = CGAffineTransformMakeRotation(0.08);
                         } completion:^(BOOL finished) {
                             [self animateSheep];
                         }];
    }];
}
- (void) animateSea {
    [UIView animateWithDuration:10
                     animations:^{
                         sea2.frame = CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
                         sea1.frame = self.view.bounds;
                     } completion:^(BOOL finished) {
                         sea1.frame = CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
                         [UIView animateWithDuration:10 animations:^{
                             sea1.frame = self.view.bounds;
                             sea2.frame = CGRectMake(-self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
                         } completion:^(BOOL finished) {
                             sea2.frame = CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
                             [self animateSea];
                         }];
                         
                     }];
}
- (void) playSong {
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"sharazan" ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:filePath];
    NSError *error;
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url
                                                         error:&error];
    [audioPlayer prepareToPlay];
    [audioPlayer play];
}
- (void) viewWillDisappear:(BOOL)animated {
    [audioPlayer stop];
}

@end

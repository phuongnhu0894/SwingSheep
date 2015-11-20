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
    UIImageView *sea1, *sea2, *sea3, *sea4;
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
    sea2.frame = CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    [self.view addSubview:sea2];
    
    sea3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sea3.jpg"]];
    sea3.frame = CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    [self.view addSubview:sea3];
    
    sea4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sea4.jpg"]];
    sea4.frame = CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    [self.view addSubview:sea4];
    
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
    CGRect leftFrame = CGRectMake(-self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    CGRect centerFrame = self.view.bounds;
    CGRect rightFrame = CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
//    [UIView animateKeyframesWithDuration:8 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
//        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:2 animations:^{
//            sea1.frame = leftFrame;
//            sea2.frame = centerFrame;
//        }];
//        sea1.frame = rightFrame;
//        [UIView addKeyframeWithRelativeStartTime:2 relativeDuration:2 animations:^{
//            sea2.frame = leftFrame;
//            sea3.frame = centerFrame;
//        }];
//        sea2.frame = rightFrame;
//        [UIView addKeyframeWithRelativeStartTime:4 relativeDuration:2 animations:^{
//            sea3.frame = leftFrame;
//            sea4.frame = centerFrame;
//        }];
//        sea3.frame = rightFrame;
//        [UIView addKeyframeWithRelativeStartTime:6 relativeDuration:2 animations:^{
//            sea4.frame = leftFrame;
//            sea1.frame = centerFrame;
//        }];
//        sea4.frame = rightFrame;
//    } completion:^(BOOL finished) {
//        [self animateSea];
//    }];

    
    [UIView animateWithDuration:5
                     animations:^{
                         sea1.frame = leftFrame;
                         sea2.frame = centerFrame;
                     } completion:^(BOOL finished) {
                         sea1.frame = rightFrame;
                         [UIView animateWithDuration:5 animations:^{
                             sea2.frame = leftFrame;
                             sea3.frame = centerFrame;
                         } completion:^(BOOL finished) {
                             sea2.frame = rightFrame;
                             [UIView animateWithDuration:5 animations:^{
                                 sea3.frame = leftFrame;
                                 sea4.frame = centerFrame;
                             } completion:^(BOOL finished) {
                                 sea3.frame = rightFrame;
                                 [UIView animateWithDuration:5 animations:^{
                                     sea4.frame = leftFrame;
                                     sea1.frame = centerFrame;
                                 } completion:^(BOOL finished) {
                                     sea4.frame = rightFrame;
                                     [self animateSea];
                                 }];
                             }];
                         
                         }];
                    }];
                          
    
}

//- (void) playSong {
//    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"sharazan" ofType:@"mp3"];
//    NSURL *url = [NSURL fileURLWithPath:filePath];
//    NSError *error;
//    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url
//                                                         error:&error];
//    [audioPlayer prepareToPlay];
//    [audioPlayer play];
//}
//- (void) viewWillDisappear:(BOOL)animated {
//    [audioPlayer stop];
//}

@end

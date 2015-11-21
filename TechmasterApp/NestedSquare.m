//
//  NestedSquare.m
//  TechmasterApp
//
//  Created by student on 11/19/15.
//  Copyright © 2015 Techmaster. All rights reserved.
//

#import "NestedSquare.h"

@interface NestedSquare ()

@end

@implementation NestedSquare

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    [self drawNestedSquares];
    [self performSelector:@selector(rotateAllSquare) withObject:nil afterDelay:2];
}

- (void) drawNestedSquares {
    CGSize mainViewSize = self.view.bounds.size;
    CGFloat margin = 5;
    CGFloat recWidth = mainViewSize.width - margin*2.0;
    CGFloat statusNavigatoinBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height + self.navigationController.navigationBar.bounds.size.height;
    CGPoint center = CGPointMake(mainViewSize.width*0.5, (mainViewSize.height+ statusNavigatoinBarHeight)*0.5);
    for (int i = 0; i<20; i++) {
        UIView* square;
        if (i % 2 == 0){
            square = [self drawSquareByWidth:recWidth andRotate:false atCenter:center];
        } else {
            square = [self drawSquareByWidth:recWidth andRotate:true atCenter:center];
        }
        [self.view addSubview:square];
        recWidth = recWidth* 0.707;
    }
    
}
- (UIView *) drawSquareByWidth: (CGFloat) width
                     andRotate: (BOOL) rotate
                      atCenter: (CGPoint) center {
    UIView *square = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, width)];
    square.center = center;
    square.backgroundColor = rotate ? [UIColor whiteColor] : [UIColor purpleColor];
    square.transform = rotate ? CGAffineTransformMakeRotation(-M_SQRT1_2) : CGAffineTransformIdentity;
    return square;
}
- (void) rotateAllSquare {
    [UIView animateWithDuration:3 animations:^{
        for (int i = 0; i < self.view.subviews.count; i++) {
            ((UIView*)self.view.subviews[i]).transform = CGAffineTransformMakeRotation(-M_LOG10E);
        }
    }];
}

@end

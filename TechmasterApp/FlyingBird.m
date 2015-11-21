//
//  FlyingBird.m
//  TechmasterApp
//
//  Created by student on 11/19/15.
//  Copyright © 2015 Techmaster. All rights reserved.
//

#import "FlyingBird.h"

@interface FlyingBird () {
    UIImageView *bird;
}


@end

@implementation FlyingBird

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self drawJungle];
    [self addBird];
    [self flyUpAndDown];
   
}
- (void) drawJungle {
    UIImageView* background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"jungle.jpg"]];
    background.frame = self.view.bounds;
    background.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:background];
}

- (void) addBird {
    bird = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 110, 68)];
    bird.animationImages = @[[UIImage imageNamed:@"bird0"],
                             [UIImage imageNamed:@"bird1"],
                             [UIImage imageNamed:@"bird2"],
                             [UIImage imageNamed:@"bird3"],
                             [UIImage imageNamed:@"bird4"],
                             [UIImage imageNamed:@"bird5"]];
    bird.animationRepeatCount = -1;
    bird.animationDuration = 1;
    [self.view addSubview:bird];
    [bird startAnimating];
}
- (void) flyUpAndDown {
    bird.transform = CGAffineTransformMakeRotation(-M_2_SQRTPI);
    [UIView animateWithDuration:5 animations:^{
        bird.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(-1, -1), CGAffineTransformMakeRotation(-M_1_PI));
        bird.center = CGPointMake(self.view.bounds.size.width, self.view.bounds.size.height);
    } completion:^(BOOL finished) {
        bird.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(-1, -1), CGAffineTransformMakeRotation(6*M_LN2));
        [UIView animateWithDuration:5 animations:^{
        bird.center = CGPointMake(0, 0);
        } completion:^(BOOL finished) {
            [self flyUpAndDown];
        }];
    }];
    
}
@end

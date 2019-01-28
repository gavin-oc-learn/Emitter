//
//  SecondController.m
//  Emitter
//
//  Created by liu kai on 2018/12/4.
//  Copyright © 2018 liu kai. All rights reserved.
//

#import "SecondController.h"
#import "HeartView.h"
@interface SecondController()
@property (weak, nonatomic) IBOutlet HeartView *heartView;

@end

@implementation SecondController

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)onBeatbuttonTap:(id)sender {
    [self.heartView updateAnimation];
}

@end

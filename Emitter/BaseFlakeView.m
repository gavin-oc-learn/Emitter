//
//  BaseFlakeView.m
//  Emitter
//
//  Created by liu kai on 2018/12/4.
//  Copyright © 2018 liu kai. All rights reserved.
//

#import "BaseFlakeView.h"

@implementation BaseFlakeView

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
}

- (void)setup {
    CAEmitterLayer *snowEmitter = [CAEmitterLayer layer];
    snowEmitter.emitterPosition = CGPointMake(self.frame.size.width / 2.0f, -30);
    snowEmitter.emitterSize = CGSizeMake(self.frame.size.width * 2.0f, 0.0);
    
    snowEmitter.emitterMode = kCAEmitterLayerOutline;
    snowEmitter.emitterShape = kCAEmitterLayerLine;
    
    CAEmitterCell *snowflake = [CAEmitterCell emitterCell];
    
    snowflake.birthRate = 6.0f;
    snowflake.lifetime = 120.0f;
    snowflake.velocity = -10;
    snowflake.velocityRange = 10;
    snowflake.yAcceleration = 2;
    snowflake.emissionRange = 0.5 * M_PI;
    snowflake.spinRange = 0.25 * M_PI;
    snowflake.contents = (__bridge id)[UIImage imageNamed:@"DazFlake"].CGImage;
    snowflake.color = [[UIColor colorWithRed:0.400 green:0.722 blue:0.961 alpha:1.00] CGColor];
    
    {
        snowEmitter.shadowColor = [[UIColor whiteColor] CGColor];
        snowEmitter.shadowOffset  = CGSizeMake(0.0, 1.0);
        snowEmitter.shadowOpacity = 1.0;
        snowEmitter.shadowRadius  = 0.0;
    }
    
    snowEmitter.emitterCells = @[snowflake];
    [self.layer addSublayer:snowEmitter];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

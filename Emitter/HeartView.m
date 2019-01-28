//
//  HeartView.m
//  Emitter
//
//  Created by liu kai on 2018/12/4.
//  Copyright © 2018 liu kai. All rights reserved.
//

#import "HeartView.h"

@interface HeartView ()
@property(strong, nonatomic) CAEmitterLayer *heartsEmitter;

@end

@implementation HeartView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
}

- (void)setup {
    CAEmitterLayer *heartLayer = [CAEmitterLayer layer];
    heartLayer.emitterPosition = CGPointMake(CGRectGetWidth(self.frame) / 2, 15);
    heartLayer.emitterSize = CGSizeMake(CGRectGetWidth(self.frame) * 2, 0.0f);
    heartLayer.emitterShape = kCAEmitterLayerRectangle;
    heartLayer.emitterMode = kCAEmitterLayerVolume;
    heartLayer.renderMode = kCAEmitterLayerAdditive;
//    heartLayer.birthRate = 100;
//    heartLayer.lifetime = 200;
    
    CAEmitterCell *cell = [CAEmitterCell emitterCell];
    cell.name = @"heart";
    cell.emissionLongitude = M_PI_2;
    cell.emissionRange = M_PI * 0.5;
    cell.birthRate = 5;
    cell.lifetime = 10;
//    cell.emissionRange = 0.55 * M_PI;
    cell.velocity = -10;
    cell.velocityRange = 10;
    cell.yAcceleration = 2;
    
    cell.contents = (__bridge id)[UIImage imageNamed:@"DazHeart"].CGImage;
    cell.color = [UIColor colorWithRed:0.5 green:0 blue:0.5 alpha:0.5].CGColor;
    cell.redRange = 0.3;
    cell.blueRange = 0.3;
    cell.alphaSpeed = -0.5 / cell.lifetime;
    
    cell.scale = 0.15;
    cell.scaleSpeed = 0.5;
    cell.spinRange = 2.0f * M_PI;
    
    heartLayer.emitterCells = @[cell];
    [self.layer addSublayer:heartLayer];
    _heartsEmitter = heartLayer;
}

- (void)updateAnimation {
    CABasicAnimation *heartsBurst = [CABasicAnimation animationWithKeyPath:@"emitterCells.heart.birthRate"];
    heartsBurst.fromValue        = [NSNumber numberWithFloat:150.0];
    heartsBurst.toValue            = [NSNumber numberWithFloat: 0.0];
    heartsBurst.duration        = 5.0;
    heartsBurst.timingFunction    = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    [self.heartsEmitter addAnimation:heartsBurst forKey:@"heartsBurst"];
}


@end

//
//  HypnosisView.m
//  Hypnosister
//
//  Created by Alexander Kudryashov on 20.01.2015.
//  Copyright (c) 2015 Alexander Kudryashov. All rights reserved.
//

#import "HypnosisView.h"

@interface HypnosisView ()

@property (strong, nonatomic) UIColor *circleColor;

@end

@implementation HypnosisView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGRect bounds = self.bounds;
    
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2;
    center.y = bounds.origin.y + bounds.size.height / 2;
    
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        [path addArcWithCenter:center radius:currentRadius startAngle:0 endAngle:2 * M_PI clockwise:YES];
    }
    
    path.lineWidth = 10;
    [self.circleColor setStroke];
    [path stroke];

//    CGContextRef currentContext = UIGraphicsGetCurrentContext();
//    CGContextSaveGState(currentContext);
//
//    CGFloat locations[2] = {0.0, 1.0};
//    CGFloat components[8] = {0.0, 1.0, 0.0, 1.0, 1.0, 1.0, 0.0, 1.0};
//    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, components, locations, 2);
//
//    UIBezierPath *myGradientPath = [[UIBezierPath alloc] init];
//    [myGradientPath moveToPoint:CGPointMake(center.x + 160, center.y + 200)];
//    [myGradientPath addLineToPoint:CGPointMake(center.x - 160, center.y + 200)];
//    [myGradientPath addLineToPoint:CGPointMake(center.x, center.y - 270)];
//    [myGradientPath closePath];
//    [myGradientPath addClip];
//
//    CGPoint startPoint = CGPointMake(center.x, center.y - 270);
//    CGPoint endPoint = CGPointMake(center.x, center.y + 160);
//    CGContextDrawLinearGradient(currentContext, gradient, startPoint, endPoint, 0);
//    CGGradientRelease(gradient);
//    CGColorSpaceRelease(colorSpace);
//    CGContextRestoreGState(currentContext);
//
//    CGContextSaveGState(currentContext);
//    CGContextSetShadow(currentContext, CGSizeMake(4, 7), 3);
//    
//    UIImage *logo = [UIImage imageNamed:@"logo.png"];
//    [logo drawInRect:CGRectMake(50, 70, 270, 400)];
//
//    CGContextRestoreGState(currentContext);
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.circleColor = [UIColor lightGrayColor];
    }
    
    return self;
}

- (void)setCircleColor:(UIColor *)circleColor {
    _circleColor = circleColor;
    [self setNeedsDisplay];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@ was touched", self);

    float red = (arc4random() % 100) / 100.0;
    float green = (arc4random() % 100) / 100.0;
    float blue = (arc4random() % 100) / 100.0;

    UIColor *randomColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    self.circleColor = randomColor;
}

@end

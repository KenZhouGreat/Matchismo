//
//  SetGameCardButton.m
//  Matchismo
//
//  Created by Ken Zhou on 13/12/2014.
//  Copyright (c) 2014 Ken Zhou. All rights reserved.
//

#import "SetGameCardButton.h"


@implementation SetGameCardButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setCardFaceFor:(SetGameCard*) card{
    
    [self setAttributedTitle:card.attributedContent forState:UIControlStateNormal];
    [self setBackgroundImage:[self imageWithColor:[UIColor grayColor]] forState:UIControlStateSelected];
    [self setBackgroundImage:[self imageWithColor:CLR_WASH_GREEN] forState:UIControlStateSelected|UIControlStateDisabled];

    
}

- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end

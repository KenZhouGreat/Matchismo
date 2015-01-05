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
    NSString *baseString;
    NSString *patternString;
    //set shape
    
    if (card.shade != SetShadeSolid ) {
        switch (card.shape) {
            case SetShapeCircle:
                baseString = @"○";
                break;
                
            case SetShapeSquare:
                baseString = @"◻︎";
                break;
                
            case SetShapeTriangle:
                baseString = @"△";
                break;
                
            default:
                break;
        }
        
    }
    else{
        switch (card.shape) {
            case SetShapeCircle:
                baseString = @"●";
                break;
                
            case SetShapeSquare:
                baseString = @"■";
                break;
                
            case SetShapeTriangle:
                baseString = @"▲";
                break;
                
            default:
                break;
        }
    }
    
    patternString = baseString;
    //set number
    for (int i = 1; i < card.number; i++) {
        patternString = [patternString stringByAppendingString:baseString];
    }
    
    //set shade
    float shadeAlpha;
    switch (card.shade) {
        case SetShadeShadowed:
            shadeAlpha = 0.2f;
            break;
            
        case SetShadeSolid:
            shadeAlpha = 1.0f;
            break;
            
        default:
            shadeAlpha = 1.0f;
            break;
    }
    
    //set colour
    UIColor *patternColour;
    switch (card.colour) {
        case SetColourBlue:
            patternColour = [UIColor blueColor];
            break;
            
        case SetColourGreen:
            patternColour = [UIColor greenColor];
            break;
            
        case SetColourRed:
            patternColour = [UIColor redColor];
            break;
            
        default:
            break;
    }
    
    //setting the attributes for the nsattributed string which stands for the card face
    NSDictionary *attr = @{NSForegroundColorAttributeName:[patternColour colorWithAlphaComponent:shadeAlpha]};
    
    NSAttributedString *cardContent = [[NSAttributedString alloc] initWithString:patternString attributes:attr];
    
    [self setAttributedTitle:cardContent forState:UIControlStateNormal];

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

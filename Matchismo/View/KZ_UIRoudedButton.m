//
//  KZ_UIRoudedButton.m
//  Matchismo
//
//  Created by Ken Zhou on 2/01/2014.
//  Copyright (c) 2014 Ken Zhou. All rights reserved.
//

#import "KZ_UIRoudedButton.h"

@implementation KZ_UIRoudedButton



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [[self layer] setCornerRadius:5];
        [[self layer] setBorderWidth:3];
        [[self layer] setBorderColor: CLR_SYS_BLUE.CGColor];
        
        [self setTitle:@"" forState:UIControlStateNormal];
     
    }
    return self;
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

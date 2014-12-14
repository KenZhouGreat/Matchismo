//
//  SetCardGame.m
//  Matchismo
//
//  Created by Ken Zhou on 10/12/2014.
//  Copyright (c) 2014 Ken Zhou. All rights reserved.
//

#import "SetCardGame.h"

@implementation SetCardGame

- (void) flipCardAtIndex:(NSUInteger)index{
    //change card status
    Card *card = [self cardAtIndex:index];
    if (card) {
        
    }
    
    
    //matching
    //score
    //verbose
    
    card.faceUp = !card.faceUp;
    
}

@end

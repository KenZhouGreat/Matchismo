//
//  CardMatchingGame_Protected.m
//  Matchismo
//
//  Created by Ken Zhou on 8/01/2015.
//  Copyright (c) 2015 Ken Zhou. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame ()

@property (readwrite, nonatomic) int score;
@property (strong, nonatomic) NSMutableArray *cards; //of card
@property (readwrite, nonatomic, getter = isGameStarted) BOOL gameStarted;
@property (nonatomic, readwrite) NSAttributedString *verbose;


@end

//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Ken Zhou on 16/01/2014.
//  Copyright (c) 2014 Ken Zhou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"

typedef enum {
    kTwoCardMode,
    kThreeCardMode
}gameModeType;

@interface CardMatchingGame : NSObject

//designated initializer
- (id)initWithCardCount:(NSUInteger)count
              usingDeck:(Deck *) deck;

- (void)flipCardAtIndex: (NSUInteger)index;

-(Card *)cardAtIndex: (NSUInteger)index;


@property (nonatomic, readonly) int score;
@property (nonatomic) gameModeType gameMode;
@property (nonatomic, getter = isGameStarted, readonly) BOOL gameStarted;
@property (nonatomic, readonly) NSAttributedString *verbose;

@end

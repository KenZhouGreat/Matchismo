//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Ken Zhou on 16/01/2014.
//  Copyright (c) 2014 Ken Zhou. All rights reserved.
//

#import "CardMatchingGame.h"
@interface CardMatchingGame()
@property (readwrite, nonatomic) int score;
@property (strong, nonatomic) NSMutableArray *cards; //of card
@property (readwrite, nonatomic, getter = isGameStarted) BOOL gameStarted;

@end



@implementation CardMatchingGame
-(NSMutableArray *)cards{
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }    
    return _cards;
}

- (gameModeType)gameMode{
    if (!_gameMode){
        _gameMode = kTwoCardMode;
    }
    return _gameMode;
}

- (BOOL)isGameStarted{
    if (!_gameStarted) {
        _gameStarted = NO;
    }
    return _gameStarted;
}

#define MATCH_BONUS 4
#define MISMATCH_PENALTY 2
#define FLIP_COST 1

- (void) flipCardAtIndex:(NSUInteger)index{
    self.gameStarted = YES;
    Card *card = [self cardAtIndex:index];
    if (!card.faceUp) {
        if (card && !card.isUnplayable) {
            NSMutableArray *validOtherCards = [[NSMutableArray alloc] init];
            for (Card *otherCard in self.cards) {
                if (otherCard.isFaceUp && !otherCard.isUnplayable) {
                    //construct two different otherCards array based on the game mode
                    [validOtherCards addObject:otherCard];
                    if ([validOtherCards count] < self.gameMode + 1) {
                        continue;
                    }
                    else{
                        break;
                    }
                }
            }
            
            if ([validOtherCards count] == self.gameMode + 1) {
                int matchScore = [card match:validOtherCards];
                if (matchScore) {
                    card.unplayable = YES;
                    for (Card *c in validOtherCards) {
                        c.unplayable = YES;
                    }
                    self.score += matchScore * MATCH_BONUS;
                }
                else{
                    for (Card *c in validOtherCards) {
                        c.faceUp = NO;
                    }
                    self.score -= MISMATCH_PENALTY;
                }
            }
         
            
     
            
            self.score -= FLIP_COST;
        }
        
    }
    card.faceUp = !card.isFaceUp;
}

- (Card *)cardAtIndex:(NSUInteger)index{
    return (index < [self.cards count]) ?  self.cards[index] : nil;
}

- (id)initWithCardCount:(NSUInteger)count
              usingDeck:(Deck *) deck{
    self = [super init];
    if (self) {
        for (int i =0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            }
            else{
                self = nil;
                break;
            }
            
            
        }
    }
    return self;
}


@end

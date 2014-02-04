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
@end



@implementation CardMatchingGame
-(NSMutableArray *)cards{
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }    
    return _cards;
}

#define MATCH_BONUS 4
#define MISMATCH_PENALTY 2
#define FLIP_COST 1

- (void) flipCardAtIndex:(NSUInteger)index{
    Card *card = [self cardAtIndex:index];
    if (!card.faceUp) {
        if (card && !card.isUnplayable) {
            for (Card *otherCard in self.cards) {
                if (otherCard.isFaceUp && !otherCard.isUnplayable) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        card.unplayable = YES;
                        otherCard.unplayable = YES;
                        self.score += matchScore * MATCH_BONUS;
                    }
                    else{
                        otherCard.faceUp = NO;
                        self.score -= MISMATCH_PENALTY;
                    }
                    break;
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

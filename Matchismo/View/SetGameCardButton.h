//
//  SetGameCardButton.h
//  Matchismo
//
//  Created by Ken Zhou on 13/12/2014.
//  Copyright (c) 2014 Ken Zhou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KZ_UIRoudedButton.h"
#import "SetGameCard.h"

@interface SetGameCardButton : KZ_UIRoudedButton

- (void)setCardFaceFor:(SetGameCard*)card;

@end

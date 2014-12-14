//
//  ViewController.h
//  Matchismo
//
//  Created by Ken Zhou on 2/01/2014.
//  Copyright (c) 2014 Ken Zhou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardMatchingGame.h"

@interface CardGameViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>


@end


#ifdef CardGameViewController_protected

@interface CardGameViewController()

@property (strong, nonatomic) CardMatchingGame *game;

@end

#endif

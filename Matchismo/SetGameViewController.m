//
//  SetGameViewController.m
//  Matchismo
//
//  Created by Ken Zhou on 11/12/2014.
//  Copyright (c) 2014 Ken Zhou. All rights reserved.
//
#define CardGameViewController_protected

#define CARD_COUNT 24

#import "SetGameViewController.h"
#import "SetGameCard.h"
#import "SetCardGame.h"
#import "SetGameCardDeck.h"
#import "KZ_UIRoudedButton.h"
#import "SetGameCardButton.h"

@interface SetGameViewController ()

@property (strong, nonatomic) IBOutlet UICollectionView *cardCollectionView;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *verboseLabel;


@end

@implementation SetGameViewController

@synthesize cardCollectionView = _cardCollectionView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

@synthesize game = _game;
#pragma - getter setters
- (CardMatchingGame *)game{
    if (!_game) {
        _game = [[SetCardGame alloc] initWithCardCount:CARD_COUNT usingDeck:[[SetGameCardDeck alloc] init]];
    }
    return _game;
}


#pragma - view controller life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma - collection view delegate method

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return CARD_COUNT;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cardCell" forIndexPath:indexPath];

    if ([cell isKindOfClass:[UICollectionViewCell class]]) {
        //display logic for the set game card
        SetGameCard *card = (SetGameCard *)[self.game cardAtIndex:indexPath.row];
        
        for (SetGameCardButton *cardButton in [cell.contentView subviews]) {
            if ([cardButton isKindOfClass:[SetGameCardButton class]]) {
                [cardButton setCardFaceFor:card];
                [cardButton setTag:indexPath.row];
                [cardButton addTarget:self action:@selector(flipCard:) forControlEvents:UIControlEventTouchUpInside];
            }
        }
        
    }
    
    return cell;
}

#pragma UI
- (void)updateUI{
    //1. update the card to be flipped/unflipped
    for (int i = 0; i < [self.cardCollectionView numberOfItemsInSection:0]; i++) {
        UICollectionViewCell *cell = [self.cardCollectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        Card *card = [self.game cardAtIndex:i];
        for (UIButton *b in [cell.contentView subviews]) {
            
            if ([b isKindOfClass:[UIButton class]]) {
                b.selected = card.faceUp;
                //2. playable/unplayable
                [b setEnabled:!card.unplayable];
                if (card.unplayable) {
                    [b setAlpha:0.5];
                }
            }
        }
    }
    //3. score
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    
    //verbose
    self.verboseLabel.text = self.game.verbose;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

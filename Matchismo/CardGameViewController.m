//
//  ViewController.m
//  Matchismo
//
//  Created by Ken Zhou on 2/01/2014.
//  Copyright (c) 2014 Ken Zhou. All rights reserved.
//

#define CardGameViewController_protected

#import "CardGameViewController.h"
#import "KZ_UIRoudedButton.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"
#import "CardMatchingGame.h"
#import "GameResult.h"


@interface CardGameViewController ()

@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;


//@property (strong, nonatomic) IBOutlet KZ_UIRoudedButton *card;

@property (strong, nonatomic) IBOutlet UICollectionView *cardCollectionView;
@property (strong, nonatomic) IBOutlet UILabel *verboseLabel;


@property (strong, nonatomic) IBOutlet UIButton *dealButton;

@property (strong, nonatomic) GameResult *gameResult;
@property (strong, nonatomic) IBOutlet UISegmentedControl *gameModeSwtich;

@end

@implementation CardGameViewController

static CGFloat CARD_BUTTON_WIDTH = 45;
static CGFloat CARD_BUTTON_HEIGH = 60;

- (GameResult *)gameResult{
    if (!_gameResult) {
        _gameResult = [[GameResult alloc] init];
    }
    return _gameResult;
}

- (CardMatchingGame *)game{
    if (!_game) {
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardCollectionView numberOfItemsInSection:0] usingDeck:[[PlayingCardDeck alloc] init]];
    }
    return _game;
}

- (IBAction)dealGame:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Are you sure to finish?"
                                                    message:@"By clicking 'OK' you will start a new game."
                                                   delegate:self
                                          cancelButtonTitle:nil
                                          otherButtonTitles:@"OK",@"Cancel",nil];
    [alert show];
   
}

- (IBAction)changeGameMode:(UISegmentedControl *)sender {
    self.game.gameMode = sender.selectedSegmentIndex;
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    // the user clicked OK
    if (buttonIndex == 0) {
        self.game = nil;
        self.gameResult = nil;
        [self.cardCollectionView reloadData];
        [self updateUI];
    }
}

- (IBAction)flipCard:(id)sender {
    
    UIButton *btn= (UIButton *)sender;
    //model
    if ([btn isKindOfClass:[UIButton class]]) {
        [self.game flipCardAtIndex:btn.tag];
    }
    self.gameResult.score = self.game.score;
    [self updateUI];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    
	// Do any additional setup after loading the view, typically from a nib.

    
    [[self cardCollectionView] setDelegate:self];
    [[self cardCollectionView] setDataSource:self];
    
    
    
    
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellReuseIdentifier = @"cardCell";
    UICollectionViewCell *cardCell = [collectionView dequeueReusableCellWithReuseIdentifier:cellReuseIdentifier forIndexPath:indexPath];
    [[[cardCell contentView] subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    CGPoint viewCenter = [[cardCell contentView] center];

    
    CGRect newCardButtonFrame = CGRectMake(	viewCenter.x - CARD_BUTTON_WIDTH/2, viewCenter.y - CARD_BUTTON_HEIGH/2, CARD_BUTTON_WIDTH, CARD_BUTTON_HEIGH);
    
    KZ_UIRoudedButton *newCardButton = [[KZ_UIRoudedButton alloc] initWithFrame:newCardButtonFrame];
    [newCardButton setTitleColor: CLR_SYS_BLUE forState:UIControlStateNormal];
    
    Card *newCard = [self.game cardAtIndex:indexPath.row];
    [newCardButton setTitle:newCard.contents  forState:UIControlStateSelected];
    [newCardButton setTitle:newCard.contents  forState:UIControlStateSelected | UIControlStateDisabled];
    [newCardButton setTag:indexPath.row];
    [newCardButton addTarget:self action:@selector(flipCard:) forControlEvents:UIControlEventTouchUpInside];
    [[cardCell contentView] addSubview:newCardButton];
    
    return cardCell;
}

-(int)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 16;
}


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
    //game mode
    self.gameModeSwtich.selectedSegmentIndex = self.game.gameMode;    
    self.gameModeSwtich.enabled = !self.game.isGameStarted;
    //verbose
    self.verboseLabel.attributedText = self.game.verbose;
}

@end

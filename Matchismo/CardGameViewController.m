//
//  ViewController.m
//  Matchismo
//
//  Created by Ken Zhou on 2/01/2014.
//  Copyright (c) 2014 Ken Zhou. All rights reserved.
//

#import "CardGameViewController.h"
#import "KZ_UIRoudedButton.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"


@interface CardGameViewController ()


@property (strong, nonatomic) IBOutlet KZ_UIRoudedButton *card;

@property (strong, nonatomic) Deck *cardDeck;

@property (strong, nonatomic) IBOutlet UICollectionView *cardCollectionView;

@end

@implementation CardGameViewController

static CGFloat CARD_BUTTON_WIDTH = 60;
static CGFloat CARD_BUTTON_HEIGH = 82;

- (Deck *)cardDeck{
    if (!_cardDeck) {
        _cardDeck = [[PlayingCardDeck alloc] init];
    }
    return _cardDeck;
}

- (IBAction)flipCard:(id)sender {
    [sender setSelected:![sender isSelected]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setCardDeck:[[PlayingCardDeck alloc] init]];
    
    
	// Do any additional setup after loading the view, typically from a nib.

    
    [[self cardCollectionView] setDelegate:self];
    [[self cardCollectionView] setDataSource:self];
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellReuseIdentifier = @"cardCell";
    UICollectionViewCell *cardCell = [collectionView dequeueReusableCellWithReuseIdentifier:cellReuseIdentifier forIndexPath:indexPath];
    
    CGPoint viewCenter = [[cardCell contentView] center];
    CGRect newCardButtonFrame = CGRectMake(	viewCenter.x - CARD_BUTTON_WIDTH/2, viewCenter.y - CARD_BUTTON_HEIGH/2, CARD_BUTTON_WIDTH, CARD_BUTTON_HEIGH);
    
    KZ_UIRoudedButton *newCardButton = [[KZ_UIRoudedButton alloc] initWithFrame:newCardButtonFrame];
    [newCardButton setTitleColor: CLR_SYS_BLUE forState:UIControlStateNormal];
    
    Card *newCard = [[self cardDeck] drawRandomCard];
    [newCardButton setTitle:newCard.contents  forState:UIControlStateSelected];
    
    [newCardButton addTarget:self action:@selector(flipCard:) forControlEvents:UIControlEventTouchUpInside];
    [self setCard:newCardButton];
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


@end

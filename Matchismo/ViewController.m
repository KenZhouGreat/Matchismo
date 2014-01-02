//
//  ViewController.m
//  Matchismo
//
//  Created by Ken Zhou on 2/01/2014.
//  Copyright (c) 2014 Ken Zhou. All rights reserved.
//

#import "ViewController.h"
#import "KZ_UIRoudedButton.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIButton *card;

@property (strong, nonatomic) IBOutlet KZ_UIRoudedButton *card2;

@end

@implementation ViewController

static CGFloat CARD_BUTTON_WIDTH = 80;
static CGFloat CARD_BUTTON_HEIGH = 100;

- (IBAction)flipCard:(id)sender {
    [[self card] setTitle:@"∆" forState:UIControlStateSelected];
    NSLog(@"att norm:%@", [sender attributedTitleForState:UIControlStateNormal]);
    NSLog(@"att select:%@", [sender attributedTitleForState:UIControlStateSelected]);
    
  
    NSLog(@"t norm:%@", [sender titleForState:UIControlStateNormal]);
    NSLog(@"t select:%@", [sender titleForState:UIControlStateSelected]);
    [sender setSelected:![sender isSelected]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    CGPoint viewCenter = [[self view] center];
    CGRect newCardButtonFrame = CGRectMake(	viewCenter.x - CARD_BUTTON_WIDTH/2, viewCenter.y - CARD_BUTTON_HEIGH/2, CARD_BUTTON_WIDTH, CARD_BUTTON_HEIGH);
    
    KZ_UIRoudedButton *newCardButton = [[KZ_UIRoudedButton alloc] initWithFrame:newCardButtonFrame];
    [newCardButton setTitle:@"" forState:UIControlStateNormal];
    [newCardButton setTitle:@"normal" forState:UIControlStateSelected];
    [newCardButton setTitleColor:[[self view] tintColor] forState:UIControlStateNormal];
    NSLog(@"%@", [newCardButton titleForState:UIControlStateNormal]);
    NSLog(@"%@", [newCardButton titleForState:UIControlStateSelected]);
    
    [newCardButton addTarget:self action:@selector(flipCard:) forControlEvents:UIControlEventTouchUpInside];
    [self setCard2:newCardButton];

    
    CGRect newCardButtonFrame2 = CGRectMake(	viewCenter.x - CARD_BUTTON_WIDTH/2, viewCenter.y - CARD_BUTTON_HEIGH/2 + 120, CARD_BUTTON_WIDTH, CARD_BUTTON_HEIGH);
    
    UIButton *button = [[UIButton alloc] initWithFrame:newCardButtonFrame2];
    [button setTitle:@"" forState:UIControlStateNormal];
    [button setTitle:@"normal" forState:UIControlStateSelected];
        [button addTarget:self action:@selector(flipCard:) forControlEvents:UIControlEventTouchUpInside];
    [[self view] addSubview:button];
    
    [[self view] addSubview:newCardButton];
    
//
//    [newCardButton setUserInteractionEnabled:YES];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

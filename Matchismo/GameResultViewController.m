//
//  GameResultViewController.m
//  Matchismo
//
//  Created by Ken Zhou on 28/01/2014.
//  Copyright (c) 2014 Ken Zhou. All rights reserved.
//

#import "GameResultViewController.h"
#import "GameResult.h"

@interface GameResultViewController ()

@property (strong, nonatomic) IBOutlet UITextView *display;



@end

@implementation GameResultViewController

- (void)updateUI{
    NSString *displayString = @"";
    for (GameResult *result in [GameResult allGameResults]) {
        displayString = [displayString stringByAppendingFormat:@"Score: %d (%@, %0gs)\n", result.score, result.end, round(result.duration)];
    }
    self.display.text = displayString;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self updateUI];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

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

- (IBAction)sortByScoreAction:(id)sender {
    
}

- (IBAction)sortByDateAction:(id)sender {
    
    
}

- (IBAction)sortByDurationAction:(id)sender {
    
}




@end

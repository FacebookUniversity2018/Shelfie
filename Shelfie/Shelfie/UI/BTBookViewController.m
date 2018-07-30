//
//  BTBookViewController.m
//  Shelfie
//
//  Created by Claudia Haddad on 7/26/18.
//  Copyright © 2018 BookTrader. All rights reserved.
//

#import "BTBookViewController.h"
#import "SWRevealViewController.h"

@interface BTBookViewController ()
@property (strong, nonatomic) IBOutlet UIBarButtonItem *barButton;
@property (strong, nonatomic) IBOutlet UIImageView *bookCover;
@property (strong, nonatomic) IBOutlet UILabel *authorLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) IBOutlet UIButton *tradeButton;
@property (strong, nonatomic) IBOutlet UIButton *giftButton;
@property (strong, nonatomic) IBOutlet UIButton *sellButton;
@property (strong, nonatomic) IBOutlet UIButton *currentLocation;


@property (nonatomic, assign) BOOL sell;
@property (nonatomic, assign) BOOL trade;
@property (nonatomic, assign) BOOL gift;
@property (nonatomic, assign) BOOL location;
@property (nonatomic, assign) BOOL own;

@end

@implementation BTBookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SWRevealViewController *revealViewController = self.revealViewController;
    
    if (revealViewController)
    {
        [self.barButton setTarget: self.revealViewController];
        [self.barButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
   
}
}


- (IBAction)useCurrentLocation:(id)sender {

    if (!self.location) {
        self.location = true;
        [self.currentLocation setImage:[UIImage imageNamed:@"iconmonstr-circle-1-240.png"] forState:UIControlStateNormal];
    } else if (self.location) {
        self.location = false;
        [self.currentLocation setImage:[UIImage imageNamed:@"iconmonstr-circle-thin-32.png"] forState:UIControlStateNormal];
        //set book location with defaults
    }
}
- (IBAction)sellClicked:(id)sender {

    if (!self.sell) {
        self.sell = true;
        [self.sellButton setImage:[UIImage imageNamed:@"iconmonstr-circle-1-240.png"] forState:UIControlStateNormal];
    } else if (self.sell) {
        self.sell = false;
        [self.sellButton setImage:[UIImage imageNamed:@"iconmonstr-circle-thin-32.png"] forState:UIControlStateNormal];
    }
}
- (IBAction)tradeClicked:(id)sender {

    if (!self.trade) {
        self.trade = true;
        [self.tradeButton setImage:[UIImage imageNamed:@"iconmonstr-circle-1-240.png"] forState:UIControlStateNormal];
    } else if (self.trade) {
        self.trade = false;
        [self.tradeButton setImage:[UIImage imageNamed:@"iconmonstr-circle-thin-32.png"] forState:UIControlStateNormal];
    }
}
- (IBAction)giftClicked:(id)sender {
    if (!self.gift) {
        self.gift = true;
        [self.giftButton setImage:[UIImage imageNamed:@"iconmonstr-circle-1-240.png"] forState:UIControlStateNormal];
    } else if (self.gift) {
        self.gift = false;
        [self.giftButton setImage:[UIImage imageNamed:@"iconmonstr-circle-thin-32.png"] forState:UIControlStateNormal];
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

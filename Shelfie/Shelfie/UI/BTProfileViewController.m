//
//  BTProfileViewController.m
//  Shelfie
//
//  Created by Claudia Haddad on 7/26/18.
//  Copyright © 2018 BookTrader. All rights reserved.
//

#import "BTProfileViewController.h"
#import "SWRevealViewController.h"

@interface BTProfileViewController ()
@property (strong, nonatomic) IBOutlet UIBarButtonItem *barButton;

@end

@implementation BTProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"PROFILE: %@", [[BTUserManager shared] getCurrentUser]);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

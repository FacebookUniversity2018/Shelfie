//
//  BTUserManager.m
//  Shelfie
//
//  Created by Chaliana Rolon on 7/31/18.
//  Copyright © 2018 BookTrader. All rights reserved.
//

#import "BTUserManager.h"
#import <Parse/Parse.h>
#import "BTLoginViewController.h"

@interface BTUserManager()

@property (strong, nonatomic) BTUser *currentUser;

@end

@implementation BTUserManager

+ (instancetype) shared {
    static BTUserManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] init];
    });
    return sharedManager;
}

- (void) initUser: (BTLoginViewController *) loginController {
    // Initiate User (ONLY WORKS IF USER EXISTS ON PARSE)
    [[self fetchUserQueryFromParse] findObjectsInBackgroundWithBlock:^(NSArray *user, NSError *error) {
        if (user.count == 1) {
            self.currentUser = (BTUser *) user[0];
            [loginController performSegueWithIdentifier:@"loginToHome" sender:loginController];
        }
    }];
}

- (BTUser *) getCurrentUser {
    return  self.currentUser;
}

- (void) FBUserExists: (FBUser *)user loginController: (BTLoginViewController *) loginVC {
    // fetch data asynchronously
    [[self fetchUserQueryFromParse] findObjectsInBackgroundWithBlock:^(NSArray *users, NSError *error) {
        if (users != nil) {
            // do something with the array of object returned by the call
            NSLog(@"Successfully retrieved user if any %@", users);
            if(users.count == 0) {
                // Add User to parse
                [BTPostManager addUserToDatabase: user.userId withName: user.name withProfilePicture: user.picture withBooks: [NSMutableArray new] withWantBooks: [NSMutableArray new] withSellBooks: [NSMutableArray new] withTradeBooks: [NSMutableArray new] withCompletion:^(BOOL succeeded, NSError * _Nullable error) {
                    if (succeeded) {
                        NSLog(@"User added to parse");
                        self.currentUser = [BTUser new];
                        self.currentUser.name = user.name;
                        self.currentUser.picture = user.picture;
                        self.currentUser.booksHave = [NSMutableArray new];
                        self.currentUser.booksTrade = [NSMutableArray new];
                        self.currentUser.booksSell = [NSMutableArray new];
                        self.currentUser.booksWant = [NSMutableArray new];
                        [loginVC performSegueWithIdentifier:@"loginToHome" sender:loginVC];
                    }
                }];
            } else {
                [self initUser:loginVC];
            }
        } else {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

- (PFQuery *) fetchUserQueryFromParse {
    PFQuery *query = [PFQuery queryWithClassName:@"User"];
    [query includeKey:@"userId"];
    [query whereKey:@"userId" containsString:[FBSDKAccessToken currentAccessToken].userID];
    
    return query;
    
}

- (void)addToBooksHave:(NSString *)bookISBN {
    [self.currentUser addObject:bookISBN forKey:@"booksHave"];
    [self.currentUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        if (succeeded) {
            NSLog(@"updated!");
        } else {
            NSLog(@"%@", error);
        }
    }];
}

- (void)removeFromBooksHave:(NSString *)bookISBN {
    [self.currentUser removeObject:bookISBN forKey:@"booksHave"];
    [self.currentUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        if (succeeded) {
            NSLog(@"updated!");
        } else {
            NSLog(@"%@", error);
        }
    }];
}

@end

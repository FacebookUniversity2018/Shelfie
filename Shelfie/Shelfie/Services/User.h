//
//  User.h
//  Shelfie
//
//  Created by Chaliana Rolon on 7/27/18.
//  Copyright © 2018 BookTrader. All rights reserved.
//

#import "JSONModel.h"

@interface User : JSONModel

// USER PROPERTIES
@property (nonatomic) NSString *userId;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *profilePicture;
@property (nonatomic) NSMutableArray *booksHave;
@property (nonatomic) NSMutableArray *booksWant;
@property (nonatomic) NSMutableArray *booksSell;
@property (nonatomic) NSMutableArray *booksTrade;

// USER MANAGER METHODS
- (void) addToBooksHave;
- (void) addToBooksWant;
- (void) removeFromBooksHave;
- (void) removeFromBooksWant;

@end

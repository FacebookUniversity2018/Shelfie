//
//  BTGetManager.h
//  Shelfie
//
//  Created by Connor Clancy on 7/31/18.
//  Copyright © 2018 BookTrader. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BTBook.h"

@interface BTGetManager : NSObject
+ (instancetype) shared;
- (void)fetchUsersBooksWithUserId:(NSString *)userId completion:(void(^)(NSArray *books, NSError *error))completion;
- (void)fetchBooksWithCompletion:(void(^)(NSArray *books, NSError *error))completion;
- (void)fetchBooksHaveWithCompletion:(NSArray *)pointerArray completion:(void(^)(BTBook *book, NSError *error))completion;
@end

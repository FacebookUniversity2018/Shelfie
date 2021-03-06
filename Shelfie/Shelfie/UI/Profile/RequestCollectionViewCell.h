//
//  RequestCollectionViewCell.h
//  Shelfie
//
//  Created by Claudia Haddad on 8/6/18.
//  Copyright © 2018 BookTrader. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BTBook.h"
#import "UIImageView+AFNetworking.h"

@interface RequestCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *requestBook;
@property (strong, nonatomic) BTBook *book;

-(void) setContents: (NSString *) coverURL;
@end

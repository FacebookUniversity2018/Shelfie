//
//  RequestCollectionViewCell.m
//  Shelfie
//
//  Created by Claudia Haddad on 8/6/18.
//  Copyright © 2018 BookTrader. All rights reserved.
//

#import "RequestCollectionViewCell.h"

@implementation RequestCollectionViewCell

- (void)setContents {
    
    [self.requestBook setImageWithURL:[NSURL URLWithString:self.book.coverURL]];
    
}
@end

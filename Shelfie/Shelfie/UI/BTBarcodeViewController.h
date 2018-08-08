//
//  BarcodeViewController.h
//  Shelfie
//
//  Created by Connor Clancy on 7/30/18.
//  Copyright © 2018 BookTrader. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BTRevealHeadViewController.h"

@protocol BarcodeViewControllerDelegate
-(void)makeBook:(NSDictionary *)book;
@end

@interface BTBarcodeViewController : BTRevealHeadViewController
@property (nonatomic, weak) id<BarcodeViewControllerDelegate> delegate;
@end

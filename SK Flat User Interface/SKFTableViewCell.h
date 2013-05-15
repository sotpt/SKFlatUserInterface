//
//  BFTableViewCell.h
//  barefoot
//
//  Created by Stefan Kreminski on 30.12.12.
//  Copyright (c) 2012 Stefan Kreminski. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SKFTableViewCell : UITableViewCell
@property (strong, nonatomic) UIColor *highlightedBackgroundColor;
@property (strong, nonatomic) UIColor *cellSeparatorColor;
@property (assign, nonatomic) BOOL drawSeparator;
- (void)configureCell;
- (void)clearContent;
@end

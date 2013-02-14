//
//  BFRoundedCornersImageView.h
//  barefoot
//
//  Created by Stefan Kreminski on 30.12.12.
//  Copyright (c) 2012 Stefan Kreminski. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SKFRoundedCornersImageView : UIImageView
@property (assign, nonatomic) CGFloat cornerRadius;
@property (assign, nonatomic) CGFloat borderWidth;
@property (strong, nonatomic) UIColor *borderColor;
@property (strong, nonatomic) UIColor *highlightedBorderColor;
@end

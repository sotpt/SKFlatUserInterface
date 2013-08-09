//
//  BFTableViewCell.m
//  barefoot
//
//  Created by Stefan Kreminski on 30.12.12.
//  Copyright (c) 2012 Stefan Kreminski. All rights reserved.
//

#import "SKFTableViewCell.h"
#import "SKFGeometryAdditions.h"
#import "SKFHelperBlocks.h"
#import "SKFUserInterface.h"
#import "SKFRoundedCornersImageView.h"
#import "SKFRoundedCornersLabel.h"

@interface SKFTableViewCell()
@end

@implementation SKFTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self configureCell];
        self.selectionStyle = UITableViewCellSelectionStyleBlue;
        if (nil == self.selectedBackgroundView)
        {
            self.selectedBackgroundView = [[UIView alloc] init];
        }
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleBlue;

    self.selectedBackgroundView = [[UIView alloc] init];
    self.selectedBackgroundView.backgroundColor = self.highlightedBackgroundColor;

    [self configureCell];

}

- (void)setHighlightedBackgroundColor:(UIColor *)highlightedBackgroundColor
{
    _highlightedBackgroundColor = self.highlightedBackgroundColor;
    self.selectedBackgroundView.backgroundColor = highlightedBackgroundColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

- (void)drawSeparatorLine
{
    if ([self.cellSeparatorColor isEqual:[UIColor clearColor]])
    {
        return;
    }
    
    CGFloat lineWidth = 1.0f;
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGPathRef path = [UIBezierPath bezierPathWithRect:CGRectMake(0, CGRectGetHeight(self.bounds) - lineWidth, CGRectGetWidth(self.bounds), lineWidth)].CGPath;
    
    CGContextAddPath(context, path);
    
    CGContextSetFillColorWithColor(context, self.cellSeparatorColor.CGColor);
    CGContextFillPath(context);

}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    if (self.drawSeparator)
    {
        [self drawSeparatorLine];
    }
}

- (void)configureCell
{
    // only used by subclasses
}

- (void)clearContent
{
    // only used by subclasses
}
@end

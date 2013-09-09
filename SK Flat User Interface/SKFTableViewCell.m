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
@property (nonatomic, strong, readwrite) UIView *seperatorView;
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
        
        [self setupSeparatorView];
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
    [self setupSeparatorView];

}

- (void)setupSeparatorView
{
    self.seperatorView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.frame) - 1.0f, CGRectGetWidth(self.frame), 1.0f)];
    self.seperatorView.backgroundColor = [UIColor greenColor];
    [self addSubview:self.seperatorView];
}

- (void)setHighlightedBackgroundColor:(UIColor *)highlightedBackgroundColor
{
    _highlightedBackgroundColor = self.highlightedBackgroundColor;
    self.selectedBackgroundView.backgroundColor = highlightedBackgroundColor;
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    [super setHighlighted:highlighted animated:animated];
    [self bringSubviewToFront:self.seperatorView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    [self bringSubviewToFront:self.seperatorView];
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

- (void)setDrawSeparator:(BOOL)drawSeparator
{
    _drawSeparator = drawSeparator;
    self.seperatorView.hidden = !drawSeparator;
}

- (void)setCellSeparatorColor:(UIColor *)cellSeparatorColor
{
    _cellSeparatorColor = cellSeparatorColor;
    self.seperatorView.backgroundColor = cellSeparatorColor;
}
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
//    if (self.drawSeparator)
//    {
//        [self drawSeparatorLine];
//    }
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

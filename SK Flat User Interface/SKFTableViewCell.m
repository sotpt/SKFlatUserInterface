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

@implementation SKFTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self configureCell];
        [self configureCellForCustomDrawing];
    }
    return self;
}

- (void)awakeFromNib
{
    [self configureCell];
    [self configureCellForCustomDrawing];
}

- (void)configureCellForCustomDrawing
{
    for (id subview in self.contentView.subviews)
    {
        if ([subview isKindOfClass:[UIImageView class]])
        {
            [(UIImageView *)subview setHidden:YES];
        }
        if ([subview isKindOfClass:[UILabel class]])
        {
            [(UILabel *)subview setHidden:YES];
        }
    }
    
    [self setNeedsDisplay];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    [self setNeedsDisplay];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    [self setNeedsDisplay];
}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    [super setHighlighted:highlighted animated:animated];
    [self setNeedsDisplay];
}

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    [self setNeedsDisplay];
}

- (void)drawLabel:(UILabel *)label
{
    if (! isNilNullOrEmpty(label.text))
    {
        CGRect labelFrame = [self convertRect:label.frame fromView:self.contentView];
       labelFrame = CGRectMoveY(labelFrame, 1.0f);
        NSString *labelText = label.text;
//        CGSize labelSize = [labelText sizeWithFont:label.font
//                                 constrainedToSize:labelFrame.size
//                                     lineBreakMode:label.lineBreakMode];
    if (self.highlighted || self.selected)
    {
        [label.highlightedTextColor set];
    }
    else
    {
        [label.textColor set];
    }
    // labelFrame = CGRectMoveY(labelFrame, floorf((CGRectGetHeight(labelFrame) - labelSize.height / 2.0f)));
    
        [labelText drawInRect:labelFrame
                     withFont:label.font
                lineBreakMode:label.lineBreakMode
                    alignment:label.textAlignment];
    }
}

- (void)drawRoundedCornersLabel:(SKFRoundedCornersLabel *)label
{
    if (! isNilNullOrEmpty(label.text))
    {
        CGRect labelFrame = [self convertRect:label.frame fromView:self.contentView];
    //labelFrame = CGRectMoveY(labelFrame, 1.0f);
        NSString *labelText = label.text;
//        CGSize labelSize = [labelText sizeWithFont:label.font
//                                 constrainedToSize:labelFrame.size
//                                     lineBreakMode:label.lineBreakMode];
               // labelFrame = CGRectMoveY(labelFrame, floorf((CGRectGetHeight(labelFrame) - labelSize.height / 2.0f)));
    
        [self fillRectWithCurrentBackgroundColor:labelFrame];
    
        if (label.cornerRadius > 0)
        {
            CGContextRef context = UIGraphicsGetCurrentContext();
            
            CGContextSaveGState(context);
            CGPathRef clippingPath = [UIBezierPath bezierPathWithRoundedRect:labelFrame cornerRadius:label.cornerRadius].CGPath;
            CGContextAddPath(context, clippingPath);
            CGContextClip(context);
            UIColor *backgroundColor;
            if (self.highlighted)
            {
                backgroundColor = label.highlightedBackgroundColor;
            }
            else
            {
                backgroundColor = label.backgroundColor;
            }
            
            if (! [backgroundColor isEqual:[UIColor clearColor]])
            {
                [backgroundColor set];
                CGContextFillRect(context, labelFrame);
            }
            CGContextSaveGState(context);

            if (self.highlighted || self.selected)
            {
                [label.highlightedTextColor set];
            }
            else
            {
                [label.textColor set];
            }
        
            labelFrame.origin.y = labelFrame.origin.y + ((labelFrame.size.height - label.font.pointSize) / 3);

            [labelText drawInRect:labelFrame
                         withFont:label.font
                    lineBreakMode:label.lineBreakMode
                        alignment:label.textAlignment];

        
            CGContextRestoreGState(context);

            CGContextRestoreGState(context);
            
            CGContextSetLineWidth(context, label.borderWidth);
            CGContextAddPath(context, clippingPath);
            
            UIColor *borderColor;
			if (self.highlighted || self.selected)
            {
                borderColor = label.highlightedBorderColor;
            }
            else
            {
                borderColor = label.borderColor;
            }
            
            CGContextSetStrokeColorWithColor(context, borderColor.CGColor);
            CGContextStrokePath(context);
        }
        else
        {
			if (self.highlighted || self.selected)
            {
                [label.highlightedTextColor set];
            }
            else
            {
                [label.textColor set];
            }

            [labelText drawInRect:labelFrame
                         withFont:label.font
                    lineBreakMode:label.lineBreakMode
                        alignment:label.textAlignment];
        }
    }
}


- (void)drawImageView:(UIImageView *)imageView
{
    CGRect imageViewFrame = [self convertRect:imageView.frame fromView:self.contentView];
//    imageViewFrame = CGRectMoveY(imageViewFrame, -0.5);
    
    if (nil != imageView.image)
    {
        if (! [imageView.backgroundColor isEqual:[UIColor clearColor]])
        {
            [imageView.backgroundColor set];
            CGContextFillRect(UIGraphicsGetCurrentContext(), imageViewFrame);
        }
        
        [self fillRectWithCurrentBackgroundColor:imageViewFrame];
    
        if (self.highlighted && nil != imageView.highlightedImage)
        {
            [imageView.highlightedImage drawInRect:imageViewFrame];

        }
        else
        {
            [imageView.image drawInRect:imageViewFrame];

        }

    }
}


- (void)drawRoundedCornersImageView:(SKFRoundedCornersImageView *)imageView
{
    CGRect imageViewFrame = [self convertRect:imageView.frame fromView:self.contentView];
    imageViewFrame = CGRectMoveY(imageViewFrame, -0.5);
	
	if (imageView.contentMode == UIViewContentModeCenter)
	{
		imageViewFrame.origin.x += (imageViewFrame.size.width -imageView.image.size.width) / 2.0f;
		imageViewFrame.origin.y += (imageViewFrame.size.height -imageView.image.size.height) / 2.0f;
	}
	
	if (imageView.contentMode != UIViewContentModeScaleToFill)
	{
		imageViewFrame.size.width = imageView.image.size.width;
		imageViewFrame.size.height = imageView.image.size.height;
	}
	

	
    if (! [imageView.backgroundColor isEqual:[UIColor clearColor]])
    {
        [imageView.backgroundColor set];
        CGContextFillRect(UIGraphicsGetCurrentContext(), imageViewFrame);
    }

    if (nil != imageView.image)
    {
        [self fillRectWithCurrentBackgroundColor:imageViewFrame];

        if (imageView.cornerRadius > 0)
        {
            
            CGContextRef context = UIGraphicsGetCurrentContext();
            
            CGContextSaveGState(context);
            CGPathRef clippingPath = [UIBezierPath bezierPathWithRoundedRect:imageViewFrame cornerRadius:imageView.cornerRadius].CGPath;
            CGContextAddPath(context, clippingPath);
            CGContextClip(context);
            
            if (! [imageView.backgroundColor isEqual:[UIColor clearColor]])
            {
                [imageView.backgroundColor set];
                CGContextFillRect(context, imageViewFrame);
            }
            
            [imageView.image drawInRect:imageViewFrame];
            
            CGContextRestoreGState(context);
            
            CGContextSetLineWidth(context, imageView.borderWidth);
            CGContextAddPath(context, clippingPath);
            
            UIColor *borderColor;
            if (self.highlighted)
            {
                borderColor = imageView.highlightedBorderColor;
            }
            else
            {
                borderColor = imageView.borderColor;
            }
            
            CGContextSetStrokeColorWithColor(context, borderColor.CGColor);
            CGContextStrokePath(context);

        }
        else
        {
            [imageView.image drawInRect:imageViewFrame];
        }
    }
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
    [self fillRectWithCurrentBackgroundColor:rect];
    for (id subview in self.contentView.subviews)
    {
        if ([subview isKindOfClass:[UIImageView class]])
        {
            if ([subview isKindOfClass:[SKFRoundedCornersImageView class]])
            {
                [self drawRoundedCornersImageView:subview];
            }
            else
            {
                [self drawImageView:subview];
            }
        }
        if ([subview isKindOfClass:[UILabel class]])
        {
            if ([subview isKindOfClass:[SKFRoundedCornersLabel class]])
            {
                [self drawRoundedCornersLabel:subview];
            }
            else
            {
                [self drawLabel:subview];
            }
        }
    }
	
	if (self.drawSeparator)
	{
		[self drawSeparatorLine];
	}
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
    [super setBackgroundColor:backgroundColor];
}

- (UIColor *)currentBackgroundColor
{
    UIColor *backgroundColor;
	if (self.highlighted || self.selected)
    {
        backgroundColor = self.highlightedBackgroundColor;
    }
    else
    {
        backgroundColor = self.backgroundColor;
    }
    return backgroundColor;
}

- (void)fillRectWithCurrentBackgroundColor:(CGRect)rect
{
    UIColor *backgroundColor = [self currentBackgroundColor];
    if ([backgroundColor isEqual:[UIColor clearColor]])
    {
        [backgroundColor set];
        CGContextClearRect(UIGraphicsGetCurrentContext(), rect);
    }
    else
    {
        [backgroundColor set];
        CGContextFillRect(UIGraphicsGetCurrentContext(), rect);
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

//
//  SKFCodePaintedUIElements.m
//  SK Flat User Interface
//
//	Copyright (c) 2013 Stefan Kreminski
//
//	Permission is hereby granted, free of charge, to any person
//	obtaining a copy of this software and associated documentation
//	files (the "Software"), to deal in the Software without
//	restriction, including without limitation the rights to use,
//	copy, modify, merge, publish, distribute, sublicense, and/or sell
//	copies of the Software, and to permit persons to whom the
//	Software is furnished to do so, subject to the following
//	conditions:
//
//	The above copyright notice and this permission notice shall be
//	included in all copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//	EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
//	OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//	NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
//	HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//	WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//	FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
//	OTHER DEALINGS IN THE SOFTWARE.
//

#import "SKFCodePaintedUIElements.h"
#import "SKFUserInterface.h"

@interface BFCodePaintedUIElementsImageCache : NSObject
@property (nonatomic, strong) UIImage *pinImage;
@property (nonatomic, strong) UIImage *backBarButtonItemImage;
@property (nonatomic, strong) UIImage *backBarButtonItemHighlightedImage;
@property (nonatomic, strong) UIImage *barButtonItemImage;
@property (nonatomic, strong) UIImage *barButtonItemHighlightedImage;
@property (nonatomic, strong) NSDateFormatter *dateFormatter;
@property (nonatomic, strong) NSMutableDictionary *calendarImageCache;
@property (nonatomic, strong) NSMutableDictionary *highlightedCalendarImageCache;

@end

@implementation BFCodePaintedUIElementsImageCache

static BFCodePaintedUIElementsImageCache *defaultImageCache;

+ (BFCodePaintedUIElementsImageCache *)defaultImageCache
{
	@synchronized(self)
    {
		if (nil == defaultImageCache)
        {
            defaultImageCache = [[BFCodePaintedUIElementsImageCache alloc] init];
		}
	}
	return defaultImageCache;
}

- (id)init
{
    self = [super init];
    if (self)
    {
        self.dateFormatter = [[NSDateFormatter alloc] init];
        self.dateFormatter.dateStyle = NSDateFormatterShortStyle;
        self.dateFormatter.timeStyle = NSDateFormatterNoStyle;
        NSString *shortDateFormatWithoutYear = [NSDateFormatter dateFormatFromTemplate:@"MM d"
                                                                               options:0
                                                                                locale:self.dateFormatter.locale];
        self.dateFormatter.dateFormat = shortDateFormatWithoutYear;
        self.calendarImageCache = [NSMutableDictionary dictionary];
        self.highlightedCalendarImageCache = [NSMutableDictionary dictionary];

    }
    return self;
}

@end

@implementation SKFCodePaintedUIElements

+ (UIImage *)backBarButtonItemImage
{
    if (nil == [BFCodePaintedUIElementsImageCache defaultImageCache].backBarButtonItemImage)
    {
      [BFCodePaintedUIElementsImageCache defaultImageCache].backBarButtonItemImage = [self backBarButtonItemWithBorderColor:[UIColor clearColor] fillColor:[SKFUserInterface darkerMainColor]];
    }

    return [BFCodePaintedUIElementsImageCache defaultImageCache].backBarButtonItemImage;
}

+ (UIImage *)backBarButtonItemHighlightedImage
{
    if (nil == [BFCodePaintedUIElementsImageCache defaultImageCache].backBarButtonItemHighlightedImage)
    {
        [BFCodePaintedUIElementsImageCache defaultImageCache].backBarButtonItemHighlightedImage = [self backBarButtonItemWithBorderColor:[UIColor clearColor] fillColor:[SKFUserInterface almostWhiteColor]];
    }
    
    return [BFCodePaintedUIElementsImageCache defaultImageCache].backBarButtonItemHighlightedImage;
}

+ (UIImage *)backBarButtonItemWithBorderColor:(UIColor *)borderColor fillColor:(UIColor *)fillColor
{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(30.0f, 30.0f), NO, 0.0f);
    
    //// Rounded Rectangle Drawing
    UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPath];
    [roundedRectanglePath moveToPoint: CGPointMake(11.5, 29.5)];
    [roundedRectanglePath addLineToPoint: CGPointMake(25.5, 29.5)];
    [roundedRectanglePath addCurveToPoint: CGPointMake(29.5, 25.5) controlPoint1: CGPointMake(27.71, 29.5) controlPoint2: CGPointMake(29.5, 27.71)];
    [roundedRectanglePath addLineToPoint: CGPointMake(29.5, 4.5)];
    [roundedRectanglePath addCurveToPoint: CGPointMake(25.5, 0.5) controlPoint1: CGPointMake(29.5, 2.29) controlPoint2: CGPointMake(27.71, 0.5)];
    [roundedRectanglePath addLineToPoint: CGPointMake(11.5, 0.5)];
    [roundedRectanglePath addCurveToPoint: CGPointMake(0.5, 15.5) controlPoint1: CGPointMake(9.29, 0.5) controlPoint2: CGPointMake(0.5, 13.29)];
    [roundedRectanglePath addCurveToPoint: CGPointMake(11.5, 29.5) controlPoint1: CGPointMake(0.5, 15.5) controlPoint2: CGPointMake(9.29, 29.5)];
    [roundedRectanglePath closePath];
    
    [fillColor setFill];
    [roundedRectanglePath fill];
    
    [borderColor setStroke];
    roundedRectanglePath.lineWidth = 1;
    [roundedRectanglePath stroke];

    //create image
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)barButtonItemImage
{
    if (nil == [BFCodePaintedUIElementsImageCache defaultImageCache].barButtonItemImage)
    {
        [BFCodePaintedUIElementsImageCache defaultImageCache].barButtonItemImage = [self barButtonItemWithBorderColor:[UIColor clearColor] fillColor:[SKFUserInterface darkerMainColor]];
    }
    
    return [BFCodePaintedUIElementsImageCache defaultImageCache].barButtonItemImage;
}

+ (UIImage *)barButtonItemHighlightedImage
{ 
    if (nil == [BFCodePaintedUIElementsImageCache defaultImageCache].barButtonItemHighlightedImage)
    {
        [BFCodePaintedUIElementsImageCache defaultImageCache].barButtonItemHighlightedImage = [self barButtonItemWithBorderColor:[UIColor clearColor] fillColor:[SKFUserInterface almostWhiteColor]];
    }
    
    return [BFCodePaintedUIElementsImageCache defaultImageCache].barButtonItemHighlightedImage;
}

+ (UIImage *)barButtonItemWithBorderColor:(UIColor *)borderColor fillColor:(UIColor *)fillColor
{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(30.0f, 30.0f), NO, 0.0f);

	//// Rounded Rectangle Drawing
	UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(0.5, 0.5, 29, 29) cornerRadius: [SKFUserInterface roundedCornerRadius]];
	
    [fillColor setFill];
    [roundedRectanglePath fill];

    [borderColor setStroke];
	roundedRectanglePath.lineWidth = 1;
    [roundedRectanglePath stroke];

    
    //create image
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


+ (UIImage *)navigationBarImageForBarMetrics:(UIBarMetrics)barMetrics
{
    CGFloat navigationBarHeight = 44.0f;
    
    if (barMetrics == UIBarMetricsLandscapePhone)
    {
        navigationBarHeight = 32.0f;
    }
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(1, navigationBarHeight), NO, 0.0f);


    UIColor *mainColor = [SKFUserInterface mainColor];
    
    UIColor *bottomBorderColor = [SKFUserInterface darkerMainColor];
    
    CGFloat bottomBorderHeight = 1.0f;
    //// bar Drawing
    UIBezierPath* barPath = [UIBezierPath bezierPathWithRect: CGRectMake(0, 0, 320, navigationBarHeight - bottomBorderHeight)];
    [mainColor setFill];
    [barPath fill];
    
    //// bottom Border Drawing
    UIBezierPath* bottomBorderPath = [UIBezierPath bezierPathWithRect: CGRectMake(0, navigationBarHeight - bottomBorderHeight, 320, bottomBorderHeight)];
    [bottomBorderColor setFill];
    [bottomBorderPath fill];
    
    //create image
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)toolbarImageForBarMetrics:(UIBarMetrics)barMetrics toolbarPosition:(UIToolbarPosition)toolbarPosition;
{
    CGFloat navigationBarHeight = 44.0f;
    
    if (barMetrics == UIBarMetricsLandscapePhone)
    {
        navigationBarHeight = 32.0f;
    }
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(1, navigationBarHeight), NO, 0.0f);
    
    
    UIColor *mainColor = [SKFUserInterface almostWhiteColor];
    
    UIColor *bottomBorderColor = [SKFUserInterface darkerGrayColor];
    
    CGFloat bottomBorderHeight = 1.0f;
    //// bar Drawing
    UIBezierPath* barPath = [UIBezierPath bezierPathWithRect: CGRectMake(0, 0, 320, navigationBarHeight)];
    [mainColor setFill];
    [barPath fill];
    
    CGFloat borderPosition = (toolbarPosition == UIToolbarPositionTop) ? navigationBarHeight - bottomBorderHeight : 0.0f;
    //// bottom Border Drawing
    UIBezierPath* bottomBorderPath = [UIBezierPath bezierPathWithRect: CGRectMake(0, borderPosition, 320, bottomBorderHeight)];
    [bottomBorderColor setFill];
    [bottomBorderPath fill];
    
    //create image
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)tabBarSelectionIndicatorImage
{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(160, 49.0f), NO, 0.0f);
    
    
    UIColor *mainColor = [SKFUserInterface mainColor];
    
    UIColor *bottomBorderColor = [SKFUserInterface darkerMainColor];
    
    CGFloat bottomBorderHeight = 1.0f;
    //// bar Drawing
    UIBezierPath* barPath = [UIBezierPath bezierPathWithRect: CGRectMake(0, 0, 160, 49.0f)];
    [mainColor setFill];
    [barPath fill];
    
    //// bottom Border Drawing
    UIBezierPath* bottomBorderPath = [UIBezierPath bezierPathWithRect: CGRectMake(0, 0, 160, bottomBorderHeight)];
    [bottomBorderColor setFill];
    [bottomBorderPath fill];
    
    //create image
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;

}

+ (UIImage *)tabBarImage
{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(320, 49.0f), NO, 0.0f);
    
    
    UIColor *mainColor = [SKFUserInterface almostWhiteColor];
    
    UIColor *bottomBorderColor = [SKFUserInterface darkerGrayColor];
    
    CGFloat bottomBorderHeight = 1.0f;
    //// bar Drawing
    UIBezierPath* barPath = [UIBezierPath bezierPathWithRect: CGRectMake(0, 0, 320, 49.0f)];
    [mainColor setFill];
    [barPath fill];
    
    //// bottom Border Drawing
    UIBezierPath* bottomBorderPath = [UIBezierPath bezierPathWithRect: CGRectMake(0, 0, 320, bottomBorderHeight)];
    [bottomBorderColor setFill];
    [bottomBorderPath fill];
    
    //create image
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;

}

+ (UIImage *)segmentedControlBackgroundImage
{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(1, 30.0f), NO, 0.0f);
    
    
    UIColor *mainColor = [SKFUserInterface grayColor];
    
    UIColor *bottomBorderColor = [SKFUserInterface darkerGrayColor];
    
    CGFloat bottomBorderHeight = 1.0f;
    //// bar Drawing
    UIBezierPath* barPath = [UIBezierPath bezierPathWithRect: CGRectMake(0, 0, 1, 30)];
    [mainColor setFill];
    [barPath fill];
    
    //// bottom Border Drawing
    UIBezierPath* bottomBorderPath = [UIBezierPath bezierPathWithRect: CGRectMake(0, 29, 1, bottomBorderHeight)];
    [bottomBorderColor setFill];
    [bottomBorderPath fill];
    
    //// bottom Border Drawing
    UIBezierPath* topBorderPath = [UIBezierPath bezierPathWithRect: CGRectMake(0, 0, 1, bottomBorderHeight)];
    [bottomBorderColor setFill];
    [topBorderPath fill];
    
    //create image
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)segmentedControlSelectedBackgroundImage
{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(1, 30.0f), NO, 0.0f);
    
    
    UIColor *mainColor = [SKFUserInterface mainColor];
    
    UIColor *bottomBorderColor = [SKFUserInterface darkerMainColor];
    
    CGFloat bottomBorderHeight = 1.0f;
    //// bar Drawing
    UIBezierPath* barPath = [UIBezierPath bezierPathWithRect: CGRectMake(0, 0, 1, 30)];
    [mainColor setFill];
    [barPath fill];
    
    //// bottom Border Drawing
    UIBezierPath* bottomBorderPath = [UIBezierPath bezierPathWithRect: CGRectMake(0, 29, 1, bottomBorderHeight)];
    [bottomBorderColor setFill];
    [bottomBorderPath fill];
    
    //// bottom Border Drawing
    UIBezierPath* topBorderPath = [UIBezierPath bezierPathWithRect: CGRectMake(0, 0, 1, bottomBorderHeight)];
    [bottomBorderColor setFill];
    [topBorderPath fill];
    
    //create image
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
    
}

+ (UIImage *)pinImageWithColor:(UIColor *)color borderColor:(UIColor *)borderColor
{
    return [self pinImageWithColor:color borderColor:borderColor height:42.0f];
}

+ (UIImage *)pinImageWithColor:(UIColor *)color borderColor:(UIColor *)borderColor height:(CGFloat)height
{
    CGFloat scaleFactor = height / 42.0f;
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(28.0f * scaleFactor, 42.0f * scaleFactor), NO, 0.0f);
    
    //// Oval 4 Drawing
    UIBezierPath* pinPath = [UIBezierPath bezierPath];
    [pinPath moveToPoint: CGPointMake(14 * scaleFactor, 40.5 * scaleFactor)];
    [pinPath addCurveToPoint: CGPointMake(23.19 * scaleFactor, 27.46 * scaleFactor) controlPoint1: CGPointMake(17.69 * scaleFactor, 40.5 * scaleFactor) controlPoint2: CGPointMake(21.68 * scaleFactor, 30.43 * scaleFactor)];
    [pinPath addCurveToPoint: CGPointMake(24.19 * scaleFactor, 5.95 * scaleFactor) controlPoint1: CGPointMake(26.2 * scaleFactor, 21.52 * scaleFactor) controlPoint2: CGPointMake(29.82 * scaleFactor, 11.89 * scaleFactor)];
    [pinPath addCurveToPoint: CGPointMake(3.81 * scaleFactor, 5.95 * scaleFactor) controlPoint1: CGPointMake(18.56 * scaleFactor, 0.02 * scaleFactor) controlPoint2: CGPointMake(9.44 * scaleFactor, 0.02 * scaleFactor)];
    [pinPath addCurveToPoint: CGPointMake(4.81 * scaleFactor, 27.46 * scaleFactor) controlPoint1: CGPointMake(-1.82 * scaleFactor, 11.89 * scaleFactor) controlPoint2: CGPointMake(1.8 * scaleFactor, 21.52 * scaleFactor)];
    [pinPath addCurveToPoint: CGPointMake(14 * scaleFactor, 40.5 * scaleFactor) controlPoint1: CGPointMake(6.31 * scaleFactor, 30.43 * scaleFactor) controlPoint2: CGPointMake(10.31 * scaleFactor, 40.5 * scaleFactor)];
    [pinPath closePath];
    
    pinPath.lineWidth = 1;
    
    [color setFill];
    [borderColor setStroke];
    
    [pinPath fill];
    [pinPath stroke];
    
    
    
    //// Oval Drawing
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(7 * scaleFactor, 8 * scaleFactor, 14 * scaleFactor, 14 * scaleFactor)];
    [borderColor setFill];
    [ovalPath fill];
    
    //create image
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return image;
}

+ (UIImage *)pinImage
{
    if (nil == [BFCodePaintedUIElementsImageCache defaultImageCache].pinImage)
    {
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(28.0f, 42.0f), NO, 0.0f);

        //// Oval 4 Drawing
        UIBezierPath* pinPath = [UIBezierPath bezierPath];
        [pinPath moveToPoint: CGPointMake(14, 40.5)];
        [pinPath addCurveToPoint: CGPointMake(23.19, 27.46) controlPoint1: CGPointMake(17.69, 40.5) controlPoint2: CGPointMake(21.68, 30.43)];
        [pinPath addCurveToPoint: CGPointMake(24.19, 5.95) controlPoint1: CGPointMake(26.2, 21.52) controlPoint2: CGPointMake(29.82, 11.89)];
        [pinPath addCurveToPoint: CGPointMake(3.81, 5.95) controlPoint1: CGPointMake(18.56, 0.02) controlPoint2: CGPointMake(9.44, 0.02)];
        [pinPath addCurveToPoint: CGPointMake(4.81, 27.46) controlPoint1: CGPointMake(-1.82, 11.89) controlPoint2: CGPointMake(1.8, 21.52)];
        [pinPath addCurveToPoint: CGPointMake(14, 40.5) controlPoint1: CGPointMake(6.31, 30.43) controlPoint2: CGPointMake(10.31, 40.5)];
        [pinPath closePath];
        
        pinPath.lineWidth = 1;
        
        [[SKFUserInterface grayColor] setFill];
        [[SKFUserInterface darkerGrayColor] setStroke];
        
        [pinPath fill];
        [pinPath stroke];
        
        
        
        //// Oval Drawing
        UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(7, 8, 14, 14)];
        [[SKFUserInterface darkerGrayColor] setFill];
        [ovalPath fill];
        
        //create image
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        [BFCodePaintedUIElementsImageCache defaultImageCache].pinImage = image;
        
    }
    
    return  [BFCodePaintedUIElementsImageCache defaultImageCache].pinImage;
}



+ (UIImage *)searchBarImageWithColor:(UIColor *)color borderColor:(UIColor *)borderColor
{
	UIGraphicsBeginImageContextWithOptions(CGSizeMake(44.0f, 44.0f), NO, 0.0f);
    CGFloat verticalInsets = 7.0f;
    
	//// Rounded Rectangle Drawing
	UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(0.5, 0.5 + verticalInsets, 43, 43 - 2 * verticalInsets) cornerRadius: [SKFUserInterface roundedCornerRadius]];
	
    [color setFill];
    [roundedRectanglePath fill];
	
    [borderColor setStroke];
	roundedRectanglePath.lineWidth = 1;
    [roundedRectanglePath stroke];
	
    
    //create image
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(12.0f, 12.0f, 12.0f, 12.0f)];
}

+ (UIImage *)buttonImageWithColor:(UIColor *)color borderColor:(UIColor *)borderColor
{
	UIGraphicsBeginImageContextWithOptions(CGSizeMake(44.0f, 44.0f), NO, 0.0f);

	//// Rounded Rectangle Drawing
	UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(0.5, 0.5, 43, 43) cornerRadius: [SKFUserInterface roundedCornerRadius]];
	
    [color setFill];
    [roundedRectanglePath fill];
	
    [borderColor setStroke];
	roundedRectanglePath.lineWidth = 0.5;
    [roundedRectanglePath stroke];
	
    
    //create image
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(12.0f, 12.0f, 12.0f, 12.0f)];
}

+ (UIImage *)sandwichButtonImageForBarMetrics:(UIBarMetrics)barMetrics
{
	if (barMetrics == UIBarMetricsLandscapePhone)
	{
		UIGraphicsBeginImageContextWithOptions(CGSizeMake(25.0f, 17.0f), NO, 0.0f);

	}
	else
	{
		UIGraphicsBeginImageContextWithOptions(CGSizeMake(25.0f, 19.0f), NO, 0.0f);
	}

	CGFloat cornerRadius = [SKFUserInterface roundedCornerRadius]/2.0f;
	[[SKFUserInterface almostWhiteColor] setFill];
	
	//// firstLine Drawing
	UIBezierPath* firstLinePath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 25, 4)
															 cornerRadius:cornerRadius];
	[firstLinePath fill];
	
	
	//// secondLine Drawing
	CGFloat secondLineOriginY = 7;
	if (barMetrics == UIBarMetricsLandscapePhone)
	{
	secondLineOriginY = 6;
	}
	UIBezierPath* secondLinePath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, secondLineOriginY, 25, 4)
															  cornerRadius:cornerRadius];
	[secondLinePath fill];
	
	//// thirdLine Drawing
	CGFloat thirdLineOriginY = 14;
	if (barMetrics == UIBarMetricsLandscapePhone)
	{
		thirdLineOriginY = 12;
	}
	UIBezierPath* thirdLinePath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, thirdLineOriginY, 25, 4)
															 cornerRadius:cornerRadius];
	[thirdLinePath fill];
	
	//create image
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)sliderImageWithBorderColor:(UIColor *)borderColor fillColor:(UIColor *)fillColor
{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(2.0f, 2.0f), NO, 0.0f);
    
	//// Rounded Rectangle Drawing
	UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(0, 0, 2, 2) cornerRadius: [SKFUserInterface roundedCornerRadius]];
	
    [fillColor setFill];
    [roundedRectanglePath fill];
    
    [borderColor setStroke];
	roundedRectanglePath.lineWidth = 1;
    [roundedRectanglePath stroke];
    
    
    //create image
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(1.0f, 1.0f, 1.0f, 1.0f)];
}

+ (UIImage *)sliderKnobImageWithBorderColor:(UIColor *)borderColor fillColor:(UIColor *)fillColor withText:(NSString *)text
{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(32.0f, 32.0f), NO, 0.0f);
    
	//// Rounded Rectangle Drawing
	UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(1.0f, 1.0f, 30.0f, 30.0f)];
	
//    [fillColor setFill];
//    [roundedRectanglePath fill];
    
    [borderColor setStroke];
	roundedRectanglePath.lineWidth = 1;
    [roundedRectanglePath stroke];
    
    [borderColor setFill];
    [roundedRectanglePath fill];
    
    UIBezierPath* roundedRectanglePath1 = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(2.0f, 2.0f, 28.0f, 28.0f)];
    	roundedRectanglePath1.lineWidth = 1;
    [fillColor setStroke];
    [roundedRectanglePath1 stroke];
    

    
    [[SKFUserInterface almostWhiteColor] set];
    CGRect contentRect = CGRectMake(1.0f, 1.0f, 30.0f, 30.0f);

    UIFont *font = [SKFUserInterface defaultFontWithSize:7.0f];
    CGFloat fontHeight = font.pointSize;
    CGFloat yOffset = (contentRect.size.height - fontHeight) / 2.0 - 1.0f;
    
    
    CGRect textRect = CGRectMake(0, yOffset, contentRect.size.width, fontHeight);
    
    [text    drawInRect:textRect
                 withFont:font
            lineBreakMode:NSLineBreakByClipping
                alignment:NSTextAlignmentCenter];

    
    
    //create image
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


+ (UIImage *)sliderImageWithColor:(UIColor *)color string:(NSString *)string textAlignment:(NSTextAlignment)textAlignment
{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(32.0f, 32.0f), NO, 0.0f);

    UIFont *font = [SKFUserInterface defaultFontWithSize:12.0f];
    CGSize size = [string sizeWithFont:font];

    CGRect contentRect = CGRectMake(0, 0, size.width, 30.0f);
    UIGraphicsBeginImageContextWithOptions(contentRect.size, NO, 0.0f);
    [color set];
    
    CGFloat fontHeight = font.pointSize;
    CGFloat yOffset = (contentRect.size.height - fontHeight) / 2.0 - 2.0f;
    
    
    CGRect textRect = CGRectMake(0, yOffset, contentRect.size.width, fontHeight);

    [string    drawInRect:textRect
                 withFont:font
            lineBreakMode:NSLineBreakByClipping
                alignment:textAlignment];
    
    //create image
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)calendarImageForDate:(NSDate *)date withColor:(UIColor *)color width:(CGFloat)width
{
    if (date == nil)
    {
        return nil;
    }

    CGSize size =CGSizeMake(width, width);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0f);

//    
        NSDateComponents *components = [[NSCalendar currentCalendar] components:NSYearCalendarUnit fromDate:date];
    //// Abstracted Attributes
    NSString* textContent = [NSString stringWithFormat:@"%d", components.year];
    NSString* text2Content = [[BFCodePaintedUIElementsImageCache defaultImageCache].dateFormatter stringFromDate:date];
    
    
    //// Rounded Rectangle Drawing
    UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(0.5, 0.5, size.width - 1.0f, size.height - 1.0f) cornerRadius: [SKFUserInterface roundedCornerRadius]];
    [color setStroke];
    roundedRectanglePath.lineWidth = 1;
    [roundedRectanglePath stroke];

    [color setFill];
    
    NSUInteger fontSize = 8 * width/30;
    
    //// Text Drawing
    CGRect textRect = CGRectMake(0, 1, size.width, size.height / 2.0f);
    [color setFill];
    [textContent drawInRect: textRect withFont: [SKFUserInterface defaultFontWithSize:fontSize] lineBreakMode: NSLineBreakByWordWrapping alignment: NSTextAlignmentCenter];
    
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    [linePath moveToPoint:CGPointMake(0, 0.4f * size.height)];
    [linePath addLineToPoint:CGPointMake(size.width, 0.4f * size.height)];
    [color setStroke];
    linePath.lineWidth = 1.0f;
    [linePath stroke];
    
    //// Text 2 Drawing
    CGRect text2Rect = CGRectMake(0, 0.5 * size.height, size.width, 0.3 * size.height);
    [color setFill];
    [text2Content drawInRect: text2Rect withFont:[SKFUserInterface defaultFontWithSize:fontSize] lineBreakMode: NSLineBreakByWordWrapping alignment: NSTextAlignmentCenter];
    
    
    
    //create image
  UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
        
//    [[BFCodePaintedUIElementsImageCache defaultImageCache].calendarImageCache setObject:image forKey:date];
//    }
    
    return image;
}

+ (UIImage *)highlightedCalendarImageForDate:(NSDate *)date
{
    return [SKFCodePaintedUIElements calendarImageForDate:date withColor:[SKFUserInterface almostWhiteColor] width:30.0f];
}

+ (UIImage *)calendarImageForDate:(NSDate *)date
{
    return [SKFCodePaintedUIElements calendarImageForDate:date withColor:[SKFUserInterface darkerGrayColor] width:30.0f];
}
@end

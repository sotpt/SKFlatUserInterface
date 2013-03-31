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

@end

@implementation SKFCodePaintedUIElements

+ (UIImage *)backBarButtonItemImage
{
    if (nil == [BFCodePaintedUIElementsImageCache defaultImageCache].backBarButtonItemImage)
    {
      [BFCodePaintedUIElementsImageCache defaultImageCache].backBarButtonItemImage = [self backBarButtonItemWithBorderColor:[SKFUserInterface darkerMainColor] fillColor:[UIColor clearColor]];
    }

    return [BFCodePaintedUIElementsImageCache defaultImageCache].backBarButtonItemImage;
}

+ (UIImage *)backBarButtonItemHighlightedImage
{
    if (nil == [BFCodePaintedUIElementsImageCache defaultImageCache].backBarButtonItemHighlightedImage)
    {
        [BFCodePaintedUIElementsImageCache defaultImageCache].backBarButtonItemHighlightedImage = [self backBarButtonItemWithBorderColor:[SKFUserInterface textColor] fillColor:[SKFUserInterface darkerMainColor]];
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
        [BFCodePaintedUIElementsImageCache defaultImageCache].barButtonItemImage = [self barButtonItemWithBorderColor:[SKFUserInterface darkerMainColor] fillColor:[UIColor clearColor]];
    }
    
    return [BFCodePaintedUIElementsImageCache defaultImageCache].barButtonItemImage;
}

+ (UIImage *)barButtonItemHighlightedImage
{ 
    if (nil == [BFCodePaintedUIElementsImageCache defaultImageCache].barButtonItemHighlightedImage)
    {
        [BFCodePaintedUIElementsImageCache defaultImageCache].barButtonItemHighlightedImage = [self barButtonItemWithBorderColor:[SKFUserInterface textColor] fillColor:[SKFUserInterface darkerMainColor]];
    }
    
    return [BFCodePaintedUIElementsImageCache defaultImageCache].barButtonItemHighlightedImage;
}

+ (UIImage *)barButtonItemWithBorderColor:(UIColor *)borderColor fillColor:(UIColor *)fillColor
{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(30.0f, 30.0f), NO, 0.0f);

	//// Rounded Rectangle Drawing
	UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(0.5, 0.5, 29, 29) cornerRadius: 4];
	
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


+ (UIImage *)buttonImageWithColor:(UIColor *)color borderColor:(UIColor *)borderColor
{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(44.0f, 44.0f), NO, 0.0f);

    UIBezierPath* path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 44.0f, 44.0f) cornerRadius:[SKFUserInterface roundedCornerRadius]];
    
    path.lineWidth = 2;
    
    [color setFill];
    [borderColor setStroke];
    
    [path fill];
    [path stroke];
    
    //create image
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(22.0f, 22.0f, 22.0f, 22.0f)];
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

	CGFloat cornerRadius = 2;
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

@end

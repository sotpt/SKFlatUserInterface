//
//  SKFUserInterface.m
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

#import "SKFUserInterface.h"
#import "SKFCodePaintedUIElements.h"

@interface SKFUserInterface()
@property (nonatomic, strong, readwrite) UIColor *mainColor;
@property (nonatomic, copy, readwrite) NSString *fontName;
@property (nonatomic, assign, readwrite) CGFloat roundedCornerRadius;
@end

@implementation SKFUserInterface


#pragma mark - singleton

static SKFUserInterface *defaultSKFUserInterface;

+ (SKFUserInterface *)defaultSKFUserInterface
{
	@synchronized(self)
    {
		if (nil == defaultSKFUserInterface)
		{
			defaultSKFUserInterface = [[SKFUserInterface alloc] init];
		}
	}
	return defaultSKFUserInterface;
}


#pragma mark - user interface configuration

+ (void)configureUserInterfaceWithMainColor:(UIColor *)mainColor
								   fontName:(NSString *)fontName
						roundedCornerRadius:(CGFloat)roundedCornerRadius
{
	[SKFUserInterface defaultSKFUserInterface].mainColor = mainColor;
	[SKFUserInterface defaultSKFUserInterface].fontName = fontName;
	[SKFUserInterface defaultSKFUserInterface].roundedCornerRadius = roundedCornerRadius;

    [self configureNavigationBar];
	[self configureToolbar];

    [self configureBarButtonItems];
	[self configureSearchBar];
}

+ (void)configureNavigationBar
{
    [[UINavigationBar appearance] setBackgroundImage:[SKFCodePaintedUIElements navigationBarImageForBarMetrics:UIBarMetricsDefault]
                                       forBarMetrics:UIBarMetricsDefault];
    
    [[UINavigationBar appearance] setBackgroundImage:[SKFCodePaintedUIElements navigationBarImageForBarMetrics:UIBarMetricsLandscapePhone]
                                       forBarMetrics:UIBarMetricsLandscapePhone];
    
    [[UINavigationBar appearance] setTitleTextAttributes:
     @{
                                    UITextAttributeFont : [self defaultFontWithSize:17.0f],
                         UITextAttributeTextShadowColor : [UIColor clearColor],
                               UITextAttributeTextColor : [self almostWhiteColor]
     }];
    
    //  [[UINavigationBar appearance] setTintColor:[self mainColor]];
}


+ (void)configureToolbar
{
    [[UIToolbar appearance] setBackgroundImage:[SKFCodePaintedUIElements navigationBarImageForBarMetrics:UIBarMetricsDefault]
							forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
    
    [[UIToolbar appearance] setBackgroundImage:[SKFCodePaintedUIElements navigationBarImageForBarMetrics:UIBarMetricsLandscapePhone]
                                       forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsLandscapePhone];
    
//    [[UIToolbar appearance] setTitleTextAttributes:
//     @{
//                                    UITextAttributeFont : [self defaultFontWithSize:17.0f],
//                         UITextAttributeTextShadowColor : [UIColor clearColor],
//                               UITextAttributeTextColor : [self almostWhiteColor]
//     }];
    
    //  [[UINavigationBar appearance] setTintColor:[self mainColor]];
}

+ (void)configureBarButtonItems
{
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:[SKFCodePaintedUIElements backBarButtonItemImage]
                                                      forState:UIControlStateNormal
                                                    barMetrics:UIBarMetricsDefault];
    
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:[SKFCodePaintedUIElements backBarButtonItemHighlightedImage]
                                                      forState:UIControlStateHighlighted
                                                    barMetrics:UIBarMetricsDefault];

	[[UIBarButtonItem appearance] setBackgroundImage:[SKFCodePaintedUIElements barButtonItemImage]
                                                      forState:UIControlStateNormal
                                                    barMetrics:UIBarMetricsDefault];
    
    [[UIBarButtonItem appearance] setBackgroundImage:[SKFCodePaintedUIElements barButtonItemHighlightedImage]
                                                      forState:UIControlStateHighlighted
                                                    barMetrics:UIBarMetricsDefault];
	
    
    
    [[UIBarButtonItem appearance] setTitleTextAttributes:
     @{
                                    UITextAttributeFont : [self defaultFontWithSize:12.0f],
                         UITextAttributeTextShadowColor : [UIColor clearColor],
                               UITextAttributeTextColor : [self almostWhiteColor]
     }
                                                forState:UIControlStateNormal];
    
    [[UIBarButtonItem appearance] setTitleTextAttributes:
     @{
                                    UITextAttributeFont : [self defaultFontWithSize:12.0f],
                         UITextAttributeTextShadowColor : [UIColor clearColor],
                               UITextAttributeTextColor : [self almostWhiteColor]
     }
                                                forState:UIControlStateHighlighted];
}

+ (void)configureSearchBar
{
	[[UISearchBar appearance] setBackgroundImage:[SKFCodePaintedUIElements navigationBarImageForBarMetrics:UIBarMetricsDefault]];
    
//    [[UISearchBar appearance] setBackgroundImage:[SKFCodePaintedUIElements navigationBarImageForBarMetrics:UIBarMetricsLandscapePhone] forBarMetrics:UIBarMetricsLandscapePhone];

}


#pragma mark - colors

+ (UIColor *)mainColor
{
	return [SKFUserInterface defaultSKFUserInterface].mainColor;
}

+ (UIColor *)darkerMainColor
{
    UIColor* mainColor = [self mainColor];
    CGFloat brightness = 0.7;
    
    CGFloat mainColorRGBA[4];
    [mainColor getRed:&mainColorRGBA[0]
                green:&mainColorRGBA[1]
                 blue:&mainColorRGBA[2]
                alpha:&mainColorRGBA[3]];
    
    return [UIColor colorWithRed:(mainColorRGBA[0] * brightness)
                           green:(mainColorRGBA[1] * brightness)
                            blue:(mainColorRGBA[2] * brightness)
                           alpha:mainColorRGBA[3]];
}

+ (UIColor *)lighterMainColor
{
    UIColor* mainColor = [self mainColor];
    CGFloat brightness = 1.1;
    
    CGFloat mainColorRGBA[4];
    [mainColor getRed:&mainColorRGBA[0]
                green:&mainColorRGBA[1]
                 blue:&mainColorRGBA[2]
                alpha:&mainColorRGBA[3]];
    
    return [UIColor colorWithRed:(mainColorRGBA[0] * brightness)
                           green:(mainColorRGBA[1] * brightness)
                            blue:(mainColorRGBA[2] * brightness)
                           alpha:mainColorRGBA[3]];
}


+ (UIColor *)grayColor
{
    UIColor *mainColor = [self mainColor];
    CGFloat mainColorHSBA[4];
    [mainColor getHue:&mainColorHSBA[0]
           saturation:&mainColorHSBA[1]
           brightness:&mainColorHSBA[2]
                alpha:&mainColorHSBA[3]];
    
    return [UIColor colorWithHue:mainColorHSBA[0]
                      saturation:0
                      brightness:mainColorHSBA[2]
                           alpha:mainColorHSBA[3]];
}


+ (UIColor *)lighterGrayColor
{
    UIColor *lighterMainColor = [self lighterMainColor];
    CGFloat lighterMainColorHSBA[4];
    [lighterMainColor getHue:&lighterMainColorHSBA[0]
                  saturation:&lighterMainColorHSBA[1]
                  brightness:&lighterMainColorHSBA[2]
                       alpha:&lighterMainColorHSBA[3]];
    
    return [UIColor colorWithHue:lighterMainColorHSBA[0]
                      saturation:0
                      brightness:lighterMainColorHSBA[2]
                           alpha:lighterMainColorHSBA[3]];
}


+ (UIColor *)darkerGrayColor
{
    UIColor *darkerMainColor = [self darkerMainColor];
    CGFloat darkerMainColorHSBA[4];
    [darkerMainColor getHue:&darkerMainColorHSBA[0]
                 saturation:&darkerMainColorHSBA[1]
                 brightness:&darkerMainColorHSBA[2]
                      alpha:&darkerMainColorHSBA[3]];
    
    return [UIColor colorWithHue:darkerMainColorHSBA[0]
                    saturation:0
                    brightness:darkerMainColorHSBA[2]
                         alpha:darkerMainColorHSBA[3]];
}


+ (UIColor *)color:(UIColor *)color withSaturation:(CGFloat)saturation
{
    CGFloat colorHSBA[4];
    [color getHue:&colorHSBA[0]
                 saturation:&colorHSBA[1]
                 brightness:&colorHSBA[2]
                      alpha:&colorHSBA[3]];
    
    return [UIColor colorWithHue:colorHSBA[0]
					  saturation:colorHSBA[1]*saturation
					  brightness:colorHSBA[2]
						   alpha:colorHSBA[3]];
}

+ (UIColor *)textColor
{
    return [UIColor colorWithHue:0.0f saturation:0.0f brightness:0.2f alpha:1.0f];
}

+ (UIColor *)almostWhiteColor
{
    return [UIColor colorWithHue:0.0f saturation:0.0f brightness:0.98f alpha:1.0f];
}

+ (UIColor *)darkerTextColor
{
    UIColor* textColor = [self textColor];
    CGFloat brightness = 0.7;
    
    CGFloat textColorRGBA[4];
    [textColor getRed:&textColorRGBA[0]
                green:&textColorRGBA[1]
                 blue:&textColorRGBA[2]
                alpha:&textColorRGBA[3]];
    
    return [UIColor colorWithRed:(textColorRGBA[0] * brightness)
                           green:(textColorRGBA[1] * brightness)
                            blue:(textColorRGBA[2] * brightness)
                           alpha:textColorRGBA[3]];
}


#pragma mark - fonts

+ (UIFont *)defaultFontWithSize:(CGFloat)size
{
    return [UIFont fontWithName:[SKFUserInterface defaultSKFUserInterface].fontName size:size];
}

+ (UIFont *)defaultFontForLabel:(UILabel *)label
{
    return [UIFont fontWithName:[SKFUserInterface defaultSKFUserInterface].fontName size:label.font.pointSize];
}

+ (UIFont *)defaultFontForTextField:(UITextField *)textField
{
    return [UIFont fontWithName:[SKFUserInterface defaultSKFUserInterface].fontName size:textField.font.pointSize];
}

+ (UIFont *)defaultFontForTextView:(UITextView *)textView
{
    return [UIFont fontWithName:[SKFUserInterface defaultSKFUserInterface].fontName size:textView.font.pointSize];
}

#pragma mark - rounded corners

+ (CGFloat)roundedCornerRadius
{
	return [SKFUserInterface defaultSKFUserInterface].roundedCornerRadius;
}

+ (void)addRoundedCornersToView:(UIView *)view withColor:(UIColor *)color;
{
    view.layer.cornerRadius = [self roundedCornerRadius];
    view.clipsToBounds = YES;
    view.layer.borderColor = color.CGColor;
    view.layer.borderWidth = 1.0f;
    view.layer.shouldRasterize = YES;
    view.layer.rasterizationScale = [UIScreen mainScreen].scale;
}


#pragma mark - buttons

+ (void)styleButton:(UIButton *)button forStyle:(SKFUserInterfaceButtonStyle)style
{
	if (style == SKFUserInterfaceButtonStyleMainColor)
	{
		[button setBackgroundImage:[SKFCodePaintedUIElements buttonImageWithColor:[SKFUserInterface mainColor]
															borderColor:[SKFUserInterface darkerMainColor]]
				forState:UIControlStateNormal];
		
		[button setBackgroundImage:[SKFCodePaintedUIElements buttonImageWithColor:[SKFUserInterface darkerMainColor]
															borderColor:[SKFUserInterface textColor]]
				forState:UIControlStateHighlighted];
		
		[button setTitleColor:[SKFUserInterface almostWhiteColor] forState:UIControlStateNormal];
		button.titleLabel.font = [SKFUserInterface defaultFontForLabel:button.titleLabel];
		button.backgroundColor = [UIColor clearColor];
	}
	
	if (style == SKFUserInterfaceButtonStyleAlmostWhiteColor)
		{
		[button setBackgroundImage:[SKFCodePaintedUIElements buttonImageWithColor:[SKFUserInterface almostWhiteColor]
															borderColor:[SKFUserInterface darkerGrayColor]]
				forState:UIControlStateNormal];
		
		[button setBackgroundImage:[SKFCodePaintedUIElements buttonImageWithColor:[SKFUserInterface textColor]
															borderColor:[SKFUserInterface darkerTextColor]]
				forState:UIControlStateHighlighted];
		
		[button setTitleColor:[SKFUserInterface darkerGrayColor] forState:UIControlStateNormal];
		[button setTitleColor:[SKFUserInterface almostWhiteColor] forState:UIControlStateHighlighted];

		button.titleLabel.font = [SKFUserInterface defaultFontForLabel:button.titleLabel];
		button.backgroundColor = [UIColor clearColor];
		}

	if (style == SKFUserInterfaceButtonStyleTextColor)
	{
		[button setBackgroundImage:[SKFCodePaintedUIElements buttonImageWithColor:[SKFUserInterface textColor]
															borderColor:[SKFUserInterface darkerTextColor]]
				forState:UIControlStateNormal];
		
		[button setBackgroundImage:[SKFCodePaintedUIElements buttonImageWithColor:[SKFUserInterface mainColor]
															borderColor:[SKFUserInterface darkerMainColor]]
				forState:UIControlStateHighlighted];
		
		[button setTitleColor:[SKFUserInterface almostWhiteColor] forState:UIControlStateNormal];
		button.titleLabel.font = [SKFUserInterface defaultFontForLabel:button.titleLabel];
		button.backgroundColor = [UIColor clearColor];
		}
	
}

@end

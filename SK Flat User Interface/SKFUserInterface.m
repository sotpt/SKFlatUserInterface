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
#import <MessageUI/MessageUI.h>

@interface SKFUserInterface()
@property (nonatomic, strong, readwrite) UIColor *mainColor;
@property (nonatomic, copy, readwrite) NSString *fontName;
@property (nonatomic, copy, readwrite) NSString *boldFontName;
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
    [self configureUserInterfaceWithMainColor:mainColor
                                     fontName:fontName
                                 boldFontName:fontName
                          roundedCornerRadius:roundedCornerRadius];
}

+ (void)configureUserInterfaceWithMainColor:(UIColor *)mainColor
								   fontName:(NSString *)fontName
                               boldFontName:(NSString *)boldFontName
						roundedCornerRadius:(CGFloat)roundedCornerRadius
{
	[SKFUserInterface defaultSKFUserInterface].mainColor = mainColor;
	[SKFUserInterface defaultSKFUserInterface].fontName = fontName;
    [SKFUserInterface defaultSKFUserInterface].boldFontName = boldFontName;
	[SKFUserInterface defaultSKFUserInterface].roundedCornerRadius = roundedCornerRadius;

    [self configureNavigationBar];
    [self configureToolbar];
//
    [self configureBarButtonItems];
//	[self configureSearchBar];
    [self configureSegmentedControl];
//
    [self configureTabBar];
}


+ (void)configureNavigationBar
{
    [[UINavigationBar appearance] setTitleTextAttributes:
     @{
                                    UITextAttributeFont : [self boldFontWithSize:17.0f],
                         UITextAttributeTextShadowColor : [UIColor clearColor],
                               UITextAttributeTextColor : [self almostWhiteColor]
     }];
    


    // iOS 7 code
    UINavigationBar *navigationBar = [[UINavigationBar alloc] init];
    
    if ([navigationBar respondsToSelector:@selector(setBarTintColor:)])
    {
//        [[UINavigationBar appearance] setBarTintColor:[SKFUserInterface mainColor]];
    }
    else
    {
        [[UINavigationBar appearance] setBackgroundImage:[SKFCodePaintedUIElements navigationBarImageForBarMetrics:UIBarMetricsDefault]
                                           forBarMetrics:UIBarMetricsDefault];

        [[UINavigationBar appearance] setBackgroundImage:[SKFCodePaintedUIElements navigationBarImageForBarMetrics:UIBarMetricsLandscapePhone]
                                           forBarMetrics:UIBarMetricsLandscapePhone];
        [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    }
    
}


+ (void)configureToolbar
{

    
//    [[UIToolbar appearance] setTitleTextAttributes:
//     @{
//                                    UITextAttributeFont : [self defaultFontWithSize:17.0f],
//                         UITextAttributeTextShadowColor : [UIColor clearColor],
//                               UITextAttributeTextColor : [self almostWhiteColor]
//     }];
    
    //
    
    
    // iOS 7 code
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    
    if ([toolbar respondsToSelector:@selector(setBarTintColor:)])
    {
        [[UIToolbar appearance] setBarTintColor:[SKFUserInterface almostWhiteColor]];
    }
    else
    {
    [[UIToolbar appearance] setBackgroundImage:[SKFCodePaintedUIElements toolbarImageForBarMetrics:UIBarMetricsDefault toolbarPosition:UIToolbarPositionBottom]
							forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];

    [[UIToolbar appearance] setBackgroundImage:[SKFCodePaintedUIElements toolbarImageForBarMetrics:UIBarMetricsDefault toolbarPosition:UIToolbarPositionAny]
							forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];




    [[UIToolbar appearance] setShadowImage:[[UIImage alloc] init] forToolbarPosition:UIToolbarPositionAny];

    }

}

+ (void)configureBarButtonItems
{
//    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:[UIImage imageNamed:@"BackButton"]
//                                                      forState:UIControlStateNormal
//                                                    barMetrics:UIBarMetricsDefault];
//    
//    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:[UIImage imageNamed:@"BackButtonHighlighted"]
//                                                      forState:UIControlStateHighlighted
//                                                    barMetrics:UIBarMetricsDefault];
//
//	[[UIBarButtonItem appearance] setBackgroundImage:[SKFCodePaintedUIElements barButtonItemImage]
//                                                      forState:UIControlStateNormal
//                                                    barMetrics:UIBarMetricsDefault];
//    
//    [[UIBarButtonItem appearance] setBackgroundImage:[SKFCodePaintedUIElements barButtonItemHighlightedImage]
//                                                      forState:UIControlStateHighlighted
//                                                    barMetrics:UIBarMetricsDefault];
//	
    
    
    [[UIBarButtonItem appearance] setTitleTextAttributes:
     @{
                                    UITextAttributeFont : [self defaultFontWithSize:14.0f],
//                         UITextAttributeTextShadowColor : [UIColor clearColor],
//                               UITextAttributeTextColor : [self mainColor]
     }
                                                forState:UIControlStateNormal];
    
    [[UIBarButtonItem appearance] setTitleTextAttributes:
     @{
                                    UITextAttributeFont : [self defaultFontWithSize:14.0f],
//                         UITextAttributeTextShadowColor : [UIColor clearColor],
//                               UITextAttributeTextColor : [self mainColor]
     }
                                                forState:UIControlStateHighlighted];
    
//    [[UIBarButtonItem appearance] setTitlePositionAdjustment:UIOffsetMake(0.0f, 2.0f) forBarMetrics:UIBarMetricsDefault];
}

+ (void)configureSearchBar
{
	[[UISearchBar appearance] setBackgroundImage:[SKFCodePaintedUIElements navigationBarImageForBarMetrics:UIBarMetricsDefault]];
    
    UITextField *textField = [UITextField appearanceWhenContainedIn:[UISearchBar class], nil];
    textField.textColor = [SKFUserInterface almostWhiteColor];
    textField.font = [SKFUserInterface defaultFontWithSize:12.0f];
    textField.background = nil;
    
    [[UISearchBar appearance] setSearchTextPositionAdjustment:UIOffsetMake(0, 0.5)];
    
}

+ (void)configureTabBar
{
//    [[UITabBar appearance] setBackgroundImage:[SKFCodePaintedUIElements tabBarImage]];
//    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    
//    [[UITabBar appearance] setSelectionIndicatorImage:[[UIImage alloc] init]];
//    [[UITabBar appearance] setSelectionIndicatorImage:[[UIImage alloc] init]];

    [[UITabBar appearance] setBarTintColor:[UIColor whiteColor]];
    [[UITabBar appearance] setTintColor:[SKFUserInterface mainColor]];

    [[UITabBar appearance] setBackgroundColor:[SKFUserInterface almostWhiteColor]];
    
    [[UITabBarItem appearance] setTitleTextAttributes:
     @{
                                 UITextAttributeFont : [SKFUserInterface defaultFontWithSize:10.0f],
                            UITextAttributeTextColor : [SKFUserInterface darkerGrayColor]
     }
                                             forState:UIControlStateNormal];
    
    [[UITabBarItem appearance] setTitleTextAttributes:
     @{
                                 UITextAttributeFont : [SKFUserInterface defaultFontWithSize:10.0f],
                            UITextAttributeTextColor : [SKFUserInterface mainColor]
     }
                                             forState: UIControlStateSelected];
    
//    [[UITabBarItem appearance] setTitlePositionAdjustment:UIOffsetMake(0, 2.0f)];
}

+ (void)configureSegmentedControl
{
//    [[UISegmentedControl appearance] setBackgroundImage:[SKFCodePaintedUIElements segmentedControlBackgroundImage]
//                                               forState:UIControlStateNormal
//                                             barMetrics:UIBarMetricsDefault];
//    [[UISegmentedControl appearance] setBackgroundImage:[SKFCodePaintedUIElements segmentedControlSelectedBackgroundImage]
//                                               forState:UIControlStateHighlighted
//                                             barMetrics:UIBarMetricsDefault];
//    [[UISegmentedControl appearance] setBackgroundImage:[SKFCodePaintedUIElements segmentedControlSelectedBackgroundImage]
//                                               forState:UIControlStateSelected
//                                             barMetrics:UIBarMetricsDefault];
//    [[UISegmentedControl appearance] setDividerImage:[[UIImage alloc] init]
//                                 forLeftSegmentState:UIControlStateNormal
//                                   rightSegmentState:UIControlStateNormal
//                                          barMetrics:UIBarMetricsDefault];
    
    [[UISegmentedControl appearance] setTitleTextAttributes:
     @{
                                    UITextAttributeFont : [self defaultFontWithSize:12.0f],
                         UITextAttributeTextShadowColor : [UIColor clearColor],
                               UITextAttributeTextColor : [self darkerGrayColor]
     }
                                                forState:UIControlStateNormal];
    
    [[UISegmentedControl appearance] setTitleTextAttributes:
     @{
                                       UITextAttributeFont : [self defaultFontWithSize:12.0f],
                            UITextAttributeTextShadowColor : [UIColor clearColor],
                                  UITextAttributeTextColor : [self almostWhiteColor]
     }
                                                   forState:UIControlStateSelected];
    
    [[UISegmentedControl appearance] setTitleTextAttributes:
     @{
       UITextAttributeFont : [self defaultFontWithSize:12.0f],
       UITextAttributeTextShadowColor : [UIColor clearColor],
       UITextAttributeTextColor : [self almostWhiteColor]
       }
                                                   forState:UIControlStateHighlighted];
}


#pragma mark - colors

+ (UIColor *)mainColor
{
	return [SKFUserInterface defaultSKFUserInterface].mainColor;
}

+ (UIColor *)darkerMainColor
{
    UIColor* mainColor = [self mainColor];
    CGFloat brightness = 0.6;
    
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


+ (UIColor *)veryLightGrayColor
{
    UIColor *mainColor = [self almostWhiteColor];
    CGFloat mainColorHSBA[4];
    [mainColor getHue:&mainColorHSBA[0]
           saturation:&mainColorHSBA[1]
           brightness:&mainColorHSBA[2]
                alpha:&mainColorHSBA[3]];
    
    return [UIColor colorWithWhite:0.96 alpha:1.0f];
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
    return [UIColor whiteColor];
//    return [UIColor colorWithHue:0.0f saturation:0.0f brightness:0.98f alpha:1.0f];
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

+ (UIColor *)darkerOverlayColor
{
    return [UIColor colorWithWhite:0.0 alpha:0.3f];
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

+ (UIFont *)boldFontWithSize:(CGFloat)size
{
    return [UIFont fontWithName:[SKFUserInterface defaultSKFUserInterface].boldFontName size:size];
}

+ (UIFont *)boldFontForLabel:(UILabel *)label
{
    return [UIFont fontWithName:[SKFUserInterface defaultSKFUserInterface].boldFontName size:label.font.pointSize];
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
															borderColor:[SKFUserInterface mainColor]]
				forState:UIControlStateNormal];
		
		[button setBackgroundImage:[SKFCodePaintedUIElements buttonImageWithColor:[SKFUserInterface mainColor]
															borderColor:[SKFUserInterface mainColor]]
				forState:UIControlStateHighlighted];
		
		[button setTitleColor:[SKFUserInterface almostWhiteColor] forState:UIControlStateNormal];
		[button setTitleColor:[SKFUserInterface darkerMainColor] forState:UIControlStateHighlighted];

		button.titleLabel.font = [SKFUserInterface defaultFontWithSize:14.0f];
		button.backgroundColor = [UIColor clearColor];
	}
    
    if (style == SKFUserInterfaceButtonStyleDarkerMainColor)
	{
		[button setBackgroundImage:[SKFCodePaintedUIElements buttonImageWithColor:[SKFUserInterface darkerMainColor]
                                                                      borderColor:[SKFUserInterface darkerMainColor]]
                          forState:UIControlStateNormal];
		
		[button setBackgroundImage:[SKFCodePaintedUIElements buttonImageWithColor:[SKFUserInterface almostWhiteColor]
                                                                      borderColor:[SKFUserInterface almostWhiteColor]]
                          forState:UIControlStateHighlighted];
		
		[button setTitleColor:[SKFUserInterface almostWhiteColor] forState:UIControlStateNormal];
		[button setTitleColor:[SKFUserInterface mainColor] forState:UIControlStateHighlighted];
        
		button.titleLabel.font = [SKFUserInterface defaultFontWithSize:14.0f];
		button.backgroundColor = [UIColor clearColor];
	}
	
	if (style == SKFUserInterfaceButtonStyleGrayColor)
		{
		[button setBackgroundImage:[SKFCodePaintedUIElements buttonImageWithColor:[SKFUserInterface darkerGrayColor]
															borderColor:[SKFUserInterface darkerGrayColor]]
				forState:UIControlStateNormal];
		
		[button setBackgroundImage:[SKFCodePaintedUIElements buttonImageWithColor:[SKFUserInterface mainColor]
															borderColor:[SKFUserInterface mainColor]]
				forState:UIControlStateHighlighted];
		
		[button setTitleColor:[SKFUserInterface almostWhiteColor] forState:UIControlStateNormal];
		[button setTitleColor:[SKFUserInterface almostWhiteColor] forState:UIControlStateHighlighted];

            button.titleLabel.font = [SKFUserInterface defaultFontWithSize:14.0f];
		button.backgroundColor = [UIColor clearColor];
		}
    
    if (style == SKFUserInterfaceButtonStyleAlmostWhiteColor)
    {
		[button setBackgroundImage:[SKFCodePaintedUIElements buttonImageWithColor:[SKFUserInterface almostWhiteColor]
                                                                      borderColor:[SKFUserInterface darkerGrayColor]]
                          forState:UIControlStateNormal];
		
		[button setBackgroundImage:[SKFCodePaintedUIElements buttonImageWithColor:[SKFUserInterface mainColor]
                                                                      borderColor:[SKFUserInterface darkerMainColor]]
                          forState:UIControlStateHighlighted];
		
		[button setTitleColor:[SKFUserInterface textColor] forState:UIControlStateNormal];
		[button setTitleColor:[SKFUserInterface almostWhiteColor] forState:UIControlStateHighlighted];
        
		button.titleLabel.font = [SKFUserInterface defaultFontWithSize:14.0f];
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
		button.titleLabel.font = [SKFUserInterface defaultFontWithSize:14.0f];
		button.backgroundColor = [UIColor clearColor];
		}
	
}


+ (void)styleSearchBar:(UISearchBar *)searchBar
{

    
    searchBar.searchFieldBackgroundPositionAdjustment = UIOffsetMake(0, 0.5);
    

    searchBar.backgroundImage  = [SKFCodePaintedUIElements navigationBarImageForBarMetrics:UIBarMetricsDefault];
     
//    UIImage *image = [SKFCodePaintedUIElements searchBarImageWithColor:[SKFUserInterface almostWhiteColor] borderColor:[SKFUserInterface darkerMainColor]];
//    image = [[[UIImage alloc] init] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    
    [searchBar setImage:[UIImage imageNamed:@"SearchIcon"] forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
//    [searchBar setPositionAdjustment:UIOffsetMake(0.0f, 1.0f) forSearchBarIcon:UISearchBarIconSearch];
    
    [searchBar setImage:[UIImage imageNamed:@"SearchClearIcon"] forSearchBarIcon:UISearchBarIconClear state:UIControlStateNormal];
    [searchBar setPositionAdjustment:UIOffsetMake(0.0f, 0.5f) forSearchBarIcon:UISearchBarIconClear];
    
     [searchBar setImage:[UIImage imageNamed:@"SearchClearIconHighlighted"] forSearchBarIcon:UISearchBarIconClear state:UIControlStateHighlighted];
    searchBar.backgroundColor = [UIColor clearColor];


//    [searchBar setSearchFieldBackgroundImage:image
//                                    forState:UIControlStateNormal];
//    
//    [searchBar setScopeBarButtonTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[self normalFontWithSize:11.0f],UITextAttributeFont,
//                                                     [UIColor whiteColor],UITextAttributeTextColor,nil]
//                                           forState:UIControlStateNormal];
    
//    [searchBar setImage:[UIImage imageNamed:@"od_tabview_searchbar_magnifier"]
//       forSearchBarIcon:UISearchBarIconSearch
//                  state:UIControlStateNormal];
//    
//    [searchBar setImage:[UIImage imageNamed:@"od_search_navbar_clear_button"]
//       forSearchBarIcon:UISearchBarIconClear
//                  state:UIControlStateNormal];
    
}
@end

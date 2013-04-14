//
//  SKFUserInterface.h
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

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, SKFUserInterfaceButtonStyle)
{
	SKFUserInterfaceButtonStyleMainColor,
	SKFUserInterfaceButtonStyleAlmostWhiteColor,
	SKFUserInterfaceButtonStyleTextColor
};

@interface SKFUserInterface : NSObject

+ (void)configureUserInterfaceWithMainColor:(UIColor *)mainColor
								   fontName:(NSString *)fontName
						roundedCornerRadius:(CGFloat)roundedCornerRadius;

+ (UIColor *)mainColor;
+ (UIColor *)darkerMainColor;
+ (UIColor *)lighterMainColor;
+ (UIColor *)lighterGrayColor;
+ (UIColor *)grayColor;
+ (UIColor *)darkerGrayColor;
+ (UIColor *)textColor;
+ (UIColor *)almostWhiteColor;
+ (UIColor *)darkerTextColor;

+ (UIColor *)color:(UIColor *)color withSaturation:(CGFloat)saturation;

+ (UIFont *)defaultFontWithSize:(CGFloat)size;
+ (UIFont *)defaultFontForLabel:(UILabel *)label;
+ (UIFont *)defaultFontForTextField:(UITextField *)textField;
+ (UIFont *)defaultFontForTextView:(UITextView *)textView;

+ (CGFloat)roundedCornerRadius;
+ (void)addRoundedCornersToView:(UIView *)view withColor:(UIColor *)color;

+ (void)styleButton:(UIButton *)button forStyle:(SKFUserInterfaceButtonStyle)style;

@end

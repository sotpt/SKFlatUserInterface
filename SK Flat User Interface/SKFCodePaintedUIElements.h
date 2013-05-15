//
//  SKFCodePaintedUIElements.h
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

#import <UIKit/UIKit.h>

@interface SKFCodePaintedUIElements : NSObject

+ (UIImage *)backBarButtonItemImage;
+ (UIImage *)backBarButtonItemHighlightedImage;
+ (UIImage *)barButtonItemImage;
+ (UIImage *)barButtonItemHighlightedImage;

+ (UIImage *)navigationBarImageForBarMetrics:(UIBarMetrics)barMetrics;
+ (UIImage *)pinImage;
+ (UIImage *)pinImageWithColor:(UIColor *)color borderColor:(UIColor *)borderColor;
+ (UIImage *)pinImageWithColor:(UIColor *)color borderColor:(UIColor *)borderColor height:(CGFloat)height;

+ (UIImage *)buttonImageWithColor:(UIColor *)color borderColor:(UIColor *)borderColor;
+ (UIImage *)sandwichButtonImageForBarMetrics:(UIBarMetrics)barMetrics;
+ (UIImage *)searchBarImageWithColor:(UIColor *)color borderColor:(UIColor *)borderColor;
+ (UIImage *)sliderImageWihBorderColor:(UIColor *)borderColor fillColor:(UIColor *)fillColor;
+ (UIImage *)sliderKnobImageWihBorderColor:(UIColor *)borderColor fillColor:(UIColor *)fillColor withText:(NSString *)text;
+ (UIImage *)sliderImageWithColor:(UIColor *)color string:(NSString *)string textAlignment:(NSTextAlignment)textAlignment;
+ (UIImage *)calendarImageForDate:(NSDate *)date;
+ (UIImage *)highlightedCalendarImageForDate:(NSDate *)date;
+ (UIImage *)tabBarImage;
+ (UIImage *)tabBarSelectionIndicatorImage;
+ (UIImage *)segmentedControlBackgroundImage;
+ (UIImage *)segmentedControlSelectedBackgroundImage;
@end

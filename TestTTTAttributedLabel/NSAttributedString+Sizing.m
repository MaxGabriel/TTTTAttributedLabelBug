//
//  NSAttributedString+Sizing.m
//  TestTTTAttributedLabel
//
//  Created by Maximilian Tagher on 4/15/13.
//  Copyright (c) 2013 Max. All rights reserved.
//

#import "NSAttributedString+Sizing.h"
#import <CoreText/CoreText.h>

@implementation NSAttributedString (Sizing)

- (CGSize)sizeAsSingleLine
{
    CTLineRef singleLine = CTLineCreateWithAttributedString((__bridge CFMutableAttributedStringRef) self);
    
    CGFloat ascent, descent, leading;
    
    double lineWidth = CTLineGetTypographicBounds(singleLine, &ascent, &descent, &leading);
    CGFloat lineHeight = roundf(ascent) + roundf(descent) + roundf(leading);
    
    CFRelease(singleLine);
    
    return CGSizeMake(round(lineWidth), lineHeight);
}

@end

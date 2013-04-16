//
//  MXViewController.m
//  TestTTTAttributedLabel
//
//  Created by Maximilian Tagher on 4/15/13.
//  Copyright (c) 2013 Max. All rights reserved.
//

#import "MXViewController.h"
#import "TTTAttributedLabel.h"
#import "NSAttributedString+Sizing.h"

@interface MXViewController ()

@end

@implementation MXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *regularString = @"Test this sentence";
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:regularString];
    
    
    /*
    // Full width
    TTTAttributedLabel *fullWidthLabel = [[self class] baseTTTLabel];
    fullWidthLabel.backgroundColor = [UIColor purpleColor];
    fullWidthLabel.text = attributedString;
    fullWidthLabel.frame = CGRectMake(0, 0, 97, 40);
//    [testLabel sizeToFit]; // frame = {{0, 0}, {97, 15}}
    NSLog(@"fullWidthLabel frame = %@",NSStringFromCGRect(fullWidthLabel.frame));
    [self.view addSubview:fullWidthLabel];
     
    */
    
    // Less width -- truncates top part of text (trying to draw with multiple lines?)
    TTTAttributedLabel *nonFullWidthLabel = [[self class] baseTTTLabel];
    nonFullWidthLabel.backgroundColor = [UIColor blueColor];
//    NSLog(@"Created");
    nonFullWidthLabel.text = attributedString;
    NSLog(@"Set text");
    nonFullWidthLabel.frame = CGRectMake(0, 50, 87, 15);
    NSLog(@"Set frame");
//    NSLog(@"nonFullWidthLabel frame = %@",NSStringFromCGRect(nonFullWidthLabel.frame));
    [self.view addSubview:nonFullWidthLabel];
    NSLog(@"Added subview");
    
    /*
    
    // Standard `UILabel` at full width
    UILabel *fullWidthRegularLabel = [[self class] baseUILabel];
    fullWidthRegularLabel.text = regularString;
    fullWidthRegularLabel.frame = CGRectMake(0, 100, 139, 21);
    NSLog(@"regularLabel frame = %@",NSStringFromCGRect(fullWidthRegularLabel.frame));
//    [regularLabel sizeToFit]; {{0, 100}, {139, 21}}
    [self.view addSubview:fullWidthRegularLabel];
    
    // Expected Behavior for reducing width -- truncates without changing baseline (not sure if baseline is the accurate term)
    UILabel *nonFullWidthRegularLabel = [[self class] baseUILabel];
    nonFullWidthRegularLabel.text = regularString;
    CGRect smallerWidthRect = fullWidthLabel.frame;
    smallerWidthRect.origin.y = 150;
    smallerWidthRect.size.width = smallerWidthRect.size.width -= 10;
    nonFullWidthRegularLabel.frame = smallerWidthRect;
    [self.view addSubview:nonFullWidthRegularLabel];
    NSLog(@"nonFullWidthRegularLabel frame = %@",NSStringFromCGRect(nonFullWidthRegularLabel.frame));
    */
    
}

+ (TTTAttributedLabel *)baseTTTLabel
{
    TTTAttributedLabel *label = [[TTTAttributedLabel alloc] initWithFrame:CGRectZero];
    label.lineBreakMode = NSLineBreakByTruncatingTail;
    label.numberOfLines = 1;
    return label;
}

+ (UILabel *)baseUILabel
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.numberOfLines = 1;
    label.lineBreakMode = NSLineBreakByTruncatingTail;
    return label;
}

@end

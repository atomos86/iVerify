//
//  UITextField+Verify.h
//  iVerifyExample
//
//  Created by Brian Thomas on 9/25/13.
//  Copyright (c) 2013 WideEyeLabs. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Verify;

@interface UITextField (Verify)

- (void)setVerifyDelegate:(Verify *)delegate;
- (void)removeVerifyDelegate;
- (void)verifyItIsNotEmpty;
- (void)verifyItIsLongerThan:(NSNumber *)length;
- (void)verifyItIsANumber;
- (void)verifyItMatches:(NSString *)stringToMatch withDescription:(NSString *)desc;

@end

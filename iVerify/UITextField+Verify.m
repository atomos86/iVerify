//
//  UITextField+Verify.m
//  iVerifyExample
//
//  Created by Brian Thomas on 9/25/13.
//  Copyright (c) 2013 WideEyeLabs. All rights reserved.
//

#import <objc/runtime.h>
#import "UITextField+Verify.h"
#import "Verify.h"

static char verifyDelegateKey;

@implementation UITextField (Verify)

- (void)setVerifyDelegate:(Verify *)delegate
{
    objc_setAssociatedObject(self, &verifyDelegateKey, delegate, OBJC_ASSOCIATION_RETAIN);
}

- (Verify *)verifyDelegate
{
    return (Verify *)objc_getAssociatedObject(self, &verifyDelegateKey);
}

- (void)removeVerifyDelegate
{
    objc_removeAssociatedObjects(self);
}

- (void)verifyItIsNotEmpty
{
    Verify *verifier = [self verifyDelegate];
    if ([self.text isEqualToString:@""])
    {
        [verifier verificationFailedWithError:
         [NSString stringWithFormat:@"The %@ field must not be empty.",
          [verifier stringRepresentationForVerifyField:self]]];
    }
}

- (void)verifyItIsLongerThan:(NSNumber *)length
{
    Verify *verifier = [self verifyDelegate];
    if (self.text.length < length.intValue)
    {
        [verifier verificationFailedWithError:
         [NSString stringWithFormat:@"The %@ field must be longer than %u characters.",
          [verifier stringRepresentationForVerifyField:self], length.intValue]];
    }
}

- (void)verifyItIsANumber
{
    Verify *verifier = [self verifyDelegate];
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber *myNumber = [formatter numberFromString:self.text];
    if (myNumber == nil)
    {
        [verifier verificationFailedWithError:
         [NSString stringWithFormat:@"The %@ field must be a number.",
          [verifier stringRepresentationForVerifyField:self]]];
    }
}

- (void)verifyItMatches:(NSString *)stringToMatch withDescription:(NSString *)desc
{
    Verify *verifier = [self verifyDelegate];
    if (![self.text isEqualToString:stringToMatch])
    {
        [verifier verificationFailedWithError:
         [NSString stringWithFormat:@"The %@ field must match the %@.",
          [verifier stringRepresentationForVerifyField:self], desc]];
    }
}

@end

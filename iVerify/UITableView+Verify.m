//
//  UITableView+Verify.m
//  
//
//  Created by Brian Thomas on 9/25/13.
//
//

#import <objc/runtime.h>
#import "Verify.h"
#import "UITableView+Verify.h"

static char verifyDelegateKey;

@implementation UITableView (Verify)

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

- (void)verifyARowIsSelected
{
    Verify *verifier = [self verifyDelegate];
    if (!self.indexPathForSelectedRow)
    {
        [verifier verificationFailedWithError:
         [NSString stringWithFormat:@"You must select a %@.",
          [verifier stringRepresentationForVerifyField:self]]];
    }
}

@end

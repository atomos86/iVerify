//
//  UITableView+Verify.h
//  
//
//  Created by Brian Thomas on 9/25/13.
//
//

#import <UIKit/UIKit.h>

@class Verify;

@interface UITableView (Verify)

- (void)setVerifyDelegate:(Verify *)delegate;
- (void)removeVerifyDelegate;
- (void)verifyARowIsSelected;

@end

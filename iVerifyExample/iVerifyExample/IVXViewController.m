//
//  IVXViewController.m
//  iVerifyExample
//
//  Created by Brian Thomas on 9/25/13.
//  Copyright (c) 2013 WideEyeLabs. All rights reserved.
//

#import "IVXViewController.h"
#import <iVerify.h>

@interface IVXViewController ()

@end

@implementation IVXViewController

- (IBAction)test
{
    NSDictionary *inputViews = @{@"not empty":_nameField, @"number":_numberField};
    
    NSArray *errors = [Verify forInputs:inputViews that:^(Verify *inspect) {
        [(UITextField *)inspect[@"not empty"] verifyItIsNotEmpty];
        [(UITextField *)inspect[@"number"] verifyItIsANumber];
        [(UITextField *)inspect[@"number"] verifyItIsNotEmpty];
    }];
    
    NSString *errorMessage = [errors componentsJoinedByString:@"\n\n"];
    if ([errorMessage isEqualToString:@""]) errorMessage = @"None!";
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Errors.." message:errorMessage delegate:self cancelButtonTitle:@"Thanks." otherButtonTitles:nil];
    [alert show];
}

- (IBAction)resignResponders
{
    [_nameField resignFirstResponder];
    [_numberField resignFirstResponder];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  IVXViewController.h
//  iVerifyExample
//
//  Created by Brian Thomas on 9/25/13.
//  Copyright (c) 2013 WideEyeLabs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IVXViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *numberField;

- (IBAction)test;
- (IBAction)resignResponders;

@end

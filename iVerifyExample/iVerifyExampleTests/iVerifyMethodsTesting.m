//
//  iVerifyMethodsTesting.m
//  iVerifyExample
//
//  Created by Brian Thomas on 9/25/13.
//  Copyright (c) 2013 WideEyeLabs. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "IVXViewController.h"
#import <iVerify.h>

@interface iVerifyMethodsTesting : XCTestCase

@property (strong, nonatomic) UITextField *emptyField;
@property (strong, nonatomic) UITextField *numberField;
@property (strong, nonatomic) UITextField *fiveCharField;
@property (strong, nonatomic) NSDictionary *inputFields;

@end

@implementation iVerifyMethodsTesting

- (void)setUp
{
    [super setUp];
    
    _emptyField = [[UITextField alloc] init];
    
    _numberField = [[UITextField alloc] init];
    [_numberField setText:@"23"];
    
    _fiveCharField = [[UITextField alloc] init];
    [_fiveCharField setText:@"5char"];
    
    _inputFields = @{@"empty": _emptyField, @"5char": _fiveCharField, @"number": _numberField};
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testFieldNotEmptySuccess
{
    NSArray *errors = [Verify forInputs:_inputFields that:^(Verify *inspect) {
        [inspect[@"5char"] verifyItIsNotEmpty];
    }];
    
    XCTAssertNotNil(errors, @"No array was returned.");
    XCTAssert([errors count] == 0, @"An error was incorrectly generated.");
}

- (void)testFieldNotEmptyFailure
{
    NSArray *errors = [Verify forInputs:_inputFields that:^(Verify *inspect) {
        [inspect[@"empty"] verifyItIsNotEmpty];
    }];
    
    XCTAssertNotNil(errors, @"No array was returned.");
    XCTAssert([errors count] == 1, @"The inspection generated an incorrect amount of errors.");
    XCTAssert([@"The empty field must not be empty." isEqualToString:(NSString *)errors[0]], @"The error generated is not correct.");
}

- (void)testFieldLengthSuccess
{
    NSArray *errors = [Verify forInputs:_inputFields that:^(Verify *inspect) {
        [inspect[@"5char"] verifyItIsLongerThan:@4];
    }];
    
    XCTAssertNotNil(errors, @"No array was returned.");
    XCTAssert([errors count] == 0, @"An error was incorrectly generated.");
}

- (void)testFieldLengthFailure
{
    NSArray *errors = [Verify forInputs:_inputFields that:^(Verify *inspect) {
        [inspect[@"5char"] verifyItIsLongerThan:@6];
    }];
    
    XCTAssertNotNil(errors, @"No array was returned.");
    XCTAssert([errors count] == 1, @"The inspection generated an incorrect amount of errors.");
    XCTAssert([@"The 5char field must be longer than 6 characters." isEqualToString:(NSString *)errors[0]], @"The error generated is not correct.");
}

@end

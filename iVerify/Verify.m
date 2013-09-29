//
//  Verify.m
//  iVerifyExample
//
//  Created by Brian Thomas on 9/25/13.
//  Copyright (c) 2013 WideEyeLabs. All rights reserved.
//

#import "Verify.h"

@interface Verify()

@property (strong, nonatomic) NSMutableDictionary *views;

@end

@implementation Verify

- (id)init
{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    _errors = [[NSMutableArray alloc] init];
    _inputsToVerify = nil;
    
    return self;
}

+ (NSArray *)forInputs:(NSDictionary *)inputs that:(void (^)(Verify *))verifyBlock
{
    Verify *verifier = [[Verify alloc] init];
    verifier.inputsToVerify = inputs;
    verifyBlock(verifier);
    return verifier.errors;
}

- (id)objectForKeyedSubscript:(id)key
{
    id fieldForReturn = _inputsToVerify[key];
    [fieldForReturn setVerifyDelegate:self];
    return fieldForReturn;
}

- (NSString *)stringRepresentationForVerifyField:(id)field
{
    NSArray *keys = [_inputsToVerify allKeysForObject:field];
    NSString *stringRepresentation = [keys objectAtIndex:0];
    return stringRepresentation;
}

- (void)verificationFailedWithError:(NSString *)error
{
    [_errors addObject:error];
}

@end

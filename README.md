iVerify is a framework for determining if inputs in subclasses of UIView meet certain basic criteria.

## How To Get Started

iVerify can be installed via CocoaPods by adding "pod 'iVerify', git: 'https://github.com/atomos86/iVerify.git'" to your Podfile.

## Using iVerify

Using this framework is simple.  After importing the iVerify.h file you
will have access to the Verify object and all relevant verification
methods.

Example:
```objective-c
#import <iVerify.h>

// ..
// ..

NSDictionary *inputViews = @{ @"Name" : self.nameField, @"Password" : self.passwordField };

NSArray *errors = [Verify forInputs:inputViews that:^(Verify *inspect) {
  [inspect[@"Name"] verifyItIsNotEmpty];
  [inspect[@"Password] verifyItIsNotEmpty];
  [inspect[@"Password] verifyItIsLongerThan:@5];
}];

if ([errors count] != 0)
{
  // handle errors / present an alert
  NSString *errorMessage = [errors componentsJoinedByString:@"\n\n"];
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Errors.." message:errorMessage delegate:self cancelButtonTitle:@"Thanks." otherButtonTitles:nil];
  [alert show];
}
else
{
  // proceed
}
```

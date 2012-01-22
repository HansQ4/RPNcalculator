//
//  CalculatorAppDelegate.m
//  Calculator
//
//  Created by Hans Winterink on 21-01-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalculatorAppDelegate.h"
#import "CalculatorBrain.h"

@interface CalculatorAppDelegate()
@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;
@property (strong) CalculatorBrain *myBrain;
@end

@implementation CalculatorAppDelegate

@synthesize window = _window;
@synthesize mydisplay = _mydisplay;
@synthesize myBrain = _myBrain;
@synthesize userIsInTheMiddleOfEnteringANumber = _userIsInTheMiddleOfEnteringANumber;



- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    self.myBrain = [[CalculatorBrain alloc] init];
    
}

- (IBAction)digitPressed:(NSButton *)sender {
    
    NSString *digit = sender.title;
    NSLog(@"digit pressed = %@", digit);
    
    if (self.userIsInTheMiddleOfEnteringANumber) {
        NSString *currentText = [self.mydisplay stringValue];
        NSString *newText = [currentText stringByAppendingString:digit];
        [self.mydisplay setStringValue:newText];
        
    } else {
        [self.mydisplay setStringValue:digit];
        self.userIsInTheMiddleOfEnteringANumber = YES;        
    }
}

- (IBAction)enterPressed:(id)sender {
    [self.myBrain pushOperand:[self.mydisplay doubleValue]];
    self.userIsInTheMiddleOfEnteringANumber = NO;    
}

- (IBAction)operationPressed:(NSButton *)sender {
    NSString *operation = sender.title;
    
    NSLog(@"Operation pressed");
    
    if (self.userIsInTheMiddleOfEnteringANumber) [self enterPressed:nil];
    double result = [self.myBrain performOperation:operation];
    NSString *resultString = [NSString stringWithFormat:@"%g", result];
    [self.mydisplay setStringValue:resultString];
    
}



@end

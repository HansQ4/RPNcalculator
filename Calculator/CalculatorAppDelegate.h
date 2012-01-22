//
//  CalculatorAppDelegate.h
//  Calculator
//
//  Created by Hans Winterink on 21-01-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface CalculatorAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *mydisplay;


- (IBAction)digitPressed:(id)sender;
- (IBAction)operationPressed:(id)sender;
- (IBAction)enterPressed:(id)sender;


@end

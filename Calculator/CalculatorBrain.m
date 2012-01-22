//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Hans Winterink on 22-01-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain()
@property (nonatomic, strong) NSMutableArray *operandStack;
@end

@implementation CalculatorBrain

@synthesize operandStack =_operandStack;

- (NSMutableArray *) operandStack {
    if (_operandStack == nil) _operandStack = [[NSMutableArray alloc] init];
    return _operandStack;
}

- (void) setOperandStack:(NSMutableArray *)operandStack {
    _operandStack = operandStack;
}

- (void) pushOperand: (double)operand
{
    NSNumber *operandObject  = [NSNumber numberWithDouble:operand];
    [self.operandStack addObject:operandObject];
}

- (double) popOperand {
    NSNumber *operandObject = [self.operandStack lastObject];
    if (operandObject) [self.operandStack removeLastObject];
    return [operandObject doubleValue];
}

- (double)performOperation: (NSString *)operation
{
    NSLog(@"operation %@", operation);
    double result = 0;
    // caluclate result
    
    if ([operation isEqualToString:@"+"]) {
        result = [self popOperand] + [self popOperand];
    }

    if ([operation isEqualToString:@"-"]) {
        double oper1 = [self popOperand];
        double oper2 = [self popOperand];
        
        result = oper2 - oper1;
        //result = [self popOperand] - [self popOperand];
    }

    if ([operation isEqualToString:@"*"]) {
        result = [self popOperand] * [self popOperand];
    }
    
    if ([operation isEqualToString:@"/"]) 
    {
        double oper1 = [self popOperand];
        double oper2 = [self popOperand];
        
        result = oper2 / oper1;
        //result = [self popOperand] - [self popOperand];
    }

    [self pushOperand:result];
    return result;
}

@end


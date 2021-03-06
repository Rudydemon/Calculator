//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Peri Smith on 2/2/15.
//  Copyright (c) 2015 Peri Smith. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain()
@property (nonatomic, strong) NSMutableArray *operandStack;
@end

@implementation CalculatorBrain

@synthesize operandStack = _operandStack;
- (NSMutableArray *)operandStack
{
    if (!_operandStack) {
        _operandStack = [[NSMutableArray alloc] init];
    }
    return _operandStack;
}

- (void)pushOperand:(double)operand
{
    NSNumber *operandObject = [NSNumber numberWithDouble:operand];
    [self.operandStack addObject:operandObject];
}

- (double) popOperand
{
    NSNumber *operandObject = [self.operandStack lastObject];
    if (operandObject) [self.operandStack removeLastObject];
    return [operandObject doubleValue];
}

-(void) clearOperand
{
     return [self.operandStack removeAllObjects];    
}

- (double)performOperation:(NSString *)operation
{
    double result = 0;
    
    if ([operation isEqualToString:@"+"]) {
        result = [self popOperand] + [self popOperand];
    }
    else if ([@"*" isEqualToString:operation])
    {
        result = [self popOperand] * [self popOperand];
    }
    else if ([operation isEqualToString:@"-"])
    {
        double subtrahend = [self popOperand];
        result = [self popOperand] - subtrahend;
    }
    else if ([operation isEqualToString:@"/"])
    {
        double divisor = [self popOperand];
        if (divisor) result = [self popOperand] / divisor;
    }
    else if ([operation isEqualToString:@"sin"])
    {
        double sinop = [self popOperand];
        result = sin(sinop);
    }
    else if ([operation isEqualToString:@"cos" ])
    {
        double cosop = [self popOperand];
        result = cos(cosop);
    }
    else if ([operation isEqualToString:@"sqrt"])
    {
        double rt = [self popOperand];
        result = sqrt(rt);
    }
    else if ([operation isEqualToString:@"π"])
    {
        result = M_PI * [self popOperand];
    }
    else if ([operation isEqualToString:@"+/-"])
    {
        result = -1 * [self popOperand];
    }
    [self pushOperand:result];
    
    return result;
}

@end

//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Peri Smith on 2/2/15.
//  Copyright (c) 2015 Peri Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

- (void)pushOperand:(double)operand;
- (double)performOperation:(NSString *)operation;

@end

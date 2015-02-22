//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Peri Smith on 2/2/15.
//  Copyright (c) 2015 Peri Smith. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"

@interface CalculatorViewController()
@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;
@property (nonatomic, strong) CalculatorBrain *brain;
@end


@implementation CalculatorViewController

@synthesize whole_display;
@synthesize display;
@synthesize userIsInTheMiddleOfEnteringANumber;
@synthesize brain = _brain;

- (CalculatorBrain *)brain
{
    if(!_brain) _brain = [[CalculatorBrain alloc] init];
    return _brain;
}

- (IBAction)digitPressed:(UIButton *)sender
{
    NSString *digit = [sender currentTitle];
    if (self.userIsInTheMiddleOfEnteringANumber)
    {
    self.display.text = [self.display.text stringByAppendingString:digit];
    }
    else
    {
        self.display.text = digit;
        self.userIsInTheMiddleOfEnteringANumber = YES;
    }
    
    if (self.userIsInTheMiddleOfEnteringANumber)
    {
        self.whole_display.text = [self.whole_display.text stringByAppendingString:digit];
    }
    else
    {
        self.whole_display.text = digit;
        self.userIsInTheMiddleOfEnteringANumber = YES;
    }

}
- (IBAction)decimalPressed:(UIButton *)sender
{
    NSString *decimal = [sender currentTitle];
    
    if (self.userIsInTheMiddleOfEnteringANumber)
    {
        self.display.text = [self.display.text stringByAppendingString:decimal];
    }
    else
    {
        self.display.text = decimal;
        self.userIsInTheMiddleOfEnteringANumber = YES;
    }
    
    if (self.userIsInTheMiddleOfEnteringANumber)
    {
        self.whole_display.text = [self.whole_display.text stringByAppendingString:decimal];
    }
    else
    {
        self.whole_display.text = decimal;
        self.userIsInTheMiddleOfEnteringANumber = YES;
    }
}

- (IBAction)enterPressed
{
    [self.brain pushOperand:[self.display.text doubleValue]];
    self.userIsInTheMiddleOfEnteringANumber = NO;
}

- (IBAction)operationPressed:(id)sender
{
    if (self.userIsInTheMiddleOfEnteringANumber) {
        [self enterPressed];
    }
    NSString *operation = [sender currentTitle];
    double result = [self.brain performOperation:operation];
    self.display.text = [NSString stringWithFormat:@"%g", result];
    self.whole_display.text = [self.whole_display.text stringByAppendingString:operation];
}


@end
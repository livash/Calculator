//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Olena Ivashyna on 9/1/14.
//  Copyright (c) 2014 __Olena_I__. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"

@interface CalculatorViewController ()
@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;
@property (nonatomic, strong) CalculatorBrain *brain;

@end

@implementation CalculatorViewController

@synthesize display = _display;
@synthesize userIsInTheMiddleOfEnteringANumber =
            _userIsInTheMiddleODfEnteringANumber;
@synthesize brain = _brain;

- (CalculatorBrain *)brain {
    NSLog(@"Olena was here :)");
    if (_brain == nil) _brain = [[CalculatorBrain alloc] init];
    NSLog(@"Olena was here and after layzy :)");
    return _brain;
}

- (IBAction)operationPressed:(UIButton *)sender {
    if (self.userIsInTheMiddleOfEnteringANumber) [self enterPressed];
    double result = [self.brain performOperation:sender.currentTitle];
    NSString *resultString = [NSString stringWithFormat:@"%g", result];
    self.display.text = resultString;
}


- (IBAction)enterPressed {
    NSLog(@"Olena 1");

    [self.brain pushOperand:[self.display.text doubleValue]];
    NSLog(@"Olena 2");
    self.userIsInTheMiddleOfEnteringANumber = NO;
    NSLog(@"Olena 3");
}
//- (IBAction)enterPressed {
//    [self.brain pushOperand:[self.display.text doubleValue]];
//    self.userIsInTheMiddleOfEnteringANumber = NO;
//}


- (IBAction)digitPressed:(UIButton *)sender {
    NSString *digit = [sender currentTitle];
//    NSLog(@"digit pressed = %@", digit);
//    UILabel *myDisplay = self.display;
//    NSString *currentText = myDisplay.text;  //[myDisplay text];
//    NSString *newText = [currentText stringByAppendingString:digit];
//    myDisplay.text = newText; //[myDisplay setText:newText];
    if (self.userIsInTheMiddleOfEnteringANumber) {
        self.display.text = [self.display.text stringByAppendingString:digit];
    } else {
        self.display.text = digit;
        self.userIsInTheMiddleOfEnteringANumber = YES;
    }
}

@end

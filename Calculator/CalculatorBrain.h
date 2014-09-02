//
//  CalculatorBrain.h
//  Calculator for Reverse Polish Notation
//
//  Created by Olena Ivashyna on 9/1/14.
//  Copyright (c) 2014 __Olena_I__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

- (void)pushOperand:(double)operand;
- (double)performOperation:(NSString *)operation;

@end

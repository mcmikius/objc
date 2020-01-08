//
//  ViewController.m
//  CalculatorObjc
//
//  Created by Mykhailo Bondarenko on 08.01.2020.
//  Copyright © 2020 Mykhailo Bondarenko. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _displayTextField.text = [NSString stringWithFormat:@"0"];
}


- (IBAction)numberButton:(id)sender {
    if (!numberString) {
        numberString = [NSString stringWithFormat:@"%d", [sender tag]];
    } else {
        numberString = [NSString stringWithFormat:@"%@%d", numberString, [sender tag]];
        _displayTextField.text = [NSString stringWithFormat:@"%@", numberString];
    }
}

- (IBAction)functionButton:(id)sender {
    if (function == 0) {
        firstNumber = [numberString intValue];
        numberString = nil;
        _displayTextField.text = [NSString stringWithFormat:@"%d", firstNumber];
    } else {
        secondNumber = [numberString intValue];
        _displayTextField.text = [NSString stringWithFormat:@"0"];
        numberString = nil;
        
        if (function == 10) {
            firstNumber = firstNumber + secondNumber;
        } else if (function == 11) {
            firstNumber = firstNumber - secondNumber;
        } else if (function == 12) {
            firstNumber = firstNumber / secondNumber;
        } else if (function == 13) {
            firstNumber = firstNumber * secondNumber;
        }
        _displayTextField.text = [NSString stringWithFormat:@"%d", firstNumber];
        
    }
}

- (IBAction)calculateResult:(id)sender {
    
}
@end

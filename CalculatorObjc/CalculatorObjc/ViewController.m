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
    } else numberString = [NSString stringWithFormat:@"%@%d", numberString, [sender tag]];
    _displayTextField.text = [NSString stringWithFormat:@"%@", numberString];
}

- (IBAction)functionButton:(id)sender {
}

- (IBAction)calculateResult:(id)sender {
}
@end

//
//  TemperatureViewController.m
//  Converter
//
//  Created by Mykhailo Bondarenko on 12.12.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

#import "TemperatureViewController.h"

@interface TemperatureViewController ()

@end

@implementation TemperatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)tempConvert:(id)sender {
    double fahren = [_tempTextField.text doubleValue];
    double celsius = (fahren - 32) / 1.0;
    [_tempTextField resignFirstResponder];
    NSString * result = [[NSString alloc] initWithFormat:@"Celsius: %f", celsius];
    _tempCompleteLabel.text = result;
}
- (IBAction)backgroundTouchedHideKeyboard:(id)sender {
    [_tempTextField resignFirstResponder];
}
@end

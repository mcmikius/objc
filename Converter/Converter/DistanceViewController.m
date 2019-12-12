//
//  DistanceViewController.m
//  Converter
//
//  Created by Mykhailo Bondarenko on 12.12.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

#import "DistanceViewController.h"

@interface DistanceViewController ()

@end

@implementation DistanceViewController

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

- (IBAction)buttonConvert:(id)sender {
    double miles = [_distanceTextField.text doubleValue];
    double km = miles * 1.61;
    [_distanceTextField resignFirstResponder];
    NSString * result = [[NSString alloc]initWithFormat:@"KM: %f", km];
    _completeLabel.text = result;
}
@end

//
//  ViewController.m
//  Hello
//
//  Created by Mykhailo Bondarenko on 12.12.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)buttonCompleted:(id)sender {
    if (![_nameTextField.text isEqualToString:@""]) {
        NSString * textMessage = [NSString stringWithFormat:@"Hello, %@", _nameTextField.text];
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Message"
               message:textMessage
        preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* yesButton = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:yesButton];

        [self presentViewController:alert animated:YES completion:nil];
    } else {
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Alert!"
               message:@"Type you name to text filed"
        preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* yesButton = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:yesButton];

        [self presentViewController:alert animated:YES completion:nil];
    }
    
}
@end

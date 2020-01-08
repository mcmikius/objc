//
//  ViewController.h
//  CalculatorObjc
//
//  Created by Mykhailo Bondarenko on 08.01.2020.
//  Copyright © 2020 Mykhailo Bondarenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    NSString *numberString;
    int function;
    int firstNumber;
    int secondNumber;
}
@property (weak, nonatomic) IBOutlet UITextField *displayTextField;
- (IBAction)numberButton:(id)sender;
- (IBAction)functionButton:(id)sender;
- (IBAction)calculateResult:(id)sender;


@end


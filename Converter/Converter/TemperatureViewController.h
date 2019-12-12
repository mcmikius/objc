//
//  TemperatureViewController.h
//  Converter
//
//  Created by Mykhailo Bondarenko on 12.12.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TemperatureViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *tempTextField;
- (IBAction)tempConvert:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *tempCompleteLabel;
-(IBAction)backgroundTouchedHideKeyboard:(id)sender;

@end

NS_ASSUME_NONNULL_END

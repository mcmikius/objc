//
//  DistanceViewController.h
//  Converter
//
//  Created by Mykhailo Bondarenko on 12.12.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DistanceViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *distanceTextField;
- (IBAction)buttonConvert:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *completeLabel;

@end

NS_ASSUME_NONNULL_END

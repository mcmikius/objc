//
//  ViewController.m
//  ToDoObjc
//
//  Created by Mykhailo Bondarenko on 12.12.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UIButton *buttonSave;


@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.datePicker.minimumDate = [NSDate date];
    [self.datePicker addTarget:self action:@selector(datePickerValueChanged) forControlEvents:UIControlEventValueChanged];
    
    [self.buttonSave addTarget:self action:@selector(save) forControlEvents:UIControlEventTouchUpInside];
    
    UITapGestureRecognizer * handleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleEndEditing)];
    [self.view addGestureRecognizer:handleTap];
}

- (void) datePickerValueChanged {
    self.eventDate = self.datePicker.date;
    NSLog(@"date Picker %@", self.eventDate);
}

- (void) handleEndEditing {
    [self.view endEditing:YES];
}

- (void) save {
    NSString * eventInfo = self.textField.text;
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"HH:mm dd.MMMM.yyyy";
    NSString * eventDate = [formatter stringFromDate:self.eventDate];
    NSDictionary * dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:eventInfo, @"eventInfo", eventDate, @"eventDate", nil];
    UILocalNotification * notification = [[UILocalNotification alloc]init];
    notification.userInfo = dictionary;
    notification.timeZone = [NSTimeZone defaultTimeZone];
    notification.fireDate = self.eventDate;
    notification.alertBody = eventInfo;
    notification.applicationIconBadgeNumber = 1;
    notification.soundName = UILocalNotificationDefaultSoundName;
    [[UIApplication sharedApplication]scheduleLocalNotification:notification];
    
    NSLog(@"save");
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ([textField isEqual:self.textField]) {
        [self.textField resignFirstResponder];
    }
    
    
    
    return YES;
}

@end

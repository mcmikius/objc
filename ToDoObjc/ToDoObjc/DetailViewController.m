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
    
    self.buttonSave.userInteractionEnabled = NO;
    
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
    if ([self.textField.text length] != 0){
    [self.view endEditing:YES];
    self.buttonSave.userInteractionEnabled = YES;
    } else {
        [self showAlertWithMessage:@"For save event inputs text in Text Field"];
    }
}

- (void) save {
    
    if (self.eventDate) {
        if ([self.eventDate compare:[NSDate date]] == NSOrderedSame) {
            [self showAlertWithMessage:@"Event's date do not equel current date"];
        } else if ([self.eventDate compare:[NSDate date]] == NSOrderedAscending) {
            [self showAlertWithMessage:@"Event's date do not early current date"];
        } else {
            [self setNotification];
        }
        
    } else {
        [self showAlertWithMessage:@"For save event change date"];
    }
    
    NSLog(@"save");
}

- (void) setNotification {
    
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
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ([textField isEqual:self.textField]) {
        if ([self.textField.text length] != 0){
        [self.textField resignFirstResponder];
        self.buttonSave.userInteractionEnabled = YES;
        return YES;
        } else {
            [self showAlertWithMessage:@"For save event inputs text in Text Field"];
        }
    }
    return NO;
}

- (void) showAlertWithMessage : (NSString *) message {
//    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Alert!" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    UIAlertController * alert = [UIAlertController
    alertControllerWithTitle:@"Alert!"
                     message:message
              preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* okButton = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    
    [alert addAction:okButton];
    [self presentViewController:alert animated:YES completion:nil];
//    [alert show];
}

@end

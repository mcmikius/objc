//
//  ViewController.h
//  ToDoObjc
//
//  Created by Mykhailo Bondarenko on 12.12.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (nonatomic, strong) NSDate * eventDate;
@property (nonatomic, strong) NSString * eventInfo;
@property (nonatomic, assign) BOOL isDetail;

@end


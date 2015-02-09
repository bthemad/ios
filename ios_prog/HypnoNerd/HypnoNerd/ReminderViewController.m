//
//  ReminderViewController.m
//  HypnoNerd
//
//  Created by Alexander Kudryashov on 09.02.2015.
//  Copyright (c) 2015 Alexander Kudryashov. All rights reserved.
//

#import "ReminderViewController.h"

@interface ReminderViewController ()

@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;

@end

@implementation ReminderViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

    if (self) {
        self.tabBarItem.title = @"Reminder";
        UIImage *i = [UIImage imageNamed:@"Time.png"];
        self.tabBarItem.image = i;
    }

    return self;
}

- (IBAction)addReminer:(id)sender {
    NSDate *date = self.datePicker.date;
    NSLog(@"Setting reminder for date: %@", date);

    UILocalNotification *note = [[UILocalNotification alloc] init];
    note.alertBody = @"Hypnotize me!";
    note.fireDate = date;

    [[UIApplication sharedApplication] scheduleLocalNotification:note];
}

@end

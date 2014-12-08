//
//  AppDelegate.h
//  iTahDoodle
//
//  Created by Alexander Kudryashov on 08.12.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic) UITableView *taskTable;
@property (nonatomic) UITextField *taskField;
@property (nonatomic) UIButton *insertButton;

@property (nonatomic) NSMutableArray *tasks;

- (void)addTask:(id)sender;

@end


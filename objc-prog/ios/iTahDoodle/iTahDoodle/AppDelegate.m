//
//  AppDelegate.m
//  iTahDoodle
//
//  Created by Alexander Kudryashov on 08.12.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#import "AppDelegate.h"

NSString *docPath() {
    NSArray *pathList = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                            NSUserDomainMask,
                                                            YES);
    return [pathList[0] stringByAppendingPathComponent:@"data.td"];
}

@interface AppDelegate ()

@end

@implementation AppDelegate

# pragma mark - Application delegates callbacks

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSArray *plist = [NSArray arrayWithContentsOfFile:docPath()];
    if (plist) {
        self.tasks = [plist mutableCopy];
    } else {
        self.tasks = [NSMutableArray array];
    }

    // Create and configure the UIWindow instance
    CGRect winFrame = [[UIScreen mainScreen] bounds];
    UIWindow *theWindow = [[UIWindow alloc] initWithFrame:winFrame];
    self.window = theWindow;
    
    // Define the frame rectangles of the three UI elements
    CGRect tableFrame = CGRectMake(0, 80, winFrame.size.width, winFrame.size.height - 100);
    CGRect fieldFrame = CGRectMake(20, 40, 200, 31);
    CGRect buttonFrame = CGRectMake(228, 40, 72, 31);
    
    // Create and configure the UITableView instance
    self.taskTable = [[UITableView alloc] initWithFrame:tableFrame
                                                  style:UITableViewStylePlain];
    self.taskTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.taskTable.dataSource = self;
    
    // Tell the table view withc class to instantiate whenever it needs to create a cell
    [self.taskTable registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"Cell"];
    
    //Create and configure the UITextField instance where the tasks will be entered
    self.taskField = [[UITextField alloc] initWithFrame:fieldFrame];
    self.taskField.borderStyle = UITextBorderStyleRoundedRect;
    self.taskField.placeholder = @"Type a task, tap insert";
    
    // Create and configure the UIButton instance
    self.insertButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.insertButton.frame = buttonFrame;
    
    // Give the button a title
    [self.insertButton setTitle:@"Insert" forState:UIControlStateNormal];
    [self.insertButton addTarget:self
                          action:@selector(addTask:)
                forControlEvents:UIControlEventTouchUpInside];

    [self.window addSubview:self.taskTable];
    [self.window addSubview:self.taskField];
    [self.window addSubview:self.insertButton];

    // Finalize the window and put it on the screen
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [self.tasks writeToFile:docPath() atomically:YES];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

# pragma mark - Actions
- (void)addTask:(id)sender {
    NSString *text = [self.taskField text];

    if ([text length] == 0) {
        return;
    }

    [self.tasks addObject:text];
    [self.taskTable reloadData];
    [self.taskField setText:@""];
    // Dismiss the keyboard
    [self.taskField resignFirstResponder];
}

# pragma mark - Table view management
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.tasks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *c = [self.taskTable dequeueReusableCellWithIdentifier:@"Cell"];
    NSString *item = [self.tasks objectAtIndex:indexPath.row];
    c.textLabel.text = item;

    return c;
}

@end

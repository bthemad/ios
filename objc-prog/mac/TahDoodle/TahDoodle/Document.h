//
//  Document.h
//  TahDoodle
//
//  Created by Alexander Kudryashov on 13.12.2014.
//  Copyright (c) 2014 Alexander Kudryashov. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Document : NSDocument <NSTableViewDataSource>

@property NSMutableArray *tasks;
@property IBOutlet NSTableView *taskTable;

- (IBAction)addTask:(id)sender;
- (IBAction)deleteTask:(id)sender;

@end

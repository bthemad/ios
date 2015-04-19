//
//  HypnosisViewController.m
//  HypnoNerd
//
//  Created by Alexander Kudryashov on 09.02.2015.
//  Copyright (c) 2015 Alexander Kudryashov. All rights reserved.
//

#import "HypnosisViewController.h"
#import "HypnosisView.h"

@interface HypnosisViewController ()

@end

@implementation HypnosisViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

    if (self) {
        self.tabBarItem.title = @"Hypnotize";
        UIImage *i = [UIImage imageNamed:@"Hypno.png"];
        self.tabBarItem.image = i;
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@", NSStringFromClass([self class]));
}

- (void)loadView {
    HypnosisView *hypnosisView = [[HypnosisView alloc] init];
    self.view = hypnosisView;
}

@end

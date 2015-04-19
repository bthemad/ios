//
//  QuizViewController.m
//  Quiz
//
//  Created by Alexander Kudryashov on 11.01.2015.
//  Copyright (c) 2015 Alexander Kudryashov. All rights reserved.
//

#import "QuizViewController.h"

@interface QuizViewController ()

@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UILabel *answerLabel;

@property (nonatomic) int currentQuestionIndex;
@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;

@end

@implementation QuizViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

    if (self) {
        self.questions = @[@"From what cognac is made?",
                           @"What's 7 + 7?",
                           @"What's the capital of Vermont"];
        self.answers = @[@"Grapes",
                         @"14",
                         @"Montpelier"];

        self.tabBarItem.title = @"Quiz";
        self.tabBarItem.image = [UIImage imageNamed:@"Quiz"];
    }

    return self;
}

# pragma mark -
- (IBAction)showQuestion:(id)sender {
    self.currentQuestionIndex++;
    
    if (self.currentQuestionIndex == [self.questions count]) {
        self.currentQuestionIndex = 0;
    }
    
    NSString *question = self.questions[self.currentQuestionIndex];
    self.questionLabel.text = question;
    
    self.answerLabel.text = @"???";
}

- (IBAction)showAnswer:(id)sender {
    NSString *answer = self.answers[self.currentQuestionIndex];
    self.answerLabel.text = answer;
}

# pragma mark -
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

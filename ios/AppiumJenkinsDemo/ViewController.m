//
//  ViewController.m
//  AppiumJenkinsDemo
//
//  Created by Vishal Banthia on 3/18/15.
//
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *xTextField;
@property (weak, nonatomic) IBOutlet UITextField *yTextField;
@property (weak, nonatomic) IBOutlet UITextView *operatorTextView;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) IBOutlet UIButton *subButton;
@property (weak, nonatomic) IBOutlet UIButton *resetButton;
@property (weak, nonatomic) IBOutlet UITextView *resultTextView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _xTextField.delegate = self;
    _yTextField.delegate = self;
    
    [_xTextField setAccessibilityLabel:@"xTextField"];
    [_yTextField setAccessibilityLabel:@"yTextField"];
    [_addButton setAccessibilityLabel:@"addButton"];
    [_subButton setAccessibilityLabel:@"subButton"];
    [_resetButton setAccessibilityLabel:@"resetButton"];
    [_resultTextView setAccessibilityLabel:@"resultTextView"];
}

- (IBAction)add:(id)sender {
    int x = [self.xTextField.text intValue];
    int y = [self.yTextField.text intValue];
    
    self.operatorTextView.text = @"+";
    self.resultTextView.text = [NSString stringWithFormat:@"%d",(x + y)];
}
- (IBAction)sub:(id)sender {
    int x = [self.xTextField.text intValue];
    int y = [self.yTextField.text intValue];
    
    self.operatorTextView.text = @"-";

    // Instead of subtracting y from x, I am adding it to create a bug.
    // Lets see how Appium test catch this bug.
    self.resultTextView.text = [NSString stringWithFormat:@"%d",(x + y)];
}
- (IBAction)reset:(id)sender {
    self.xTextField.text = @"";
    self.yTextField.text = @"";
    self.operatorTextView.text = @"";
    self.resultTextView.text = @"";
}

#pragma mark -
- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

@end

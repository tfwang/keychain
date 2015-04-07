//
//  ViewController.m
//  keychain
//
//  Created by 茅矛 on 15-4-7.
//  Copyright (c) 2015年 tfwang. All rights reserved.
//

#import "ViewController.h"
#import "UserDataManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _inputPasswordTextField.secureTextEntry = true;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)click:(UIButton *)sender {
    NSLog(@"click");
    if (![_inputPasswordTextField.text isEqualToString:@""]) {
        [UserDataManager savePassword:_inputPasswordTextField.text];
    }
    [_shouPasswordLabel setText:(NSString *)[UserDataManager readPassword]];
}
- (IBAction)deleteClick:(UIButton *)sender {
    [UserDataManager deletePassword];
}

@end

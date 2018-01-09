//
//  LoginViewController.m
//  iOSTest
//
//  Created by App Partner on 9/6/16.
//  Copyright © 2016 AppPartner. All rights reserved.
//

#import "LoginViewController.h"
#import "MenuViewController.h"
#import "LoginClient.h"

@interface LoginViewController ()

@property (nonatomic, strong) LoginClient *client;
@property (weak, nonatomic) UITextField *loginTextField;
@property (weak, nonatomic) UITextField *passwordTextField;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UIImageView *imageView;


@end

@implementation LoginViewController

/**
 * =========================================================================================
 * INSTRUCTIONS
 * =========================================================================================
 * 1) Make the UI look like it does in the mock-up.
 *
 * 2) Take username and password input from the user using UITextFields
 *
 * 3) Using the following endpoint, make a request to login
 *    URL: http://dev3.apppartner.com/AppPartnerDeveloperTest/scripts/login.php
 *    Parameter One: username
 *    Parameter Two: password
 *
 * 4) A valid username is 'AppPartner'
 *    A valid password is 'qwerty'
 *
 * 5) Calculate how long the API call took in milliseconds
 *
 * 6) If the response is an error display the error in a UIAlertView
 *
 * 7) If the response is successful display the success message AND how long the API call took in milliseconds in a UIAlertView
 *
 * 8) When login is successful, tapping 'OK' in the UIAlertView should bring you back to the main menu.
**/


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Login";
    
    [self setNavigationBar];
    [self addSubviews];
    [self addConstraints];
}

- (void)setNavigationBar
{
    self.navigationController.navigationBar.topItem.title = @"Back";
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

- (void)addSubviews
{
    [self setLoginTextField];
    [self setPasswordTextField];
    [self setLoginButton];
    [self setLoginImage];
}

- (void)addConstraints
{
    //[self setLoginTextFieldConstraint];
    [self setLoginButtonConstraint];
    [self setLoginImageConstraint];
}

- (void)setLoginTextField
{
    UIView *superview = self.view;
    UITextField *textField = self.loginTextField;
    UILabel *prefixLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    
    prefixLabel.text =@"       ";
    [prefixLabel setFont:[UIFont boldSystemFontOfSize:14]];
    [prefixLabel sizeToFit];
  
    textField = [[UITextField  alloc]init];
    textField.borderStyle = UITextBorderStyleNone;
    textField.translatesAutoresizingMaskIntoConstraints = NO;
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    textField.placeholder = @"username";
    textField.leftView = prefixLabel;
    textField.leftViewMode = UITextFieldViewModeAlways;
    textField.font = [UIFont fontWithName:@"Helvetica" size:18.0f];
    textField.layer.cornerRadius = 10;
    textField.layer.borderColor = [[UIColor colorWithRed:0.61 green:0.61 blue:0.61 alpha:1.0]CGColor];
    textField.layer.borderWidth = 1.0f;

    self.loginTextField = textField;
     // Adds the textField to the view.
    [superview addSubview:textField];
    
    NSLayoutConstraint *loginTextFieldXConstraint = [NSLayoutConstraint constraintWithItem:textField attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeCenterX multiplier:1 constant:0.0f];
    
    NSLayoutConstraint *loginTextFieldYConstraint = [NSLayoutConstraint constraintWithItem:textField  attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:superview attribute:NSLayoutAttributeTop multiplier:1.0 constant:112.0f];
    
    NSLayoutConstraint *loginTextFieldLeftConstraint = [NSLayoutConstraint constraintWithItem:textField attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeLeft multiplier:1.0f constant:56.0f];
    
    NSLayoutConstraint *loginTextFieldRightConstraint = [NSLayoutConstraint constraintWithItem:textField attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeRight multiplier:1.0f constant:-56.0f];
    
    NSLayoutConstraint *loginTextFieldHeightConstraint = [NSLayoutConstraint constraintWithItem:textField attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:48.0f];
    
    [superview addConstraints:@[loginTextFieldXConstraint, loginTextFieldYConstraint,loginTextFieldLeftConstraint, loginTextFieldRightConstraint, loginTextFieldHeightConstraint]];
}

- (void)setPasswordTextField
{
    UIView *superview = self.view;
    UITextField *textField = self.passwordTextField;
    UILabel *prefixLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    
    prefixLabel.text =@"       ";
    [prefixLabel setFont:[UIFont boldSystemFontOfSize:14]];
    [prefixLabel sizeToFit];
    
    textField = [[UITextField  alloc]init];
    textField.borderStyle = UITextBorderStyleNone;
    textField.translatesAutoresizingMaskIntoConstraints = NO;
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    textField.placeholder = @"password";
    textField.leftView = prefixLabel;
    textField.leftViewMode = UITextFieldViewModeAlways;
    textField.font = [UIFont fontWithName:@"Helvetica" size:18.0f];
    textField.layer.cornerRadius = 10;
    textField.layer.borderColor = [[UIColor colorWithRed:0.61 green:0.61 blue:0.61 alpha:1.0]CGColor];
    textField.layer.borderWidth = 1.0f;
    
    self.passwordTextField = textField;
    // Adds the textField to the view.
    [superview addSubview:textField];
    
    NSLayoutConstraint *passwordTextFieldXConstraint = [NSLayoutConstraint constraintWithItem:textField attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeCenterX multiplier:1 constant:0.0f];
    
    NSLayoutConstraint *passwordTextFieldYConstraint = [NSLayoutConstraint constraintWithItem:textField  attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:superview attribute:NSLayoutAttributeTop multiplier:1.0 constant:176.0f];
    
    NSLayoutConstraint *passwordTextFieldLeftConstraint = [NSLayoutConstraint constraintWithItem:textField attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeLeft multiplier:1.0f constant:56.0f];
    
    NSLayoutConstraint *passwordTextFieldRightConstraint = [NSLayoutConstraint constraintWithItem:textField attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeRight multiplier:1.0f constant:-56.0f];
    
    NSLayoutConstraint *passwordTextFieldHeightConstraint = [NSLayoutConstraint constraintWithItem:textField attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:48.0f];
    
    [superview addConstraints:@[passwordTextFieldXConstraint, passwordTextFieldYConstraint,passwordTextFieldLeftConstraint, passwordTextFieldRightConstraint, passwordTextFieldHeightConstraint]];
}

- (void)setLoginButton
{
    self.loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.loginButton.backgroundColor = [UIColor colorWithRed:0.94 green:0.47 blue:0.13 alpha:1.0];;
    self.loginButton.layer.cornerRadius = 28;
    self.loginButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.loginButton sizeToFit];
    [self.loginButton.titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:18.0]];
    [self.loginButton setTitleColor: UIColor.whiteColor forState:UIControlStateNormal];
    [self.loginButton setTitle:@"Login" forState:UIControlStateNormal];
    [self.loginButton addTarget:self action:@selector(didPressLoginButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.loginButton];
}

- (void)setLoginImage
{
    self.imageView = [[UIImageView alloc] init];
    self.imageView.image = [UIImage imageNamed:@"img_login"];
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:self.imageView];
}

- (void)setLoginButtonConstraint
{
    UIView *superview = self.view;
    UIButton *loginBtn = self.loginButton;
    
    NSLayoutConstraint *loginButtonXConstraint = [NSLayoutConstraint constraintWithItem:loginBtn attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationGreaterThanOrEqual toItem: superview attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0f];
    
    NSLayoutConstraint *loginButtonYConstraint = [NSLayoutConstraint constraintWithItem:loginBtn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:superview attribute:NSLayoutAttributeTop multiplier:1.0 constant:264.0f];
    
    NSLayoutConstraint *loginButtonLeftConstraint = [NSLayoutConstraint constraintWithItem:loginBtn attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeLeft multiplier:1.0f constant:56.0f];
    
    NSLayoutConstraint *loginButtonRightConstraint = [NSLayoutConstraint constraintWithItem:loginBtn attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeRight multiplier:1.0f constant:-56.0f];
    
    NSLayoutConstraint *loginButtonHeightConstraint = [NSLayoutConstraint constraintWithItem:loginBtn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:56.0f];
    
    
    [superview addConstraints:@[loginButtonXConstraint,loginButtonYConstraint,loginButtonLeftConstraint, loginButtonRightConstraint, loginButtonHeightConstraint]];
}


- (void)setLoginImageConstraint
{
    UIView *superview = self.view;
    UIImageView *image = self.imageView;
    
    NSLayoutConstraint *loginImageXConstraint = [NSLayoutConstraint constraintWithItem:image attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeCenterX multiplier:1 constant:0.0f];
    
    NSLayoutConstraint *loginImageYConstraint = [NSLayoutConstraint constraintWithItem:image attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.loginButton attribute: NSLayoutAttributeBottom multiplier:1 constant:48.0f];
    
    NSLayoutConstraint *loginImageBottomConstraint = [NSLayoutConstraint constraintWithItem:image attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:superview attribute: NSLayoutAttributeBottom multiplier:1 constant:0.0f];
    
    NSLayoutConstraint *loginImageLeftConstraint = [NSLayoutConstraint constraintWithItem:image attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeLeft multiplier:1.0f constant:0.0f];
    
    NSLayoutConstraint *loginImageRightConstraint = [NSLayoutConstraint constraintWithItem:image attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeRight multiplier:1.0f constant:0.0f];
    
    [superview addConstraints:@[loginImageXConstraint, loginImageYConstraint, loginImageBottomConstraint, loginImageLeftConstraint, loginImageRightConstraint]];
}

-(void)didPressLoginButton:(UIButton *)loginButton {
    LoginClient *loginClient = [[LoginClient alloc] init];
    
    self.username = self.loginTextField.text;
    self.password = self.passwordTextField.text;
    
    [loginClient loginWithUsername:self.username password:self.password completion:nil];
}

@end

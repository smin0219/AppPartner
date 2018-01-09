//
//  LoginViewController.h
//  iOSTest
//
//  Created by App Partner on 9/6/16.
//  Copyright © 2016 AppPartner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface LoginViewController : UIViewController <UITextFieldDelegate>

- (void)setNavigationBar;
- (void)addSubviews;
- (void)addConstraints;
- (void)setLoginTextField;
- (void)setPasswordTextField;
- (void)setLoginButton;
- (void)setLoginImage;
- (void)setLoginImageConstraint;
- (void)setLoginButtonConstraint;
- (void)didPressLoginButton:(UIButton *)loginButton;
- (void)textFieldDidEndEditing:(UITextField *)textField;

@end

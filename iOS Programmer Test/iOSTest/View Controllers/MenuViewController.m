//
//  MenuViewController.m
//  iOSTest
//
//  Created by App Partner on 9/6/16.
//  Copyright © 2016 AppPartner. All rights reserved.
//

#import "ChatViewController.h"
#import "LoginViewController.h"
#import "MenuViewController.h"
#import "AnimationViewController.h"

@interface MenuViewController ()

@property (nonatomic, strong) UIButton *chatButton;
@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UIButton *animationButton;

@end

@implementation MenuViewController

/**
 * =========================================================================================
 * INSTRUCTIONS
 * =========================================================================================
 *
 * 1) UI must work on iOS phones of multiple sizes. Do not worry about iPads.
 *
 * 2) Use Autolayout to make sure all UI works for each resolution
 *
 * 3) Use this starter project as a base and build upon it. It is ok to remove some of the
 *    provided code if necessary. It is ok to add any classes. This is your project now!
 *
 * 4) Read the additional instructions comments throughout the codebase, they will guide you.
 *
 * 5) Please take care of the bug(s) we left for you in the project as well. Happy hunting!
 *
 * Thank you and Good luck. - App Partner
 * =========================================================================================
 */

- (void)viewDidLoad
{
    // TODO: Make the UI look like it does in the mock-up
    [super viewDidLoad];
    
    self.title = @"Coding Tasks";

    [self setNavigationBar];
    [self addSubviews];
    [self addConstraints];
}



- (void)viewWillAppear:(BOOL)animated
{
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"bg_home_menu.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    [self setNavigationBar];
}

- (void)setNavigationBar
{
    self.navigationController.navigationBar.topItem.title = @"Coding Tasks";
    UINavigationBar* navbar = self.navigationController.navigationBar;
    navbar.barTintColor = [UIColor colorWithRed:0.00 green:0.68 blue:0.74 alpha:1.0];
    navbar.barStyle = UIBarStyleBlack;
    
    [navbar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17 weight:UIFontWeightSemibold], NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self.navigationController setNavigationBarHidden:NO animated: YES];
}


- (void)addSubviews
{
    [self setChatButton];
    [self setLoginButton];
    [self setAnimationButton];
}

- (void)addConstraints
{
    [self setChatButtonConstraint];
    [self setLoginButtonConstraint];
    [self setAnimationButtonConstraint];
}

- (void)setChatButton
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(24.0f, 15.0f, 26.0f, 26.0f)];
    imageView.image = [UIImage imageNamed:@"ic_chat"];
   
    self.chatButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.chatButton.backgroundColor = [UIColor colorWithRed:0.37 green:0.37 blue:0.37 alpha:1.0];
    self.chatButton.layer.cornerRadius = 28;
    self.chatButton.translatesAutoresizingMaskIntoConstraints = NO;

    [self.chatButton sizeToFit];
    [self.chatButton.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Regular" size:18.0]];
    [self.chatButton setTitleColor: UIColor.whiteColor forState:UIControlStateNormal];
    [self.chatButton setTitle:@"Chat" forState:UIControlStateNormal];
    [self.chatButton setTitleEdgeInsets:UIEdgeInsetsMake(0.0f, 0.0f, 0.0f, 0.0f)];
    [self.chatButton addTarget:self action:@selector(didPressChatButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.chatButton];
    [self.chatButton addSubview:imageView];
}

- (void)setLoginButton
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(24.0f, 15.0f, 26.0f, 26.0f)];
    imageView.image = [UIImage imageNamed:@"ic_login"];
    
    self.loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.loginButton.backgroundColor = [UIColor colorWithRed:0.37 green:0.37 blue:0.37 alpha:1.0];
    self.loginButton.layer.cornerRadius = 28;
    self.loginButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.loginButton sizeToFit];
    [self.loginButton.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Regular" size:18.0]];
    [self.loginButton setTitleColor: UIColor.whiteColor forState:UIControlStateNormal];
    [self.loginButton setTitle:@"Login" forState:UIControlStateNormal];
    [self.loginButton addTarget:self action:@selector(didPressLoginButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.loginButton];
    [self.loginButton addSubview:imageView];
}

- (void)setAnimationButton
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(24.0f, 15.0f, 26.0f, 26.0f)];
    imageView.image = [UIImage imageNamed:@"ic_animation"];
    
    self.animationButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.animationButton.backgroundColor = [UIColor colorWithRed:0.37 green:0.37 blue:0.37 alpha:1.0];
    self.animationButton.layer.cornerRadius = 28;
    self.animationButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.animationButton sizeToFit];
    [self.animationButton.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Regular" size:18.0]];
    [self.animationButton setTitleColor: UIColor.whiteColor forState:UIControlStateNormal];
    [self.animationButton setTitle:@"Animation" forState:UIControlStateNormal];
    [self.animationButton addTarget:self action:@selector(didPressAnimationButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.animationButton];
    [self.animationButton addSubview:imageView];
    
}

- (void)setChatButtonConstraint
{
    UIView *superview = self.view;
    UIButton *chatBtn = self.chatButton;
    float buttonWidth = superview.frame.size.width - 112.0;
    
    NSLayoutConstraint *chatButtonXConstraint = [NSLayoutConstraint constraintWithItem:chatBtn attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationGreaterThanOrEqual toItem: superview attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0f];
    
    NSLayoutConstraint *chatButtonYConstraint = [NSLayoutConstraint constraintWithItem:chatBtn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationGreaterThanOrEqual toItem: superview attribute:NSLayoutAttributeTop multiplier:1.0 constant:208.0f];
    
    NSLayoutConstraint *chatButtonWidthConstraint = [NSLayoutConstraint constraintWithItem:chatBtn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:buttonWidth];
    
    NSLayoutConstraint *chatButtonHeightConstraint = [NSLayoutConstraint constraintWithItem:chatBtn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:56.0f];
    
    [superview addConstraints:@[chatButtonXConstraint, chatButtonYConstraint, chatButtonWidthConstraint, chatButtonHeightConstraint]];
}

- (void)setLoginButtonConstraint
{
    UIView *superview = self.view;
    UIButton *loginBtn = self.loginButton;
    UIButton *chatBtn = self.chatButton;
    float buttonWidth = superview.frame.size.width - 112.0;
    
    NSLayoutConstraint *loginButtonXConstraint = [NSLayoutConstraint constraintWithItem:loginBtn attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationGreaterThanOrEqual toItem: superview attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0f];
    
    NSLayoutConstraint *loginButtonYConstraint = [NSLayoutConstraint constraintWithItem:loginBtn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationGreaterThanOrEqual toItem: chatBtn attribute:NSLayoutAttributeBottom multiplier:1.0 constant:24.0f];
    
    NSLayoutConstraint *loginButtonWidthConstraint = [NSLayoutConstraint constraintWithItem:loginBtn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:buttonWidth];
    
    NSLayoutConstraint *loginButtonHeightConstraint = [NSLayoutConstraint constraintWithItem:loginBtn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:56.0f];
    
    [superview addConstraints:@[loginButtonXConstraint, loginButtonYConstraint, loginButtonWidthConstraint, loginButtonHeightConstraint]];
}

- (void)setAnimationButtonConstraint
{
    UIView *superview = self.view;
    UIButton *loginBtn = self.loginButton;
    UIButton *animationBtn = self.animationButton;
    float buttonWidth = superview.frame.size.width - 112.0;
    
    NSLayoutConstraint *animationButtonXConstraint = [NSLayoutConstraint constraintWithItem:animationBtn attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationGreaterThanOrEqual toItem: superview attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0f];
    
    NSLayoutConstraint *animationButtonYConstraint = [NSLayoutConstraint constraintWithItem:animationBtn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationGreaterThanOrEqual toItem: loginBtn attribute:NSLayoutAttributeBottom multiplier:1.0 constant:24.0f];
    
    NSLayoutConstraint *animationButtonWidthConstraint = [NSLayoutConstraint constraintWithItem:animationBtn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:buttonWidth];
    
    NSLayoutConstraint *animationButtonHeightConstraint = [NSLayoutConstraint constraintWithItem:animationBtn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:56.0f];
    
    [superview addConstraints:@[animationButtonXConstraint, animationButtonYConstraint, animationButtonWidthConstraint, animationButtonHeightConstraint]];
}

-(void)didPressChatButton:(UIButton *)chatButton {
    ChatViewController *chatViewController = [[ChatViewController alloc] init];
    [self.navigationController pushViewController:chatViewController animated:YES];
}

-(void)didPressLoginButton:(UIButton *)chatButton {
    LoginViewController *loginViewController = [[LoginViewController alloc] init];
    [self.navigationController pushViewController:loginViewController animated:YES];
}

-(void)didPressAnimationButton:(UIButton *)chatButton {
    AnimationViewController *animationViewController = [[AnimationViewController alloc] init];
    [self.navigationController pushViewController:animationViewController animated:YES];
}

@end

//
//  AnimationViewController.m
//  iOSTest
//
//  Created by App Partner on 12/13/16.
//  Copyright © 2016 AppPartner. All rights reserved.
//

#import "AnimationViewController.h"
#import "MenuViewController.h"
#import <QuartzCore/QuartzCore.h>
#import <AVFoundation/AVFoundation.h>

@interface AnimationViewController ()
@property (nonatomic, strong) UIButton *spinButton;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) AVAudioPlayer *player;
@end

@implementation AnimationViewController

/**
 * =========================================================================================
 * INSTRUCTIONS
 * =========================================================================================
 * 1) Make the UI look like it does in the mock-up.
 *
 * 2) Logo should spin when the user hits the spin button
 *
 * 3) User should be able to drag the logo around the screen with his/her fingers
 *
 * 4) Add a bonus to make yourself stick out. Music, color, fireworks, explosions!!! Have Swift experience? Why not write the Animation 
 *    section in Swfit to show off your skills. Anything your heart desires!
 *
 **/

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Animation";
    
    [self setNavigationBar];
    [self addSubviews];
    [self addConstraints];
}

- (void)addSubviews
{
    [self setSpinImage];
    [self setSpinButton];
}

- (void)addConstraints
{
    [self setSpinButtonConstraint];
    [self setSpinImageConstraint];
}

- (void)setNavigationBar
{
    self.navigationController.navigationBar.topItem.title = @"Back";
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

- (void)setSpinImage
{
    self.imageView = [[UIImageView alloc] init];
    self.imageView.image = [UIImage imageNamed:@"ic_logo"];
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:self.imageView];
}

- (void)setSpinButton
{
    self.spinButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.spinButton.backgroundColor = [UIColor colorWithRed:0.26 green:0.45 blue:0.73 alpha:1.0];
    self.spinButton.layer.cornerRadius = 28;
    self.spinButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.spinButton sizeToFit];
    [self.spinButton.titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:18.0]];
    [self.spinButton setTitleColor: UIColor.whiteColor forState:UIControlStateNormal];
    [self.spinButton setTitle:@"Spin" forState:UIControlStateNormal];
    [self.spinButton addTarget:self action:@selector(didPressSpinButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.spinButton];
}

- (void)setSpinImageConstraint
{
    UIView *superview = self.view;
    UIImageView *image = self.imageView;
    
    NSLayoutConstraint *spinImageXConstraint = [NSLayoutConstraint constraintWithItem:image attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeCenterX multiplier:1 constant:0.0f];
    
    NSLayoutConstraint *spinImageYConstraint = [NSLayoutConstraint constraintWithItem:image attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:superview attribute: NSLayoutAttributeCenterY multiplier:1 constant:-50.0f];
    
    
    NSLayoutConstraint *spinImageLeftConstraint = [NSLayoutConstraint constraintWithItem:image attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeLeft multiplier:1.0f constant:56.0f];
    
    NSLayoutConstraint *spinImageRightConstraint = [NSLayoutConstraint constraintWithItem:image attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeRight multiplier:1.0f constant:-56.0f];
    
    [superview addConstraints:@[spinImageXConstraint, spinImageYConstraint, spinImageLeftConstraint, spinImageRightConstraint]];
}

- (void)setSpinButtonConstraint
{
    UIView *superview = self.view;
    UIButton *spinBtn = self.spinButton;
    
    NSLayoutConstraint *spinButtonXConstraint = [NSLayoutConstraint constraintWithItem:spinBtn attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationGreaterThanOrEqual toItem: superview attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0f];
    
    NSLayoutConstraint *spinButtonBottomConstraint = [NSLayoutConstraint constraintWithItem:spinBtn attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:superview attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-100.0f];
    
    NSLayoutConstraint *spinButtonLeftConstraint = [NSLayoutConstraint constraintWithItem:spinBtn attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeLeft multiplier:1.0f constant:56.0f];
    
    NSLayoutConstraint *spinButtonRightConstraint = [NSLayoutConstraint constraintWithItem:spinBtn attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeRight multiplier:1.0f constant:-56.0f];
    
    NSLayoutConstraint *spinButtonHeightConstraint = [NSLayoutConstraint constraintWithItem:spinBtn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:56.0f];
    
    
    [superview addConstraints:@[spinButtonXConstraint,spinButtonBottomConstraint,spinButtonLeftConstraint, spinButtonRightConstraint, spinButtonHeightConstraint]];
}

-(void)didPressSpinButton:(UIButton *)spinButton {
    NSLog(@"Spin!!");
    
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"button" ofType:@"mp3"];
    NSURL *url = [NSURL URLWithString:path];
    _player = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:NULL];
    [_player play];
    
    CABasicAnimation *rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotation.fromValue = [NSNumber numberWithFloat:0];
    rotation.toValue = [NSNumber numberWithFloat:((360*M_PI)/180)];
    rotation.duration = 1.0;
    rotation.repeatCount = 1;
    [self.imageView.layer addAnimation:rotation forKey:@"ic_logo"];
}
@end

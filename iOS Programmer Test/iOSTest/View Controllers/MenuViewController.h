//
//  MenuViewController.h
//  iOSTest
//
//  Created by App Partner on 9/6/16.
//  Copyright © 2016 AppPartner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewController : UIViewController

- (void)setNavigationBar;
- (void)addSubviews;
- (void)addConstraints;

/* Setup each buttons */
- (void)setChatButton;
- (void)setLoginButton;
- (void)setAnimationButton;

/* Add constraints for each buttons */
- (void)setChatButtonConstraint;
- (void)setLoginButtonConstraint;
- (void)setAnimationButtonConstraint;

-(void)didPressChatButton:(UIButton *)chatButton;

@end

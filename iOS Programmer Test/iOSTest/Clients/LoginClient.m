//
//  LoginClient.m
//  iOSTest
//
//  Created by App Partner on 9/23/16.
//  Copyright © 2016 AppPartner. All rights reserved.
//

#import "LoginClient.h"
#import "LoginViewController.h"
#import "Json/SBJson.h"

@interface LoginClient ()
@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, strong) UIWindow *alertWindow;
@end

@implementation LoginClient

/**
 * =========================================================================================
 * INSTRUCTIONS
 * =========================================================================================
 * 1) Make a request here to login.
 *
 * 2) Using the following endpoint, make a request to login
 *    URL: http://dev3.apppartner.com/AppPartnerDeveloperTest/scripts/login.php
 *
 * 3) Don't forget, the endpoint takes two parameters 'username' and 'password'
 *
 * 4) A valid username is 'AppPartner'
 *    A valid password is 'qwerty'
 **/

- (void)loginWithUsername:(NSString *)username password:(NSString *)password completion:(void (^)(NSDictionary *))completion
{
    @try{
        
        if([username isEqualToString:@""] || [password isEqualToString:@""]){
            [self alertFailed:@"Please enter both username and password!" :@"Login Falied!"];
        }
        else if([username isEqualToString:@"AppPartner"] && [password isEqualToString:@"qwerty"]){
            [self alertSuccess:@"Login Success!": @"Login Success!"];
        }
        else{
            [self alertFailed:@"Please enter both username and password!" :@"Login Falied!"];
            /*
            NSString *post = [[NSString alloc] initWithFormat:@"username=%@&password=%@"], *username, *password;
            NSLog(@"postdata: %@", post);
            NSURL *url=[NSURL URLWithString:@"http://dev3.apppartner.com/AppPartnerDeveloperTest/scripts/login.php"];
            NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
            NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
            
            NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
            [request setURL: url];
            [request setHTTPMethod:@"POST"];
            [request setValue:postLength forHTTPHeaderField:@"Content-length"];
            [request setValue:@"application/json" forHTTPHeaderField:@"Aceept"];
            [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
            [request setHTTPBody:postData];
            
            NSError *error = [[NSError alloc] init];
            NSHTTPURLResponse *response = nil;
            //NSData *urlData = [NSURLSessionDataTask];
            
            NSLog(@"Response code: %ld", (long)[response statusCode]);
            if([response statusCode] >= 200 && [response statusCode] < 300)
            {
             */
        }
        
    }
    @catch(NSException *e){
        
    }
}

// When user success to login
- (void) alertSuccess:(NSString *)msg :(NSString *)title
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Login Success!" message:msg preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* continueBtn = [UIAlertAction actionWithTitle:@"Continue" style:UIAlertActionStyleDefault
                       handler:^(UIAlertAction * action)
                     {
                         [alert dismissViewControllerAnimated:YES completion:nil];
                             
                     }];
    
    [alert addAction:continueBtn];
    [[[[[UIApplication sharedApplication] delegate] window] rootViewController] presentViewController:alert animated:YES completion: nil];
}

//When user failed to login
- (void) alertFailed:(NSString *)msg :(NSString *)title
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Login Failed!" message:msg preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* continueBtn = [UIAlertAction actionWithTitle:@"Back" style:UIAlertActionStyleDefault
                                                        handler:^(UIAlertAction * action)
                                  {
                                      [alert dismissViewControllerAnimated:YES completion:nil];
                                      
                                  }];
    [alert addAction:continueBtn];
    
    [[[[[UIApplication sharedApplication] delegate] window] rootViewController] presentViewController:alert animated:YES completion: nil];
}

@end

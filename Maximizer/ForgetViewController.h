//
//  ForgetViewController.h
//  Maximizer
//
//  Created by Genie Technology on 29/03/16.
//  Copyright (c) 2016 Genie Soft Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForgetViewController : UIViewController


@property (strong, nonatomic) IBOutlet UIView *loginview;
@property (strong, nonatomic) IBOutlet UITextField *useridtxt;
@property (strong, nonatomic) IBOutlet UITextField *passtxt;
@property (strong, nonatomic) IBOutlet UIButton *loginbtn;
@property (strong, nonatomic) IBOutlet UIButton *forgetbtn;

- (IBAction)btn_cancel_back:(id)sender;


@end

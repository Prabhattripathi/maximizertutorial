//
//  ViewController.h
//  Maximizer
//
//  Created by Genie Technology on 07/08/15.
//  Copyright (c) 2015 Genie Soft Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *loginview;
@property (strong, nonatomic) IBOutlet UITextField *useridtxt;
@property (strong, nonatomic) IBOutlet UITextField *passtxt;
@property (strong, nonatomic) IBOutlet UIButton *loginbtn;
@property (strong, nonatomic) IBOutlet UIButton *forgetbtn;


- (IBAction)loginbtncliked:(id)sender;
- (IBAction)forgtecliked:(id)sender;


@end

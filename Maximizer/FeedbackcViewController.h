//
//  FeedbackcViewController.h
//  Maximizer
//
//  Created by Genie Technology on 10/08/15.
//  Copyright (c) 2015 Genie Soft Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedbackcViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextView *textview;
@property (strong, nonatomic) IBOutlet UIView *view1;
@property (strong, nonatomic) IBOutlet UIButton *submit;
- (IBAction)submitcliked:(id)sender;
- (IBAction)homercliked:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *menubtn;
- (IBAction)sharecliked:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *sharebtn;

@end

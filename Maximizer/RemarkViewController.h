//
//  RemarkViewController.h
//  Maximizer
//
//  Created by Genie Technology on 18/08/15.
//  Copyright (c) 2015 Genie Soft Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RemarkViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *menubtn;
@property (strong, nonatomic) IBOutlet UIButton *sharebtn;
- (IBAction)sharecliked:(id)sender;
- (IBAction)menucliked:(id)sender;


@end

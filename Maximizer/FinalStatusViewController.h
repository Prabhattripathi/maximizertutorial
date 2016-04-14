//
//  FinalStatusViewController.h
//  Maximizer
//
//  Created by geniemac4 on 21/08/15.
//  Copyright (c) 2015 Genie Soft Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FinalStatusViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *menubtn;
@property (strong, nonatomic) IBOutlet UIButton *sharebtn;
- (IBAction)sharecliked:(id)sender;
- (IBAction)menucliked:(id)sender;


@end

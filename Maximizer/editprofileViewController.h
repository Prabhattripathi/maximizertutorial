//
//  editprofileViewController.h
//  Maximizer
//
//  Created by Genie Technology on 10/08/15.
//  Copyright (c) 2015 Genie Soft Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NIDropDown.h"

@interface editprofileViewController : UIViewController<NIDropDownDelegate>
{
    NIDropDown *dropDown;
    
}

@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *mytextfileds;

@property (strong, nonatomic) IBOutlet UIScrollView *scroll;

@property (strong, nonatomic) IBOutlet UITextField *nametxt;
@property (strong, nonatomic) IBOutlet UITextField *mailtxt;
@property (strong, nonatomic) IBOutlet UITextField *notxt;
@property (strong, nonatomic) IBOutlet UITextField *adresstxt;
@property (strong, nonatomic) IBOutlet UITextField *citytxt;
@property (strong, nonatomic) IBOutlet UITextField *statetxt;
@property (strong, nonatomic) IBOutlet UITextField *pincodetxt;
@property (strong, nonatomic) IBOutlet UITextField *current_passtxt;
@property (strong, nonatomic) IBOutlet UITextField *newpasstxt;
@property (strong, nonatomic) IBOutlet UITextField *confirm_passtxt;
@property (strong, nonatomic) IBOutlet UIButton *departmentbtn;

- (IBAction)sharecliekd:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *sharebtn;
@property (strong, nonatomic) IBOutlet UIButton *menubtn;
- (IBAction)menucliked:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *submitbtn;
- (IBAction)submitcliked:(id)sender;
- (IBAction)departmentcliked:(id)sender;

@end

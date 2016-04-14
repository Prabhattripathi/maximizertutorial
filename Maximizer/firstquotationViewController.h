//
//  firstquotationViewController.h
//  Maximizer
//
//  Created by Genie Technology on 07/08/15.
//  Copyright (c) 2015 Genie Soft Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NIDropDown.h"

@interface firstquotationViewController : UIViewController<NIDropDownDelegate>
{
    UIDocumentInteractionController *documentInteractionController;
    NIDropDown *dropDown;
    
}



@property (strong, nonatomic) IBOutlet UIButton *nextbtn;
- (IBAction)nextbntcliked:(id)sender;
- (IBAction)titlescliked:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *nameview;
@property (strong, nonatomic) IBOutlet UIView *contactview;
@property (strong, nonatomic) IBOutlet UIView *mailview;
@property (strong, nonatomic) IBOutlet UIView *ccmialview;
@property (strong, nonatomic) IBOutlet UIView *timeview;
@property (strong, nonatomic) IBOutlet UIView *budgetview;
- (IBAction)homercliked:(id)sender;
- (IBAction)logoutcliked:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *selectbtn;
@property (strong, nonatomic) IBOutlet UIButton *menubtn;
@property (strong, nonatomic) IBOutlet UIButton *sharebtn;

@property (strong, nonatomic) IBOutlet UITextField *txt_name;
@property (strong, nonatomic) IBOutlet UITextField *txt_contact_no;
@property (strong, nonatomic) IBOutlet UITextField *txt_email_ID;
@property (strong, nonatomic) IBOutlet UITextField *txt_email_CC;
@property (strong, nonatomic) IBOutlet UITextField *txt_date;
@property (strong, nonatomic) IBOutlet UITextField *txt_exp_budj;


@property (strong, nonatomic) IBOutlet UIScrollView *scroll_view;

//1
- (IBAction)btn_dateclick:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *lbl_displaydate;

//1
@property (strong, nonatomic) IBOutlet UIView *VIEWPICKER;
@property (strong, nonatomic) IBOutlet UIDatePicker *date_picker;
- (IBAction)btn_set:(id)sender;



@property (strong, nonatomic) IBOutlet UIView *view_lastName;
@property (strong, nonatomic) IBOutlet UITextField *txt_lastName;

@end

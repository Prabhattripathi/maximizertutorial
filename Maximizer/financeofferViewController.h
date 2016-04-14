//
//  financeofferViewController.h
//  Maximizer
//
//  Created by Genie Technology on 08/08/15.
//  Copyright (c) 2015 Genie Soft Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface financeofferViewController : UIViewController

- (IBAction)backcliked:(id)sender;
- (IBAction)submitcliked:(id)sender;


@property (strong, nonatomic) IBOutlet UIView *tabview;
@property (strong, nonatomic) IBOutlet UIView *loanview;
@property (strong, nonatomic) IBOutlet UIView *valueview;
@property (strong, nonatomic) IBOutlet UIView *balanceview;
@property (strong, nonatomic) IBOutlet UIButton *backbtn;
@property (strong, nonatomic) IBOutlet UIButton *submitbtn;

- (IBAction)homecliked:(id)sender;
- (IBAction)sharecliked:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *menubtn;
@property (strong, nonatomic) IBOutlet UIButton *sharebtn;

@property (strong, nonatomic) IBOutlet UITextField *txt_financeoffer;
@property (strong, nonatomic) IBOutlet UITextField *txt_TORV;
@property (strong, nonatomic) IBOutlet UITextField *txt_BTIALF;




//table fields under interest rate...
@property (strong, nonatomic) IBOutlet UITextField *txt_interstrate_3yrs;
@property (strong, nonatomic) IBOutlet UITextField *txt_interestrate_4yrs;
@property (strong, nonatomic) IBOutlet UITextField *txt_interestrate_5yrs;
@property (strong, nonatomic) IBOutlet UITextField *txt_interestrate_7yrs;



//labels under downpayment...
@property (strong, nonatomic) IBOutlet UILabel *lbl_downpayment_3yrs;
@property (strong, nonatomic) IBOutlet UILabel *lbl_downpayment_4yrs;
@property (strong, nonatomic) IBOutlet UILabel *lbl_downpayment_5yrs;
@property (strong, nonatomic) IBOutlet UILabel *lbl_downpayment_7yrs;


//labels under emi...
@property (strong, nonatomic) IBOutlet UILabel *lbl_emi_3yrs;
@property (strong, nonatomic) IBOutlet UILabel *lbl_emi_4yrs;
@property (strong, nonatomic) IBOutlet UILabel *lbl_emi_5yrs;
@property (strong, nonatomic) IBOutlet UILabel *lbl_emi_7yrs;


//labels under tenure..
@property (strong, nonatomic) IBOutlet UILabel *lbl_3yrs;




@end

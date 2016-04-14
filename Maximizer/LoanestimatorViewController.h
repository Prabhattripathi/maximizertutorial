//
//  LoanestimatorViewController.h
//  Maximizer
//
//  Created by Genie Technology on 08/08/15.
//  Copyright (c) 2015 Genie Soft Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoanestimatorViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIScrollView *scroll;
@property (strong, nonatomic) IBOutlet UIView *orview;
@property (strong, nonatomic) IBOutlet UITextField *rate_intrest_txt;
@property (strong, nonatomic) IBOutlet UIButton *loan_tenure_btn;
@property (strong, nonatomic) IBOutlet UITextField *monthly_pay_txt;
@property (strong, nonatomic) IBOutlet UIView *mention_loan_view;
@property (strong, nonatomic) IBOutlet UIView *emi_view;
@property (strong, nonatomic) IBOutlet UISlider *sliderview;
@property (strong, nonatomic) IBOutlet UITextField *slider_txt;
@property (strong, nonatomic) IBOutlet UIView *finaal_price_view;
@property (strong, nonatomic) IBOutlet UIView *outstanding_loan_amt_view;
@property (strong, nonatomic) IBOutlet UIView *balance_trade_view;
@property (strong, nonatomic) IBOutlet UIButton *estimate_btn;
@property (strong, nonatomic) IBOutlet UIButton *back_btn;
@property (strong, nonatomic) IBOutlet UIButton *next_btn;
@property (strong, nonatomic) IBOutlet UILabel *or_lbl;
- (IBAction)backcliked:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *sharebtn;
- (IBAction)nextcliked:(id)sender;
- (IBAction)homercliked:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *menubtn;
- (IBAction)sharecliked:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *txt_loanamt;
@property (strong, nonatomic) IBOutlet UITextField *txt_finalprice;
@property (strong, nonatomic) IBOutlet UITextField *txt_outstanding_loan;
@property (strong, nonatomic) IBOutlet UITextField *txt_balance_trsde;

@property (strong, nonatomic) IBOutlet UITextField *txt_emi;



- (IBAction)btn_LoanTenure:(id)sender;
- (IBAction)btn_EstimationBy:(id)sender;


@property (weak, nonatomic) IBOutlet UILabel *lbl_monthlypayment;


@end

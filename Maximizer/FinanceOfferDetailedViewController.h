//
//  FinanceOfferDetailedViewController.h
//  Maximizer
//
//  Created by Mobilestyx on 20/10/15.
//  Copyright (c) 2015 Genie Soft Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FinanceOfferDetailedViewController : UIViewController<UIPrintInteractionControllerDelegate>


- (IBAction)btn_menu:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn_menu_outlet;


- (IBAction)btn_share:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn_share_outlet;




@property (strong, nonatomic) IBOutlet UIView *VIEW_MAIN;



@property (strong, nonatomic) IBOutlet UILabel *lbl_custname;
@property (strong, nonatomic) IBOutlet UILabel *lbl_SelectingCarname;


@property (strong, nonatomic) IBOutlet UIScrollView *scroll_view;




////hidden labels of "your new vehicle estimation"...

@property (strong, nonatomic) IBOutlet UILabel *lbl_vehiclemake;
@property (strong, nonatomic) IBOutlet UILabel *lbl_vehiclemodel;
@property (strong, nonatomic) IBOutlet UILabel *lbl_vehiclesubmodel;
@property (strong, nonatomic) IBOutlet UILabel *lbl_exshowroomprize;
@property (strong, nonatomic) IBOutlet UILabel *lbl_insurance;
@property (strong, nonatomic) IBOutlet UILabel *lbl_logisticscharge;
@property (strong, nonatomic) IBOutlet UILabel *lbl_regchargesincludingroadtax;
@property (strong, nonatomic) IBOutlet UILabel *lbl_accesories;
@property (strong, nonatomic) IBOutlet UILabel *lbl_serviceplan;
@property (strong, nonatomic) IBOutlet UILabel *lbl_extwarranty;
@property (strong, nonatomic) IBOutlet UILabel *lbl_totalonrdvalue;
@property (strong, nonatomic) IBOutlet UILabel *lbl_finalprizeoffered;
@property (strong, nonatomic) IBOutlet UILabel *lbl_outstandingloanamnt;
@property (strong, nonatomic) IBOutlet UILabel *lbl_finalnettransactionvalue;




////hidden labels of "your new vehicle estimation"...

//on road value..
@property (strong, nonatomic) IBOutlet UILabel *lbl_onrdvalueS1;
@property (strong, nonatomic) IBOutlet UILabel *lbl_onrdvalueS2;
@property (strong, nonatomic) IBOutlet UILabel *lbl_onrdvalueS3;
@property (strong, nonatomic) IBOutlet UILabel *lbl_onrdvalueS4;

//loan value..
@property (strong, nonatomic) IBOutlet UILabel *lbl_loanvalueS1;
@property (strong, nonatomic) IBOutlet UILabel *lbl_loanvalueS2;
@property (strong, nonatomic) IBOutlet UILabel *lbl_loanvalueS3;
@property (strong, nonatomic) IBOutlet UILabel *lbl_loanvalueS4;

//EMI value..
@property (strong, nonatomic) IBOutlet UILabel *lbl_EMIvalueS1;
@property (strong, nonatomic) IBOutlet UILabel *lbl_EMIvalueS2;
@property (strong, nonatomic) IBOutlet UILabel *lbl_EMIvalueS3;
@property (strong, nonatomic) IBOutlet UILabel *lbl_EMIvalueS4;

//Downpayment..
@property (strong, nonatomic) IBOutlet UILabel *lbl_downpaymentS1;
@property (strong, nonatomic) IBOutlet UILabel *lbl_downpaymentS2;
@property (strong, nonatomic) IBOutlet UILabel *lbl_downpaymentS3;
@property (strong, nonatomic) IBOutlet UILabel *lbl_downpaymentS4;

//Total outflow..
@property (strong, nonatomic) IBOutlet UILabel *lbl_TotaloverflowS1;
@property (strong, nonatomic) IBOutlet UILabel *lbl_TotaloverflowS2;
@property (strong, nonatomic) IBOutlet UILabel *lbl_TotaloverflowS3;
@property (strong, nonatomic) IBOutlet UILabel *lbl_TotaloverflowS4;



////Our contact information...

@property (strong, nonatomic) IBOutlet UILabel *lbl_ProductSpecialistName;
@property (strong, nonatomic) IBOutlet UILabel *lbl_Contactnumber;
@property (strong, nonatomic) IBOutlet UILabel *lbl_emailID;





//buttons...

- (IBAction)btn_PDF:(id)sender;
- (IBAction)btn_sendEmail:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn_sendemail_outlet;


@property (strong, nonatomic) IBOutlet UIView *view1;

@property (strong, nonatomic) IBOutlet UILabel *lbl_custlastname;



@end

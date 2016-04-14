//
//  FinanceOfferDetailed2ViewController.h
//  Maximizer
//
//  Created by Mobilestyx on 02/11/15.
//  Copyright (c) 2015 Genie Soft Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FinanceOfferDetailed2ViewController : UIViewController


@property (strong, nonatomic) IBOutlet UILabel *lbl_custFirstName;
@property (strong, nonatomic) IBOutlet UILabel *lbl_CustLastName;

@property (strong, nonatomic) IBOutlet UILabel *lbl_carName;



//Your used vehicle estimation...
@property (strong, nonatomic) IBOutlet UILabel *lbl_vehicleManufacturer;
@property (strong, nonatomic) IBOutlet UILabel *lbl_vehicleModel;
@property (strong, nonatomic) IBOutlet UILabel *lbl_vehicleSubModel;

@property (strong, nonatomic) IBOutlet UILabel *lbl_Year;
@property (strong, nonatomic) IBOutlet UILabel *lbl_Month;
@property (strong, nonatomic) IBOutlet UILabel *lbl_onroadvalue;
@property (strong, nonatomic) IBOutlet UILabel *lbl_color;
@property (strong, nonatomic) IBOutlet UILabel *lbl_Insurance;
@property (strong, nonatomic) IBOutlet UILabel *lbl_KMSS;
@property (strong, nonatomic) IBOutlet UILabel *lbl_cbutockd;
@property (strong, nonatomic) IBOutlet UILabel *lbl_accidental;
@property (strong, nonatomic) IBOutlet UILabel *lbl_fuel;
@property (strong, nonatomic) IBOutlet UILabel *lbl_refurbishment;
@property (strong, nonatomic) IBOutlet UILabel *lbl_offerprice;
//


//Our COntact info...
@property (strong, nonatomic) IBOutlet UILabel *lbl_contactNo;
@property (strong, nonatomic) IBOutlet UILabel *lbl_productSpecialist;
@property (strong, nonatomic) IBOutlet UILabel *lbl_emailId;
//


@property (strong, nonatomic) IBOutlet UIScrollView *scroll_view;



- (IBAction)btn_Print:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn_Print_outlet;


- (IBAction)btn_sendEmail:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn_sendEmail_outlet;



- (IBAction)btn_menu:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn_menu_outlet;


- (IBAction)btn_share:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn_share_outlet;




@end

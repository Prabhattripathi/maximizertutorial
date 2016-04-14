//
//  EvaluateexistingvehcleViewController.m
//  Maximizer
//
//  Created by Genie Technology on 08/08/15.
//  Copyright (c) 2015 Genie Soft Systems. All rights reserved.
//

#import "EvaluateexistingvehcleViewController.h"
#import "dashboardViewController.h"
#import "ViewController.h"
#import "LoanestimatorViewController.h"
#import "BaseTableView.h"
#import "NIDropDown.h"
#import "NewvehcleViewController.h"
#import "MBProgressHUD.h"
#include <netdb.h>



@interface EvaluateexistingvehcleViewController ()
{
    UIImageView *backimgview;
    BaseTableView *basetab;
    FMDatabase *database;
    AppDelegate *app;
    BOOL check;
    NIDropDown *dropdown,*dropdown1,*dropdown2;
    NSMutableArray *arrayfmdb,*arrayfmdb_id,*arrayfmdb_reportid_compare;
    NSMutableArray *arrayfmdb2,*arrayfmdb_id2;

    NSMutableArray *model_arr,*model_id_arr,*model_type_arr;
    NSString *name;
   // NSString *name1;
    BOOL manufacture,model,type;
    UITapGestureRecognizer *tap;

    NSString *manuid,*modid,*rep_idd;
    
   // NSString*year;
    
    //for calculations...
    //NSString *REFURB_VAL,*DEDUCTOR_VAL,*OFFERPRICE_VAL,*MONTH_VAL,*FUEL_VAL,*KMS_VAL,*COLOR_VAL,*OWNER_VAL,*REM_INS_VAL,*ACCIDENTAL_VAL,*MDOV_VAL,*CBUCKD_VAL;
    
    
    //implementation of selected particular drpdwn....

    
    NSString*kmss;
    NSString*Color;
    NSString*Insurancee;
    NSString*Accidental;
    NSString*CBUCKDD,*CBUCKDD_D;
    NSString*Fuell;
    NSString*Ownerr;
    NSString*MDOVV;
    NSString*Slider;
    NSString* datee;
    NSString* yearr;
    
    
    int result;
    
    
    //for API's:--
    NSMutableArray * array_manufacturer_name,*array_model_name;
    NSString *brandstr ,*modelstr,*versionstr,*statestr,*fuelstr,*citystr,*cartype;

    NSString*manuustr,*modellstr,*typeestr;

    //3nov..
    NSString *accidentall_sttr,*fuelll_sttr,*cbuckd_sttr;
    
    
    
    //for used car sync...
    NSMutableArray * arr_id,*arr_uid,*arr_custid,*arr_reportid,*arr_expectedtime,*arr_expected_budget,*arr_action,*arr_quot_type,*arr_action_time,*arr_created_on,*arr_fname,*arr_lname,*arr_salutation,*arr_email,*arr_cc_email,*arr_car_make,*arr_car_model,*arr_car_model_type,*arr_purchase_year,*arr_purchase_month,*arr_onroad_value,*arr_colour,*arr_remain_insurance,*arr_car_kms,*arr_cbuckd,*arr_accidental,*arr_car_fuel_type,*arr_refurbishment,*arr_used_car_estimate_by,*arr_outstanding_estimate_by,*arr_used_car_purchase_offer,*arr_owner,*arr_car_speed_type,*arr_net_transaction_amount,*arr_outstanding_loan_amount,*arr_loan_amount,*arr_interest_rate_percent,*arr_loan_tenure,*arr_actual_emi,*arr_estimated_foreclose_percent,*arr_balance_trade_foreclose;
    
    
    
      MBProgressHUD *HUD;
    
    NSString *db_reportid_compare;
    
    
    NSString *evaluate_CBUCKD;
    NSString *ManufacEstr ,*ModelEstr,*TypeEstr;
}

@end

@implementation EvaluateexistingvehcleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    check=false;
    
    app=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    self.manufacture_btn.layer.cornerRadius=5;
    self.model_btn.layer.cornerRadius=5;
    self.modeltype_btn.layer.cornerRadius=5;
    self.datebtn.layer.cornerRadius=5;
    self.month_btn.layer.cornerRadius=5;
    self.owner_btn.layer.cornerRadius=5;
    self.color_btn.layer.cornerRadius=5;
    self.remian_insurance_btn.layer.cornerRadius=5;
    self.market_demnad_btn.layer.cornerRadius=5;
    self.kms_btn.layer.cornerRadius=5;
    self.estimate_btn.layer.cornerRadius=5;
    self.next_btn.layer.cornerRadius=5;
    
    self.manufacture_btn.layer.borderWidth=0.5;
    self.manufacture_btn.layer.borderColor=[UIColor blackColor].CGColor;
    
    self.model_btn.layer.borderWidth=0.5;
    self.model_btn.layer.borderColor=[UIColor blackColor].CGColor;
    
    self.modeltype_btn.layer.borderWidth=0.5;
    self.modeltype_btn.layer.borderColor=[UIColor blackColor].CGColor;
    
    self.datebtn.layer.borderWidth=0.5;
    self.datebtn.layer.borderColor=[UIColor blackColor].CGColor;
    
    self.month_btn.layer.borderWidth=0.5;
    self.month_btn.layer.borderColor=[UIColor blackColor].CGColor;
    
    self.owner_btn.layer.borderWidth=0.5;
    self.owner_btn.layer.borderColor=[UIColor blackColor].CGColor;
    
    self.color_btn.layer.borderWidth=0.5;
    self.color_btn.layer.borderColor=[UIColor blackColor].CGColor;
    
    self.remian_insurance_btn.layer.borderWidth=0.5;
    self.remian_insurance_btn.layer.borderColor=[UIColor blackColor].CGColor;
    
    self.market_demnad_btn.layer.borderWidth=0.5;
    self.market_demnad_btn.layer.borderColor=[UIColor blackColor].CGColor;
    
    self.kms_btn.layer.borderWidth=0.5;
    self.kms_btn.layer.borderColor=[UIColor blackColor].CGColor;
    
    self.estimate_btn.layer.borderWidth=0.5;
    self.estimate_btn.layer.borderColor=[UIColor blackColor].CGColor;
    
    self.valuesgement.layer.borderColor=[UIColor colorWithRed: 133/255.0 green:25/255.0 blue:41/255.0 alpha:1.0].CGColor;
    self.valuesgement.tintColor=[UIColor colorWithRed: 133/255.0 green:25/255.0 blue:41/255.0 alpha:1.0];
    
    self.accidentail_segment.layer.borderColor=[UIColor colorWithRed: 133/255.0 green:25/255.0 blue:41/255.0 alpha:1.0].CGColor;
    self.accidentail_segment.tintColor=[UIColor colorWithRed: 133/255.0 green:25/255.0 blue:41/255.0 alpha:1.0];
    
    self.fuel_segment.layer.borderColor=[UIColor colorWithRed: 133/255.0 green:25/255.0 blue:41/255.0 alpha:1.0].CGColor;
    self.fuel_segment.tintColor=[UIColor colorWithRed: 133/255.0 green:25/255.0 blue:41/255.0 alpha:1.0];
    
    
    self.offerprice_view.layer.cornerRadius=5;
    self.offerprice_view.layer.borderWidth=1.0;
    self.offerprice_view.layer.borderColor=[UIColor colorWithRed:133/255.0 green:25/255.0 blue:41/255.0 alpha:1.0].CGColor;
    
    self.slider_amount_view.layer.cornerRadius=5;
    self.slider_amount_view.layer.borderWidth=1.0;
    self.slider_amount_view.layer.borderColor=[UIColor colorWithRed:133/255.0 green:25/255.0 blue:41/255.0 alpha:1.0].CGColor;
    
    self.onroadvalue_view.layer.cornerRadius=5;
    self.onroadvalue_view.layer.borderWidth=1.0;
    self.onroadvalue_view.layer.borderColor=[UIColor colorWithRed:133/255.0 green:25/255.0 blue:41/255.0 alpha:1.0].CGColor;
    
    
    [self.scroll setContentSize:CGSizeMake(0,1700)];
    
    /// ===  back image ==== /////
    
    backimgview=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 568)];
    backimgview.backgroundColor=[UIColor blackColor];
    backimgview.alpha=0.6;
    [self.view addSubview:backimgview];
    backimgview.hidden=YES;
    
    //imp...related with the sidebar...
    basetab=[[BaseTableView alloc]initWithFrame:CGRectMake(-280, 68, 280, self.view.frame.size.height-50)];
    [self.view addSubview:basetab];
    basetab.hidden=YES;
    
    UISwipeGestureRecognizer * swipeleft=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeleft:)];
    swipeleft.direction=UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeleft];
    
    UISwipeGestureRecognizer * swiperight=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swiperight:)];
    swiperight.direction=UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swiperight];
    
    
    [self.slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    
    /* 
     
     FORMULAS CALCULATION :----
     
     1) Deductor=[existing car amount * sum-value]-Refurbishment(slider)
     
     2)  OFFER PRICE BY MAX.=(existing car amount - deductor)
     
     3) Sum value= Monthvalue + fuelvalue(P/D) + kms + color + owner + remaining insurance(months) + accidental(Y/N) + category(compare string) + CBU/CKD ....
     
     
    [ calculations done in CALCL method.... ]
     
     */
    
    //  SV = fuel_val+kms_val+colour_val+owner_val+Insurance_val+Accidential_val+MDOVV_val+CBUCKDD_val;
    
    
  //  [self GetManufacturerBrandDrpDown];
    
    
    
    
    
    //3nov..
    fuelll_sttr=[NSString stringWithFormat:@"%@",[self.fuel_segment titleForSegmentAtIndex:[self.fuel_segment selectedSegmentIndex]]];
    NSLog(@"fuelll_sttr:%@",fuelll_sttr);
    
    [[NSUserDefaults standardUserDefaults] setValue:fuelll_sttr forKey:@"fuelcliked_str_resullt"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    //3nov..
    cbuckd_sttr=[NSString stringWithFormat:@"%@",[self.valuesgement titleForSegmentAtIndex:[self.valuesgement selectedSegmentIndex]]];
    NSLog(@"cbuckd_sttr:%@",cbuckd_sttr);
    
    [[NSUserDefaults standardUserDefaults] setValue:cbuckd_sttr forKey:@"cbuckd_str_resullt"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    //3nov..
    accidentall_sttr=[NSString stringWithFormat:@"%@",[self.accidentail_segment titleForSegmentAtIndex:[self.accidentail_segment selectedSegmentIndex]]];
    NSLog(@"accidentall_sttr:%@",accidentall_sttr);
    
    [[NSUserDefaults standardUserDefaults] setValue:accidentall_sttr forKey:@"accidentallstrresullt"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    
    
    //==== For Activity Indicator ..using HUD..=======
    
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    HUD.delegate = self;
    HUD.labelText = @"Please Wait...";
    //HUD.mode = MBProgressHUDModeAnnularDeterminate;
    [self.view addSubview:HUD];
    
    [HUD showAnimated:YES whileExecutingBlock:^{
        
       // [self GetUsedCardata_For_Syncing];
       // [self Syncing];
        
        
    } completionBlock:^{
        
        
    }];

    
    //[self GetUsedCardata_For_Syncing];
    
    
    

}





//used car syncing data method....getapi..



//http://maximizer.mdei.info/jlrmaximizer_p2/api/api/getAllUsedcardata


-(void)GetUsedCardata_For_Syncing            //getapi..
{

    NSString *urlString =@"http://maximizer.mdei.info/jlrmaximizer_p2/api/api/getAllUsedcardata";
    
    NSURL *URL = [[NSURL alloc]initWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSData * jsondata= [NSData dataWithContentsOfURL:URL];
    
    id jsonObjects = [NSJSONSerialization JSONObjectWithData:
                      jsondata options:NSJSONReadingMutableContainers error:nil];
    
    NSLog(@"Output :%@",jsonObjects);
    
    NSMutableDictionary * respdic = [[NSMutableDictionary alloc]init];
    
    respdic = [jsonObjects valueForKey:@"usedcardetails"];
    
    arr_id = [respdic valueForKey:@"id"];
    
    
    arr_uid = [respdic valueForKey:@"uid"];
    arr_custid = [respdic valueForKey:@"custid"];
    arr_reportid = [respdic valueForKey:@"report_id"];
    arr_expectedtime = [respdic valueForKey:@"expected_time"];
    arr_expected_budget = [respdic valueForKey:@"expected_budget"];
    arr_action = [respdic valueForKey:@"action"];
    arr_quot_type = [respdic valueForKey:@"quot_type"];
    arr_action_time = [respdic valueForKey:@"action_time"];
    arr_created_on = [respdic valueForKey:@"created_on"];
    arr_fname = [respdic valueForKey:@"fname"];
    arr_lname = [respdic valueForKey:@"lname"];
    arr_salutation = [respdic valueForKey:@"salutation"];
    arr_email = [respdic valueForKey:@"email"];
    arr_cc_email = [respdic valueForKey:@"cc_email"];
    arr_car_make = [respdic valueForKey:@"car_make"];
    arr_car_model = [respdic valueForKey:@"car_model"];
    arr_car_model_type = [respdic valueForKey:@"car_model_type"];
    arr_purchase_year = [respdic valueForKey:@"purchase_year"];
    arr_purchase_month = [respdic valueForKey:@"purchase_month"];
    arr_onroad_value = [respdic valueForKey:@"onroad_value"];
    arr_colour = [respdic valueForKey:@"colour"];
    arr_remain_insurance = [respdic valueForKey:@"remain_insurance"];
    arr_car_kms = [respdic valueForKey:@"car_kms"];
    arr_cbuckd = [respdic valueForKey:@"cbuckd"];
    arr_accidental = [respdic valueForKey:@"accidental"];
    arr_car_fuel_type = [respdic valueForKey:@"car_fuel_type"];
    arr_refurbishment = [respdic valueForKey:@"refurbishment"];
    arr_used_car_estimate_by = [respdic valueForKey:@"used_car_estimate_by"];
    arr_outstanding_estimate_by = [respdic valueForKey:@"outstanding_estimate_by"];
    arr_used_car_purchase_offer = [respdic valueForKey:@"used_car_purchase_offer"];
    arr_owner = [respdic valueForKey:@"owner"];
    arr_car_speed_type = [respdic valueForKey:@"car_speed_type"];
    arr_net_transaction_amount = [respdic valueForKey:@"net_transaction_amount"];
    arr_outstanding_loan_amount = [respdic valueForKey:@"outstanding_loan_amount"];
    arr_loan_amount = [respdic valueForKey:@"loan_amount"];
    arr_interest_rate_percent = [respdic valueForKey:@"interest_rate_percent"];
    arr_loan_tenure = [respdic valueForKey:@"loan_tenure"];
    arr_actual_emi = [respdic valueForKey:@"actual_emi"];
    arr_estimated_foreclose_percent = [respdic valueForKey:@"estimated_foreclose_percent"];
    arr_balance_trade_foreclose = [respdic valueForKey:@"balance_trade_foreclose"];

//    cell1.lbl_name.text =[array1 objectAtIndex:indexPath.row];


    
}
//used car syncing data ends....



//db method...

-(void)Syncing
{
    
NSString *str=[[NSUserDefaults standardUserDefaults]valueForKey:@"db_path"];

NSLog(@"str:%@",str);

database = [FMDatabase databaseWithPath:str];

[database open];

    //27
    
    for (int i=0;i<[arr_car_make count];i++)
    {
        
//        NSString *uidstr=[arr2 objectAtIndex:i];
//        NSLog(@"uidstr:%@",uidstr);
        
      //  NSString *estby=@"estby_static";
        
//expelled after refurb second last line:- "estimation_by" ...
        
        
        
        /* main query
        [database executeUpdate:@"insert into tbl_usedcar_details(uid,Cust_id,Report_id,car_make,car_model,car_model_type,used_car_purchase_offer,outstanding_loan_amount,net_transaction_amount,used_car_estimate_by,outstanding_estimate_by,expected_time,expected_budget,purchase_year,purchase_month,onroad_value,owner,colour,remain_insurance,car_speed_type,car_kms,cbuckd,accidental,car_fuel_type,refurbishment,loan_amount,interest_rate_percent,loan_tenure,actual_emi,estimated_foreclose_percent,balance_trade_foreclose,created_on) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",[arr_uid objectAtIndex:i],[arr_custid objectAtIndex:i],[arr_reportid objectAtIndex:i],[arr_car_make objectAtIndex:i],[arr_car_model objectAtIndex:i],[arr_car_model_type objectAtIndex:i],[arr_used_car_purchase_offer objectAtIndex:i],[arr_outstanding_loan_amount objectAtIndex:i],[arr_net_transaction_amount objectAtIndex:i],[arr_used_car_estimate_by objectAtIndex:i],[arr_outstanding_estimate_by objectAtIndex:i],[arr_expectedtime objectAtIndex:i],[arr_expected_budget objectAtIndex:i],[arr_purchase_year objectAtIndex:i],[arr_purchase_month objectAtIndex:i],[arr_onroad_value objectAtIndex:i],[arr_owner objectAtIndex:i],[arr_colour objectAtIndex:i],[arr_remain_insurance objectAtIndex:i],[arr_car_speed_type objectAtIndex:i],[arr_car_kms objectAtIndex:i],[arr_cbuckd objectAtIndex:i],[arr_accidental objectAtIndex:i],[arr_car_fuel_type objectAtIndex:i],[arr_refurbishment objectAtIndex:i],[arr_loan_amount objectAtIndex:i],[arr_interest_rate_percent objectAtIndex:i],[arr_loan_tenure objectAtIndex:i],[arr_actual_emi objectAtIndex:i],[arr_estimated_foreclose_percent objectAtIndex:i],[arr_balance_trade_foreclose objectAtIndex:i],[arr_created_on objectAtIndex:i],nil]; */
        
        
        
        
        db_reportid_compare = [NSString stringWithFormat:@"%@",[arr_reportid objectAtIndex:i]];
        
        NSLog(@"db_reportid_compare:%@",db_reportid_compare);

        const char *sqlQueryy = [db_reportid_compare UTF8String];
        
        NSLog(@"sqlQueryy:%s",sqlQueryy);
        
       
        NSString *str=[[NSUserDefaults standardUserDefaults]valueForKey:@"db_path"];
        database = [FMDatabase databaseWithPath:str];
        
        [database open];
        
       // arrayfmdb = [[NSMutableArray alloc]init];
       // arrayfmdb_id=[[NSMutableArray alloc]init];
        
        NSString *report_id;
        
        FMResultSet *results = [database executeQuery:@"SELECT * FROM tbl_usedcar_details"];
        
        while ([results next])
        {
            report_id = [results stringForColumn:@"Report_id"];
        
            if (![report_id isEqualToString:[arr_reportid objectAtIndex:i]])
            {
                
               // NSLog(@"Duplicate Entries");
                
                [database executeUpdate:@"insert or replace into tbl_usedcar_details(uid,Cust_id,Report_id,car_make,car_model,car_model_type,used_car_purchase_offer,outstanding_loan_amount,net_transaction_amount,used_car_estimate_by,outstanding_estimate_by,expected_time,expected_budget,purchase_year,purchase_month,onroad_value,owner,colour,remain_insurance,car_speed_type,car_kms,cbuckd,accidental,car_fuel_type,refurbishment,loan_amount,interest_rate_percent,loan_tenure,actual_emi,estimated_foreclose_percent,balance_trade_foreclose,created_on) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",[arr_uid objectAtIndex:i],[arr_custid objectAtIndex:i],[arr_reportid objectAtIndex:i],[arr_car_make objectAtIndex:i],[arr_car_model objectAtIndex:i],[arr_car_model_type objectAtIndex:i],[arr_used_car_purchase_offer objectAtIndex:i],[arr_outstanding_loan_amount objectAtIndex:i],[arr_net_transaction_amount objectAtIndex:i],[arr_used_car_estimate_by objectAtIndex:i],[arr_outstanding_estimate_by objectAtIndex:i],[arr_expectedtime objectAtIndex:i],[arr_expected_budget objectAtIndex:i],[arr_purchase_year objectAtIndex:i],[arr_purchase_month objectAtIndex:i],[arr_onroad_value objectAtIndex:i],[arr_owner objectAtIndex:i],[arr_colour objectAtIndex:i],[arr_remain_insurance objectAtIndex:i],[arr_car_speed_type objectAtIndex:i],[arr_car_kms objectAtIndex:i],[arr_cbuckd objectAtIndex:i],[arr_accidental objectAtIndex:i],[arr_car_fuel_type objectAtIndex:i],[arr_refurbishment objectAtIndex:i],[arr_loan_amount objectAtIndex:i],[arr_interest_rate_percent objectAtIndex:i],[arr_loan_tenure objectAtIndex:i],[arr_actual_emi objectAtIndex:i],[arr_estimated_foreclose_percent objectAtIndex:i],[arr_balance_trade_foreclose objectAtIndex:i],[arr_created_on objectAtIndex:i],nil];

            }
        }
        
      /*  [database executeUpdate:@"insert or replace into tbl_usedcar_details(uid,Cust_id,Report_id,car_make,car_model,car_model_type,used_car_purchase_offer,outstanding_loan_amount,net_transaction_amount,used_car_estimate_by,outstanding_estimate_by,expected_time,expected_budget,purchase_year,purchase_month,onroad_value,owner,colour,remain_insurance,car_speed_type,car_kms,cbuckd,accidental,car_fuel_type,refurbishment,loan_amount,interest_rate_percent,loan_tenure,actual_emi,estimated_foreclose_percent,balance_trade_foreclose,created_on) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",[arr_uid objectAtIndex:i],[arr_custid objectAtIndex:i],[arr_reportid objectAtIndex:i],[arr_car_make objectAtIndex:i],[arr_car_model objectAtIndex:i],[arr_car_model_type objectAtIndex:i],[arr_used_car_purchase_offer objectAtIndex:i],[arr_outstanding_loan_amount objectAtIndex:i],[arr_net_transaction_amount objectAtIndex:i],[arr_used_car_estimate_by objectAtIndex:i],[arr_outstanding_estimate_by objectAtIndex:i],[arr_expectedtime objectAtIndex:i],[arr_expected_budget objectAtIndex:i],[arr_purchase_year objectAtIndex:i],[arr_purchase_month objectAtIndex:i],[arr_onroad_value objectAtIndex:i],[arr_owner objectAtIndex:i],[arr_colour objectAtIndex:i],[arr_remain_insurance objectAtIndex:i],[arr_car_speed_type objectAtIndex:i],[arr_car_kms objectAtIndex:i],[arr_cbuckd objectAtIndex:i],[arr_accidental objectAtIndex:i],[arr_car_fuel_type objectAtIndex:i],[arr_refurbishment objectAtIndex:i],[arr_loan_amount objectAtIndex:i],[arr_interest_rate_percent objectAtIndex:i],[arr_loan_tenure objectAtIndex:i],[arr_actual_emi objectAtIndex:i],[arr_estimated_foreclose_percent objectAtIndex:i],[arr_balance_trade_foreclose objectAtIndex:i],[arr_created_on objectAtIndex:i],nil];*/
        
        
        
        
        
        
        
        
        
        
        
        
      //  [self updateSyncing];

        
       /*
        arrayfmdb_reportid_compare = [[NSMutableArray alloc]init];
        
        
        FMResultSet *results = [database executeQuery:@"SELECT * FROM tbl_usedcar_details"];
//        while ([results next])
//            
//        {
            rep_idd = [results stringForColumn:@"Report_id"];
            NSLog(@"rep_idd:%@",rep_idd);
            
            //  [arrayfmdb_reportid_compare addObject:rep_idd];
            //   NSLog(@"arrayfmdb_reportid_compare:%@",arrayfmdb_reportid_compare);
      //  }
        */

        
        
       // NSLog(@"Output :%@",jsonObjects);
        
     //   NSString *db_reportid_compare = [NSString stringWithFormat:@"select Report_id from tbl_usedcar_details where Report_id='%@'",[arr_reportid objectAtIndex:i]];

        
     //   NSString * dbrepidcompare = select Report_id from tbl_usedcar_details where Report_id=@"%@",[arr_reportid objectAtIndex:i];
        
        
        
        
        
        
        
        /*
         insert or replace into Book (ID, Name, TypeID, Level, Seen) values
         ((select ID from Book where Name = "SearchName"), "SearchName", ...);
         
         
         
         
      [database executeUpdate:@"insert or replace into tbl_usedcar_details (uid,Cust_id,Report_id,car_make,car_model,car_model_type,used_car_purchase_offer,outstanding_loan_amount,net_transaction_amount,used_car_estimate_by,outstanding_estimate_by,expected_time,expected_budget,purchase_year,purchase_month,onroad_value,owner,colour,remain_insurance,car_speed_type,car_kms,cbuckd,accidental,car_fuel_type,refurbishment,loan_amount,interest_rate_percent,loan_tenure,actual_emi,estimated_foreclose_percent,balance_trade_foreclose,created_on) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",((select Report_id from tbl_usedcar_details where Report_id =@"%@",[arr_reportid objectAtIndex:i],nil))];
        
        ((select ID from Book where Name = "SearchName"), "SearchName", ...);*/
       
    }
    
    
    /*
    [database executeUpdate:@"insert into tbl_loan_amount_estimator(LoanAmount,RateOfInterest,loanTenure,MonthlyPayment,EMI,Percent,FinalPrice,LoanAmount,BalanceTrade,EstimationBy) values(?,?,?,?,?,?,?,?,?,?)",self.txt_loanamt.text,self.rate_intrest_txt.text,[self.loan_tenure_btn titleForState:UIControlStateNormal],self.monthly_pay_txt.text,self.txt_emi.text,self.slider_txt.text,self.txt_finalprice.text,self.txt_outstanding_loan.text,self.txt_balance_trsde.text,[self.estimate_btn titleForState:UIControlStateNormal],nil];
    

    
    //19 nov..for reference..28
    [database executeUpdate:@"create table tbl_usedcar_details(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,uid varchar,Cust_id varchar, Report_id varchar, car_make varchar, car_model varchar, car_model_type varchar, used_car_purchase_offer varchar, outstanding_loan_amount varchar, net_transaction_amount varchar, used_car_estimate_by varchar, outstanding_estimate_by varchar,expected_time varchar, expected_budget varchar, purchase_year varchar,purchase_month varchar, onroad_value varchar, owner varchar, colour varchar,remain_insurance varchar, car_speed_type varchar, car_kms varchar, cbuckd varchar, accidental varchar, car_fuel_type varchar, refurbishment varchar, estimation_by varchar, created_on NOT NULL DEFAULT GETDATE())"];

    */
    

[database close];
    
    
}
//db method ends...





-(void)updateSyncing            //postapi..
{
    
    //http://maximizer.mdei.info/jlrmaximizer_p2/api/api/update_sync?data={%22report_id%22:%22R7469%22}
    
     NSString *urlString =[NSString stringWithFormat:@"http://maximizer.mdei.info/jlrmaximizer_p2/api/api/update_sync?data={\"report_id\":\"%@\"}",db_reportid_compare];
    
    
    NSLog(@" urlString %@",urlString);
    
    NSURL *addurl = [[NSURL alloc]initWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSData *jsonData = [NSData dataWithContentsOfURL:addurl];
    if (jsonData)
    {
        NSError *error = nil;
        NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
        if (!error)
        {
            NSLog(@"dataDictionary %@",dataDictionary);
        }
        else
        {
            NSLog(@"error %@",error.description);
        }
        
    }
    else
    {
        NSLog(@"error");
    }
    
    
}







//fr drpdown..

-(int)getRandomNumberBetween:(int)from to:(int)to
{
    
    return (int)from + arc4random() % (to-from+1);
    
}

-(void)UniqueRandom
{
    
    int T[11];
    BOOL flag;
    for(int i=0;i<10;i++){
        
        int ranNo=  random()%100+1;
        flag=TRUE;
        int s=(sizeof T);
        
        for(int x=0;x<s;x++){
            
            if(ranNo==T[x]){
                i--;
                flag= FALSE;
                break;
            }
        }
        
        if(flag) T[i]=ranNo;
    }
    
    for(int j=0;j<100;j++)
        
        NSLog(@"unique random %d",T[j]);
}


- (void) niDropDownDelegateMethod: (NIDropDown *) sender
{
    if(model==true)
    {
        // for drpdown 1 time click...
        NSString *model_sttr=[NSString stringWithFormat:@"%@",self.model_btn.currentTitle];
        NSLog(@"model_sttr:%@",model_sttr);
        
        [[NSUserDefaults standardUserDefaults] setValue:model_sttr forKey:@"EvalExisvehicle_model"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        
        
        //8sept
        
        app=(AppDelegate *)[[UIApplication sharedApplication]delegate];
        
        NSInteger index=[app.drop_index integerValue];
        
        modid=[NSString stringWithFormat:@"%@",[arrayfmdb_id2 objectAtIndex:index]];
        
        NSLog(@"manud:%@",modid);

        
        [self rel1];
    }
   else if(manufacture==true)
    {
        
        // for drpdown 1 time click...
        NSString *manufac_str=[NSString stringWithFormat:@"%@",self.manufacture_btn.currentTitle];
        NSLog(@"manufac_str:%@",manufac_str);
        
        [[NSUserDefaults standardUserDefaults] setValue:manufac_str forKey:@"EvalExisvehicle_manufacturer"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        
       // [self GetManufacturerBrandDrpDown];
       // dropdown = nil;
        ManufacEstr=[NSString stringWithFormat:@"%@",[array_manufacturer_name objectAtIndex:app.index]];
        NSLog(@"ManufacEstr%@",ManufacEstr);
        NSLog(@"ManufacEstr%ld",(long)app.index);

        
        //....
        
        app=(AppDelegate *)[[UIApplication sharedApplication]delegate];
        
        NSInteger index=[app.drop_index integerValue];
        
        manuid=[NSString stringWithFormat:@"%@",[arrayfmdb_id objectAtIndex:index]];
        
        NSLog(@"manud:%@",manuid);
        
        [self rel];
    }
   else if(type==true)
   {
       //for drpdown 1 time click...
       NSString *model_type_sttr=[NSString stringWithFormat:@"%@",self.modeltype_btn.currentTitle];
       NSLog(@"type_sttr:%@",model_type_sttr);
       
       [[NSUserDefaults standardUserDefaults] setValue:model_type_sttr forKey:@"EvalExisvehicle_type"];
       [[NSUserDefaults standardUserDefaults]synchronize];

       
       
       //...
       [self rel2];
       
   }
    
    
    
    
    else
        
    {
        //for drpdown 1 time click...  month;year...
        NSString *mnth=[NSString stringWithFormat:@"%@",self.month_btn.currentTitle];
        NSLog(@"year:%@",mnth);
        
        [[NSUserDefaults standardUserDefaults] setValue:mnth forKey:@"EvalExisvehicle_monthh"];
        [[NSUserDefaults standardUserDefaults]synchronize];


        //owner..for drpdown 1 time click...
        NSString *owner_btn_str=[NSString stringWithFormat:@"%@",self.owner_btn.currentTitle];
        NSLog(@"owner_btn_str:%@",owner_btn_str);
        
        [[NSUserDefaults standardUserDefaults] setValue:owner_btn_str forKey:@"EvalExisvehicle_owner"];
        [[NSUserDefaults standardUserDefaults]synchronize];

        
        //color..for 1 click drpdown..
        NSString *color_sttr=[NSString stringWithFormat:@"%@",self.color_btn.currentTitle];
        NSLog(@"manufac_str:%@",color_sttr);
        
        [[NSUserDefaults standardUserDefaults] setValue:color_sttr forKey:@"EvalExisvehicle_color"];
        [[NSUserDefaults standardUserDefaults]synchronize];

        
        //remaining insurance...
        NSString *insurance_sttr=[NSString stringWithFormat:@"%@",self.remian_insurance_btn.currentTitle];
        NSLog(@"insurance_sttr:%@",insurance_sttr);
        
        [[NSUserDefaults standardUserDefaults] setValue:insurance_sttr forKey:@"EvalExisvehicle_insurance"];
        [[NSUserDefaults standardUserDefaults]synchronize];

        
        //market demond of vehicle..
        NSString *market_demnad_sttr=[NSString stringWithFormat:@"%@",self.market_demnad_btn.currentTitle];
        NSLog(@"market_demnad_sttr:%@",market_demnad_sttr);
        
        [[NSUserDefaults standardUserDefaults] setValue:market_demnad_sttr forKey:@"EvalExisvehicle_market_demnad"];
        [[NSUserDefaults standardUserDefaults]synchronize];

        
        //kms...1 click drpdown..
        NSString *kmss_sttr=[NSString stringWithFormat:@"%@",self.kms_btn.currentTitle];
        NSLog(@"kmss_sttr:%@",kmss_sttr);
        
        [[NSUserDefaults standardUserDefaults] setValue:kmss_sttr forKey:@"EvalExisvehicle_kmss"];
        [[NSUserDefaults standardUserDefaults]synchronize];

        
        //estimation by...1 click drpdown..
        NSString *EvalExisvehicle_estimate_by_sttr=[NSString stringWithFormat:@"%@",self.estimate_btn.currentTitle];
        NSLog(@"EvalExisvehicle_estimate_by_sttr:%@",EvalExisvehicle_estimate_by_sttr);
        
        [[NSUserDefaults standardUserDefaults] setValue:EvalExisvehicle_estimate_by_sttr forKey:@"EvalExisvehicle_estimate_by"];
        [[NSUserDefaults standardUserDefaults]synchronize];

        
        [self rel];
    //  [self CALCL];
        
    }
    
}




/*
//calculating method...
-(void)CALCL
{
    NSDate *currentDate = [NSDate date];
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* components = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:currentDate]; // Get necessary date components
    
    [components month];
    [components day];
    [components year];
    
    float SUM_VAL;
    
    float fuelvalue=[Fuell floatValue];
    float kmsvalue=[kmss floatValue];
    float mdovvalue=[MDOVV floatValue];
    float colorvalue=[Color floatValue];
    float insurancevalue=[Insurancee floatValue];
    float accidentalvalue=[Accidental floatValue];
    float ownervalue=[Ownerr floatValue];

    SUM_VAL=fuelvalue+kmsvalue+mdovvalue+colorvalue+insurancevalue+accidentalvalue+ownervalue;
    
    NSLog(@"sum value:%f",SUM_VAL);
}
*/

-(void)rel
{
  //  if([self isNetworkAvailable] == YES)
   // {
        [self GetManufacturerBrandDrpDown];
 //   dropdown = nil;
 //   ManufacEstr=[NSString stringWithFormat:@"%@",[array_manufacturer_name objectAtIndex:app.index]];
 //   NSLog(@"ManufacEstr%@",ManufacEstr);
 //   NSLog(@"ManufacEstr%ld",(long)app.index);


  //  }
    
   // else
   // {
    dropdown = nil;
    tap = [[UITapGestureRecognizer alloc]
           initWithTarget:self
           action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
   // }
   // [self GetManufacturerBrandDrpDown];
}



-(void)rel1
{
    dropdown1 = nil;
    tap = [[UITapGestureRecognizer alloc]
           initWithTarget:self
           action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
}


-(void)rel2
{
    dropdown2 = nil;
    tap = [[UITapGestureRecognizer alloc]
           initWithTarget:self
           action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


-(void)dismissKeyboard
{

    [self.view endEditing:YES];
    self.scroll.contentSize=CGSizeMake(0, 1700);
    
}


#pragma mark -
#pragma mark -Gesture method

-(void)viewWillAppear:(BOOL)animated
{
    tap = [[UITapGestureRecognizer alloc]
           initWithTarget:self
           action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
    basetab.hidden=YES;
    backimgview.hidden=true;
    self.menubtn.userInteractionEnabled=YES;
    self.sharebtn.userInteractionEnabled=YES;
    self.scroll.userInteractionEnabled=YES;
    
    [self.view endEditing:YES];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.50];
    [UIView setAnimationBeginsFromCurrentState:YES];
    basetab.frame = CGRectMake(-320, 68, 280, self.view.frame.size.height-50);
    [UIView commitAnimations];
    
}

-(void)swipeleft:(UISwipeGestureRecognizer*)gestureRecognizer
{
    tap = [[UITapGestureRecognizer alloc]
           initWithTarget:self
           action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
    self.menubtn.userInteractionEnabled=YES;
    self.sharebtn.userInteractionEnabled=YES;
    self.scroll.userInteractionEnabled=YES;
    
    backimgview.hidden=YES;
    [self.view endEditing:YES];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.50];
    [UIView setAnimationBeginsFromCurrentState:YES];
    basetab.frame = CGRectMake(-320, 68, 280, self.view.frame.size.height-50);
    [UIView commitAnimations];
    
}

-(void)swiperight:(UISwipeGestureRecognizer*)gestureRecognizer
{
    [self.view removeGestureRecognizer:tap];
    
    backimgview.hidden=NO;
    basetab.hidden=NO;
    self.menubtn.userInteractionEnabled=NO;
    self.sharebtn.userInteractionEnabled=NO;
    self.scroll.userInteractionEnabled=NO;
    
    [self.view endEditing:YES];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.50];
    [UIView setAnimationBeginsFromCurrentState:YES];
    basetab.frame = CGRectMake(0, 68, 280, self.view.frame.size.height-50);
    [UIView commitAnimations];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    /*tap = [[UITapGestureRecognizer alloc]
           initWithTarget:self
           action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];*/
    

    
    self.menubtn.userInteractionEnabled=YES;
    self.sharebtn.userInteractionEnabled=YES;
    self.scroll.userInteractionEnabled=YES;
    
    backimgview.hidden=YES;
    [self.view endEditing:YES];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.50];
    [UIView setAnimationBeginsFromCurrentState:YES];
    basetab.frame = CGRectMake(-320, 68, 280, self.view.frame.size.height-50);
    [UIView commitAnimations];
    
    [self.txt_roadvalue resignFirstResponder];
    [self.txt_value1 resignFirstResponder];
    [self.txt_pricebymax resignFirstResponder];
}

#pragma mark -
#pragma mark - Button method

- (void)sliderValueChanged:(UISlider *)sender
{
    /*NSLog(@"slider value = %f", sender.value*4000000);*/
    
    float temp=sender.value*4000000;
    result = (int)temp;
    NSLog(@"result:%d",result);
    
    self.txt_value1.text=[NSString stringWithFormat:@"%d",result];
    
    //3nov..
  [[NSUserDefaults standardUserDefaults] setValue:self.txt_value1.text forKey:@"refurbishment_result"];
    [[NSUserDefaults standardUserDefaults]synchronize];

    
    //implementation of selected particular option(Y or N)...
    //[sat_slider setValue:1.0];
    
    
//    if(0<result<5000)
//    {
    //         Slider=[NSString stringWithFormat:@"%@",@"0"];
    
   // NSLog(@"Slider:%@",Slider);

//    }
    
    
    
    //.....
    
   /* //1.for torv...
    int number = result;
    
    int tremp=[prizestr intValue];
    int final=tremp+number;
    
    self.txt_TORV.text=[NSString stringWithFormat:@"%d",final];*/
    
 //   [[NSUserDefaults standardUserDefaults] setValue:Slider forKey:@"refurbishment_val"];
 //   [[NSUserDefaults standardUserDefaults] synchronize];
    
}

- (IBAction)valuchangedcliked:(id)sender
{
    
    for (int i=0; i<2; i++)
    {
        if ([[self.valuesgement.subviews objectAtIndex:i]isSelected] )
        {
            UIColor *tintcolor=[UIColor colorWithRed:133/255.0 green:25/255.0 blue:41/255.0 alpha:1.0];
            [[self.valuesgement.subviews objectAtIndex:i] setTintColor:tintcolor];
            
            [self.valuesgement titleForSegmentAtIndex:self.valuesgement.selectedSegmentIndex];
            
        }
        else
        {
            [[self.valuesgement.subviews objectAtIndex:i] setTintColor:nil];
        }
    }
    
    
    //implementation of selected particular option(Y or N)...
    
    if ([[self.valuesgement.subviews objectAtIndex:0]isSelected] )
    {
        CBUCKDD=[NSString stringWithFormat:@"%@",@"0"];
        
        NSLog(@"CBUCKDD:%@",CBUCKDD);
    }
    
    else if ([[self.valuesgement.subviews objectAtIndex:1]isSelected] )
    {
       // CBUCKDD=[NSString stringWithFormat:@"%@",@"0.15"];
        
        //int rv=(int)self.txt_roadvalue.text;
        int rv=[self.txt_roadvalue.text intValue];
        
        if (rv>= 2000000 && rv<= 5000000)
        {
            
            CBUCKDD=[NSString stringWithFormat:@"%@",@"0.09"];
        }
        else if(rv >= 5000000 && rv <= 8000000)
        {
        
            CBUCKDD=[NSString stringWithFormat:@"%@",@"0.12"];
            NSLog(@"%@",CBUCKDD);
        }
        else if (rv >= 8000000)
        {
            CBUCKDD=[NSString stringWithFormat:@"%@",@"0.18"];
        }
        
        
        NSLog(@"CBUCKDD:%@",CBUCKDD);
        
        [[NSUserDefaults standardUserDefaults] setValue:CBUCKDD forKey:@"CBUCKDD_val"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
      }
    
    
    
    
    
//    [self.valuesgement titleForSegmentAtIndex:self.valuesgement.selectedSegmentIndex];
//    NSLog(@"valuesgementindex:%@",[self.valuesgement titleForSegmentAtIndex:self.valuesgement.selectedSegmentIndex]);
//    evaluate_CBUCKD=[NSString stringWithFormat:@"%@",[self.valuesgement titleForSegmentAtIndex:self.valuesgement.selectedSegmentIndex]];
//    NSLog(@"evaluate_CBUCKD_index:%@",evaluate_CBUCKD);
//
//    
//    [[NSUserDefaults standardUserDefaults] setValue:evaluate_CBUCKD forKey:@"Evaluate_CBUCKDD_YorN"];
//    [[NSUserDefaults standardUserDefaults] synchronize];
    
   

    
    
    /*
    //..for fuel..p or d..
    NSString *fuell_strz=[[NSUserDefaults standardUserDefaults] objectForKey:@"fuelcliked_str_resullt"];
    self.lbl_fuel.text=[NSString stringWithFormat:@"%@",fuell_strz];
    
    //..for fuel..p or d..
    NSString *octroi_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"Octroi_yesorNo"];
    self.lbl_fuel.text=[NSString stringWithFormat:@"%@",octroi_str];*/


}

- (IBAction)accidentialcliked:(id)sender
{
    for (int i=0; i<2; i++)
    {
        if ([[self.accidentail_segment.subviews objectAtIndex:i]isSelected] )
        {
            UIColor *tintcolor=[UIColor colorWithRed:133/255.0 green:25/255.0 blue:41/255.0 alpha:1.0];
            [[self.accidentail_segment.subviews objectAtIndex:i] setTintColor:tintcolor];
        }
        else
        {
            [[self.accidentail_segment.subviews objectAtIndex:i] setTintColor:nil];
        }
    }
    
    
    //implementation of selected particular option(Y or N)...

    if ([[self.accidentail_segment.subviews objectAtIndex:0]isSelected] )
    {
        Accidental=[NSString stringWithFormat:@"%@",@"0"];
        
        
        NSLog(@"Accidental:%@",Accidental);
    }
    
    else if ([[self.accidentail_segment.subviews objectAtIndex:1]isSelected] )
    {
        Accidental=[NSString stringWithFormat:@"%@",@"0.15"];
        
        NSLog(@"Accidental:%@",Accidental);
    }

    
    [[NSUserDefaults standardUserDefaults] setValue:Accidental forKey:@"Accidential_val"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    

}


-(IBAction)fuelcliked:(id)sender
{

    for (int i=0; i<2; i++)
    {
        if ([[self.fuel_segment.subviews objectAtIndex:i]isSelected] )
        {
            UIColor *tintcolor=[UIColor colorWithRed:133/255.0 green:25/255.0 blue:41/255.0 alpha:1.0];
            [[self.fuel_segment.subviews objectAtIndex:i] setTintColor:tintcolor];
            
            
            [self.fuel_segment titleForSegmentAtIndex:self.fuel_segment.selectedSegmentIndex];
            
            NSLog(@"result:%@",[self.fuel_segment titleForSegmentAtIndex:self.fuel_segment.selectedSegmentIndex]);
        }
        else
        {
            [[self.fuel_segment.subviews objectAtIndex:i] setTintColor:nil];
        }
    }
    
    //implementation of selected particular option(Y or N)...
    
    if ([[self.fuel_segment.subviews objectAtIndex:0]isSelected] )
    {
        Fuell=[NSString stringWithFormat:@"%@",@"0"];
        
        NSLog(@"Fuell:%@",Fuell);
    }
    
    else if ([[self.fuel_segment.subviews objectAtIndex:1]isSelected] )
    {
        Fuell=[NSString stringWithFormat:@"%@",@"0.06"];
        
        NSLog(@"Fuell:%@",Fuell);
    }

}

- (IBAction)homecliekd:(id)sender
{
    [self.view removeGestureRecognizer:tap];
    //self.scroll.userInteractionEnabled=NO;
    
    backimgview.hidden=NO;
    basetab.hidden=NO;
    self.menubtn.userInteractionEnabled=NO;
    self.sharebtn.userInteractionEnabled=NO;
    self.scroll.userInteractionEnabled=NO;
    
    [self.view endEditing:YES];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.50];
    [UIView setAnimationBeginsFromCurrentState:YES];
    basetab.frame = CGRectMake(0, 68, 280, self.view.frame.size.height-50);
    [UIView commitAnimations];
}

- (IBAction)logoutcliked:(id)sender
{
    
}

- (IBAction)nextcliked:(id)sender
{
    /*
    UIStoryboard *storyboard ;
    storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    LoanestimatorViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"LoanestimatorViewController"];
    [self.navigationController pushViewController:vw animated:YES];
    */
    
    //............

    
    NSString *str=[[NSUserDefaults standardUserDefaults]valueForKey:@"db_path"];
    
    NSLog(@"str:%@",str);
    
    database = [FMDatabase databaseWithPath:str];
    
    [database open];
    
    //[[self.modeltype_btn titleForState:UIControlStateNormal] isEqualToString:@"Select"]
    if([[self.manufacture_btn titleForState:UIControlStateNormal] isEqualToString:@"Select"] || [[self.model_btn titleForState:UIControlStateNormal] isEqualToString:@"Select"] || [[self.datebtn titleForState:UIControlStateNormal] isEqualToString:@"Select"]||[[self.month_btn titleForState:UIControlStateNormal] isEqualToString:@"Select"]|| [self.txt_roadvalue.text isEqualToString:@""]||[[self.owner_btn titleForState:UIControlStateNormal] isEqualToString:@"Select"]||[[self.color_btn titleForState:UIControlStateNormal] isEqualToString:@"Select"]||[[self.remian_insurance_btn titleForState:UIControlStateNormal] isEqualToString:@"Select"]||[[self.market_demnad_btn titleForState:UIControlStateNormal] isEqualToString:@"Select"]||[[self.kms_btn titleForState:UIControlStateNormal] isEqualToString:@"Select"]||[[self.owner_btn titleForState:UIControlStateNormal] isEqualToString:@"Select"]||[self.txt_value1.text isEqualToString:@""]||[[self.estimate_btn titleForState:UIControlStateNormal] isEqualToString:@"Select"]||[self.txt_pricebymax.text isEqualToString:@""])
    
    
//    if([self.txt_name.text isEqualToString:@""] || [self.txt_contact_no.text isEqualToString:@""] || [self.txt_email_ID.text isEqualToString:@""] || [self.txt_email_CC.text isEqualToString:@""] || [self.txt_date.text isEqualToString:@""] || [self.txt_exp_budj.text isEqualToString:@""])
    {
        UIAlertView *aert=[[UIAlertView alloc]initWithTitle:@"Maximizer." message:@"Please Enter All The Fields." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [aert show];
    }
    else
    {
    
        [database executeUpdate:@"insert into tbl_evaluate_existing_vehicle(Manufacturer,Model,VehicleModelType,Date,Month,OnRoadValue,Owner,Color,RemainingInsurance,MarketDemand,KMS,ValueRupee,EstimationBy,PriceByMax) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)",[self.manufacture_btn titleForState:UIControlStateNormal],[self.model_btn titleForState:UIControlStateNormal],[self.modeltype_btn titleForState:UIControlStateNormal],[self.datebtn titleForState:UIControlStateNormal],[self.month_btn titleForState:UIControlStateNormal],self.txt_roadvalue.text,[self.owner_btn titleForState:UIControlStateNormal],[self.color_btn titleForState:UIControlStateNormal],[self.remian_insurance_btn titleForState:UIControlStateNormal],[self.market_demnad_btn titleForState:UIControlStateNormal],[self.kms_btn titleForState:UIControlStateNormal],[self.owner_btn titleForState:UIControlStateNormal],self.txt_value1.text,[self.estimate_btn titleForState:UIControlStateNormal],self.txt_pricebymax.text,nil];
        
        
        
        UIStoryboard *storyboard ;
        storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        LoanestimatorViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"LoanestimatorViewController"];
        [self.navigationController pushViewController:vw animated:YES];
        
        
        /*
        if(app.selectindex==0 || app.selectindex==2)
        {
            UIStoryboard *storyboard ;
            storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
            EvaluateexistingvehcleViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"EvaluateexistingvehcleViewController"];
            [self.navigationController pushViewController:vw animated:YES];
        }
        if(app.selectindex==1)
        {
            UIStoryboard *storyboard ;
            storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
            NewvehcleViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"NewvehcleViewController"];
            [self.navigationController pushViewController:vw animated:YES];
        }
        */
        
    }
    
    [database close];
    
}


- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.scroll.contentSize=CGSizeMake(0, 1700);
    
    if (textField == self.txt_roadvalue)
    {
        
        self.view.frame = CGRectMake(0, -50, 320, 568);
        
    }
    if (textField == self.txt_value1)
    {
        self.view.frame = CGRectMake(0, -50, 320, 568);
        
    }
    if (textField == self.txt_pricebymax)
    {
        self.view.frame = CGRectMake(0, -150, 320, 568);
        
    }
    self.scroll.contentSize=CGSizeMake(0, 2000);
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    /*
    if (textField == self.txt_roadvalue)
    {
        self.view.frame = CGRectMake(0, 0, 320, 568);
    }
    if (textField == self.txt_value1)
    {
        self.view.frame = CGRectMake(0, 0, 320, 568);
    }
    if (textField == self.txt_pricebymax)
    {
        self.view.frame = CGRectMake(0, 0, 320, 568);
    }*/
    
    self.view.frame=CGRectMake(0, 0, 320, 568);
    [textField resignFirstResponder];
    
    
    [self Evalcalcllll];
    /*
    //CALCULATION...
    
    [[NSUserDefaults standardUserDefaults] setValue:self.txt_roadvalue.text forKey:@"road_val"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    
    NSString *str0=[[NSUserDefaults standardUserDefaults] objectForKey:@"dates_val"];
    
    NSString *str1=[[NSUserDefaults standardUserDefaults] objectForKey:@"road_val"];
    NSString *str2=[[NSUserDefaults standardUserDefaults] objectForKey:@"fuel_val"];
    NSString *str3=[[NSUserDefaults standardUserDefaults] objectForKey:@"colour_val"];
    NSString *str4=[[NSUserDefaults standardUserDefaults] objectForKey:@"owner_val"];
    NSString *str5=[[NSUserDefaults standardUserDefaults] objectForKey:@"Insurance_val"];
    NSString *str6=[[NSUserDefaults standardUserDefaults] objectForKey:@"Accidential_val"];
    NSString *str7=[[NSUserDefaults standardUserDefaults] objectForKey:@"MDOVV_val"];
    NSString *str8=[[NSUserDefaults standardUserDefaults] objectForKey:@"CBUCKDD_val"];
    NSString *str9=[[NSUserDefaults standardUserDefaults] objectForKey:@"KMS_val"];
    
    
    
    
    float datee_val=[str0 floatValue];
    
    float txt_road_val=[str1 floatValue];
    float fuel_val=[str2 floatValue];
    float colour_val=[str3 floatValue];
    float owner_val=[str4 floatValue];
    float Insurance_val=[str5 floatValue];
    float Accidential_val=[str6 floatValue];
    float MDOVV_val=[str7 floatValue];
    float CBUCKDD_val=[str8 floatValue];
    float kms_val=[str9 floatValue];
    
    
    
    NSLog(@"datee_val:%f",datee_val);
    
    NSLog(@"txt_road_val:%f",txt_road_val);
    NSLog(@"fuel_val:%f",fuel_val);
    NSLog(@"KMS_val:%f",kms_val);
    NSLog(@"colour_val:%f",colour_val);
    NSLog(@"owner_val:%f",owner_val);
    NSLog(@"Insurance_val:%f",Insurance_val);
    NSLog(@"Accidential_val:%f",Accidential_val);
    NSLog(@"MDOVV_val:%f",MDOVV_val);
    NSLog(@"CBUCKDD_val:%f",CBUCKDD_val);
    
    
    

    //sum of all details
    float SUM=datee_val+fuel_val+kms_val+colour_val+owner_val+Insurance_val+Accidential_val+MDOVV_val+CBUCKDD_val;
    NSLog(@"SUM%f",SUM);
    
    
    
    float rdata=[[NSUserDefaults standardUserDefaults] integerForKey:@"refurbishment_val"];
    NSLog(@"rdata%f",rdata);
    //int output=txt_road_val-SUM;
    
    
    float tempval=txt_road_val*SUM;
    NSLog(@"tempval%f",tempval);

    
    float DEDUCTOR=tempval+(float)result;//- - = +
    NSLog(@"deductor%f",DEDUCTOR);
    
    
    float OFFER_PRICE=txt_road_val-DEDUCTOR;
    NSLog(@"OFFER_Price:%f",OFFER_PRICE);
    
    
    NSString *op=[NSString stringWithFormat:@"%f",OFFER_PRICE];
    
    int fr=[op intValue];
    
    self.txt_pricebymax.text=[NSString stringWithFormat:@"%d",fr];
    
    
    
    [[NSUserDefaults standardUserDefaults] setInteger:fr forKey:@"Final_price_value"];//used in loan amont estimator's viewdidload...
    [[NSUserDefaults standardUserDefaults] synchronize];*/


}




//16dec...
-(void)Evalcalcllll
{
    
    [[NSUserDefaults standardUserDefaults] setValue:self.txt_roadvalue.text forKey:@"road_val"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    
    NSString *str0=[[NSUserDefaults standardUserDefaults] objectForKey:@"dates_val"];
    
    NSString *str1=[[NSUserDefaults standardUserDefaults] objectForKey:@"road_val"];
    NSString *str2=[[NSUserDefaults standardUserDefaults] objectForKey:@"fuel_val"];
    NSString *str3=[[NSUserDefaults standardUserDefaults] objectForKey:@"colour_val"];
    NSString *str4=[[NSUserDefaults standardUserDefaults] objectForKey:@"owner_val"];
    NSString *str5=[[NSUserDefaults standardUserDefaults] objectForKey:@"Insurance_val"];
    NSString *str6=[[NSUserDefaults standardUserDefaults] objectForKey:@"Accidential_val"];
    NSString *str7=[[NSUserDefaults standardUserDefaults] objectForKey:@"MDOVV_val"];
    NSString *str8=[[NSUserDefaults standardUserDefaults] objectForKey:@"CBUCKDD_val"];
    NSString *str9=[[NSUserDefaults standardUserDefaults] objectForKey:@"KMS_val"];
    
    
    
    
    float datee_val=[str0 floatValue];
    
    float txt_road_val=[str1 floatValue];
    float fuel_val=[str2 floatValue];
    float colour_val=[str3 floatValue];
    float owner_val=[str4 floatValue];
    float Insurance_val=[str5 floatValue];
    float Accidential_val=[str6 floatValue];
    float MDOVV_val=[str7 floatValue];
    float CBUCKDD_val=[str8 floatValue];
    float kms_val=[str9 floatValue];
    
    
    
    NSLog(@"datee_val:%f",datee_val);
    
    NSLog(@"txt_road_val:%f",txt_road_val);
    NSLog(@"fuel_val:%f",fuel_val);
    NSLog(@"KMS_val:%f",kms_val);
    NSLog(@"colour_val:%f",colour_val);
    NSLog(@"owner_val:%f",owner_val);
    NSLog(@"Insurance_val:%f",Insurance_val);
    NSLog(@"Accidential_val:%f",Accidential_val);
    NSLog(@"MDOVV_val:%f",MDOVV_val);
    NSLog(@"CBUCKDD_val:%f",CBUCKDD_val);
    
    
    
    
    //sum of all details
    float SUM=datee_val+fuel_val+kms_val+colour_val+owner_val+Insurance_val+Accidential_val+MDOVV_val+CBUCKDD_val;
    NSLog(@"SUM%f",SUM);
    
    
    
    float rdata=[[NSUserDefaults standardUserDefaults] integerForKey:@"refurbishment_val"];
    NSLog(@"rdata%f",rdata);
    //int output=txt_road_val-SUM;
    
    
    float tempval=txt_road_val*SUM;
    NSLog(@"tempval%f",tempval);
    
    float ram=txt_road_val-tempval;
    
    float ram2=ram-result;
    
    //float DEDUCTOR=tempval+(float)result;//- - = +
 //   NSLog(@"deductor%f",DEDUCTOR);
    
    
   // float OFFER_PRICE=txt_road_val-DEDUCTOR;
 //   NSLog(@"OFFER_Price:%f",OFFER_PRICE);
    
    float OFFER_PRICE=ram2;
    
    NSString *op=[NSString stringWithFormat:@"%f",OFFER_PRICE];
    
    int fr=[op intValue];
    
    self.txt_pricebymax.text=[NSString stringWithFormat:@"%d",fr];
    
    
    
    [[NSUserDefaults standardUserDefaults] setInteger:fr forKey:@"Final_price_value"];//used in loan amont estimator's viewdidload...
    [[NSUserDefaults standardUserDefaults] synchronize];

}





- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
     self.view.frame=CGRectMake(0, 0, 320, 568);
    [textField resignFirstResponder];
    
    return YES;
}



/*
 http://maximizer.mdei.info/api/api/getAllManufacturer
 http://maximizer.mdei.info/api/api/getModel?data={%22manufacturer%22:%22Toyota%22}
 http://maximizer.mdei.info/api/api/getModel_type?data={%22model%22:%22Corolla%20Altis%22}
  */


//methods for Manufacturer,model and brand....

-(void)GetManufacturerBrandDrpDown

{
    //http://maximizer.mdei.info/jlrmaximizer_p2/api/api/getAllManufacturer
 //   NSString *urlString =@"http://maximizer.mdei.info/api/api/getAllManufacturer";
    
    NSString *urlString =@"http://maximizer.mdei.info/jlrmaximizer_p2/api/api/getAllManufacturer";
    
    NSURL *URL = [[NSURL alloc]initWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSData * jsondata= [NSData dataWithContentsOfURL:URL];
    
    
    id jsonObjects = [NSJSONSerialization JSONObjectWithData:
                      jsondata options:NSJSONReadingMutableContainers error:nil];
    
    NSLog(@"Output :%@",jsonObjects);
    
    NSMutableDictionary * respdic = [[NSMutableDictionary alloc]init];
    
    respdic = [jsonObjects valueForKey:@"userdata"];

    
    array_manufacturer_name = [respdic valueForKey:@"manufacturer"];
    
   // array_brand_id = [respdic valueForKey:@"brand_id"];
    NSLog(@"manufacturer_name%@",array_manufacturer_name);
    
    
}

-(void)getSelctModelDrpDown

{
    
    //    NSString *str1=[NSString stringWithFormat:@"%@",app.modeldrpdownid];
    //    NSLog(@"Output :%@",app.modeldrpdownid);
    
    NSString *urlString =[NSString stringWithFormat:@"http://demo1.geniesoftsystem.com/vahanindia/api/index.php/api/modeldropdwon?data={\"brand_id\":\"%@\"}",brandstr];
    
    
    
    //    NSString *urlString =[NSString stringWithFormat:@"http://demo1.geniesoftsystem.com/vahanindia/api/index.php/api/modeldropdwon?data={\"brand_id\":\"%@\"}"];
    
    NSLog(@"urlstyju%@",urlString);
    
    NSURL *URL = [[NSURL alloc]initWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSData * jsondata= [NSData dataWithContentsOfURL:URL];
    
    
    id jsonObjects = [NSJSONSerialization JSONObjectWithData:
                      jsondata options:NSJSONReadingMutableContainers error:nil];
    
    NSLog(@"Output :%@",jsonObjects);
    
    NSMutableDictionary * respdic = [[NSMutableDictionary alloc]init];
    
    respdic = [jsonObjects valueForKey:@"text"];
    
    
    array_model_name = [respdic valueForKey:@"model_name"];
  //  array_model_id = [respdic valueForKey:@"model_id"];
    
}

/*
-(void)getSelctVersionDrpDown

{
    
    
    //    NSString *str1=[NSString stringWithFormat:@"%@",app.modeldrpdownid];
    //    NSLog(@"Output :%@",app.modeldrpdownid);
    
    
    NSString *urlString =[NSString stringWithFormat:@"http://demo1.geniesoftsystem.com/vahanindia/api/index.php/api/versiondropdwon?data={\"model_id\":\"%@\"}",modelstr];
    NSLog(@"urlstr is %@",urlString);
    
    
    //http://demo1.geniesoftsystem.com/vahanindia/api/index.php/api/versiondropdwon?data={%22model_id%22:%2217%22}
    
    
    // NSString *urlString =[NSString stringWithFormat:@"http://demo1.geniesoftsystem.com/vahanindia/api/index.php/api/versiondropdwon?data={\"model_id\":\"%@\"}",self.btn_outlet_selectbrand.titleLabel.text];
    
    
    
    NSURL *URL = [[NSURL alloc]initWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSData * jsondata= [NSData dataWithContentsOfURL:URL];
    
    
    id jsonObjects = [NSJSONSerialization JSONObjectWithData:
                      jsondata options:NSJSONReadingMutableContainers error:nil];
    
    NSLog(@"Output :%@",jsonObjects);
    
    NSMutableDictionary * respdic = [[NSMutableDictionary alloc]init];
    
    respdic = [jsonObjects valueForKey:@"version"];
    
    
    array_version_name = [respdic valueForKey:@"version_name"];
    NSLog(@"abnkl%@",array_version_name);
    array_version_id = [respdic valueForKey:@"versionid"];
    array_carid = [respdic valueForKey:@"carid"];
    array_carname = [respdic valueForKey:@"carname"];
    array_carimage = [respdic valueForKey:@"carimage"];
    
    
    
}
*/


-(BOOL)isNetworkAvailable
{
    char *hostname;
    struct hostent *hostinfo;
    hostname = "google.com";
    hostinfo = gethostbyname(hostname);
    if (hostinfo == NULL){
        //NSLog(@"-> no connection!\n");
        return NO;
    }
    else{
        //NSLog(@"-> connection established!\n");
        return YES;
    }
}



- (IBAction)btn_manufacturer:(id)sender
{
    
    if([self isNetworkAvailable] == YES)
        
{

   //
    NSMutableArray *arr=[[NSMutableArray alloc]init];
    
    for(int i=0;i<[array_manufacturer_name count];i++)
    {
        
        NSString *namestr=[array_manufacturer_name objectAtIndex:i];
        [arr addObject:namestr];
    }
    
    if(dropdown == nil)
    {
        CGFloat f;
        f = 300;
        dropdown = [[NIDropDown alloc]showDropDown:sender :&f :arr :nil :@"down"];
        dropdown.delegate = self;
    }
    else
    {
        [dropdown hideDropDown:sender];
        [self rel];
    }
    //
}
    
    
    else
{
        
    [self dismissKeyboard];
    
    [self.view removeGestureRecognizer:tap];
    
    manufacture=true;
    model=false;
    type=false;
    
    NSString *str=[[NSUserDefaults standardUserDefaults]valueForKey:@"db_path"];
    database = [FMDatabase databaseWithPath:str];
    
    [database open];
    
    arrayfmdb = [[NSMutableArray alloc]init];
    arrayfmdb_id=[[NSMutableArray alloc]init];
    
    
    FMResultSet *results = [database executeQuery:@"SELECT * FROM tbl_manufacturure"];
    
    while ([results next])
        
    {
        
        name = [results stringForColumn:@"brandname"];
        NSInteger id1=[results intForColumn:@"id"];
        
        [arrayfmdb addObject:name];
        [arrayfmdb_id addObject:[NSString stringWithFormat:@"%ld",(long)id1]];
        
        NSLog(@"arr:%@",arrayfmdb);
         NSLog(@"arr:%@",arrayfmdb_id);
    }
    
    if(dropdown == nil)
    {
        CGFloat f =200;
        dropdown = [[NIDropDown alloc]showDropDown:sender :&f :arrayfmdb :Nil :@"down"];
        dropdown.delegate = (id)self;
        
        
        //for hiding remaining 2 dropdowns..
        dropdown1.hidden=YES;
        dropdown2.hidden=YES;

    }
    else
    {
        [dropdown hideDropDown:sender];
        [self rel];
    }
    
    [database close];
        
        
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /*
   //  a=1;b=0;c=0,d=0;e=0;f=0;g=0;h=0;
     NSMutableArray *arr=[[NSMutableArray alloc]init];
     
     
     for(int i=0;i<[array_manufacturer_name count];i++)
     {
     
     NSString *namestr=[array_manufacturer_name objectAtIndex:i];
     [arr addObject:namestr];
     }
     
     if(dropdown == nil)
     {
     CGFloat f;
     f = 300;
     dropdown = [[NIDropDown alloc]showDropDown:sender :&f :arr :nil :@"down"];
     dropdown.delegate = self;
     }
     else
     {
     [dropdown hideDropDown:sender];
     [self rel1];
     }
    
    */
    
   
   /*
    //implementation of selected particular drpdwn of MANUFACTURER ..
    
    if ([[self.manufacture_btn titleForState:UIControlStateNormal] isEqualToString:@"Audi"])
    {
        manuustr=[NSString stringWithFormat:@"%@",@"Audi"];
        
        NSLog(@"manuustr:%@",manuustr);
        
    }
    else if ([[self.manufacture_btn titleForState:UIControlStateNormal] isEqualToString:@"Bently"])
    {
        
        manuustr=[NSString stringWithFormat:@"%@",@"Bently"];
        
        NSLog(@"manuustr:%@",manuustr);
        
    }
    else if ([[self.manufacture_btn titleForState:UIControlStateNormal] isEqualToString:@"BMW"])
    {
        
        manuustr=[NSString stringWithFormat:@"%@",@"BMW"];
        
        NSLog(@"manuustr:%@",manuustr);
        
    }
    else if ([[self.manufacture_btn titleForState:UIControlStateNormal] isEqualToString:@"Land Rover"])
    {
        
        manuustr=[NSString stringWithFormat:@"%@",@"Land Rover"];
        
        NSLog(@"manuustr:%@",manuustr);
        
    }
    else if ([[self.manufacture_btn titleForState:UIControlStateNormal] isEqualToString:@"Chevrolet"])
    {
        
        manuustr=[NSString stringWithFormat:@"%@",@"Chevrolet"];
        
        NSLog(@"manuustr:%@",manuustr);
        
    }
    else if ([[self.manufacture_btn titleForState:UIControlStateNormal] isEqualToString:@"Ford"])
    {
        
        manuustr=[NSString stringWithFormat:@"%@",@"Ford"];
        
        NSLog(@"manuustr:%@",manuustr);
        
    }
    else if ([[self.manufacture_btn titleForState:UIControlStateNormal] isEqualToString:@"Honda"])
    {
        
        manuustr=[NSString stringWithFormat:@"%@",@"Honda"];
        
        NSLog(@"manuustr:%@",manuustr);
        
    }
    else if ([[self.manufacture_btn titleForState:UIControlStateNormal] isEqualToString:@"Hyundai"])
    {
        
        manuustr=[NSString stringWithFormat:@"%@",@"Hyundai"];
        
        NSLog(@"manuustr:%@",manuustr);
        
    }

    else if ([[self.manufacture_btn titleForState:UIControlStateNormal] isEqualToString:@"jaguar"])
    {
        
        manuustr=[NSString stringWithFormat:@"%@",@"jaguar"];
        
        NSLog(@"manuustr:%@",manuustr);
        
    }

    
    
    [[NSUserDefaults standardUserDefaults] setValue:manuustr forKey:@"EvalExisvehicle_manufacturer"];
    [[NSUserDefaults standardUserDefaults]synchronize];*/
    
    
//    NSString *manufac_str=[NSString stringWithFormat:@"%@",self.manufacture_btn.currentTitle];
//    NSLog(@"manufac_str:%@",manufac_str);
//    
//   [[NSUserDefaults standardUserDefaults] setValue:manufac_str forKey:@"EvalExisvehicle_manufacturer"];
//    [[NSUserDefaults standardUserDefaults]synchronize];


}

- (IBAction)btn_model:(id)sender
{
     [self dismissKeyboard];
    [self.view removeGestureRecognizer:tap];
    
    if(manuid.length==0)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Maximizer" message:@"Select manufacturer first." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        
    }
    else
    {
        model=true;
        manufacture=false;
        type=false;
        
        NSString *str=[[NSUserDefaults standardUserDefaults]valueForKey:@"db_path"];
        database = [FMDatabase databaseWithPath:str];
        
        [database open];
        
        model_arr = [[NSMutableArray alloc]init];
        
        arrayfmdb2 = [[NSMutableArray alloc]init];
        arrayfmdb_id2=[[NSMutableArray alloc]init];
        
        
        FMResultSet *results = [database executeQuery:@"SELECT * FROM tbl_model WHERE manufacturureid = ?",[NSString stringWithFormat:@"%@",manuid]];
        
        while ([results next])
        {
            
           NSString *name1 = [results stringForColumn:@"model_name"];
            NSInteger id2=[results intForColumn:@"modelid"];
            
            [arrayfmdb_id2 addObject:[NSString stringWithFormat:@"%ld",(long)id2]];
            
            // NSLog(@"arr:%@",arrayfmdb);
            NSLog(@"arr:%@",arrayfmdb_id2);

            
            //.........//
            
         
         //   [arrayfmdb2 addObject:name1];//....
            
           [model_arr addObject:name1];
            NSLog(@"arr:%@",model_arr);
            
        }
        
        
        if(dropdown1 == nil)
        {
            CGFloat f =40*(model_arr.count);
            dropdown1 = [[NIDropDown alloc]showDropDown:sender :&f :model_arr :Nil :@"down"];
            dropdown1.delegate = (id)self;
            
            
            //for hiding remaining 2 dropdowns..
            dropdown.hidden=YES;
            dropdown2.hidden=YES;

            
        }
        else{
            [dropdown1 hideDropDown:sender];
            [self rel1];
        }
        
        [database close];
        
        
        
//        //2 nov...
//        NSString *model_sttr=[NSString stringWithFormat:@"%@",self.model_btn.currentTitle];
//        NSLog(@"manufac_str:%@",model_sttr);
//        
//        [[NSUserDefaults standardUserDefaults] setValue:model_sttr forKey:@"EvalExisvehicle_model"];
//        [[NSUserDefaults standardUserDefaults]synchronize];

        
        
        
        /*
        //implementation of selected particular drpdwn of  MODEL....
        
        if ([[self.model_btn titleForState:UIControlStateNormal] isEqualToString:@"A3"])
        {
            modellstr=[NSString stringWithFormat:@"%@",@"A3"];
            
            NSLog(@"modelstr:%@",modellstr);
            
        }
        else if ([[self.model_btn titleForState:UIControlStateNormal] isEqualToString:@"Cabriolet"])
        {
            
            modellstr=[NSString stringWithFormat:@"%@",@"Cabriolet"];
            
            NSLog(@"modelstr:%@",modellstr);
            
        }
        else if ([[self.model_btn titleForState:UIControlStateNormal] isEqualToString:@"Continental Flying Spur"])
        {
            
            modellstr=[NSString stringWithFormat:@"%@",@"Continental Flying Spur"];
            
            NSLog(@"modelstr:%@",modellstr);
            
        }
        else if ([[self.model_btn titleForState:UIControlStateNormal] isEqualToString:@"Continental GT"])
        {
            
            modellstr=[NSString stringWithFormat:@"%@",@"Continental GT"];
            
            NSLog(@"modelstr:%@",modellstr);
            
        }
        else if ([[self.model_btn titleForState:UIControlStateNormal] isEqualToString:@"1 Serires"])
        {
            
            modellstr=[NSString stringWithFormat:@"%@",@"1 Serires"];
            
            NSLog(@"modelstr:%@",modellstr);
            
        }
        else if ([[self.model_btn titleForState:UIControlStateNormal] isEqualToString:@"3 Serires"])
        {
            
            modellstr=[NSString stringWithFormat:@"%@",@"3 Serires"];
            
            NSLog(@"modelstr:%@",modellstr);
            
        }
        else if ([[self.model_btn titleForState:UIControlStateNormal] isEqualToString:@"AVEO"])
        {
            
            modellstr=[NSString stringWithFormat:@"%@",@"AVEO"];
            
            NSLog(@"modelstr:%@",modellstr);
            
        }
        else if ([[self.model_btn titleForState:UIControlStateNormal] isEqualToString:@"AVEO U-VA"])
        {
            
            modellstr=[NSString stringWithFormat:@"%@",@"AVEO U-VA"];
            
            NSLog(@"modelstr:%@",modellstr);
            
        }
        else if ([[self.model_btn titleForState:UIControlStateNormal] isEqualToString:@"Endeavor"])
        {
            
            modellstr=[NSString stringWithFormat:@"%@",@"Endeavor"];
            
            NSLog(@"modelstr:%@",modellstr);
            
        }
        else if ([[self.model_btn titleForState:UIControlStateNormal] isEqualToString:@"Fiesta"])
        {
            
            modellstr=[NSString stringWithFormat:@"%@",@"Fiesta"];
            
            NSLog(@"modelstr:%@",modellstr);
            
        }
        else if ([[self.model_btn titleForState:UIControlStateNormal] isEqualToString:@"Accord"])
        {
            
            modellstr=[NSString stringWithFormat:@"%@",@"Accord"];
            
            NSLog(@"modelstr:%@",modellstr);
            
        }
        else if ([[self.model_btn titleForState:UIControlStateNormal] isEqualToString:@"Amaze"])
        {
            
            modellstr=[NSString stringWithFormat:@"%@",@"Amaze"];
            
            NSLog(@"modelstr:%@",modellstr);
            
        }
        else if ([[self.model_btn titleForState:UIControlStateNormal] isEqualToString:@"Accent"])
        {
            
            modellstr=[NSString stringWithFormat:@"%@",@"Accent"];
            
            NSLog(@"modelstr:%@",modellstr);
            
        }
        else if ([[self.model_btn titleForState:UIControlStateNormal] isEqualToString:@"EON"])
        {
            
            modellstr=[NSString stringWithFormat:@"%@",@"EON"];
            
            NSLog(@"modelstr:%@",modellstr);
            
        }
        else if ([[self.model_btn titleForState:UIControlStateNormal] isEqualToString:@"F-type"])
        {
            
            modellstr=[NSString stringWithFormat:@"%@",@"F-type"];
            
            NSLog(@"modelstr:%@",modellstr);
            
        }
        else if ([[self.model_btn titleForState:UIControlStateNormal] isEqualToString:@"XF"])
        {
            
            modellstr=[NSString stringWithFormat:@"%@",@"XF"];
            
            NSLog(@"modelstr:%@",modellstr);
            
        }
        
        
        [[NSUserDefaults standardUserDefaults] setValue:modellstr forKey:@"EvalExisvehicle_model"];
        [[NSUserDefaults standardUserDefaults]synchronize];*/

    }
    
}

- (IBAction)btn_VMT:(id)sender
{
     [self dismissKeyboard];
    
    
    /*
    manufacture=false;
    model=false;
    type=true;*/
    
    
    [self.view removeGestureRecognizer:tap];
    
    if(modid.length==0)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Maximizer" message:@"Select Model first." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        
    }
    else
    {
        manufacture=false;
        model=false;
        type=true;
        
        NSString *str=[[NSUserDefaults standardUserDefaults]valueForKey:@"db_path"];
        database = [FMDatabase databaseWithPath:str];
        
        [database open];
        
        NSLog(@"model id:%@",modid);
        
        model_type_arr = [[NSMutableArray alloc]init];
        
        FMResultSet *results = [database executeQuery:@"SELECT * FROM tbl_model_type WHERE modelid = ?",[NSString stringWithFormat:@"%@",modid]];
        
        while ([results next])
        {
            
            NSString *name1 = [results stringForColumn:@"type_name"];
            [model_type_arr addObject:name1];
            NSLog(@"arr:%@",model_type_arr);
        }
        
        
        if(dropdown2 == nil)
        {
            CGFloat f =40*(model_type_arr.count);
            dropdown2 = [[NIDropDown alloc]showDropDown:sender :&f :model_type_arr :Nil :@"down"];
             dropdown2.delegate = (id)self;
            
            
            //for hiding remaining 2 dropdowns..
            dropdown.hidden=YES;
            dropdown1.hidden=YES;

            
        }
        else{
            [dropdown2 hideDropDown:sender];
            [self rel2];
        }
        
        [database close];
        
        
        
//        //2 nov...
//        NSString *model_type_sttr=[NSString stringWithFormat:@"%@",self.modeltype_btn.currentTitle];
//        NSLog(@"manufac_str:%@",model_type_sttr);
//        
//       [[NSUserDefaults standardUserDefaults] setValue:model_type_sttr forKey:@"EvalExisvehicle_type"];
//        [[NSUserDefaults standardUserDefaults]synchronize];

        
        
        /*
        //implementation of selected particular drpdwn of   TYPE....
        
        if ([[self.modeltype_btn titleForState:UIControlStateNormal] isEqualToString:@"3 5DTI Attraction"])
        {
            typeestr=[NSString stringWithFormat:@"%@",@"3 5DTI Attraction"];
            
            NSLog(@"typeestr:%@",typeestr);
            
        }
        else if ([[self.modeltype_btn titleForState:UIControlStateNormal] isEqualToString:@"3 5DTI Premium"])
        {
            
            typeestr=[NSString stringWithFormat:@"%@",@"3 5DTI Premium"];
            
            NSLog(@"typeestr:%@",typeestr);
            
        }
        
        if ([[self.modeltype_btn titleForState:UIControlStateNormal] isEqualToString:@"40 TFSI"])
        {
            typeestr=[NSString stringWithFormat:@"%@",@"40 TFSI"];
            
            NSLog(@"typeestr:%@",typeestr);
            
        }
        else if ([[self.modeltype_btn titleForState:UIControlStateNormal] isEqualToString:@"Other"])
        {
            
            typeestr=[NSString stringWithFormat:@"%@",@"Other"];
            
            NSLog(@"typeestr:%@",typeestr);
            
        }
        
        //b
        else if ([[self.modeltype_btn titleForState:UIControlStateNormal] isEqualToString:@"Continental Flying Spur V8(Petrol)"])
        {
            
            typeestr=[NSString stringWithFormat:@"%@",@"Continental Flying Spur V8(Petrol)"];
            
            NSLog(@"typeestr:%@",typeestr);
            
        }
        else if ([[self.modeltype_btn titleForState:UIControlStateNormal] isEqualToString:@"Continental Flying Spur W12(Petrol)"])
        {
            
            typeestr=[NSString stringWithFormat:@"%@",@"Continental Flying Spur W12(Petrol)"];
            
            NSLog(@"typeestr:%@",typeestr);
            
        }
        else if ([[self.modeltype_btn titleForState:UIControlStateNormal] isEqualToString:@"Continental GT Coupe(Petrol)"])
        {
            
            typeestr=[NSString stringWithFormat:@"%@",@"Continental GT Coupe(Petrol)"];
            
            NSLog(@"typeestr:%@",typeestr);
            
        }
        else if ([[self.modeltype_btn titleForState:UIControlStateNormal] isEqualToString:@"Continental GT Speed"])
        {
            
            typeestr=[NSString stringWithFormat:@"%@",@"Continental GT Speed"];
            
            NSLog(@"typeestr:%@",typeestr);
            
        }
        
        //bm
        else if ([[self.modeltype_btn titleForState:UIControlStateNormal] isEqualToString:@"1 Series 116I Hatch Back(Petrol)"])
        {
            
            typeestr=[NSString stringWithFormat:@"%@",@"1 Series 116I Hatch Back(Petrol)"];
            
            NSLog(@"typeestr:%@",typeestr);
            
        }
        else if ([[self.modeltype_btn titleForState:UIControlStateNormal] isEqualToString:@"1 Series 118I Hatch Back(Diesel)"])
        {
            
            typeestr=[NSString stringWithFormat:@"%@",@"1 Series 118I Hatch Back(Diesel)"];
            
            NSLog(@"typeestr:%@",typeestr);
            
        }
        else if ([[self.modeltype_btn titleForState:UIControlStateNormal] isEqualToString:@"3 Series 320 Luxury Line(Diesel)"])
        {
            
            typeestr=[NSString stringWithFormat:@"%@",@"3 Series 320 Luxury Line(Diesel)"];
            
            NSLog(@"typeestr:%@",typeestr);
            
        }
        else if ([[self.modeltype_btn titleForState:UIControlStateNormal] isEqualToString:@"3 Series 320 Sport Line(Diesel)"])
        {
            
            typeestr=[NSString stringWithFormat:@"%@",@"3 Series 320 Sport Line(Diesel)"];
            
            NSLog(@"typeestr:%@",typeestr);
            
        }
        
        
        //chevrolet
        else if ([[self.modeltype_btn titleForState:UIControlStateNormal] isEqualToString:@"1.4"])
        {
            
            typeestr=[NSString stringWithFormat:@"%@",@"1.4"];
            
            NSLog(@"typeestr:%@",typeestr);
            
        }
        else if ([[self.modeltype_btn titleForState:UIControlStateNormal] isEqualToString:@"1.4 LS"])
        {
            
            typeestr=[NSString stringWithFormat:@"%@",@"1.4 LS"];
            
            NSLog(@"typeestr:%@",typeestr);
            
        }
        else if ([[self.modeltype_btn titleForState:UIControlStateNormal] isEqualToString:@"1.2"])
        {
            
            typeestr=[NSString stringWithFormat:@"%@",@"1.2"];
            
            NSLog(@"typeestr:%@",typeestr);
            
        }
        else if ([[self.modeltype_btn titleForState:UIControlStateNormal] isEqualToString:@"1.2 LS"])
        {
            
            typeestr=[NSString stringWithFormat:@"%@",@"1.2 LS"];
            
            NSLog(@"typeestr:%@",typeestr);
            
        }
        
        //ford.;
        else if ([[self.modeltype_btn titleForState:UIControlStateNormal] isEqualToString:@"4*2 Club Series"])
        {
            
            typeestr=[NSString stringWithFormat:@"%@",@"4*2 Club Series"];
            
            NSLog(@"typeestr:%@",typeestr);
            
        }
        else if ([[self.modeltype_btn titleForState:UIControlStateNormal] isEqualToString:@"4*4 Club Series"])
        {
            
            typeestr=[NSString stringWithFormat:@"%@",@"4*4 Club Series"];
            
            NSLog(@"typeestr:%@",typeestr);
            
        }
        else if ([[self.modeltype_btn titleForState:UIControlStateNormal] isEqualToString:@"1.4 Duratec EXI"])
        {
            
            typeestr=[NSString stringWithFormat:@"%@",@"1.4 Duratec EXI"];
            
            NSLog(@"typeestr:%@",typeestr);
            
        }
        else if ([[self.modeltype_btn titleForState:UIControlStateNormal] isEqualToString:@"1.4 Duratec ZX"])
        {
            
            typeestr=[NSString stringWithFormat:@"%@",@"1.4 Duratec ZX"];
            
            NSLog(@"typeestr:%@",typeestr);
            
        }

        //honda
        else if ([[self.modeltype_btn titleForState:UIControlStateNormal] isEqualToString:@"2.4 A/T"])
        {
            
            typeestr=[NSString stringWithFormat:@"%@",@"2.4 A/T"];
            
            NSLog(@"typeestr:%@",typeestr);
            
        }
        else if ([[self.modeltype_btn titleForState:UIControlStateNormal] isEqualToString:@"Other"])
        {
            
            typeestr=[NSString stringWithFormat:@"%@",@"Other"];
            
            NSLog(@"typeestr:%@",typeestr);
            
        }
        else if ([[self.modeltype_btn titleForState:UIControlStateNormal] isEqualToString:@"1.2 E MT(i_VTEC)"])
        {
            
            typeestr=[NSString stringWithFormat:@"%@",@"1.2 E MT(i_VTEC)"];
            
            NSLog(@"typeestr:%@",typeestr);
            
        }
        else if ([[self.modeltype_btn titleForState:UIControlStateNormal] isEqualToString:@"1.2 EX MT(i_VTEC)"])
        {
            
            typeestr=[NSString stringWithFormat:@"%@",@"1.2 EX MT(i_VTEC)"];
            
            NSLog(@"typeestr:%@",typeestr);
            
        }

        
        //hyndai
        else if ([[self.modeltype_btn titleForState:UIControlStateNormal] isEqualToString:@"Executive"])
        {
            
            typeestr=[NSString stringWithFormat:@"%@",@"Executive"];
            
            NSLog(@"typeestr:%@",typeestr);
            
        }
        else if ([[self.modeltype_btn titleForState:UIControlStateNormal] isEqualToString:@"Executive-LPG"])
        {
            
            typeestr=[NSString stringWithFormat:@"%@",@"Executive-LPG"];
            
            NSLog(@"typeestr:%@",typeestr);
            
        }
        
        else if ([[self.modeltype_btn titleForState:UIControlStateNormal] isEqualToString:@"D_Lite(M)"])
        {
            
            typeestr=[NSString stringWithFormat:@"%@",@"D_Lite(M)"];
            
            NSLog(@"typeestr:%@",typeestr);
            
        }
        else if ([[self.modeltype_btn titleForState:UIControlStateNormal] isEqualToString:@"D_Lite(S)"])
        {
            
            typeestr=[NSString stringWithFormat:@"%@",@"D_Lite(S)"];
            
            NSLog(@"typeestr:%@",typeestr);
            
        }

        
        //jaguar
        else if ([[self.modeltype_btn titleForState:UIControlStateNormal] isEqualToString:@"F_Type Coupe(Petrol)"])
        {
            
            typeestr=[NSString stringWithFormat:@"%@",@"F_Type Coupe(Petrol)"];
            
            NSLog(@"typeestr:%@",typeestr);
            
        }
        else if ([[self.modeltype_btn titleForState:UIControlStateNormal] isEqualToString:@"F_Type R(Petrol)"])
        {
            
            typeestr=[NSString stringWithFormat:@"%@",@"F_Type R(Petrol)"];
            
            NSLog(@"typeestr:%@",typeestr);
            
        }
        else if ([[self.modeltype_btn titleForState:UIControlStateNormal] isEqualToString:@"XF 2.2 Diesel Luxury(Diesel)"])
        {
            
            typeestr=[NSString stringWithFormat:@"%@",@"XF 2.2 Diesel Luxury(Diesel)"];
            
            NSLog(@"typeestr:%@",typeestr);
            
        }
        else if ([[self.modeltype_btn titleForState:UIControlStateNormal] isEqualToString:@"XF 2.2 Diesel(Diesel)"])
        {
            
            typeestr=[NSString stringWithFormat:@"%@",@"XF 2.2 Diesel(Diesel)"];
            
            NSLog(@"typeestr:%@",typeestr);
            
        }

        
        
        [[NSUserDefaults standardUserDefaults] setValue:typeestr forKey:@"EvalExisvehicle_type"];
        [[NSUserDefaults standardUserDefaults]synchronize];*/

    }

    
}


- (IBAction)btn_date:(id)sender
{
     [self dismissKeyboard];
    model=false;
    manufacture=false;
    type=false;
    
    [self.view removeGestureRecognizer:tap];
    
    NSString *str=[[NSUserDefaults standardUserDefaults]valueForKey:@"db_path"];
    database = [FMDatabase databaseWithPath:str];
    
    [database open];
    
    arrayfmdb = [[NSMutableArray alloc]init];
    
    FMResultSet *results = [database executeQuery:@"SELECT * FROM tbl_year_purchase"];
    
    while ([results next])
    {
        
        name = [results stringForColumn:@"date"];
        [arrayfmdb addObject:name];
        NSLog(@"arr:%@",arrayfmdb);
        
    }
    
    if(dropdown == nil)
    {
        CGFloat f =200;
        dropdown = [[NIDropDown alloc]showDropDown:sender :&f :arrayfmdb :Nil :@"down"];
        dropdown.delegate = (id)self;
        
        //for hiding remaining 2 dropdowns..
        dropdown1.hidden=YES;
        dropdown2.hidden=YES;

        
    }
    else
    {
        [dropdown hideDropDown:sender];
        [self rel];
    }
    
    [database close];
    
    
    NSDate *currentDate = [NSDate date];
    NSLog(@"currentDate:%@",currentDate);
    
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSLog(@"calendar:%@",calendar);
    
    NSDateComponents* components = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:currentDate]; // Get necessary date components
    NSLog(@"components:%@",components);
    
    [components month];
    NSLog(@"month:%ld",(long)[components month]);
    
    [components day];
    NSLog(@"day:%ld",(long)[components day]);
    
    [components year];
    NSLog(@"year:%ld",(long)[components year]);

    int yr=[self.datebtn.currentTitle intValue];
    NSLog(@"year:%d",yr);
    
    int output=(int)[components year]-yr;
    NSLog(@"output:%d",output);
    
    int mult=output*12;
    NSLog(@"mult:%d",mult);
    if (output!=0)
    {
            
        
    }
    
    [[NSUserDefaults standardUserDefaults] setInteger:yr forKey:@"year_val"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}




- (IBAction)btn_month:(id)sender
{
     [self dismissKeyboard];
    
    model=false;
    manufacture=false;
    type=false;
    [self.view removeGestureRecognizer:tap];
    
    NSString *str=[[NSUserDefaults standardUserDefaults]valueForKey:@"db_path"];
    database = [FMDatabase databaseWithPath:str];
    
    [database open];
    
    arrayfmdb = [[NSMutableArray alloc]init];
    
    FMResultSet *results = [database executeQuery:@"SELECT * FROM tbl_month_purchase"];
    
    while ([results next])
    {
        
        name = [results stringForColumn:@"month"];
        [arrayfmdb addObject:name];
        NSLog(@"arr:%@",arrayfmdb);
        
    }
    
    if(dropdown == nil)
    {
        CGFloat f =200;
        dropdown = [[NIDropDown alloc]showDropDown:sender :&f :arrayfmdb :Nil :@"down"];
        dropdown.delegate = (id)self;
        
        
        //for hiding remaining 2 dropdowns..
        dropdown1.hidden=YES;
        dropdown2.hidden=YES;

        
    }
    else
    {
        [dropdown hideDropDown:sender];
        [self rel];
    }
    
    [database close];
    
    
    
    
    //2 nov..
//    NSString *mnth=[NSString stringWithFormat:@"%@",self.month_btn.currentTitle];
//    NSLog(@"year:%@",mnth);
//    
//    [[NSUserDefaults standardUserDefaults] setValue:mnth forKey:@"EvalExisvehicle_monthh"];
//    [[NSUserDefaults standardUserDefaults]synchronize];

    
    
    
    /*
    NSDate *currentDate = [NSDate date];
    NSLog(@"currentDate:%@",currentDate);
    
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSLog(@"calendar:%@",calendar);
    
    NSDateComponents* components = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:currentDate]; // Get necessary date components
    NSLog(@"components:%@",components);
    
    */
    
    
    
    NSString *getyear=[[NSUserDefaults standardUserDefaults] objectForKey:@"year_val"];
   
    int myyear= [getyear intValue];
    int m1=1;
    
    NSLog(@"getyear:%@",getyear);
    
    if ([self.month_btn.currentTitle isEqualToString:@"January"])
    {
        m1=1;
    }
    else if ([self.month_btn.currentTitle isEqualToString:@"february"])
    {
        m1=2;
    }
    else if ([self.month_btn.currentTitle isEqualToString:@"March"])
    {
        m1=3;
    }
    else if ([self.month_btn.currentTitle isEqualToString:@"April"])
    {
        m1=4;
    }
    else if ([self.month_btn.currentTitle isEqualToString:@"May"])
    {
        m1=5;
    }
    else if ([self.month_btn.currentTitle isEqualToString:@"June"])
    {
        m1=6;
    }
    else if ([self.month_btn.currentTitle isEqualToString:@"July"])
    {
        m1=7;
    }
    else if ([self.month_btn.currentTitle isEqualToString:@"August"])
    {
        m1=8;
    }
    else if ([self.month_btn.currentTitle isEqualToString:@"September"])
    {
        m1=9;
    }
    else if ([self.month_btn.currentTitle isEqualToString:@"October"])
    {
        m1=10;
    }
    else if ([self.month_btn.currentTitle isEqualToString:@"November"])
    {
        m1=11;
    }
    else if ([self.month_btn.currentTitle isEqualToString:@"December"])
    {
        m1=12;
    }
    
    //NSInteger final = m1+myyear+[components month];
   // NSLog(@"final:%ld",final);

    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setYear:myyear];
    [comps setMonth:m1];
    
    NSLog(@"setyear:%d",myyear);
    NSLog(@"setmonth:%d",m1);
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *newDate = [calendar dateFromComponents:comps];
    
    NSDateComponents *timeDifference = [[NSCalendar currentCalendar]
                                        components: NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit |
                                        NSMinuteCalendarUnit | NSSecondCalendarUnit
                                        fromDate:[NSDate date] toDate:newDate options:0];
    
    int months = (int)timeDifference.month;
    
      months= abs(months);
    NSLog(@"monthsdiff:%d",months);
    
    
    [[NSUserDefaults standardUserDefaults] setInteger:months forKey:@"EvaluateYrMnthValue"];
    [[NSUserDefaults standardUserDefaults] synchronize];

    
    
    //NSLog(@"final:%ld",(long)months);
    
    
    
    //...
   /*
    //implementation of selected particular drpdwn..
    if (months>0 && months<12)
    {
        datee=[NSString stringWithFormat:@"%@",@"0.2"];
        
        NSLog(@"dates:%@",datee);
        
    }
    else if (months>=12 && months<18)
    {
        
        datee=[NSString stringWithFormat:@"%@",@"0.24"];
        
        NSLog(@"dates:%@",datee);
        
    }
    else if (months>=18 && months<24)
    {
        
        datee=[NSString stringWithFormat:@"%@",@"0.3"];
        
        NSLog(@"dates:%@",datee);
        
    }
    
    else if (months>=24 && months<30)
    {
        
        datee=[NSString stringWithFormat:@"%@",@"0.35"];
        
        NSLog(@"dates:%@",datee);
        
    }
    else if (months>=30 && months<36)
    {
        
        datee=[NSString stringWithFormat:@"%@",@"0.4"];
        
        NSLog(@"dates:%@",datee);
        
    }
    
     else if (months>=36 && months<42)
    {
        
        datee=[NSString stringWithFormat:@"%@",@"0.44"];
        
        NSLog(@"dates:%@",datee);
        
    }
    
    
    else if (months>=42 && months<48)
    {
        
        datee=[NSString stringWithFormat:@"%@",@"0.48"];
        
        NSLog(@"dates:%@",datee);
        
    }
    
    else if (months>=48 && months<60)
    {
        
        datee=[NSString stringWithFormat:@"%@",@"0.53"];
        
        NSLog(@"dates:%@",datee);
        
    }
    
    else if (months>=60)
    {
        
        datee=[NSString stringWithFormat:@"%@",@"0.6"];
        
        NSLog(@"dates:%@",datee);
        
    }*/
    
    
    
    
  //  ram k
    //implementation of selected particular drpdwn..
    if (months>0 && months<=12)
    {
        datee=[NSString stringWithFormat:@"%@",@"0.2"];
        
        NSLog(@"dates:%@",datee);
        
    }
    else if (months>12 && months<=18)
    {
        
        datee=[NSString stringWithFormat:@"%@",@"0.3"];
        
        NSLog(@"dates:%@",datee);
        
    }
    else if (months>18 && months<=24)
    {
        
         datee=[NSString stringWithFormat:@"%@",@"0.24"];
        NSLog(@"dates:%@",datee);
        
    }
    
    else if (months>24 && months<=30)
    {
        
        datee=[NSString stringWithFormat:@"%@",@"0.4"];
        
        NSLog(@"dates:%@",datee);
        
    }
    else if (months>30 && months<=36)
    {
        
        datee=[NSString stringWithFormat:@"%@",@"0.35"];
        
        NSLog(@"dates:%@",datee);
        
    }
    
    else if (months>36 && months<=42)
    {
        
        datee=[NSString stringWithFormat:@"%@",@"0.48"];
        
        NSLog(@"dates:%@",datee);
        
    }
    
    
    else if (months>42 && months<=48)
    {
        
        datee=[NSString stringWithFormat:@"%@",@"0.44"];
        
        NSLog(@"dates:%@",datee);
        
    }
    
    else if (months>48 && months<=60)
    {
        
        datee=[NSString stringWithFormat:@"%@",@"0.53"];
        
        NSLog(@"dates:%@",datee);
        
    }
    
    else if (months>60)
    {
        
        datee=[NSString stringWithFormat:@"%@",@"0.6"];
        
        NSLog(@"dates:%@",datee);
        
    }

    
    
    [[NSUserDefaults standardUserDefaults] setValue:datee forKey:@"dates_val"];
    [[NSUserDefaults standardUserDefaults] synchronize];

    
}

- (IBAction)btn_owner:(id)sender
{
     [self dismissKeyboard];
    
    model=false;
    manufacture=false;
    type=false;
    
    
    [self.view removeGestureRecognizer:tap];
    
    NSString *str=[[NSUserDefaults standardUserDefaults]valueForKey:@"db_path"];
    database = [FMDatabase databaseWithPath:str];
    
    [database open];
    
    arrayfmdb = [[NSMutableArray alloc]init];
    
    FMResultSet *results = [database executeQuery:@"SELECT * FROM tbl_owner"];
    
    while ([results next])
    {
        
        name = [results stringForColumn:@"owner"];
        [arrayfmdb addObject:name];
        NSLog(@"arr:%@",arrayfmdb);
        
    }
    
    if(dropdown == nil)
    {
        CGFloat f =120;
        dropdown = [[NIDropDown alloc]showDropDown:sender :&f :arrayfmdb :Nil :@"down"];
        dropdown.delegate = (id)self;
        
        
        //for hiding remaining 2 dropdowns..
        dropdown1.hidden=YES;
        dropdown2.hidden=YES;

        
    }
    else
    {
        [dropdown hideDropDown:sender];
        [self rel];
    }
    
    [database close];
    
    
    
    
    //implementation of selected particular drpdwn..
    if ([self.owner_btn.currentTitle isEqualToString:@"1"])
    {
        Ownerr=[NSString stringWithFormat:@"%@",@"0"];
        
        NSLog(@"Ownerr:%@",Ownerr);
        
    }
    else if ([self.owner_btn.currentTitle isEqualToString:@"2"])
    {
        
        Ownerr=[NSString stringWithFormat:@"%@",@"0.1"];
        
        NSLog(@"Ownerr:%@",Ownerr);
        
    }
    else if ([self.owner_btn.currentTitle isEqualToString:@"3"])
    {
        
        Ownerr=[NSString stringWithFormat:@"%@",@"0.15"];
        
        NSLog(@"Ownerr:%@",Ownerr);
        
    }
    
    [[NSUserDefaults standardUserDefaults] setValue:Ownerr forKey:@"owner_val"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
    
    //..drpdown selection...
//    NSString *owner_btn_str=[NSString stringWithFormat:@"%@",self.owner_btn.currentTitle];
//    NSLog(@"owner_btn_str:%@",owner_btn_str);
//    
//    [[NSUserDefaults standardUserDefaults] setValue:owner_btn_str forKey:@"EvalExisvehicle_owner"];
//    [[NSUserDefaults standardUserDefaults]synchronize];


}

- (IBAction)btn_color:(id)sender
{
     [self dismissKeyboard];
    
    model=false;
    manufacture=false;
    type=false;
    
    
    [self.view removeGestureRecognizer:tap];
    
    NSString *str=[[NSUserDefaults standardUserDefaults]valueForKey:@"db_path"];
    database = [FMDatabase databaseWithPath:str];
    
    [database open];
    
    arrayfmdb = [[NSMutableArray alloc]init];
    
    FMResultSet *results = [database executeQuery:@"SELECT * FROM tbl_Color"];
    
    while ([results next])
    {
        
        name = [results stringForColumn:@"color"];
        [arrayfmdb addObject:name];
        NSLog(@"arr:%@",arrayfmdb);
        
    }
    
    if(dropdown == nil)
    {
        CGFloat f =200;
        dropdown = [[NIDropDown alloc]showDropDown:sender :&f :arrayfmdb :Nil :@"down"];
        dropdown.delegate = (id)self;
        
        
        //for hiding remaining 2 dropdowns..
        dropdown1.hidden=YES;
        dropdown2.hidden=YES;

        
    }
    else
    {
        [dropdown hideDropDown:sender];
        [self rel];
    }
    
    [database close];
    
    
    //2 nov...
//    NSString *color_sttr=[NSString stringWithFormat:@"%@",self.color_btn.currentTitle];
//    NSLog(@"manufac_str:%@",color_sttr);
//    
//    [[NSUserDefaults standardUserDefaults] setValue:color_sttr forKey:@"EvalExisvehicle_color"];
//    [[NSUserDefaults standardUserDefaults]synchronize];
    //
    
    
    
    
    
    
    //implementation of selected particular drpdwn..
    if ([self.color_btn.currentTitle isEqualToString:@"Blue"])
    {
        Color=[NSString stringWithFormat:@"%@",@"0.025"];
        
        NSLog(@"Color:%@",Color);
        
    }
    else if ([self.color_btn.currentTitle isEqualToString:@"Red"])
    {
        
        Color=[NSString stringWithFormat:@"%@",@"0.025"];
        
        NSLog(@"Color:%@",Color);
        
    }
    else if ([self.color_btn.currentTitle isEqualToString:@"Black"])
    {
        
        Color=[NSString stringWithFormat:@"%@",@"0"];
        
        NSLog(@"Color:%@",Color);
        
    }
    else if ([self.color_btn.currentTitle isEqualToString:@"White"])
    {
        
        Color=[NSString stringWithFormat:@"%@",@"0"];
        
        NSLog(@"Color:%@",Color);
        
    }

    else if ([self.color_btn.currentTitle isEqualToString:@"Silver"])
    {
        
        Color=[NSString stringWithFormat:@"%@",@"0"];
        
        NSLog(@"Color:%@",Color);
        
    }

    else if ([self.color_btn.currentTitle isEqualToString:@"Green"])
    {
        
        Color=[NSString stringWithFormat:@"%@",@"0"];
        
        NSLog(@"Color:%@",Color);
        
    }
    else if ([self.color_btn.currentTitle isEqualToString:@"Orange"])
    {
        
        Color=[NSString stringWithFormat:@"%@",@"0"];
        
        NSLog(@"Color:%@",Color);
        
    }
    else if ([self.color_btn.currentTitle isEqualToString:@"Yellow"])
    {
        
        Color=[NSString stringWithFormat:@"%@",@"0"];
        
        NSLog(@"Color:%@",Color);
        
    }
    else if ([self.color_btn.currentTitle isEqualToString:@"Purple"])
    {
        
        Color=[NSString stringWithFormat:@"%@",@"0"];
        
        NSLog(@"Color:%@",Color);
        
    }
    else if ([self.color_btn.currentTitle isEqualToString:@"Others"])
    {
        
        Color=[NSString stringWithFormat:@"%@",@"0"];
        
        NSLog(@"Color:%@",Color);
        
    }

    [[NSUserDefaults standardUserDefaults] setValue:Color forKey:@"colour_val"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (IBAction)btn_RI:(id)sender
{
     [self dismissKeyboard];
    
    model=false;
    manufacture=false;
    type=false;
    
    
    [self.view removeGestureRecognizer:tap];
    
    NSString *str=[[NSUserDefaults standardUserDefaults]valueForKey:@"db_path"];
    database = [FMDatabase databaseWithPath:str];
    
    [database open];
    
    arrayfmdb = [[NSMutableArray alloc]init];
    
    FMResultSet *results = [database executeQuery:@"SELECT * FROM tbl_remaining_insurance"];
    
    while ([results next])
    {
        
        name = [results stringForColumn:@"ri"];
        [arrayfmdb addObject:name];
        NSLog(@"arr:%@",arrayfmdb);
        
    }
    
    if(dropdown == nil)
    {
        CGFloat f =160;
        dropdown = [[NIDropDown alloc]showDropDown:sender :&f :arrayfmdb :Nil :@"down"];
        dropdown.delegate = (id)self;
        
        
        //for hiding remaining 2 dropdowns..
        dropdown1.hidden=YES;
        dropdown2.hidden=YES;

        
    }
    else
    {
        [dropdown hideDropDown:sender];
        [self rel];
    }
    
    [database close];
    
    
    //2 nov...
//    NSString *insurance_sttr=[NSString stringWithFormat:@"%@",self.remian_insurance_btn.currentTitle];
//    NSLog(@"insurance_sttr:%@",insurance_sttr);
//    
//   [[NSUserDefaults standardUserDefaults] setValue:insurance_sttr forKey:@"EvalExisvehicle_insurance"];
//    [[NSUserDefaults standardUserDefaults]synchronize];
    //

    
    
    //implementation of selected particular drpdwn..
    if ([[self.remian_insurance_btn titleForState:UIControlStateNormal] isEqualToString:@"10 months"])
    {
        Insurancee=[NSString stringWithFormat:@"%@",@"0"];
        
        NSLog(@"Insurancee:%@",Insurancee);
        
    }
    else if ([[self.remian_insurance_btn titleForState:UIControlStateNormal] isEqualToString:@"6 months"])
    {
        
        Insurancee=[NSString stringWithFormat:@"%@",@"0.005"];
        
        NSLog(@"Insurancee:%@",Insurancee);
        
    }
    else if ([[self.remian_insurance_btn titleForState:UIControlStateNormal] isEqualToString:@"4 months"])
    {
        
        Insurancee=[NSString stringWithFormat:@"%@",@"0.008"];
        
        NSLog(@"Insurancee:%@",Insurancee);
        
    }
    else if ([[self.remian_insurance_btn titleForState:UIControlStateNormal] isEqualToString:@"0 months"])
    {
        
        Insurancee=[NSString stringWithFormat:@"%@",@"0.015"];
        
        NSLog(@"Insurancee:%@",Insurancee);
        
    }

    [[NSUserDefaults standardUserDefaults] setValue:Insurancee forKey:@"Insurance_val"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (IBAction)btn_MDOV:(id)sender
{
     [self dismissKeyboard];
    
    model=false;
    manufacture=false;
    type=false;
    
    
    [self.view removeGestureRecognizer:tap];
    
    NSString *str=[[NSUserDefaults standardUserDefaults]valueForKey:@"db_path"];
    database = [FMDatabase databaseWithPath:str];
    
    [database open];
    
    arrayfmdb = [[NSMutableArray alloc]init];
    
    FMResultSet *results = [database executeQuery:@"SELECT * FROM tbl_market_demand_vehicle"];
    
    while ([results next])
    {
        
        name = [results stringForColumn:@"mdov"];
        [arrayfmdb addObject:name];
        NSLog(@"arr:%@",arrayfmdb);
        
    }
    
    if(dropdown == nil)
    {
        CGFloat f =120;
        dropdown = [[NIDropDown alloc]showDropDown:sender :&f :arrayfmdb :Nil :@"down"];
        dropdown.delegate = (id)self;
        
        
        //for hiding remaining 2 dropdowns..
        dropdown1.hidden=YES;
        dropdown2.hidden=YES;

        
    }
    else
    {
        [dropdown hideDropDown:sender];
        [self rel];
    }
    
    [database close];
    
    
    
    //
//    NSString *market_demnad_sttr=[NSString stringWithFormat:@"%@",self.market_demnad_btn.currentTitle];
//    NSLog(@"market_demnad_sttr:%@",market_demnad_sttr);
//    
//    [[NSUserDefaults standardUserDefaults] setValue:market_demnad_sttr forKey:@"EvalExisvehicle_market_demnad"];
//    [[NSUserDefaults standardUserDefaults]synchronize];
    //

    
    
    
    
    
    //implementation of selected particular drpdwn..
    if ([[self.market_demnad_btn titleForState:UIControlStateNormal] isEqualToString:@"Fast"])
    {
        MDOVV=[NSString stringWithFormat:@"%@",@"0.01"];
        
        NSLog(@"MDOVV:%@",MDOVV);
        
    }
    else if ([[self.market_demnad_btn titleForState:UIControlStateNormal] isEqualToString:@"Average"])
    {
        
        MDOVV=[NSString stringWithFormat:@"%@",@"0.03"];
        
        NSLog(@"MDOVV:%@",MDOVV);
        
    }
    else if ([[self.market_demnad_btn titleForState:UIControlStateNormal] isEqualToString:@"Slow"])
    {
        
        MDOVV=[NSString stringWithFormat:@"%@",@"0.05"];
        
        NSLog(@"MDOVV:%@",MDOVV);
        
    }
    
    [[NSUserDefaults standardUserDefaults] setValue:MDOVV forKey:@"MDOVV_val"];
    [[NSUserDefaults standardUserDefaults] synchronize];

}

- (IBAction)btn_KMS:(id)sender
{
     [self dismissKeyboard];
    
    model=false;
    manufacture=false;
    type=false;
    
    
    [self.view removeGestureRecognizer:tap];
    
    NSString *str=[[NSUserDefaults standardUserDefaults]valueForKey:@"db_path"];
    database = [FMDatabase databaseWithPath:str];
    
    [database open];
    
    arrayfmdb = [[NSMutableArray alloc]init];
    
    FMResultSet *results = [database executeQuery:@"SELECT * FROM tbl_kms"];
    
    while ([results next])
    {
        
        name = [results stringForColumn:@"kms"];
        [arrayfmdb addObject:name];
        NSLog(@"arr:%@",arrayfmdb);
        
    }
    
    if(dropdown == nil)
    {
        CGFloat f =120;
        dropdown = [[NIDropDown alloc]showDropDown:sender :&f :arrayfmdb :Nil :@"down"];
        dropdown.delegate = (id)self;
        
        
        //for hiding remaining 2 dropdowns..
        dropdown1.hidden=YES;
        dropdown2.hidden=YES;

        
    }
    else{
        [dropdown hideDropDown:sender];
        [self rel];
    }
    
    [database close];
    
    
    
    //2 nov...
//    NSString *kmss_sttr=[NSString stringWithFormat:@"%@",self.kms_btn.currentTitle];
//    NSLog(@"kmss_sttr:%@",kmss_sttr);
//    
//    [[NSUserDefaults standardUserDefaults] setValue:kmss_sttr forKey:@"EvalExisvehicle_kmss"];
//    [[NSUserDefaults standardUserDefaults]synchronize];
    //

    
    
    
    //implementation of selected particular drpdwn..
    if ([[self.kms_btn titleForState:UIControlStateNormal] isEqualToString:@"0-10000"])
    {
        kmss=[NSString stringWithFormat:@"%@",@"0"];
        
        NSLog(@"kmss:%@",kmss);

    }
    else if ([[self.kms_btn titleForState:UIControlStateNormal] isEqualToString:@"10000-15000"])
    {
        
        kmss=[NSString stringWithFormat:@"%@",@"0.005"];
        
        NSLog(@"kmss:%@",kmss);

    }
    else if ([[self.kms_btn titleForState:UIControlStateNormal] isEqualToString:@"15000-25000"])
    {
        
        kmss=[NSString stringWithFormat:@"%@",@"0.011"];
        
        NSLog(@"kmss:%@",kmss);
        
    }
    else if ([[self.kms_btn titleForState:UIControlStateNormal] isEqualToString:@"25000-35000"])
    {
        
        kmss=[NSString stringWithFormat:@"%@",@"0.02"];
        
        NSLog(@"kmss:%@",kmss);
        
    }
    else if ([[self.kms_btn titleForState:UIControlStateNormal] isEqualToString:@"35000-45000"])
    {
        
        kmss=[NSString stringWithFormat:@"%@",@"0.032"];
        
        NSLog(@"kmss:%@",kmss);
        
    }
    else if ([[self.kms_btn titleForState:UIControlStateNormal] isEqualToString:@"45000-50000"])
    {
        
        kmss=[NSString stringWithFormat:@"%@",@"0.042"];
        
        NSLog(@"kmss:%@",kmss);
        
    }
    else if ([[self.kms_btn titleForState:UIControlStateNormal] isEqualToString:@"50000-60000"])
    {
        
        kmss=[NSString stringWithFormat:@"%@",@"0.055"];
        
        NSLog(@"kmss:%@",kmss);
        
    }
    else if ([[self.kms_btn titleForState:UIControlStateNormal] isEqualToString:@"60000-70000"])
    {
        
        kmss=[NSString stringWithFormat:@"%@",@"0.065"];
        
        NSLog(@"kmss:%@",kmss);
        
    }

    else if ([[self.kms_btn titleForState:UIControlStateNormal] isEqualToString:@"70000-80000"])
    {
        
        kmss=[NSString stringWithFormat:@"%@",@"0.08"];
        
        NSLog(@"kmss:%@",kmss);
        
    }

    else if ([[self.kms_btn titleForState:UIControlStateNormal] isEqualToString:@"80000-90000"])
    {
        
        kmss=[NSString stringWithFormat:@"%@",@"0.08"];
        
        NSLog(@"kmss:%@",kmss);
        
    }

    else if ([[self.kms_btn titleForState:UIControlStateNormal] isEqualToString:@"90000-100000"])
    {
        
        kmss=[NSString stringWithFormat:@"%@",@"0.08"];
        
        NSLog(@"kmss:%@",kmss);
        
    }

    else if ([[self.kms_btn titleForState:UIControlStateNormal] isEqualToString:@"100000-200000"])
    {
        
        kmss=[NSString stringWithFormat:@"%@",@"0.08"];
        
        NSLog(@"kmss:%@",kmss);
        
    }
    else if ([[self.kms_btn titleForState:UIControlStateNormal] isEqualToString:@"200000-300000"])
    {
        
        kmss=[NSString stringWithFormat:@"%@",@"0.08"];
        
        NSLog(@"kmss:%@",kmss);
        
    }
    else if ([[self.kms_btn titleForState:UIControlStateNormal] isEqualToString:@"300000-400000"])
    {
        
        kmss=[NSString stringWithFormat:@"%@",@"0.08"];
        
        NSLog(@"kmss:%@",kmss);
        
    }
    else if ([[self.kms_btn titleForState:UIControlStateNormal] isEqualToString:@"400000-500000"])
    {
        
        kmss=[NSString stringWithFormat:@"%@",@"0.08"];
        
        NSLog(@"kmss:%@",kmss);
        
    }

    [[NSUserDefaults standardUserDefaults] setValue:kmss forKey:@"KMS_val"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (IBAction)btn_EstimationBy:(id)sender
{
     [self dismissKeyboard];
    
    model=false;
    manufacture=false;
    type=false;
    
    
    [self.view removeGestureRecognizer:tap];
    NSString *str=[[NSUserDefaults standardUserDefaults]valueForKey:@"db_path"];
    database = [FMDatabase databaseWithPath:str];
    
    [database open];
    
    arrayfmdb = [[NSMutableArray alloc]init];
    
    FMResultSet *results = [database executeQuery:@"SELECT * FROM tbl_EstimationBy"];
    
    while ([results next])
        
    {
        name = [results stringForColumn:@"estimationby"];
        [arrayfmdb addObject:name];
        NSLog(@"arr:%@",arrayfmdb);
    }
    
    
    if(dropdown == nil)
    {
        CGFloat f =150;
        dropdown = [[NIDropDown alloc]showDropDown:sender :&f :arrayfmdb :Nil :@"down"];
        dropdown.delegate = (id)self;
        
        //for hiding remaining 2 dropdowns..
        dropdown1.hidden=YES;
        dropdown2.hidden=YES;
        
    }
    else
    {
        [dropdown hideDropDown:sender];
        [self rel];
    }
    
    [database close];
     self.scroll.contentSize=CGSizeMake(0, 1750);
    
    
    
//    NSString *EvalExisvehicle_estimate_by_sttr=[NSString stringWithFormat:@"%@",self.estimate_btn.currentTitle];
//    NSLog(@"EvalExisvehicle_estimate_by_sttr:%@",EvalExisvehicle_estimate_by_sttr);
//    
//    [[NSUserDefaults standardUserDefaults] setValue:EvalExisvehicle_estimate_by_sttr forKey:@"EvalExisvehicle_estimate_by"];
//    [[NSUserDefaults standardUserDefaults]synchronize];

    
}


@end

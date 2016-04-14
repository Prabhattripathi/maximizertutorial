//
//  dashboardViewController.m
//  Maximizer
//
//  Created by Genie Technology on 07/08/15.
//  Copyright (c) 2015 Genie Soft Systems. All rights reserved.
//

#import "dashboardViewController.h"
#import "DashboardCell.h"
#import "BaseTableView.h"
#import "editprofileViewController.h"
#import "AppDelegate.h"
#import "statusreportViewController.h"
#import "RemarkViewController.h"
#import "ViewController.h"
#import "MBProgressHUD.h"



@interface dashboardViewController ()

{
    
    
    DashboardCell *Cell;
    NSMutableArray *imgarr;
    UIImageView *backimgview;
    BaseTableView *basetab;
    
    AppDelegate *app;
    
    MBProgressHUD *HUD;
    
    //for used car sync...
    NSMutableArray * arr_id,*arr_uid,*arr_custid,*arr_reportid,*arr_expectedtime,*arr_expected_budget,*arr_action,*arr_quot_type,*arr_action_time,*arr_created_on,*arr_fname,*arr_lname,*arr_salutation,*arr_email,*arr_cc_email,*arr_car_make,*arr_car_model,*arr_car_model_type,*arr_purchase_year,*arr_purchase_month,*arr_onroad_value,*arr_colour,*arr_remain_insurance,*arr_car_kms,*arr_cbuckd,*arr_accidental,*arr_car_fuel_type,*arr_refurbishment,*arr_used_car_estimate_by,*arr_outstanding_estimate_by,*arr_used_car_purchase_offer,*arr_owner,*arr_car_speed_type,*arr_net_transaction_amount,*arr_outstanding_loan_amount,*arr_loan_amount,*arr_interest_rate_percent,*arr_loan_tenure,*arr_actual_emi,*arr_estimated_foreclose_percent,*arr_balance_trade_foreclose;
    
    NSString *db_reportid_compare;
    
    FMDatabase *database;
    
    NSString *urlString;

}

@end

@implementation dashboardViewController

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
    
    
    app=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
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
    
    
    imgarr=[[NSMutableArray alloc]init];
    [imgarr addObject:[UIImage imageNamed:@"ic_tradeInVehicle.png"]];
    [imgarr addObject:[UIImage imageNamed:@"Vehicle.png"]];
    [imgarr addObject:[UIImage imageNamed:@"Used.png"]];
    [imgarr addObject:[UIImage imageNamed:@"ic_status.png"]];//
    [imgarr addObject:[UIImage imageNamed:@"ic_feedback.png"]];
    [imgarr addObject:[UIImage imageNamed:@"ic_editP.png"]];
    [imgarr addObject:[UIImage imageNamed:@"remark_icon.png"]];
    [imgarr addObject:[UIImage imageNamed:@"ic_logout.png"]];
    
    
    [self.dashcollection registerNib:[UINib nibWithNibName:@"DashboardCell" bundle:nil] forCellWithReuseIdentifier:@"DashboardCell"];
    
    
    UISwipeGestureRecognizer * swipeleft=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeleft:)];
    swipeleft.direction=UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeleft];
    
    UISwipeGestureRecognizer * swiperight=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swiperight:)];
    swiperight.direction=UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swiperight];
    
    //self.dashcollection.showsVerticalScrollIndicator=NO;
    
    
    //==== For Activity Indicator ..using HUD..=======
    
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    HUD.delegate = self;
    HUD.labelText = @"Please Wait...";
    //HUD.mode = MBProgressHUDModeAnnularDeterminate;
    [self.view addSubview:HUD];
    
    [HUD showAnimated:YES whileExecutingBlock:^{
        
        
        
        //background hit api's:---
        
        //for used vehicle....
        
     //   [self GetUsedCardata_For_SyncingN];
     //   [self SyncingN];
     //   [self Getsyncc];
        
        
        //for tradein vehicle....
        
      //   [self GetTradeIndata_For_SyncingN];
       //  [self tradein_SyncingN];
       //   [self tradein_Getsyncc];
        
        
        //for NewVehicle....
        
        // [self GetNewVehicle_For_SyncingN];
        //  [self NewVehicle_SyncingN];
        //  [self NewVehicle_Getsyncc];


        
        
    } completionBlock:^{
        
        
    }];

    
    
   // [self Getsyncc];   // fetch values from local db n pass it to ds below new api....
    
}




//FOR USED VEHICLE STARTSSSSSSSSS......

-(void)GetUsedCardata_For_SyncingN            //getapi..
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
    NSLog(@"arr_custid:%@",arr_custid);
    
    arr_reportid = [respdic valueForKey:@"report_id"];
    NSLog(@"arr_reportid:%@",arr_reportid);

    
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



//db method...for saving in our local db..

-(void)SyncingN
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
           // report_id = [results stringForColumn:@"Report_id"];
          //  NSLog(@"reoid:%@",report_id);
            
          //  if (![report_id isEqualToString:[arr_reportid objectAtIndex:i]])
          //  {
                
                // NSLog(@"Duplicate Entries");
                
                [database executeUpdate:@"insert or replace into tbl_usedcar_details(uid,Cust_id,Report_id,car_make,car_model,car_model_type,used_car_purchase_offer,outstanding_loan_amount,net_transaction_amount,used_car_estimate_by,outstanding_estimate_by,expected_time,expected_budget,purchase_year,purchase_month,onroad_value,owner,colour,remain_insurance,car_speed_type,car_kms,cbuckd,accidental,car_fuel_type,refurbishment,loan_amount,interest_rate_percent,loan_tenure,actual_emi,estimated_foreclose_percent,balance_trade_foreclose,sync_type,created_on) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",[arr_uid objectAtIndex:i],[arr_custid objectAtIndex:i],[arr_reportid objectAtIndex:i],[arr_car_make objectAtIndex:i],[arr_car_model objectAtIndex:i],[arr_car_model_type objectAtIndex:i],[arr_used_car_purchase_offer objectAtIndex:i],[arr_outstanding_loan_amount objectAtIndex:i],[arr_net_transaction_amount objectAtIndex:i],[arr_used_car_estimate_by objectAtIndex:i],[arr_outstanding_estimate_by objectAtIndex:i],[arr_expectedtime objectAtIndex:i],[arr_expected_budget objectAtIndex:i],[arr_purchase_year objectAtIndex:i],[arr_purchase_month objectAtIndex:i],[arr_onroad_value objectAtIndex:i],[arr_owner objectAtIndex:i],[arr_colour objectAtIndex:i],[arr_remain_insurance objectAtIndex:i],[arr_car_speed_type objectAtIndex:i],[arr_car_kms objectAtIndex:i],[arr_cbuckd objectAtIndex:i],[arr_accidental objectAtIndex:i],[arr_car_fuel_type objectAtIndex:i],[arr_refurbishment objectAtIndex:i],[arr_loan_amount objectAtIndex:i],[arr_interest_rate_percent objectAtIndex:i],[arr_loan_tenure objectAtIndex:i],[arr_actual_emi objectAtIndex:i],[arr_estimated_foreclose_percent objectAtIndex:i],[arr_balance_trade_foreclose objectAtIndex:i],@"True",[arr_created_on objectAtIndex:i],nil];
            
            
            //14dec..
            /*
              [database executeUpdate:@"create table tbl_usedcar_details(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,Report_id varchar,Salutation varchar,Name varchar,LastName varchar,ContactNo varchar,Mail varchar,CCMail varchar,Date varchar,Budget varchar,Evaluate_Manufacturer varchar,Evaluate_ModelType varchar,Evaluate_VehicleModelType varchar,Evaluate_Date varchar,Evaluate_Month varchar,Evaluate_OnRoadValue varchar, Evaluate_Owner varchar,Evaluate_Color varchar,Evaluate_RemainingInsurance varchar, Evaluate_MarketDemand varchar,Evaluate_KMS varchar,Evaluate_CBUCKD varchar,Evaluate_Accidental varchar,Evaluate_Fuel varchar,Evaluate_Refurbishment varchar,Evaluate_EstimationBy varchar,Evaluate_OfferPriceByMax varchar,LoanAmountEstimator_LoanAmountTaken varchar, LoanAmountEstimator_RateOfInterest varchar, LoanAmountEstimator_loanTenure varchar, LoanAmountEstimator_MonthlyPayment varchar, LoanAmountEstimator_EMI varchar, LoanAmountEstimator_Percent varchar, LoanAmountEstimator_FinalPrice varchar, LoanAmountEstimator_OutstandingLoan varchar, LoanAmountEstimator_BalanceTradeforclose varchar, LoanAmountEstimator_EstimationBy varchar)"];
             */
                
           // }
        }
        
        /*  [database executeUpdate:@"insert or replace into tbl_usedcar_details(uid,Cust_id,Report_id,car_make,car_model,car_model_type,used_car_purchase_offer,outstanding_loan_amount,net_transaction_amount,used_car_estimate_by,outstanding_estimate_by,expected_time,expected_budget,purchase_year,purchase_month,onroad_value,owner,colour,remain_insurance,car_speed_type,car_kms,cbuckd,accidental,car_fuel_type,refurbishment,loan_amount,interest_rate_percent,loan_tenure,actual_emi,estimated_foreclose_percent,balance_trade_foreclose,created_on) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",[arr_uid objectAtIndex:i],[arr_custid objectAtIndex:i],[arr_reportid objectAtIndex:i],[arr_car_make objectAtIndex:i],[arr_car_model objectAtIndex:i],[arr_car_model_type objectAtIndex:i],[arr_used_car_purchase_offer objectAtIndex:i],[arr_outstanding_loan_amount objectAtIndex:i],[arr_net_transaction_amount objectAtIndex:i],[arr_used_car_estimate_by objectAtIndex:i],[arr_outstanding_estimate_by objectAtIndex:i],[arr_expectedtime objectAtIndex:i],[arr_expected_budget objectAtIndex:i],[arr_purchase_year objectAtIndex:i],[arr_purchase_month objectAtIndex:i],[arr_onroad_value objectAtIndex:i],[arr_owner objectAtIndex:i],[arr_colour objectAtIndex:i],[arr_remain_insurance objectAtIndex:i],[arr_car_speed_type objectAtIndex:i],[arr_car_kms objectAtIndex:i],[arr_cbuckd objectAtIndex:i],[arr_accidental objectAtIndex:i],[arr_car_fuel_type objectAtIndex:i],[arr_refurbishment objectAtIndex:i],[arr_loan_amount objectAtIndex:i],[arr_interest_rate_percent objectAtIndex:i],[arr_loan_tenure objectAtIndex:i],[arr_actual_emi objectAtIndex:i],[arr_estimated_foreclose_percent objectAtIndex:i],[arr_balance_trade_foreclose objectAtIndex:i],[arr_created_on objectAtIndex:i],nil];*/
        
    }
    
    [database close];
    
}



//3rd last imp API for-loop data dat i vl send to heena,,...
-(void)Getsyncc
{
    
    //hit api:-
    /*
     maximizer.mdei.info/jlrmaximizer_p2/api/api/sync_usedcar_vehicle?data={"uid":"DLR139","custid":"40",
     "salutation":"Mr","fname":"kiran","lname":"patil","email":"kiran@gmail.com","phone":"7678351436",
     "cc_email":"heena@gmail.com", "report_id":"R6633",
     "registration_charges":"0","used_car_purchase_offer":"380000",
     "outstanding_loan_amount":"547740","net_transaction_amount":"14015458","used_car_estimate_by":"usedcar_rep",
     "outstanding_estimate_by":"out_product_sp","expected_time":"13-12-2016","expected_budget":"2000000",
     "car_make":"BMW","car_model":"3 Series","car_model_type":"3 Series 320d Luxury Line(Diesel)",
     "purchase_year":"2013","purchase_month":"3","onroad_value":"4000000","owner":"2",
     "colour":"red","remain_insurance":"6m","car_speed_type":"fast","car_kms":"35.45",
     "cbuckd":"no","accidental":"no","car_fuel_type":"petrol","old_refurb":"0","estimation_by":"out_product_sp",
     "loan_amount":"2000000","interest_rate_percent":"9","loan_tenure":"3","actual_emi":"63599",
     "estimated_foreclose_percent":"0","final_offer_price":"1472000","outstanding_loan":"249714","balance_trade_foreclose":"1472000"}
     */
    for (int i=0;i<[arr_car_make count];i++)
    {

   /* [database executeUpdate:@"insert or replace into tbl_usedcar_details(uid,Cust_id,Report_id,car_make,car_model,car_model_type,used_car_purchase_offer,outstanding_loan_amount,net_transaction_amount,used_car_estimate_by,outstanding_estimate_by,expected_time,expected_budget,purchase_year,purchase_month,onroad_value,owner,colour,remain_insurance,car_speed_type,car_kms,cbuckd,accidental,car_fuel_type,refurbishment,loan_amount,interest_rate_percent,loan_tenure,actual_emi,estimated_foreclose_percent,balance_trade_foreclose,created_on) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",[arr_uid objectAtIndex:i],[arr_custid objectAtIndex:i],[arr_reportid objectAtIndex:i],[arr_car_make objectAtIndex:i],[arr_car_model objectAtIndex:i],[arr_car_model_type objectAtIndex:i],[arr_used_car_purchase_offer objectAtIndex:i],[arr_outstanding_loan_amount objectAtIndex:i],[arr_net_transaction_amount objectAtIndex:i],[arr_used_car_estimate_by objectAtIndex:i],[arr_outstanding_estimate_by objectAtIndex:i],[arr_expectedtime objectAtIndex:i],[arr_expected_budget objectAtIndex:i],[arr_purchase_year objectAtIndex:i],[arr_purchase_month objectAtIndex:i],[arr_onroad_value objectAtIndex:i],[arr_owner objectAtIndex:i],[arr_colour objectAtIndex:i],[arr_remain_insurance objectAtIndex:i],[arr_car_speed_type objectAtIndex:i],[arr_car_kms objectAtIndex:i],[arr_cbuckd objectAtIndex:i],[arr_accidental objectAtIndex:i],[arr_car_fuel_type objectAtIndex:i],[arr_refurbishment objectAtIndex:i],[arr_loan_amount objectAtIndex:i],[arr_interest_rate_percent objectAtIndex:i],[arr_loan_tenure objectAtIndex:i],[arr_actual_emi objectAtIndex:i],[arr_estimated_foreclose_percent objectAtIndex:i],[arr_balance_trade_foreclose objectAtIndex:i],[arr_created_on objectAtIndex:i],nil];*/

        
        
        
    //parsing begins.....40 entities in below API...
        //NSString *urlString
        
    urlString=[NSString stringWithFormat:@"http://maximizer.mdei.info/jlrmaximizer_p2/api/api/sync_usedcar_vehicle?data={\"uid\":\"%@\",\"custid\":\"%@\",\"salutation\":\"%@\",\"fname\":\"%@\",\"lname\":\"%@\",\"email\":\"%@\",\"phone\":\"%@\",\"cc_email\":\"%@\",\"report_id\":\"%@\",\"used_car_purchase_offer\":\"%@\",\"outstanding_loan_amount\":\"%@\",\"net_transaction_amount\":\"%@\",\"used_car_estimate_by\":\"%@\",\"outstanding_estimate_by\":\"%@\",\"expected_time\":\"%@\",\"expected_budget\":\"%@\",\"car_make\":\"%@\",\"car_model\":\"%@\",\"car_model_type\":\"%@\",\"purchase_year\":\"%@\",\"purchase_month\":\"%@\",\"onroad_value\":\"%@\",\"owner\":\"%@\",\"colour\":\"%@\",\"remain_insurance\":\"%@\",\"car_speed_type\":\"%@\",\"car_kms\":\"%@\",\"cbuckd\":\"%@\",\"accidental\":\"%@\",\"car_fuel_type\":\"%@\",\"old_refurb\":\"%@\",\"estimation_by\":\"%@\",\"loan_amount\":\"%@\",\"interest_rate_percent\":\"%@\",\"loan_tenure\":\"%@\",\"actual_emi\":\"%@\",\"estimated_foreclose_percent\":\"%@\",\"final_offer_price\":\"%@\",\"outstanding_loan\":\"%@\",\"balance_trade_foreclose\":\"%@\"}",[arr_uid objectAtIndex:i],[arr_custid objectAtIndex:i],@"mr_static",@"suraj_static",@"kumar_static",@"suraj@static.com",@"static_1234",@"ccsurajstatic",@"R141216",[arr_used_car_purchase_offer objectAtIndex:i],[arr_outstanding_loan_amount objectAtIndex:i],[arr_net_transaction_amount objectAtIndex:i],[arr_used_car_estimate_by objectAtIndex:i],[arr_outstanding_estimate_by objectAtIndex:i],[arr_expectedtime objectAtIndex:i],[arr_expected_budget objectAtIndex:i],[arr_car_make objectAtIndex:i],[arr_car_model objectAtIndex:i],[arr_car_model_type objectAtIndex:i],[arr_purchase_year objectAtIndex:i],[arr_purchase_month objectAtIndex:i],[arr_onroad_value objectAtIndex:i],[arr_owner objectAtIndex:i],[arr_colour objectAtIndex:i],[arr_remain_insurance objectAtIndex:i],[arr_car_speed_type objectAtIndex:i],[arr_car_kms objectAtIndex:i],[arr_cbuckd objectAtIndex:i],[arr_accidental objectAtIndex:i],[arr_car_fuel_type objectAtIndex:i],@"oldrefurb_static",[arr_refurbishment objectAtIndex:i],[arr_loan_amount objectAtIndex:i],[arr_interest_rate_percent objectAtIndex:i],[arr_loan_tenure objectAtIndex:i],[arr_actual_emi objectAtIndex:i],[arr_estimated_foreclose_percent objectAtIndex:i],[arr_used_car_purchase_offer objectAtIndex:i],[arr_outstanding_loan_amount objectAtIndex:i],[arr_balance_trade_foreclose objectAtIndex:i]];
        
        
        //[arr_reportid objectAtIndex:i]
    
    
    NSLog(@" urlString %@",urlString);
        
        
        
        
        
   /*
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
    }*/
    
}
    
    
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


//FOR USED VEHICLE ENDSSSSSSSSSSSSSSSS......










//FOR TRADEIN STARTSSSSSSSSS......

-(void)GetTradeIndata_For_SyncingN            //getapi..
{
    
  NSString *urlString =@"http://maximizer.mdei.info/jlrmaximizer_p2/api/api/getAllTradeindata";
    
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
    NSLog(@"arr_custid:%@",arr_custid);
    
    arr_reportid = [respdic valueForKey:@"report_id"];
    NSLog(@"arr_reportid:%@",arr_reportid);
    
    
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



//db method...for saving in our local db..

-(void)tradein_SyncingN
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
        
        FMResultSet *results = [database executeQuery:@"SELECT * FROM tbl_TradeInVehicle"];
        
        while ([results next])
        {
            report_id = [results stringForColumn:@"Report_id"];
            NSLog(@"reoid:%@",report_id);
            
            if (![report_id isEqualToString:[arr_reportid objectAtIndex:i]])
            {
                
                // NSLog(@"Duplicate Entries");
                
                [database executeUpdate:@"insert or replace into tbl_TradeInVehicle(uid,Cust_id,Report_id,car_make,car_model,car_model_type,used_car_purchase_offer,outstanding_loan_amount,net_transaction_amount,used_car_estimate_by,outstanding_estimate_by,expected_time,expected_budget,purchase_year,purchase_month,onroad_value,owner,colour,remain_insurance,car_speed_type,car_kms,cbuckd,accidental,car_fuel_type,refurbishment,loan_amount,interest_rate_percent,loan_tenure,actual_emi,estimated_foreclose_percent,balance_trade_foreclose,sync_type,created_on) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",[arr_uid objectAtIndex:i],[arr_custid objectAtIndex:i],[arr_reportid objectAtIndex:i],[arr_car_make objectAtIndex:i],[arr_car_model objectAtIndex:i],[arr_car_model_type objectAtIndex:i],[arr_used_car_purchase_offer objectAtIndex:i],[arr_outstanding_loan_amount objectAtIndex:i],[arr_net_transaction_amount objectAtIndex:i],[arr_used_car_estimate_by objectAtIndex:i],[arr_outstanding_estimate_by objectAtIndex:i],[arr_expectedtime objectAtIndex:i],[arr_expected_budget objectAtIndex:i],[arr_purchase_year objectAtIndex:i],[arr_purchase_month objectAtIndex:i],[arr_onroad_value objectAtIndex:i],[arr_owner objectAtIndex:i],[arr_colour objectAtIndex:i],[arr_remain_insurance objectAtIndex:i],[arr_car_speed_type objectAtIndex:i],[arr_car_kms objectAtIndex:i],[arr_cbuckd objectAtIndex:i],[arr_accidental objectAtIndex:i],[arr_car_fuel_type objectAtIndex:i],[arr_refurbishment objectAtIndex:i],[arr_loan_amount objectAtIndex:i],[arr_interest_rate_percent objectAtIndex:i],[arr_loan_tenure objectAtIndex:i],[arr_actual_emi objectAtIndex:i],[arr_estimated_foreclose_percent objectAtIndex:i],[arr_balance_trade_foreclose objectAtIndex:i],@"True",[arr_created_on objectAtIndex:i],nil];
                
            }
        }
        
        /*  [database executeUpdate:@"insert or replace into tbl_usedcar_details(uid,Cust_id,Report_id,car_make,car_model,car_model_type,used_car_purchase_offer,outstanding_loan_amount,net_transaction_amount,used_car_estimate_by,outstanding_estimate_by,expected_time,expected_budget,purchase_year,purchase_month,onroad_value,owner,colour,remain_insurance,car_speed_type,car_kms,cbuckd,accidental,car_fuel_type,refurbishment,loan_amount,interest_rate_percent,loan_tenure,actual_emi,estimated_foreclose_percent,balance_trade_foreclose,created_on) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",[arr_uid objectAtIndex:i],[arr_custid objectAtIndex:i],[arr_reportid objectAtIndex:i],[arr_car_make objectAtIndex:i],[arr_car_model objectAtIndex:i],[arr_car_model_type objectAtIndex:i],[arr_used_car_purchase_offer objectAtIndex:i],[arr_outstanding_loan_amount objectAtIndex:i],[arr_net_transaction_amount objectAtIndex:i],[arr_used_car_estimate_by objectAtIndex:i],[arr_outstanding_estimate_by objectAtIndex:i],[arr_expectedtime objectAtIndex:i],[arr_expected_budget objectAtIndex:i],[arr_purchase_year objectAtIndex:i],[arr_purchase_month objectAtIndex:i],[arr_onroad_value objectAtIndex:i],[arr_owner objectAtIndex:i],[arr_colour objectAtIndex:i],[arr_remain_insurance objectAtIndex:i],[arr_car_speed_type objectAtIndex:i],[arr_car_kms objectAtIndex:i],[arr_cbuckd objectAtIndex:i],[arr_accidental objectAtIndex:i],[arr_car_fuel_type objectAtIndex:i],[arr_refurbishment objectAtIndex:i],[arr_loan_amount objectAtIndex:i],[arr_interest_rate_percent objectAtIndex:i],[arr_loan_tenure objectAtIndex:i],[arr_actual_emi objectAtIndex:i],[arr_estimated_foreclose_percent objectAtIndex:i],[arr_balance_trade_foreclose objectAtIndex:i],[arr_created_on objectAtIndex:i],nil];*/
        
    }
    
    [database close];
    
}



//3rd last imp API for-loop data dat i vl send to heena,,...
-(void)tradein_Getsyncc
{
    
    //hit api:-
    
       /*
    //trade api
    
     maximizer.mdei.info/jlrmaximizer_p2/api/api/sync_tradein_vehicle?data={"uid":"DLR139","custid":"39",
     "salutation":"Mr","fname":"manmeet","lname":"singh","email":"manmeet@gmail.com","phone":"7678321436",
     "cc_email":"heena@gmail.com","report_id":"R52233","newcar_make":"Jaguar",
     "newcar_model":"F-Type","newcar_model_type":"3.0 S/C Coupe S (ST2 380 PS)","ex_showroom_price":"13766186",
     "insurance":"13766186","logistics_charges":"0","registration_charges":"0","accessories":"0",
     "service_plan":"3 year Solitaire","service_plan_amount":"0","ext_warranty":"4th yr upto 125000 Kms",
     "ext_warranty_amount":"81532","total_onroad_amount":"13847718","used_car_purchase_offer":"380000",
     "outstanding_loan_amount":"547740","net_transaction_amount":"14015458","used_car_estimate_by":"usedcar_rep",
     "outstanding_estimate_by":"out_product_sp","expected_time":"13-12-2016","expected_budget":"2000000",
     "car_make":"BMW","car_model":"3 Series","car_model_type":"3 Series 320d Luxury Line(Diesel)",
     "purchase_year":"2013","purchase_month":"3","onroad_value":"4000000","owner":"2",
     "colour":"red","remain_insurance":"6m","car_speed_type":"fast","car_kms":"35.45",
     "cbuckd":"no","accidental":"no","car_fuel_type":"petrol","old_refurb":"0",
     "octroi":"no","customer_discount":"0","downpayment":"81532","sugg_loan_amount":"11003630",
     "loan_amount":"2000000","interest_rate_percent":"9","loan_tenure":"3","actual_emi":"63599",
     "estimated_foreclose_percent":"0","final_offer_price":"1472000","outstanding_loan":"249714","balance_trade_foreclose":"1472000",
     "options":"total_outflow,interest_rate,down_payment,emi_value,loan_tenure_years",
     "scheme1":"12807820,9.7,81532,353508,3 Years",
     "scheme2":"13401436,9.7,81532,277498,4 Years",
     "scheme3":"14011972,9.7,81532,232174,5 Years",
     "scheme4":"15283180,9.7,81532,180972,7 Years"}
    */
    
    
    
    for (int i=0;i<[arr_car_make count];i++)
    {
        
        /* [database executeUpdate:@"insert or replace into tbl_usedcar_details(uid,Cust_id,Report_id,car_make,car_model,car_model_type,used_car_purchase_offer,outstanding_loan_amount,net_transaction_amount,used_car_estimate_by,outstanding_estimate_by,expected_time,expected_budget,purchase_year,purchase_month,onroad_value,owner,colour,remain_insurance,car_speed_type,car_kms,cbuckd,accidental,car_fuel_type,refurbishment,loan_amount,interest_rate_percent,loan_tenure,actual_emi,estimated_foreclose_percent,balance_trade_foreclose,created_on) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",[arr_uid objectAtIndex:i],[arr_custid objectAtIndex:i],[arr_reportid objectAtIndex:i],[arr_car_make objectAtIndex:i],[arr_car_model objectAtIndex:i],[arr_car_model_type objectAtIndex:i],[arr_used_car_purchase_offer objectAtIndex:i],[arr_outstanding_loan_amount objectAtIndex:i],[arr_net_transaction_amount objectAtIndex:i],[arr_used_car_estimate_by objectAtIndex:i],[arr_outstanding_estimate_by objectAtIndex:i],[arr_expectedtime objectAtIndex:i],[arr_expected_budget objectAtIndex:i],[arr_purchase_year objectAtIndex:i],[arr_purchase_month objectAtIndex:i],[arr_onroad_value objectAtIndex:i],[arr_owner objectAtIndex:i],[arr_colour objectAtIndex:i],[arr_remain_insurance objectAtIndex:i],[arr_car_speed_type objectAtIndex:i],[arr_car_kms objectAtIndex:i],[arr_cbuckd objectAtIndex:i],[arr_accidental objectAtIndex:i],[arr_car_fuel_type objectAtIndex:i],[arr_refurbishment objectAtIndex:i],[arr_loan_amount objectAtIndex:i],[arr_interest_rate_percent objectAtIndex:i],[arr_loan_tenure objectAtIndex:i],[arr_actual_emi objectAtIndex:i],[arr_estimated_foreclose_percent objectAtIndex:i],[arr_balance_trade_foreclose objectAtIndex:i],[arr_created_on objectAtIndex:i],nil];*/
        
        
        
        
        //parsing begins.....40 entities in below API...
        //NSString *urlString
        
        urlString=[NSString stringWithFormat:@"http://maximizer.mdei.info/jlrmaximizer_p2/api/api/sync_tradein_vehicle?data={\"uid\":\"%@\",\"custid\":\"%@\",\"salutation\":\"%@\",\"fname\":\"%@\",\"lname\":\"%@\",\"email\":\"%@\",\"phone\":\"%@\",\"cc_email\":\"%@\",\"report_id\":\"%@\",\"used_car_purchase_offer\":\"%@\",\"outstanding_loan_amount\":\"%@\",\"net_transaction_amount\":\"%@\",\"used_car_estimate_by\":\"%@\",\"outstanding_estimate_by\":\"%@\",\"expected_time\":\"%@\",\"expected_budget\":\"%@\",\"car_make\":\"%@\",\"car_model\":\"%@\",\"car_model_type\":\"%@\",\"purchase_year\":\"%@\",\"purchase_month\":\"%@\",\"onroad_value\":\"%@\",\"owner\":\"%@\",\"colour\":\"%@\",\"remain_insurance\":\"%@\",\"car_speed_type\":\"%@\",\"car_kms\":\"%@\",\"cbuckd\":\"%@\",\"accidental\":\"%@\",\"car_fuel_type\":\"%@\",\"old_refurb\":\"%@\",\"estimation_by\":\"%@\",\"loan_amount\":\"%@\",\"interest_rate_percent\":\"%@\",\"loan_tenure\":\"%@\",\"actual_emi\":\"%@\",\"estimated_foreclose_percent\":\"%@\",\"final_offer_price\":\"%@\",\"outstanding_loan\":\"%@\",\"balance_trade_foreclose\":\"%@\"}",[arr_uid objectAtIndex:i],[arr_custid objectAtIndex:i],@"mr_static",@"suraj_static",@"kumar_static",@"suraj@static.com",@"static_1234",@"ccsurajstatic",[arr_reportid objectAtIndex:i],[arr_used_car_purchase_offer objectAtIndex:i],[arr_outstanding_loan_amount objectAtIndex:i],[arr_net_transaction_amount objectAtIndex:i],[arr_used_car_estimate_by objectAtIndex:i],[arr_outstanding_estimate_by objectAtIndex:i],[arr_expectedtime objectAtIndex:i],[arr_expected_budget objectAtIndex:i],[arr_car_make objectAtIndex:i],[arr_car_model objectAtIndex:i],[arr_car_model_type objectAtIndex:i],[arr_purchase_year objectAtIndex:i],[arr_purchase_month objectAtIndex:i],[arr_onroad_value objectAtIndex:i],[arr_owner objectAtIndex:i],[arr_colour objectAtIndex:i],[arr_remain_insurance objectAtIndex:i],[arr_car_speed_type objectAtIndex:i],[arr_car_kms objectAtIndex:i],[arr_cbuckd objectAtIndex:i],[arr_accidental objectAtIndex:i],[arr_car_fuel_type objectAtIndex:i],@"oldrefurb_static",[arr_refurbishment objectAtIndex:i],[arr_loan_amount objectAtIndex:i],[arr_interest_rate_percent objectAtIndex:i],[arr_loan_tenure objectAtIndex:i],[arr_actual_emi objectAtIndex:i],[arr_estimated_foreclose_percent objectAtIndex:i],[arr_used_car_purchase_offer objectAtIndex:i],[arr_outstanding_loan_amount objectAtIndex:i],[arr_balance_trade_foreclose objectAtIndex:i]];
        
        
        NSLog(@" urlString %@",urlString);
        
        /*
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
         }*/
        
        
    }
    
    
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


//FOR TRADEIN ENDSSSSSSSSSSSSSSSS......












- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark -Gesture method

-(void)viewWillAppear:(BOOL)animated
{
    basetab.hidden=YES;
    backimgview.hidden=true;
    self.menubtn.userInteractionEnabled=YES;
    self.sharebtn.userInteractionEnabled=YES;
    self.dashcollection.userInteractionEnabled=YES;
    
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
    self.menubtn.userInteractionEnabled=YES;
    self.sharebtn.userInteractionEnabled=YES;
    self.dashcollection.userInteractionEnabled=YES;
    
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
    backimgview.hidden=NO;
    basetab.hidden=NO;
    self.menubtn.userInteractionEnabled=NO;
    self.sharebtn.userInteractionEnabled=NO;
    self.dashcollection.userInteractionEnabled=NO;
    
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
    self.menubtn.userInteractionEnabled=YES;
    self.sharebtn.userInteractionEnabled=YES;
    self.dashcollection.userInteractionEnabled=YES;
    
    backimgview.hidden=YES;
    [self.view endEditing:YES];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.50];
    [UIView setAnimationBeginsFromCurrentState:YES];
    basetab.frame = CGRectMake(-320, 68, 280, self.view.frame.size.height-50);
    [UIView commitAnimations];
}


#pragma mark -
#pragma mark - Collection view delegate


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return imgarr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    Cell = (DashboardCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"DashboardCell" forIndexPath:indexPath];
    Cell.imagview.image=[imgarr objectAtIndex:indexPath.row];
    return Cell;
    
    
}





-(void)getStatusReports_webview
{

}




/*
-(void)getStatusReports_webview
{
    //data={"uid":"DLR124","imei_no":"5454","pin_no":"U567","mobile_type":"iphone"}
//http://maximizer.mdei.info/jlrmaximizer_p2/mobile/mobile_reports
    
    
    NSString *unaMe=[[NSUserDefaults standardUserDefaults]valueForKey:@"usernameE"];
    NSLog(@"username:%@",unaMe);

    
    NSString *post = [NSString stringWithFormat:@"uid=%@&imei_no=%@&pin_no=%@",unaMe,@"I9819",@"P9819"];
    
    // @"www.yourserver.com?var1=%@&var2=%@&var3=%@&var4=%@", strForTextField1
   // NSLog(@"userid dumped => %@", userid);
   // NSLog(@"password dumped => %@", passwd);
    
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    //  [request setURL:[NSURL URLWithString:@"http://resto.mdei.info/jlrmaximizer/login/validate_login?device=mobile"]];
    // [request setURL:[NSURL URLWithString:@"http://50.116.74.50/~jlrmaximizer/login/validate_login?device=mobile"]];
    //    [request setURL:[NSURL URLWithString:@"https://www.jlrmaximizer.in/login/validate_login?device=mobile"]];
    
   // [request setURL:[NSURL URLWithString:@"https://www.jlrmaximizer.in/login/validate_login?device=mobile"]];
    
    [request setURL:[NSURL URLWithString:@"http://maximizer.mdei.info/jlrmaximizer_p2/mobile/mobile_reports"]];

    
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody:postData];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
        NSString *requestReply = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
        NSLog(@"requestReply: %@", requestReply);
        
        id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:Nil];
        if([jsonObject respondsToSelector:@selector(objectForKey:)])
            
        {
            NSDictionary *jsonResponse = [jsonObject valueForKey:@"msg"];
            NSDictionary *jsonResponse2 = [jsonObject valueForKey:@"link"];
            NSLog(@" Json Response ==== %@", jsonResponse);
            NSLog(@" Json Response2 ==== %@", jsonResponse2);
            //new
            NSString *jsonStrResponse1 = jsonResponse;
            NSString *jsonStrResponse2 = jsonResponse2;
            NSLog(@"json response string is %@", jsonStrResponse1);
            
            if ([jsonStrResponse1 isEqualToString:@"success"] )
            {
                UIStoryboard *storyboard ;
                storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
                statusreportViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"statusreportViewController"];
                [self.navigationController pushViewController:vw animated:YES];

            }
            else
            {
                NSLog(@"error:%@",@"Error");
            }
            
        }


}] resume];
}
*/

-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.view.userInteractionEnabled=NO;
    
    // app.gadgetid=[idarr objectAtIndex:indexPath.row];
    //NSLog(@"app.gadgetid:%@",app.gadgetid);
    
    app.selectindex=indexPath.row;
    
    Cell = (DashboardCell*)[collectionView cellForItemAtIndexPath:indexPath];
    
    [UIView transitionWithView:Cell
                      duration:1
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    animations:^{
                        
                    }
                    completion:NULL];
    
    double delayInSeconds = 1.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void)
                   {
                       
                       
                       if(indexPath.row==0)
                           [self performSegueWithIdentifier:@"firstpage" sender:nil];
                       if(indexPath.row==1)
                           [self performSegueWithIdentifier:@"firstpage" sender:nil];
                       if(indexPath.row==2)
                           [self performSegueWithIdentifier:@"firstpage" sender:nil];
                       else if (indexPath.row==4)
                           [self performSegueWithIdentifier:@"feedback" sender:nil];
                       
                       
                       else if (indexPath.row==5)
                       {
                           UIStoryboard *storyboard ;
                           storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
                           editprofileViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"editprofileViewController"];
                           [self.navigationController pushViewController:vw animated:YES];
                       }
                       else if (indexPath.row==3)
                       {
                           
                           //API hit...
                           [self getStatusReports_webview];

                           
                           /*UIStoryboard *storyboard ;
                           storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
                           statusreportViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"statusreportViewController"];
                           [self.navigationController pushViewController:vw animated:YES];*/
                           
                           
                           
                       }
                       else if (indexPath.row==6)
                       {
                           UIStoryboard *storyboard ;
                           storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
                           RemarkViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"RemarkViewController"];
                           [self.navigationController pushViewController:vw animated:YES];
                       }
                       else if (indexPath.row==7)
                       {
                           UIStoryboard *storyboard ;
                           storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
                           ViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
                           [self.navigationController pushViewController:vw animated:YES];
                       }

                       
                       self.view.userInteractionEnabled=YES;
                       
                   });
    
}



- (IBAction)logoutcliked:(id)sender
{
    // [self.navigationController popViewControllerAnimated:YES];
    
}
- (IBAction)menucliked:(id)sender
{
    backimgview.hidden=NO;
    basetab.hidden=NO;
    self.menubtn.userInteractionEnabled=NO;
    self.sharebtn.userInteractionEnabled=NO;
    self.dashcollection.userInteractionEnabled=NO;
    
    [self.view endEditing:YES];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.50];
    [UIView setAnimationBeginsFromCurrentState:YES];
    basetab.frame = CGRectMake(0, 68, 280, self.view.frame.size.height-50);
    [UIView commitAnimations];
}
@end

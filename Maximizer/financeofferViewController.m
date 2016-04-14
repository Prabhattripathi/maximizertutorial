//
//  financeofferViewController.m
//  Maximizer
//
//  Created by Genie Technology on 08/08/15.
//  Copyright (c) 2015 Genie Soft Systems. All rights reserved.
//

#import "financeofferViewController.h"
#import "dashboardViewController.h"
#import "ViewController.h"
#import "BaseTableView.h"
#import "AppDelegate.h"
#import "FinanceOfferDetailedViewController.h"
#import "JSONDictionaryExtensions.h"
#include <netdb.h>
#include "FinanceOfferdetailedTradeinViewController.h"


@interface financeofferViewController ()
{
    UIImageView *backimgview;
    BaseTableView *basetab;
    
    FMDatabase *database;
    AppDelegate *app;
    
    BOOL check;
    
    
    //
    int mult;
    float multf;
    float emi;
    
    //
    int mult2;
    float multf2;
    float emi2;
    
    //
    int mult3;
    float multf3;
    float emi3;
    
    //
    int mult4;
    float multf4;
    float emi4;

    int error1;


    //16nov..
    NSString *rateIntrst3yrs,*rateIntrst4yrs,*rateIntrst5yrs,*rateIntrst7yrs,*rep1300,*rep1300_newvehicleflow;
    NSString * concatt_Global,*concatt_Global_newvehicleflowSTR;//for dynamic reportid
    
    NSString*SyncStatus;

}

@end

@implementation financeofferViewController

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
    
    
    if(app.selectindex==1)
    {
        [self.submitbtn setTitle:@"Sub_Newvehicle" forState:UIControlStateNormal];
    }
    if(app.selectindex==2)
    {
        [self.submitbtn setTitle:@"Sub_tradein" forState:UIControlStateNormal];
    }
    
    

    
    
    self.tabview.layer.borderWidth=0.5;
    self.tabview.layer.borderColor=[UIColor blackColor].CGColor;
    
    self.backbtn.layer.cornerRadius=5;
    self.submitbtn.layer.cornerRadius=5;
    
    
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
    
       
    //...1
    NSString *BalanceTradeStr=[[NSUserDefaults standardUserDefaults] objectForKey:@"BalanceTradeValue"];
    int BalanceTrade=[BalanceTradeStr intValue];
    self.txt_BTIALF.text=[NSString stringWithFormat:@"%d",BalanceTrade];
    
    
    //...2
    NSString *TotOnRoadValue=[[NSUserDefaults standardUserDefaults] objectForKey:@"TotOnRoadValue"];
    self.txt_TORV.text=[NSString stringWithFormat:@"%@",TotOnRoadValue];
    
    
    //...3
    NSString *SuggestedLoanAmnt=[[NSUserDefaults standardUserDefaults] objectForKey:@"SuggestedLoanAmnt"];
    self.txt_financeoffer.text=[NSString stringWithFormat:@"%@",SuggestedLoanAmnt];
    
    
    //downpayment...
    
    NSString *downpayment=[[NSUserDefaults standardUserDefaults] objectForKey:@"dwnpayment"];
    
    self.lbl_downpayment_3yrs.text=[NSString stringWithFormat:@"%@",downpayment];
    self.lbl_downpayment_4yrs.text=[NSString stringWithFormat:@"%@",downpayment];
    self.lbl_downpayment_5yrs.text=[NSString stringWithFormat:@"%@",downpayment];
    self.lbl_downpayment_7yrs.text=[NSString stringWithFormat:@"%@",downpayment];


    
    [self CALCULATION_EMI_3];
    [self CALCULATION_EMI_4];
    [self CALCULATION_EMI_5];
    [self CALCULATION_EMI_7];
    
   // interest_rate_STR
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}




-(void)CALCULATION_EMI_3
{

 //  int lbl3yr=3;
 //  self.lbl_3yrs.text = [NSString stringWithFormat:@"%d",lbl3yr];
    
//    mult=lbl3yr*12;
    
    mult=3*12;
    NSLog(@"mult:%d",mult);
    
    NSString *op=[NSString stringWithFormat:@"%d",mult];
    multf=[op floatValue];
    NSLog(@"multf:%f",multf);

    
    [[NSUserDefaults standardUserDefaults] setValue:self.txt_interstrate_3yrs.text forKey:@"selectedRateInterest3yrs"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    rateIntrst3yrs=[[NSUserDefaults standardUserDefaults] objectForKey:@"selectedRateInterest3yrs"];
    
    float rateintrst=[rateIntrst3yrs floatValue];
    
    float RR=(rateintrst/100)/12;
    NSLog(@"rateintrst:%f",RR);
    
    //float finalresult= powf((1+RR),(float)mult);
    float finalresult=powf((1+RR),multf);
    NSLog(@"finalresult:%f",finalresult);
    
    float bottom=finalresult-1;
    NSLog(@"bottom:%f",bottom);
    
    float sp=finalresult/bottom;
    NSLog(@"sp:%f",sp);
    
    [[NSUserDefaults standardUserDefaults] setValue:self.txt_financeoffer.text forKey:@"loanamount"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    NSString *loanamount=[[NSUserDefaults standardUserDefaults] objectForKey:@"loanamount"];
    
    float LA=[loanamount floatValue];
    //float emi=round((LA+RR)*sp);
    // float emi=roundf((LA*RR)*sp);
    emi=roundf((LA*RR)*sp);
    NSLog(@"emi:%f",emi);
    
    NSString *emifloat=[NSString stringWithFormat:@"%f",emi];
    int EMIRESULT=[emifloat intValue];
    NSLog(@"EMIRESULT:%d",EMIRESULT);
    
    
    self.lbl_emi_3yrs.text=[NSString stringWithFormat:@"%d",EMIRESULT];
    
    
    
    
    
    //23Oct
    
   // NSString*emiresultfinal=[NSString stringWithFormat:@"%d",EMIRESULT];
    
    [[NSUserDefaults standardUserDefaults] setValue:self.lbl_emi_3yrs.text forKey:@"EMIRESULT3yrs"];
    [[NSUserDefaults standardUserDefaults] synchronize];

    
    
    
}


-(void)CALCULATION_EMI_4
{
    
    //  int lbl3yr=3;
    //  self.lbl_3yrs.text = [NSString stringWithFormat:@"%d",lbl3yr];
    
    //    mult=lbl3yr*12;
    
    mult2=4*12;
    NSLog(@"mult:%d",mult2);
    
    NSString *op=[NSString stringWithFormat:@"%d",mult2];
    multf2=[op floatValue];
    NSLog(@"multf:%f",multf2);
    
    
    [[NSUserDefaults standardUserDefaults] setValue:self.txt_interestrate_4yrs.text forKey:@"selectedRateInterest4yrs"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    rateIntrst4yrs=[[NSUserDefaults standardUserDefaults] objectForKey:@"selectedRateInterest4yrs"];
    
    float rateintrst=[rateIntrst4yrs floatValue];
    
    float RR=(rateintrst/100)/12;
    NSLog(@"rateintrst:%f",RR);
    
    //float finalresult= powf((1+RR),(float)mult);
    float finalresult=powf((1+RR),multf2);
    NSLog(@"finalresult:%f",finalresult);
    
    float bottom=finalresult-1;
    NSLog(@"bottom:%f",bottom);
    
    float sp=finalresult/bottom;
    NSLog(@"sp:%f",sp);
    
    [[NSUserDefaults standardUserDefaults] setValue:self.txt_financeoffer.text forKey:@"loanamount"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    NSString *loanamount=[[NSUserDefaults standardUserDefaults] objectForKey:@"loanamount"];
    
    float LA=[loanamount floatValue];
    //float emi=round((LA+RR)*sp);
    // float emi=roundf((LA*RR)*sp);
    emi2=roundf((LA*RR)*sp);
    NSLog(@"emi:%f",emi2);
    
    NSString *emifloat=[NSString stringWithFormat:@"%f",emi2];
    int EMIRESULT=[emifloat intValue];
    NSLog(@"EMIRESULT:%d",EMIRESULT);
    
    
    self.lbl_emi_4yrs.text=[NSString stringWithFormat:@"%d",EMIRESULT];
    
    
    
    
    //23Oct
    [[NSUserDefaults standardUserDefaults] setValue:self.lbl_emi_4yrs.text forKey:@"EMIRESULT4yrs"];
    [[NSUserDefaults standardUserDefaults] synchronize];

    
}



-(void)CALCULATION_EMI_5
{
    
    //  int lbl3yr=3;
    //  self.lbl_3yrs.text = [NSString stringWithFormat:@"%d",lbl3yr];
    
    //    mult=lbl3yr*12;
    
    mult3=5*12;
    NSLog(@"mult:%d",mult3);
    
    NSString *op=[NSString stringWithFormat:@"%d",mult3];
    multf3=[op floatValue];
    NSLog(@"multf:%f",multf3);
    
    
    [[NSUserDefaults standardUserDefaults] setValue:self.txt_interestrate_5yrs.text forKey:@"selectedRateInterest5yrs"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    rateIntrst5yrs=[[NSUserDefaults standardUserDefaults] objectForKey:@"selectedRateInterest5yrs"];
    
    float rateintrst=[rateIntrst5yrs floatValue];
    
    float RR=(rateintrst/100)/12;
    NSLog(@"rateintrst:%f",RR);
    
    //float finalresult= powf((1+RR),(float)mult);
    float finalresult=powf((1+RR),multf3);
    NSLog(@"finalresult:%f",finalresult);
    
    float bottom=finalresult-1;
    NSLog(@"bottom:%f",bottom);
    
    float sp=finalresult/bottom;
    NSLog(@"sp:%f",sp);
    
    [[NSUserDefaults standardUserDefaults] setValue:self.txt_financeoffer.text forKey:@"loanamount"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    NSString *loanamount=[[NSUserDefaults standardUserDefaults] objectForKey:@"loanamount"];
    
    float LA=[loanamount floatValue];
    //float emi=round((LA+RR)*sp);
    // float emi=roundf((LA*RR)*sp);
    emi3=roundf((LA*RR)*sp);
    NSLog(@"emi:%f",emi3);
    
    NSString *emifloat=[NSString stringWithFormat:@"%f",emi3];
    int EMIRESULT=[emifloat intValue];
    NSLog(@"EMIRESULT:%d",EMIRESULT);
    
    
    self.lbl_emi_5yrs.text=[NSString stringWithFormat:@"%d",EMIRESULT];
    
    
    
    //23Oct
    [[NSUserDefaults standardUserDefaults] setValue:self.lbl_emi_5yrs.text forKey:@"EMIRESULT5yrs"];
    [[NSUserDefaults standardUserDefaults] synchronize];

    
}



-(void)CALCULATION_EMI_7
{
    
    //  int lbl3yr=3;
    //  self.lbl_3yrs.text = [NSString stringWithFormat:@"%d",lbl3yr];
    
    //    mult=lbl3yr*12;
    
    mult4=7*12;
    NSLog(@"mult:%d",mult4);
    
    NSString *op=[NSString stringWithFormat:@"%d",mult4];
    multf4=[op floatValue];
    NSLog(@"multf:%f",multf4);
    
    
    [[NSUserDefaults standardUserDefaults] setValue:self.txt_interestrate_7yrs.text forKey:@"selectedRateInterest7yrs"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    rateIntrst7yrs=[[NSUserDefaults standardUserDefaults] objectForKey:@"selectedRateInterest7yrs"];
    
    float rateintrst=[rateIntrst7yrs floatValue];
    
    float RR=(rateintrst/100)/12;
    NSLog(@"rateintrst:%f",RR);
    
    //float finalresult= powf((1+RR),(float)mult);
    float finalresult=powf((1+RR),multf4);
    NSLog(@"finalresult:%f",finalresult);
    
    float bottom=finalresult-1;
    NSLog(@"bottom:%f",bottom);
    
    float sp=finalresult/bottom;
    NSLog(@"sp:%f",sp);
    
    [[NSUserDefaults standardUserDefaults] setValue:self.txt_financeoffer.text forKey:@"loanamount"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    NSString *loanamount=[[NSUserDefaults standardUserDefaults] objectForKey:@"loanamount"];
    
    float LA=[loanamount floatValue];
    //float emi=round((LA+RR)*sp);
    // float emi=roundf((LA*RR)*sp);
    emi4=roundf((LA*RR)*sp);
    NSLog(@"emi:%f",emi4);
    
    NSString *emifloat=[NSString stringWithFormat:@"%f",emi4];
    int EMIRESULT=[emifloat intValue];
    NSLog(@"EMIRESULT:%d",EMIRESULT);
    
    
    self.lbl_emi_7yrs.text=[NSString stringWithFormat:@"%d",EMIRESULT];
    
    
    
    
    //23Oct
    [[NSUserDefaults standardUserDefaults] setValue:self.lbl_emi_7yrs.text forKey:@"EMIRESULT7yrs"];
    [[NSUserDefaults standardUserDefaults] synchronize];

    
}



#pragma mark -
#pragma mark -Gesture method

-(void)viewWillAppear:(BOOL)animated
{
    basetab.hidden=YES;
    backimgview.hidden=true;
    self.menubtn.userInteractionEnabled=YES;
    self.sharebtn.userInteractionEnabled=YES;
    
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
    
    [self.view endEditing:YES];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.50];
    [UIView setAnimationBeginsFromCurrentState:YES];
    basetab.frame = CGRectMake(0, 68, 280, self.view.frame.size.height-50);
    [UIView commitAnimations];
}





#pragma mark -
#pragma mark - Button method

- (IBAction)backcliked:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    
}



//call ds method if internet is on....
-(void)GetAllViewsDataThruTradeIn
{
    
    
    /*
     maximizer.mdei.info/jlrmaximizer_p2/api/api/insert_tradein_vehicle?data={"uid":"DLR139","custid":"39",
     "salutation":"Mr","fname":"manmeet","lname":"singh","email":"manmeet@gmail.com","phone":"7678321436",
     "cc_email":"heena@gmail.com", "report_id":"R5433","newcar_make":"Jaguar",
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
     "scheme4":"15283180,9.7,81532,180972,7 Years"}    61 */
    
   // options":"total_outflow,down_payment,emi_value,loan_tenure_years"
    
    
    NSString *newcarvehiclemak=[[NSUserDefaults standardUserDefaults] objectForKey:@"newcarvehiclemake"];
    
    NSString *newcarvehiclemode=[[NSUserDefaults standardUserDefaults] objectForKey:@"newcarvehiclemodel"];
    
    NSString *newcarvehicletyp=[[NSUserDefaults standardUserDefaults] objectForKey:@"newcarvehicletype"];
    
    NSString *dwnpaymen=[[NSUserDefaults standardUserDefaults] objectForKey:@"dwnpayment"];
    
    NSString *SuggestedLoanAmn=[[NSUserDefaults standardUserDefaults] objectForKey:@"SuggestedLoanAmnt"];
    
    //for exshowroom price and totalonroad value..
    NSString *exShowroompric=[[NSUserDefaults standardUserDefaults] objectForKey:@"TotOnRoadValue"];
    
    NSString *insuranceresul=[[NSUserDefaults standardUserDefaults] objectForKey:@"insuranceresult"];
    
    NSString *logisticresul=[[NSUserDefaults standardUserDefaults] objectForKey:@"logisticresult"];
    
    NSString *registrationservicecharges_resul=[[NSUserDefaults standardUserDefaults] objectForKey:@"registrationservicecharges_result"];
    
    NSString *serviceplan_resul=[[NSUserDefaults standardUserDefaults] objectForKey:@"serviceplan_result"];
    
    NSString *extendedwarranty_resul=[[NSUserDefaults standardUserDefaults] objectForKey:@"extendedwarranty_result"];
    
    NSString *accessories_resul=[[NSUserDefaults standardUserDefaults] objectForKey:@"accessories_result"];
    
    
    // for fname ,lname ,customerEmailiD,customerContactNo, DisplayDate,ExpectedBudget ...
    NSString *CustFnamestr=[[NSUserDefaults standardUserDefaults] objectForKey:@"customername"];
    
    NSString *CustLastnamestr=[[NSUserDefaults standardUserDefaults] objectForKey:@"customerlastname"];
    NSString *customerEmailiDstr=[[NSUserDefaults standardUserDefaults] objectForKey:@"customerEmailiD"];
    
    NSString *customerContactNo_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"customerContactNo"];
    
    NSString *DisplayDate_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"DisplayDate"];
    
    NSString *ExpectedBudget_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"ExpectedBudget"];
    
    
    
    //for salutation...
    NSString *salutation_strr=[[NSUserDefaults standardUserDefaults] objectForKey:@"titles_salutation"];
    
    
    //for service and extended_warranty...
    NSString *service_strr=[[NSUserDefaults standardUserDefaults] objectForKey:@"Servicedropdown_newvehicle"];
    NSString *extended_warranty_strr=[[NSUserDefaults standardUserDefaults] objectForKey:@"extendedwarranty_newvehicle"];
    
    
    //for username(uid)...
    NSString *unaMe=[[NSUserDefaults standardUserDefaults]valueForKey:@"usernameE"];
    NSLog(@"username:%@",unaMe);
    
    
    
    //3 dummy strings & 4th dummy..net trans amnt.& reportid..totoutflow
    NSString *usedcarpurchasestr=[NSString stringWithFormat:@"%@",@"0"];
    NSString *outstanding_loan_amountstr=[NSString stringWithFormat:@"%@",@"0"];
 //   NSString *sugg_loan_amountstr=[NSString stringWithFormat:@"%@",@"0"];
    
    NSString *net_transaction_amount_str=[NSString stringWithFormat:@"%@",@"13000"];
    
    NSString *reportid_str=[NSString stringWithFormat:@"%@",@"R98754876"];
    NSString *custid_str=[NSString stringWithFormat:@"%@",@"C1300451"];
    
    
    //DUMMMY 16NOV...
    NSString *octroi_str=[NSString stringWithFormat:@"%@",@"Y"];
    NSString *balTradeForeClosure_str=[NSString stringWithFormat:@"%@",@"130000"];
    NSString *CBUCKD_str=[NSString stringWithFormat:@"%@",@"Y"];
    NSString *accidental_str=[NSString stringWithFormat:@"%@",@"N"];
    NSString *fuel_str=[NSString stringWithFormat:@"%@",@"PETROL"];
    NSString *oldrefurb_str=[NSString stringWithFormat:@"%@",@"131313"];
    
    NSString *customer_discount_str=[NSString stringWithFormat:@"%@",@"0"];
    NSString *ccmail_str=[NSString stringWithFormat:@"%@",@"genie@mail.com"];


    //
    
    
    NSString *totoutflow_str=[NSString stringWithFormat:@"%@",@"13709"];
    NSString *loantenure3yrs_str=[NSString stringWithFormat:@"%@",@"3 Years"];
    NSString *loantenure4yrs_str=[NSString stringWithFormat:@"%@",@"4 Years"];
    NSString *loantenure5yrs_str=[NSString stringWithFormat:@"%@",@"5 Years"];
    NSString *loantenure7yrs_str=[NSString stringWithFormat:@"%@",@"7 Years"];
    
    //emi's:-;;;;
    NSString *Emi3yrs_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EMIRESULT3yrs"];
    NSString *Emi4yrs_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EMIRESULT4yrs"];
    NSString *Emi5yrs_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EMIRESULT5yrs"];
    NSString *Emi7yrs_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EMIRESULT7yrs"];

    
    
    
    
    //evaluate fetching values...
    NSString *EvalExisvehicle_manufacturer_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_manufacturer"];
    NSString *EvalExisvehicle_model_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_model"];
    NSString *EvalExisvehicle_type_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_type"];
    NSString *year_val_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"year_val"];
    NSString *EvalExisvehicle_monthh_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_monthh"];
    NSString *road_val_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"road_val"];
    NSString *EvalExisvehicle_owner_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_owner"];
    NSString *EvalExisvehicle_color_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_color"];
    NSString *EvalExisvehicle_estimate_by_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_estimate_by"];
    NSString *EvalExisvehicle_insurance_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_insurance"];
    NSString *EvalExisvehicle_market_demnad_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_market_demnad"];
    NSString *EvalExisvehicle_kmss_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_kmss"];
   NSString *pricebymax_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"Final_price_value"];
    
    
    
    //loanamount fetching values...
    NSString *loanamount_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"loanamount"];
    NSString *rateintrest_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"selectedRateInterest"];
NSString *loan_tenure_yrs_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"loan_tenure_yrs"];
    NSString *EMi_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EMII"];
    NSString *loan_foreclose_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"loan_foreclose"];

    NSString *FinalPRicee=[[NSUserDefaults standardUserDefaults] objectForKey:@"Final_price_value"];
    NSString *outstanding_loan_amount_strqq=[[NSUserDefaults standardUserDefaults] objectForKey:@"outstanding_loan_amount"];
 NSString *loanamnt_estimate_by_strqq=[[NSUserDefaults standardUserDefaults] objectForKey:@"loanamnt_estimate_by"];
    
    
    
    
    /*
     maximizer.mdei.info/jlrmaximizer_p2/api/api/insert_tradein_vehicle?data={"uid":"DLR139","custid":"39",
     "salutation":"Mr","fname":"manmeet","lname":"singh","email":"manmeet@gmail.com","phone":"7678321436",
     "cc_email":"heena@gmail.com", "report_id":"R5433","newcar_make":"Jaguar",
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
    
    
    
    //parsing begins...
    NSMutableDictionary *mydict=[[NSMutableDictionary alloc]init];
    
    [mydict setObject:unaMe forKey:@"uid"];
    //dummy...
    [mydict setObject:custid_str forKey:@"custid"];
    //...
    
    //FORM....
    [mydict setObject:salutation_strr forKey:@"salutation"];
    [mydict setObject:CustFnamestr forKey:@"fname"];
    [mydict setObject:CustLastnamestr forKey:@"lname"];
    [mydict setObject:customerEmailiDstr forKey:@"email"];
    [mydict setObject:ccmail_str forKey:@"cc_email"];
    [mydict setObject:customerContactNo_str forKey:@"phone"];
    [mydict setObject:DisplayDate_str forKey:@"expected_time"];
    [mydict setObject:ExpectedBudget_str forKey:@"expected_budget"];

    //..
    [mydict setObject:reportid_str forKey:@"report_id"];
    //..
       
    
    //NEWvehicle.....
    [mydict setObject:newcarvehiclemak forKey:@"newcar_make"];
    [mydict setObject:newcarvehiclemode forKey:@"newcar_model"];
    [mydict setObject:newcarvehicletyp forKey:@"newcar_model_type"];
    
    [mydict setObject:exShowroompric forKey:@"ex_showroom_price"];
    [mydict setObject:insuranceresul forKey:@"insurance"];
    [mydict setObject:logisticresul forKey:@"logistics_charges"];
    
    [mydict setObject:octroi_str forKey:@"octroi"];
    
    [mydict setObject:registrationservicecharges_resul forKey:@"registration_charges"];
    [mydict setObject:accessories_resul forKey:@"accessories"];
    [mydict setObject:service_strr forKey:@"service_plan"];
    [mydict setObject:serviceplan_resul forKey:@"service_plan_amount"];
    [mydict setObject:extended_warranty_strr forKey:@"ext_warranty"];
    [mydict setObject:extendedwarranty_resul forKey:@"ext_warranty_amount"];
    [mydict setObject:exShowroompric forKey:@"total_onroad_amount"];
    
    [mydict setObject:dwnpaymen forKey:@"downpayment"];
    [mydict setObject:SuggestedLoanAmn forKey:@"sugg_loan_amount"];
    [mydict setObject:balTradeForeClosure_str forKey:@"balance_trade_foreclose"];
    //.......
    
    [mydict setObject:net_transaction_amount_str forKey:@"net_transaction_amount"];
    
    
    
    //EVALUATE.....
    [mydict setObject:EvalExisvehicle_manufacturer_str forKey:@"car_make"];
    [mydict setObject:EvalExisvehicle_model_str forKey:@"car_model"];
    [mydict setObject:EvalExisvehicle_type_str forKey:@"car_model_type"];
    [mydict setObject:year_val_str forKey:@"purchase_year"];
    [mydict setObject:EvalExisvehicle_monthh_str forKey:@"purchase_month"];
    [mydict setObject:road_val_str forKey:@"onroad_value"];
    [mydict setObject:EvalExisvehicle_owner_str forKey:@"owner"];
    [mydict setObject:EvalExisvehicle_color_str forKey:@"colour"];
    [mydict setObject:EvalExisvehicle_estimate_by_str forKey:@"used_car_estimate_by"];
    [mydict setObject:EvalExisvehicle_insurance_str forKey:@"remain_insurance"];
    [mydict setObject:EvalExisvehicle_market_demnad_str forKey:@"car_speed_type"];
    [mydict setObject:EvalExisvehicle_kmss_str forKey:@"car_kms"];
    
    //dummies..
    [mydict setObject:CBUCKD_str forKey:@"cbuckd"];
    [mydict setObject:accidental_str forKey:@"accidental"];
    [mydict setObject:fuel_str forKey:@"car_fuel_type"];
    //
    
    [mydict setObject:oldrefurb_str forKey:@"old_refurb"];
    [mydict setObject:pricebymax_str forKey:@"used_car_purchase_offer"];//offer price by maximizer..

    [mydict setObject:customer_discount_str forKey:@"customer_discount"];//give staticaly 0
    
    
    //OUTSTANDING LOAN AMOUNT ESTIMATOR....
    [mydict setObject:loanamount_str forKey:@"loan_amount"];
    [mydict setObject:rateintrest_str forKey:@"interest_rate_percent"];
    [mydict setObject:loan_tenure_yrs_str forKey:@"loan_tenure"];
    [mydict setObject:EMi_str forKey:@"actual_emi"];
    [mydict setObject:loan_foreclose_str forKey:@"estimated_foreclose_percent"];
    [mydict setObject:FinalPRicee forKey:@"final_offer_price"];
    
    [mydict setObject:outstanding_loan_amount_strqq forKey:@"outstanding_loan"];
    [mydict setObject:outstanding_loan_amount_strqq forKey:@"outstanding_loan_amount"];

    [mydict setObject:loanamnt_estimate_by_strqq forKey:@"outstanding_estimate_by"];


    
    //  NSArray *myStrings = [[NSArray alloc] initWithObjects:first, second, third, fourth, nil];
    //  NSString *joinedString = [myStrings componentsJoinedByString:@"|"];
    
    
    NSString * tot=[NSString stringWithFormat:@"%@",@"total_outflow"];
    NSString * interest_rate_STR=[NSString stringWithFormat:@"%@",@"interest_rate"];
    NSString * down_payment=[NSString stringWithFormat:@"%@",@"down_payment"];
    NSString * emi_valuestr=[NSString stringWithFormat:@"%@",@"emi_value"];
    NSString * loan_tenure_yearsstr=[NSString stringWithFormat:@"%@",@"loan_tenure_years"];
    
    NSString *combinedstrings = [@[tot,interest_rate_STR,down_payment,emi_valuestr,loan_tenure_yearsstr] componentsJoinedByString:@","];
    
    NSLog(@"combinedstrings:%@",combinedstrings);
    
    [mydict setObject:combinedstrings forKey:@"options"];
    
    
    NSString *scheme1_combinedstrings = [@[totoutflow_str,rateIntrst3yrs,dwnpaymen,Emi3yrs_str,loantenure3yrs_str] componentsJoinedByString:@","];
    
    [mydict setObject:scheme1_combinedstrings forKey:@"scheme1"];
    
    NSString *scheme2_combinedstrings = [@[totoutflow_str,rateIntrst4yrs,dwnpaymen,Emi4yrs_str,loantenure4yrs_str] componentsJoinedByString:@","];
    
    [mydict setObject:scheme2_combinedstrings forKey:@"scheme2"];
    
    NSString *scheme3_combinedstrings = [@[totoutflow_str,rateIntrst5yrs,dwnpaymen,Emi5yrs_str,loantenure5yrs_str] componentsJoinedByString:@","];
    
    [mydict setObject:scheme3_combinedstrings forKey:@"scheme3"];
    
    NSString *scheme4_combinedstrings = [@[totoutflow_str,rateIntrst7yrs,dwnpaymen,Emi7yrs_str,loantenure7yrs_str] componentsJoinedByString:@","];
    
    [mydict setObject:scheme4_combinedstrings forKey:@"scheme4"];
    
  
    
    //  NSString *str=@"http://maximizer.mdei.info/api/api/send_email?";
    NSString *str=@"http://maximizer.mdei.info/jlrmaximizer_p2/api/api/insert_tradein_vehicle?";
    NSLog(@"str:%@",str);
    
    
    NSURL *tempurl=[NSURL URLWithString:str];
    
    NSLog(@"tempurl:%@",tempurl);
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:tempurl cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:100.0];
    NSError *error;
    [request setTimeoutInterval:100.0];
    [request setURL:tempurl];
    [request setHTTPMethod:@"POST"];
    NSString *boundary = @"---------------------------14737809831466499882746641449";
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
    [request addValue:contentType forHTTPHeaderField:@"Content-Type"];
    NSMutableData *body = [NSMutableData data];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"data`\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    // NSLog(@"body:%@",body);
    NSData *paramsJSONDictionaryData = [NSJSONSerialization dataWithJSONObject:mydict options:NSJSONWritingPrettyPrinted error:&error];
    // NSLog(@"paramsJSONDictionaryData:%@",paramsJSONDictionaryData);
    NSString *jsonParamsString = [[NSString alloc] initWithData:paramsJSONDictionaryData encoding:NSUTF8StringEncoding];
    
    NSLog(@"jsonParamsString :%@",jsonParamsString );
    
    /////////.......
    [body appendData:[[NSString stringWithFormat:@"%@\r\n",jsonParamsString] dataUsingEncoding:NSUTF8StringEncoding]];
    [request setHTTPBody:body];
    
    NSHTTPURLResponse *response = [[NSHTTPURLResponse alloc] init];
    NSLog(@"response:%@",response);
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
     NSLog(@"respopsedata:%@",responseData);
    NSDictionary *jsonResponseDictionary = [NSJSONSerialization JSONObjectWithData:responseData
                                                                           options:kNilOptions error:&error];
    NSLog(@"res12222333p:%@",jsonResponseDictionary);
    
    
    NSString  *responsestr =[jsonResponseDictionary valueForKey:@"response"];
    
    if([responsestr isEqualToString:@"success"])
    {
        
        UIAlertView *messageBox = [[UIAlertView alloc]initWithTitle:@"Maximizer" message:@"Trade In Details inserted Successfully!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        
        [messageBox show];
        
        //navigation to anotherr view...
        UIStoryboard *storyboard ;
        storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        
        FinanceOfferDetailedViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"FinanceOfferDetailedViewController"];
        [self.navigationController pushViewController:vw animated:YES];

    }
    
    else if([responsestr isEqualToString:@"failure"])
    {
        UIAlertView *messageBox = [[UIAlertView alloc]initWithTitle:@"Maximizer" message:@"Trade In Details not inserted Successfully!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        
        [messageBox show];
        
//        //navigation to anotherr view...
//        UIStoryboard *storyboard ;
//        storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
//        
//        FinanceOfferDetailedViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"FinanceOfferDetailedViewController"];
//        [self.navigationController pushViewController:vw animated:YES];

        
    }
    
    
    
}




//17Nov..
-(void)GetAllViewsDataThruTradeInnn
{

    NSString *newcarvehiclemak=[[NSUserDefaults standardUserDefaults] objectForKey:@"newcarvehiclemake"];
    
    NSString *newcarvehiclemode=[[NSUserDefaults standardUserDefaults] objectForKey:@"newcarvehiclemodel"];
    
    NSString *newcarvehicletyp=[[NSUserDefaults standardUserDefaults] objectForKey:@"newcarvehicletype"];
    
    NSString *dwnpaymen=[[NSUserDefaults standardUserDefaults] objectForKey:@"dwnpayment"];
    
    NSString *SuggestedLoanAmn=[[NSUserDefaults standardUserDefaults] objectForKey:@"SuggestedLoanAmnt"];
    
    //for exshowroom price and totalonroad value..
    NSString *exShowroompric=[[NSUserDefaults standardUserDefaults] objectForKey:@"TotOnRoadValue"];
    
    NSString *insuranceresul=[[NSUserDefaults standardUserDefaults] objectForKey:@"insuranceresult"];
    
    NSString *logisticresul=[[NSUserDefaults standardUserDefaults] objectForKey:@"logisticresult"];
    
    NSString *registrationservicecharges_resul=[[NSUserDefaults standardUserDefaults] objectForKey:@"registrationservicecharges_result"];
    
    NSString *serviceplan_resul=[[NSUserDefaults standardUserDefaults] objectForKey:@"serviceplan_result"];
    
    NSString *extendedwarranty_resul=[[NSUserDefaults standardUserDefaults] objectForKey:@"extendedwarranty_result"];
    
    NSString *accessories_resul=[[NSUserDefaults standardUserDefaults] objectForKey:@"accessories_result"];
    
    
    // for fname ,lname ,customerEmailiD,customerContactNo, DisplayDate,ExpectedBudget ...
    NSString *CustFnamestr=[[NSUserDefaults standardUserDefaults] objectForKey:@"customername"];
    
    NSString *CustLastnamestr=[[NSUserDefaults standardUserDefaults] objectForKey:@"customerlastname"];
    NSString *customerEmailiDstr=[[NSUserDefaults standardUserDefaults] objectForKey:@"customerEmailiD"];
    
    NSString *customerContactNo_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"customerContactNo"];
    
    NSString *DisplayDate_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"DisplayDate"];
    
    NSString *ExpectedBudget_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"ExpectedBudget"];
    
    
    //for salutation...
    NSString *salutation_strr=[[NSUserDefaults standardUserDefaults] objectForKey:@"titles_salutation"];
    
    //for service and extended_warranty...
    NSString *service_strr=[[NSUserDefaults standardUserDefaults] objectForKey:@"Servicedropdown_newvehicle"];
    NSString *extended_warranty_strr=[[NSUserDefaults standardUserDefaults] objectForKey:@"extendedwarranty_newvehicle"];
    
    //for username(uid)...
    NSString *unaMe=[[NSUserDefaults standardUserDefaults]valueForKey:@"usernameE"];
    NSLog(@"username:%@",unaMe);
    
    //3 dummy strings & 4th dummy..net trans amnt.& reportid..totoutflow
    NSString *usedcarpurchasestr=[NSString stringWithFormat:@"%@",@"0"];
    NSString *outstanding_loan_amountstr=[NSString stringWithFormat:@"%@",@"0"];
    //   NSString *sugg_loan_amountstr=[NSString stringWithFormat:@"%@",@"0"];
    
    NSString *net_transaction_amount_str=[NSString stringWithFormat:@"%@",@"13000"];
    
    NSString *reportid_str=[NSString stringWithFormat:@"%@",@"R1234432999"];
    NSString *custid_str=[NSString stringWithFormat:@"%@",@"C13004"];
    
    
    //DUMMMY 16NOV...
    NSString *octroi_str=[NSString stringWithFormat:@"%@",@"Y"];
    NSString *balTradeForeClosure_str=[NSString stringWithFormat:@"%@",@"130000"];
    NSString *CBUCKD_str=[NSString stringWithFormat:@"%@",@"Y"];
    NSString *accidental_str=[NSString stringWithFormat:@"%@",@"N"];
    NSString *fuel_str=[NSString stringWithFormat:@"%@",@"PETROL"];
    NSString *oldrefurb_str=[NSString stringWithFormat:@"%@",@"131313"];
    
    NSString *customer_discount_str=[NSString stringWithFormat:@"%@",@"0"];
    NSString *ccmail_str=[NSString stringWithFormat:@"%@",@"genie@mail.com"];
    //
    
    
    NSString *totoutflow_str=[NSString stringWithFormat:@"%@",@"13709"];
    NSString *loantenure3yrs_str=[NSString stringWithFormat:@"%@",@"3 Years"];
    NSString *loantenure4yrs_str=[NSString stringWithFormat:@"%@",@"4 Years"];
    NSString *loantenure5yrs_str=[NSString stringWithFormat:@"%@",@"5 Years"];
    NSString *loantenure7yrs_str=[NSString stringWithFormat:@"%@",@"7 Years"];
    
    //emi's:-;;;;
    NSString *Emi3yrs_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EMIRESULT3yrs"];
    NSString *Emi4yrs_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EMIRESULT4yrs"];
    NSString *Emi5yrs_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EMIRESULT5yrs"];
    NSString *Emi7yrs_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EMIRESULT7yrs"];
    
    
    //evaluate fetching values...
    NSString *EvalExisvehicle_manufacturer_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_manufacturer"];
    NSString *EvalExisvehicle_model_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_model"];
    NSString *EvalExisvehicle_type_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_type"];
    NSString *year_val_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"year_val"];
    NSString *EvalExisvehicle_monthh_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_monthh"];
    NSString *road_val_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"road_val"];
    NSString *EvalExisvehicle_owner_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_owner"];
    NSString *EvalExisvehicle_color_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_color"];
    NSString *EvalExisvehicle_estimate_by_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_estimate_by"];
    NSString *EvalExisvehicle_insurance_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_insurance"];
    NSString *EvalExisvehicle_market_demnad_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_market_demnad"];
    NSString *EvalExisvehicle_kmss_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_kmss"];
    NSString *pricebymax_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"Final_price_value"];
    
    
    //loanamount fetching values...
    NSString *loanamount_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"loanamount"];
    NSString *rateintrest_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"selectedRateInterest"];
    NSString *loan_tenure_yrs_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"loan_tenure_yrs"];
    NSString *EMi_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EMII"];
    NSString *loan_foreclose_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"loan_foreclose"];
    
    NSString *FinalPRicee=[[NSUserDefaults standardUserDefaults] objectForKey:@"Final_price_value"];
    NSString *outstanding_loan_amount_strqq=[[NSUserDefaults standardUserDefaults] objectForKey:@"outstanding_loan_amount"];
    NSString *loanamnt_estimate_by_strqq=[[NSUserDefaults standardUserDefaults] objectForKey:@"loanamnt_estimate_by"];
    
    
    
    //options...
    NSString * tot=[NSString stringWithFormat:@"%@",@"total_outflow"];
    NSString * interest_rate_STR=[NSString stringWithFormat:@"%@",@"interest_rate"];
    NSString * down_payment=[NSString stringWithFormat:@"%@",@"down_payment"];
    NSString * emi_valuestr=[NSString stringWithFormat:@"%@",@"emi_value"];
    NSString * loan_tenure_yearsstr=[NSString stringWithFormat:@"%@",@"loan_tenure_years"];
    
    NSString *combinedstrings = [@[tot,interest_rate_STR,down_payment,emi_valuestr,loan_tenure_yearsstr] componentsJoinedByString:@","];
    
    NSLog(@"combinedstrings:%@",combinedstrings);
    NSString *scheme1_combinedstrings = [@[totoutflow_str,rateIntrst3yrs,dwnpaymen,Emi3yrs_str,loantenure3yrs_str] componentsJoinedByString:@","];
    NSString *scheme2_combinedstrings = [@[totoutflow_str,rateIntrst4yrs,dwnpaymen,Emi4yrs_str,loantenure4yrs_str] componentsJoinedByString:@","];
    NSString *scheme3_combinedstrings = [@[totoutflow_str,rateIntrst5yrs,dwnpaymen,Emi5yrs_str,loantenure5yrs_str] componentsJoinedByString:@","];
    NSString *scheme4_combinedstrings = [@[totoutflow_str,rateIntrst7yrs,dwnpaymen,Emi7yrs_str,loantenure7yrs_str] componentsJoinedByString:@","];

    
    
    
    //parsing begins....
    
    /*
    NSString *post = [NSString stringWithFormat:@"uid=%@&custid=%@&salutation=%@&fname=%@&lname=%@&email=%@&phone=%@&cc_email=%@&report_id=%@&newcar_make=%@&newcar_model=%@&newcar_model_type=%@&ex_showroom_price=%@&insurance=%@&logistics_charges=%@&registration_charges=%@&accessories=%@&service_plan=%@&service_plan_amount=%@&ext_warranty=%@&ext_warranty_amount=%@&total_onroad_amount=%@&used_car_purchase_offer=%@&outstanding_loan_amount=%@&net_transaction_amount=%@&used_car_estimate_by=%@&outstanding_estimate_by=%@&expected_time=%@&expected_budget=%@&car_make=%@&car_model=%@&car_model_type=%@&purchase_year=%@&purchase_month=%@&onroad_value=%@&owner=%@&colour=%@&remain_insurance=%@&car_speed_type=%@&car_kms=%@&cbuckd=%@&accidental=%@&car_fuel_type=%@&old_refurb=%@&octroi=%@&customer_discount=%@&downpayment=%@&sugg_loan_amount=%@&loan_amount=%@&interest_rate_percent=%@&loan_tenure=%@&actual_emi=%@&estimated_foreclose_percent=%@&final_offer_price=%@&outstanding_loan=%@&balance_trade_foreclose=%@&options=%@&scheme1=%@&scheme2=%@&scheme3=%@&scheme4=%@", unaMe,custid_str,salutation_strr,CustFnamestr,CustLastnamestr,customerEmailiDstr,customerContactNo_str,ccmail_str,reportid_str,newcarvehiclemak,newcarvehiclemode,newcarvehicletyp,exShowroompric,insuranceresul,logisticresul,registrationservicecharges_resul,accessories_resul,service_strr,serviceplan_resul,extended_warranty_strr,extendedwarranty_resul,exShowroompric,pricebymax_str,outstanding_loan_amount_strqq,net_transaction_amount_str,EvalExisvehicle_estimate_by_str,loanamnt_estimate_by_strqq,DisplayDate_str,ExpectedBudget_str,EvalExisvehicle_manufacturer_str,EvalExisvehicle_model_str,EvalExisvehicle_type_str,year_val_str,EvalExisvehicle_monthh_str,road_val_str,EvalExisvehicle_owner_str,EvalExisvehicle_color_str,EvalExisvehicle_insurance_str,EvalExisvehicle_market_demnad_str,EvalExisvehicle_kmss_str,CBUCKD_str,accidental_str,fuel_str,oldrefurb_str,octroi_str,customer_discount_str,dwnpaymen,SuggestedLoanAmn,loanamount_str,rateintrest_str,loan_tenure_yrs_str,EMi_str,loan_foreclose_str,FinalPRicee,outstanding_loan_amount_strqq,balTradeForeClosure_str,combinedstrings,scheme1_combinedstrings,scheme2_combinedstrings,scheme3_combinedstrings,scheme4_combinedstrings];*/
    
    NSString *post = [NSString stringWithFormat:@"uid=%@&report_id=%@",unaMe,reportid_str];

    
    NSLog(@"post:%@",post);
    
    
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    
   // http://maximizer.mdei.info/jlrmaximizer_p2/api/api/insert_tradein_vehicle?
    [request setURL:[NSURL URLWithString:@"http://maximizer.mdei.info/jlrmaximizer_p2/api/api/insert_tradein_vehicle?"]];
    
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
            
            NSDictionary *jsonResponse = [jsonObject valueForKey:@"response"];
            
            NSDictionary *jsonResponse2 = [jsonObject valueForKey:@"message"];
            
            NSLog(@" Json Response ==== %@", jsonResponse);
            
            NSLog(@" Json Response2 ==== %@", jsonResponse2);
            
            //new
            
            NSString *jsonStrResponse1 = jsonResponse;
            
            NSString *jsonStrResponse2 = jsonResponse2;
            
            NSLog(@"json response string is %@", jsonStrResponse1);
            
            
            
            if ([jsonStrResponse1 isEqualToString:@"success"] )
            {
                UIAlertView *messageBox = [[UIAlertView alloc]initWithTitle:@"Maximizer" message:@"Trade In Details inserted Successfully!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                
                [messageBox show];
                
                //navigation to anotherr view...
                UIStoryboard *storyboard ;
                storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
                
                FinanceOfferDetailedViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"FinanceOfferDetailedViewController"];
                [self.navigationController pushViewController:vw animated:YES];

            }
            
            else if([jsonStrResponse1 isEqualToString:@"failure"])
            {
                UIAlertView *messageBox = [[UIAlertView alloc]initWithTitle:@"Maximizer" message:@"Trade In Details not inserted Successfully!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                
                [messageBox show];
                
            }

        }

    
    }] resume];
    
    
    
     }




// for trade-in...
-(void)GetAllViewsDataThruTradeInnn_hit

{
    NSString *newcarvehiclemak=[[NSUserDefaults standardUserDefaults] objectForKey:@"newcarvehiclemake"];
    
    NSString *newcarvehiclemode=[[NSUserDefaults standardUserDefaults] objectForKey:@"newcarvehiclemodel"];
    
    NSString *newcarvehicletyp=[[NSUserDefaults standardUserDefaults] objectForKey:@"newcarvehicletype"];
    
    NSString *dwnpaymen=[[NSUserDefaults standardUserDefaults] objectForKey:@"dwnpayment"];
    
    NSString *SuggestedLoanAmn=[[NSUserDefaults standardUserDefaults] objectForKey:@"SuggestedLoanAmnt"];
    
    //for exshowroom price and totalonroad value..
    NSString *exShowroompric=[[NSUserDefaults standardUserDefaults] objectForKey:@"TotOnRoadValue"];
    
    NSString *insuranceresul=[[NSUserDefaults standardUserDefaults] objectForKey:@"insuranceresult"];
    
    NSString *logisticresul=[[NSUserDefaults standardUserDefaults] objectForKey:@"logisticresult"];
    
    NSString *registrationservicecharges_resul=[[NSUserDefaults standardUserDefaults] objectForKey:@"registrationservicecharges_result"];
    
    NSString *serviceplan_resul=[[NSUserDefaults standardUserDefaults] objectForKey:@"serviceplan_result"];
    
    NSString *extendedwarranty_resul=[[NSUserDefaults standardUserDefaults] objectForKey:@"extendedwarranty_result"];
    
    NSString *accessories_resul=[[NSUserDefaults standardUserDefaults] objectForKey:@"accessories_result"];
    
    
    // for fname ,lname ,customerEmailiD,customerContactNo, DisplayDate,ExpectedBudget ...
    NSString *CustFnamestr=[[NSUserDefaults standardUserDefaults] objectForKey:@"customername"];
    
    NSString *CustLastnamestr=[[NSUserDefaults standardUserDefaults] objectForKey:@"customerlastname"];
    NSString *customerEmailiDstr=[[NSUserDefaults standardUserDefaults] objectForKey:@"customerEmailiD"];
    
    NSString *customerContactNo_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"customerContactNo"];
    
    NSString *DisplayDate_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"DisplayDate"];
    
    NSString *ExpectedBudget_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"ExpectedBudget"];
    
    
    //for salutation...
    NSString *salutation_strr=[[NSUserDefaults standardUserDefaults] objectForKey:@"titles_salutation"];
    
    //for service and extended_warranty...
    NSString *service_strr=[[NSUserDefaults standardUserDefaults] objectForKey:@"Servicedropdown_newvehicle"];
    NSString *extended_warranty_strr=[[NSUserDefaults standardUserDefaults] objectForKey:@"extendedwarranty_newvehicle"];
    
    //for username(uid)...
    NSString *unaMe=[[NSUserDefaults standardUserDefaults]valueForKey:@"usernameE"];
    NSLog(@"username:%@",unaMe);
    
    //3 dummy strings & 4th dummy..net trans amnt.& reportid..totoutflow
    NSString *usedcarpurchasestr=@"0";
    NSString *outstanding_loan_amountstr=@"0";
    //   NSString *sugg_loan_amountstr=[NSString stringWithFormat:@"%@",@"0"];
    
    NSString *net_transaction_amount_str=@"1398193272107";
    
    NSString *reportid_str=@"R_Tr_98982377";
    NSString *custid_str=@"C_Tr_98239977";
    
    
    //DUMMMY 16NOV...
    NSString *octroi_str=@"Y";
    NSString *balTradeForeClosure_str=@"130000";
    NSString *CBUCKD_str=@"Y";
    NSString *accidental_str=@"N";
    NSString *fuel_str=@"PETROL";
    NSString *oldrefurb_str=@"131313";
    
    NSString *customer_discount_str=@"0";
    NSString *ccmail_str=@"genie@mail.com";
    //
    
    
    NSString *totoutflow_str=@"13709";
    NSString *loantenure3yrs_str=@"3 Years";
    NSString *loantenure4yrs_str=@"4 Years";
    NSString *loantenure5yrs_str=@"5 Years";
    NSString *loantenure7yrs_str=@"7 Years";
    
    //emi's:-;;;;
    NSString *Emi3yrs_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EMIRESULT3yrs"];
    NSString *Emi4yrs_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EMIRESULT4yrs"];
    NSString *Emi5yrs_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EMIRESULT5yrs"];
    NSString *Emi7yrs_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EMIRESULT7yrs"];
    
    
    //evaluate fetching values...
    NSString *EvalExisvehicle_manufacturer_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_manufacturer"];
    NSString *EvalExisvehicle_model_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_model"];
    NSString *EvalExisvehicle_type_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_type"];
    NSString *year_val_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"year_val"];
    NSString *EvalExisvehicle_monthh_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_monthh"];
    NSString *road_val_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"road_val"];
    NSString *EvalExisvehicle_owner_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_owner"];
    NSString *EvalExisvehicle_color_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_color"];
    NSString *EvalExisvehicle_estimate_by_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_estimate_by"];
    NSString *EvalExisvehicle_insurance_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_insurance"];
    NSString *EvalExisvehicle_market_demnad_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_market_demnad"];
    NSString *EvalExisvehicle_kmss_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_kmss"];
    NSString *pricebymax_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"Final_price_value"];
    
    
    //loanamount fetching values...
    NSString *loanamount_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"loanamount"];
    NSString *rateintrest_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"selectedRateInterest"];
    NSString *loan_tenure_yrs_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"loan_tenure_yrs"];
    NSString *EMi_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EMII"];
    NSString *loan_foreclose_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"loan_foreclose"];
    
    NSString *FinalPRicee=[[NSUserDefaults standardUserDefaults] objectForKey:@"Final_price_value"];
    NSString *outstanding_loan_amount_strqq=[[NSUserDefaults standardUserDefaults] objectForKey:@"outstanding_loan_amount"];
    NSString *loanamnt_estimate_by_strqq=[[NSUserDefaults standardUserDefaults] objectForKey:@"loanamnt_estimate_by"];
    
    
    
    //options...
    NSString * tot=[NSString stringWithFormat:@"%@",@"total_outflow"];
    NSString * interest_rate_STR=[NSString stringWithFormat:@"%@",@"interest_rate"];
    NSString * down_payment=[NSString stringWithFormat:@"%@",@"down_payment"];
    NSString * emi_valuestr=[NSString stringWithFormat:@"%@",@"emi_value"];
    NSString * loan_tenure_yearsstr=[NSString stringWithFormat:@"%@",@"loan_tenure_years"];
    
    NSString *combinedstrings = [@[tot,interest_rate_STR,down_payment,emi_valuestr,loan_tenure_yearsstr] componentsJoinedByString:@","];
    
    NSLog(@"combinedstrings:%@",combinedstrings);
    NSString *scheme1_combinedstrings = [@[totoutflow_str,rateIntrst3yrs,dwnpaymen,Emi3yrs_str,loantenure3yrs_str] componentsJoinedByString:@","];
    NSString *scheme2_combinedstrings = [@[totoutflow_str,rateIntrst4yrs,dwnpaymen,Emi4yrs_str,loantenure4yrs_str] componentsJoinedByString:@","];
    NSString *scheme3_combinedstrings = [@[totoutflow_str,rateIntrst5yrs,dwnpaymen,Emi5yrs_str,loantenure5yrs_str] componentsJoinedByString:@","];
    NSString *scheme4_combinedstrings = [@[totoutflow_str,rateIntrst7yrs,dwnpaymen,Emi7yrs_str,loantenure7yrs_str] componentsJoinedByString:@","];
    
    
    
  //  PARSING BEGINS....
    
    NSString *urlString=[NSString stringWithFormat:@"http://maximizer.mdei.info/jlrmaximizer_p2/api/api/insert_tradein_vehicle?data={\"uid\":\"%@\",\"custid\":\"%@\",\"salutation\":\"%@\",\"fname\":\"%@\",\"lname\":\"%@\",\"email\":\"%@\",\"phone\":\"%@\",\"cc_email\":\"%@\",\"report_id\":\"%@\",\"newcar_make\":\"%@\",\"newcar_model\":\"%@\",\"newcar_model_type\":\"%@\",\"ex_showroom_price\":\"%@\",\"insurance\":\"%@\",\"logistics_charges\":\"%@\",\"registration_charges\":\"%@\",\"accessories\":\"%@\",\"service_plan\":\"%@\",\"service_plan_amount\":\"%@\",\"ext_warranty\":\"%@\",\"ext_warranty_amount\":\"%@\",\"total_onroad_amount\":\"%@\",\"used_car_purchase_offer\":\"%@\",\"outstanding_loan_amount\":\"%@\",\"net_transaction_amount\":\"%@\",\"used_car_estimate_by\":\"%@\",\"outstanding_estimate_by\":\"%@\",\"expected_time\":\"%@\",\"expected_budget\":\"%@\",\"car_make\":\"%@\",\"car_model\":\"%@\",\"car_model_type\":\"%@\",\"purchase_year\":\"%@\",\"purchase_month\":\"%@\",\"onroad_value\":\"%@\",\"owner\":\"%@\",\"colour\":\"%@\",\"remain_insurance\":\"%@\",\"car_speed_type\":\"%@\",\"car_kms\":\"%@\",\"cbuckd\":\"%@\",\"accidental\":\"%@\",\"car_fuel_type\":\"%@\",\"old_refurb\":\"%@\",\"octroi\":\"%@\",\"customer_discount\":\"%@\",\"downpayment\":\"%@\",\"sugg_loan_amount\":\"%@\",\"loan_amount\":\"%@\",\"interest_rate_percent\":\"%@\",\"loan_tenure\":\"%@\",\"actual_emi\":\"%@\",\"estimated_foreclose_percent\":\"%@\",\"final_offer_price\":\"%@\",\"outstanding_loan\":\"%@\",\"balance_trade_foreclose\":\"%@\",\"options\":\"%@\",\"scheme1\":\"%@\",\"scheme2\":\"%@\",\"scheme3\":\"%@\",\"scheme4\":\"%@\"}",unaMe,custid_str,salutation_strr,CustFnamestr,CustLastnamestr,customerEmailiDstr,customerContactNo_str,ccmail_str,concatt_Global,newcarvehiclemak,newcarvehiclemode,newcarvehicletyp,exShowroompric,insuranceresul,logisticresul,registrationservicecharges_resul,accessories_resul,service_strr,serviceplan_resul,extended_warranty_strr,extendedwarranty_resul,exShowroompric,pricebymax_str,outstanding_loan_amount_strqq,net_transaction_amount_str,EvalExisvehicle_estimate_by_str,loanamnt_estimate_by_strqq,DisplayDate_str,ExpectedBudget_str,EvalExisvehicle_manufacturer_str,EvalExisvehicle_model_str,EvalExisvehicle_type_str,year_val_str,EvalExisvehicle_monthh_str,road_val_str,EvalExisvehicle_owner_str,EvalExisvehicle_color_str,EvalExisvehicle_insurance_str,EvalExisvehicle_market_demnad_str,EvalExisvehicle_kmss_str,CBUCKD_str,accidental_str,fuel_str,oldrefurb_str,octroi_str,customer_discount_str,dwnpaymen,SuggestedLoanAmn,loanamount_str,rateintrest_str,loan_tenure_yrs_str,EMi_str,loan_foreclose_str,FinalPRicee,outstanding_loan_amount_strqq,balTradeForeClosure_str,combinedstrings,scheme1_combinedstrings,scheme2_combinedstrings,scheme3_combinedstrings,scheme4_combinedstrings];
    
    
    
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
            
            [database executeUpdate:@"UPDATE tbl_TradeInVehicle SET Sync_Status='Done' WHERE id = (SELECT max(id) FROM tbl_TradeInVehicle)"];

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


-(void)LocalDbinsertion_TradeIn
{
    //submit btn clicked LOCAL DB integration...IMP
    NSString *str=[[NSUserDefaults standardUserDefaults]valueForKey:@"db_path"];
    
    NSLog(@"str:%@",str);
    
    database = [FMDatabase databaseWithPath:str];
    
    [database open];
    
    
    self.view.frame=CGRectMake(0, 0, 320, 568);
    [self.txt_financeoffer resignFirstResponder];
    [self.txt_TORV resignFirstResponder];
    [self.txt_BTIALF resignFirstResponder];
    
    if(self.txt_financeoffer.text.length==0)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Maximizer" message:@"Insert Loan Amount." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if (self.txt_TORV.text.length==0)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Maximizer" message:@"Insert Total On Road Value." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if (self.txt_BTIALF.text.length==0)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Maximizer" message:@"Insert Balance Trade field." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    
    else
    {
        NSString *str=[[NSUserDefaults standardUserDefaults]valueForKey:@"db_path"];
        
        NSLog(@"str:%@",str);
        
        
        NSInteger uid = 0;
        NSInteger EEVid = 0;
        NSInteger LAEid = 0;
        NSInteger NVid = 0;
        
        NSString *logint_status;
        
        
        
        
        NSString *namestr,*salutationstr,*lastnamestr,*contactnostr,*mailstr,*ccmailstr,*datestr,*budgetstr;
        
        
        NSString *manufacturerstr,*modelstr,*vehiclemodeltypestr,*datestr2,*monthstr,*onroadvaluestr,*ownerstr,*colorstr,*remnginsurancestr,*marketdemadstr,*kmsstr,*valuerupeestr,*estimationbystr,*pricebymaxstr;
        
        
        NSString *LoanAmountstr,*RateOfIntereststr,*loanTenurestr,*MonthlyPaymentstr,*EMIstr,*Percentstr,*FinalPricestr,*OutstandingLoanstr,*BalanceTradestr,*EstimationBystr;
        
        
        NSString *Makestr,*Modelstrr,*Typestr,*ExShowroomPricestr,*Insurancestr,*LogisticsChargesstr,*RegistrationServiceChargesstr,*ServicePlanstr,*ExtendedWarrantystr,*Accessoriesstr,*BenefitstoCustomerstr,*TotalOnRoadValuestr,*BalanceTradeInValuestr,*DownPaymentstr,*SuggestedLoanAmntstr;
        
        
        
        database = [FMDatabase databaseWithPath:str];
        
        [database open];
        
        
        //... FOR USERDETAILS TABLE...
        FMResultSet *results = [database executeQuery:@"select * from tbl_userdetails"];
        
        //NSLog(@"reslut:%@",[results next]);
        
        while([results next])
        {
            check=true;
            
            uid=[results intForColumn:@"id"];
            
            rep1300 = [results stringForColumn:@"id"];
            
            
            salutationstr=[results stringForColumn:@"Salutation"]; //10d
            
            namestr=[results stringForColumn:@"Name"];
            lastnamestr=[results stringForColumn:@"LastName"];
            contactnostr=[results stringForColumn:@"ContactNo"];
            mailstr=[results stringForColumn:@"Mail"];
            ccmailstr=[results stringForColumn:@"CCMail"];
            datestr=[results stringForColumn:@"Date"];
            budgetstr=[results stringForColumn:@"Budget"];
            
            // NSLog(@"User: %ld - %@",(long)uid,logint_status);
            
        }
        
        
        //        //1dec..
        //        FMResultSet *results = [database executeQuery:@"SELECT id FROM tbl_userdetails ORDER BY id DESC LIMIT 1"];
        //
        //        while ([results next])
        //        {
        //
        //            name176 = [results stringForColumn:@"id"];
        //            NSLog(@"name176:%@",name176);
        //        }
        
        // NSString *string = @"5";
        //  int valuestr_ew = [rep1300 intValue]+1;
        
        
        int valuestr_ew = [rep1300 intValue];
        
        NSString *strFromIntt = [NSString stringWithFormat:@"%d",valuestr_ew];
        
        NSString *Rr=@"RTrd";
        
        concatt_Global =[Rr stringByAppendingString:strFromIntt];
        NSLog(@"concatt_Global:%@",concatt_Global);
        
        
        
        //for rep_id:--
        //1 dec..
        NSString *str_reppid=[NSString stringWithFormat:@"%@",concatt_Global];
        NSLog(@"str_reppid:%@",str_reppid);
        
        [[NSUserDefaults standardUserDefaults]setValue:str_reppid forKey:@"Report_IDD"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        
        
        
        
        
        
        //...USERDETAILS END....
        
        
        
        // FOR EVALUATE EXISTING VEHICLE TABLE...
        FMResultSet *results2 = [database executeQuery:@"select * from tbl_evaluate_existing_vehicle"];
        
        while([results2 next])
        {
            
            check=true;
            
            EEVid=[results2 intForColumn:@"id"];
            
            manufacturerstr=[results2 stringForColumn:@"Manufacturer"];
            modelstr=[results2 stringForColumn:@"Model"];
            vehiclemodeltypestr=[results2 stringForColumn:@"VehicleModelType"];
            datestr2=[results2 stringForColumn:@"Date"];
            monthstr=[results2 stringForColumn:@"Month"];
            onroadvaluestr=[results2 stringForColumn:@"OnRoadValue"];
            ownerstr=[results2 stringForColumn:@"Owner"];
            colorstr=[results2 stringForColumn:@"Color"];
            remnginsurancestr=[results2 stringForColumn:@"RemainingInsurance"];
            marketdemadstr=[results2 stringForColumn:@"MarketDemand"];
            kmsstr=[results2 stringForColumn:@"KMS"];
            valuerupeestr=[results2 stringForColumn:@"ValueRupee"];
            estimationbystr=[results2 stringForColumn:@"EstimationBy"];
            pricebymaxstr=[results2 stringForColumn:@"PriceByMax"];
            
            
            
            //    NSLog(@"User: %ld - %@",(long)uid,logint_status);
            
        }
        //..EVALUATE EXISTING VEHICLE TABLE ENDS...
        
        
        
        
        
        // ....FOR LOAN AMOUNT ESTIMATOR TABLE...
        FMResultSet *results3 = [database executeQuery:@"select * from tbl_loan_amount_estimator"];
        
        //NSLog(@"reslut:%@",[results next]);
        
        while([results3 next])
        {
            check=true;
            
            LAEid=[results3 intForColumn:@"id"];
            
            LoanAmountstr=[results3 stringForColumn:@"LoanAmount"];
            RateOfIntereststr=[results3 stringForColumn:@"RateOfInterest"];
            loanTenurestr=[results3 stringForColumn:@"loanTenure"];
            MonthlyPaymentstr=[results3 stringForColumn:@"MonthlyPayment"];
            EMIstr=[results3 stringForColumn:@"EMI"];
            Percentstr=[results3 stringForColumn:@"Percent"];
            FinalPricestr=[results3 stringForColumn:@"FinalPrice"];
            OutstandingLoanstr=[results3 stringForColumn:@"OutstandingLoan"];
            BalanceTradestr=[results3 stringForColumn:@"BalanceTrade"];
            EstimationBystr=[results3 stringForColumn:@"EstimationBy"];
            
            
            //  NSLog(@"User: %ld - %@",(long)uid,logint_status);
            
        }
        //..LOAN AMOUNT ESTIMATOR TABLE ENDS...
        
        
        
        
        
        //....FOR NEW VEHICLE TABLE...
        FMResultSet *results4 = [database executeQuery:@"select * from tbl_newvehicle"];
        
        //NSLog(@"reslut:%@",[results next]);
        
        while([results4 next])
        {
            check=true;
            
            NVid=[results4 intForColumn:@"id"];
            
            
            
            Makestr=[results4 stringForColumn:@"Make"];
            Modelstrr=[results4 stringForColumn:@"Model"];
            Typestr=[results4 stringForColumn:@"Type"];
            ExShowroomPricestr=[results4 stringForColumn:@"ExShowroomPrice"];
            Insurancestr=[results4 stringForColumn:@"Insurance"];
            LogisticsChargesstr=[results4 stringForColumn:@"LogisticsCharges"];
            RegistrationServiceChargesstr=[results4 stringForColumn:@"RegistrationServiceCharges"];
            ServicePlanstr=[results4 stringForColumn:@"ServicePlan"];
            ExtendedWarrantystr=[results4 stringForColumn:@"ExtendedWarranty"];
            Accessoriesstr=[results4 stringForColumn:@"Accessories"];
            BenefitstoCustomerstr=[results4 stringForColumn:@"BenefitstoCustomer"];
            TotalOnRoadValuestr=[results4 stringForColumn:@"TotalOnRoadValue"];
            BalanceTradeInValuestr=[results4 stringForColumn:@"BalanceTradeInValue"];
            DownPaymentstr=[results4 stringForColumn:@"DownPayment"];
            SuggestedLoanAmntstr=[results4 stringForColumn:@"SuggestedLoanAmnt"];
            
            
            //  NSLog(@"User: %ld - %@",(long)uid,logint_status);
            
        }
        //..NEW VEHICLE TABLE ENDS...
        
        /*
         
         
         
         */
        
        
        /*
        //OLD..
        //MAIN FINANCE TABLE INSERTION QUERY...
        [database executeUpdate:@"insert into tbl_quotation(Report_id,Name,ContactNo,Mail,CCMail,Date,Budget,Manufacturer,ModelType,VehicleModelType,Datee,Month,OnRoadValue,Owner,Color,RemainingInsurance,MarketDemand,KMS,ValueRupee,EstimationByy,PriceByMax,LoanAmountTaken,RateOfInterest,loanTenure,MonthlyPayment,EMI,Percent,FinalPrice,OutstandingLoan,BalanceTrade,EstimationBy,Make,Model,Type,ExShowroomPrice,Insurance,LogisticsCharges,RegistrationServiceCharges,ServicePlan,ExtendedWarranty,Accessories,BenefitstoCustomer,TotalOnRoadValuee,BalanceTradeInValue,DownPayment,SuggestedLoanAmnt,LoanAmount,TotalOnRoadValue,LoanForeClosure) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",concatt,namestr,contactnostr,mailstr,ccmailstr,datestr,budgetstr,manufacturerstr,modelstr,vehiclemodeltypestr,datestr2,monthstr,onroadvaluestr,ownerstr,colorstr,remnginsurancestr,marketdemadstr,kmsstr,valuerupeestr,estimationbystr,pricebymaxstr,LoanAmountstr,RateOfIntereststr,loanTenurestr,MonthlyPaymentstr,EMIstr,Percentstr,FinalPricestr,OutstandingLoanstr,BalanceTradestr,EstimationBystr,Makestr,Modelstrr,Typestr,ExShowroomPricestr,Insurancestr,LogisticsChargesstr,RegistrationServiceChargesstr,ServicePlanstr,ExtendedWarrantystr,Accessoriesstr,BenefitstoCustomerstr,TotalOnRoadValuestr,BalanceTradeInValuestr,DownPaymentstr,SuggestedLoanAmntstr,self.txt_financeoffer.text,self.txt_TORV.text,self.txt_BTIALF.text,nil];*/
        
        
//         //..for fuel..p or d..
//         NSString *fuell_strz=[[NSUserDefaults standardUserDefaults] objectForKey:@"fuelcliked_str_resullt"];
//         self.lbl_fuel.text=[NSString stringWithFormat:@"%@",fuell_strz];
//         
//         //..for fuel..p or d..
//         NSString *octroi_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"Octroi_yesorNo"];
//         self.lbl_fuel.text=[NSString stringWithFormat:@"%@",octroi_str];
        
        

         //for evaluate...
        NSString *eval_cbuckd_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"cbuckd_str_resullt"];
        //self.lbl_fuel.text=[NSString stringWithFormat:@"%@",fuell_strz];
        
        NSString *eval_accidentallstr=[[NSUserDefaults standardUserDefaults] objectForKey:@"accidentallstrresullt"];
        
        NSString *eval_fuelcliked_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"fuelcliked_str_resullt"];
        
        
        //for New..
        NSString *New_OCtroistr=[[NSUserDefaults standardUserDefaults] objectForKey:@"newvehicle_octroi_resultt"];
        
        NSString *New_ServicedropdownTEXTVALUEstr=[[NSUserDefaults standardUserDefaults] objectForKey:@"ServicedropdownTEXTVALUE_newvehicle"];
        
        NSString *New_ExtendedropdownTEXTVALUEstr=[[NSUserDefaults standardUserDefaults] objectForKey:@"ExtendedropdownTEXTVALUE_newvehicle"];
        
        
        //for firstquattaion salutation...
        NSString *Salutation_strq=[[NSUserDefaults standardUserDefaults] objectForKey:@"titles_salutation"];
        
        //for loan amount
        NSString *monthlypayment_vall_strq=[[NSUserDefaults standardUserDefaults] objectForKey:@"monthlypayment_vall"];
        
        NSString *outstanding_loan_amount_strq=[[NSUserDefaults standardUserDefaults] objectForKey:@"outstanding_loan_amount"];
        
        
        SyncStatus=@"Pending";

        
        
        // NEW 10d
        //MAIN FINANCE TABLE INSERTION QUERY...61
        [database executeUpdate:@"insert into tbl_TradeInVehicle(Report_id,Salutation,Name,LastName,ContactNo,Mail,CCMail,Date,Budget,Evaluate_Manufacturer,Evaluate_ModelType,Evaluate_VehicleModelType,Evaluate_Date,Evaluate_Month,Evaluate_OnRoadValue,Evaluate_Owner,Evaluate_Color,Evaluate_RemainingInsurance,Evaluate_MarketDemand,Evaluate_KMS,Evaluate_CBUCKD,Evaluate_Accidental,Evaluate_Fuel,Evaluate_Refurbishment,Evaluate_EstimationBy,Evaluate_OfferPriceByMax,LoanAmountEstimator_LoanAmountTaken,LoanAmountEstimator_RateOfInterest,LoanAmountEstimator_loanTenure,LoanAmountEstimator_MonthlyPayment,LoanAmountEstimator_EMI,LoanAmountEstimator_Percent,LoanAmountEstimator_FinalPrice,LoanAmountEstimator_OutstandingLoan,LoanAmountEstimator_BalanceTradeforclose,LoanAmountEstimator_EstimationBy,NewVehicle_Make,NewVehicle_Model,NewVehicle_Type,NewVehicle_Octroi,NewVehicle_ExShowroomPrice,NewVehicle_Insurance,NewVehicle_LogisticsCharges,NewVehicle_RegistrationServiceCharges,NewVehicle_ServicePlan,NewVehicle_ServicePlan_text,NewVehicle_ExtendedWarranty,NewVehicle_ExtendedWarranty_text,NewVehicle_Accessories,NewVehicle_BenefitstoCustomer,NewVehicle_TotalOnRoadValue,NewVehicle_BalanceTradeInValueforeclose,NewVehicle_DownPayment,NewVehicle_SuggestedLoanAmnt,FinanceOffer_LoanAmount,FinanceOffer_TotalOnRoadValue,FinanceOffer_BalanceTrade_LoanForeClosure,FinanceOffer_scheme1,FinanceOffer_scheme2,FinanceOffer_scheme3,FinanceOffer_scheme4,Sync_Status) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",concatt_Global,Salutation_strq,namestr,lastnamestr,contactnostr,mailstr,ccmailstr,datestr,budgetstr,manufacturerstr,modelstr,vehiclemodeltypestr,datestr2,monthstr,onroadvaluestr,ownerstr,colorstr,remnginsurancestr,marketdemadstr,kmsstr,eval_cbuckd_str,eval_accidentallstr,eval_fuelcliked_str,valuerupeestr,estimationbystr,pricebymaxstr,LoanAmountstr,RateOfIntereststr,loanTenurestr,monthlypayment_vall_strq,EMIstr,Percentstr,FinalPricestr,outstanding_loan_amount_strq,BalanceTradestr,EstimationBystr,Makestr,Modelstrr,Typestr,New_OCtroistr,ExShowroomPricestr,Insurancestr,LogisticsChargesstr,RegistrationServiceChargesstr,ServicePlanstr,New_ServicedropdownTEXTVALUEstr,ExtendedWarrantystr,New_ExtendedropdownTEXTVALUEstr,Accessoriesstr,BenefitstoCustomerstr,TotalOnRoadValuestr,BalanceTradeInValuestr,DownPaymentstr,SuggestedLoanAmntstr,self.txt_financeoffer.text,self.txt_TORV.text,self.txt_BTIALF.text,self.lbl_emi_3yrs.text,self.lbl_emi_4yrs.text,self.lbl_emi_5yrs.text,self.lbl_emi_7yrs.text,SyncStatus,nil];

        
        /*
        if([self isNetworkAvailable] == YES)
            
        {
            [self GetAllViewsDataThruTradeInnn_hit];
        }*/
        

        //navigation to anotherr view...
        UIStoryboard *storyboard ;
        storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        
        FinanceOfferDetailedViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"FinanceOfferDetailedViewController"];
        [self.navigationController pushViewController:vw animated:YES];
        
        
    }
    
    
    [database close];

}




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






/*
- (IBAction)submitcliked:(id)sender
{
   // [self GetAllViewsDataThruTradeIn];
   // [self GetAllViewsDataThruTradeInnn];

    [self GetAllViewsDataThruTradeInnn_hit];
}
*/



//for new vehicle flow...

-(void)GetAllViewsDataThruTradeInnn_hit_NewVehicleFlow
{
    NSLog(@"NewVehicle-flow");
   // for insert new car data when net is avail in submit click...
    //http://maximizer.mdei.info/jlrmaximizer_p2/api/api/get_Retail_Finance
      /*  http://maximizer.mdei.info/jlrmaximizer_p2/api/api/insert_newcar_vehicle?data={"uid":"DLR139","custid":"32","salutation":"Mr","fname":"nanu","lname":"parab","email":"eknath@gmail.com","phone":"7678321436",
            "cc_email":"heena@gmail.com", "report_id":"R53765233","newcar_make":"Jaguar",
            "newcar_model":"F-Type","newcar_model_type":"3.0 S/C Coupe S (ST2 380 PS)","ex_showroom_price":"13766186","insurance":"13766186","logistics_charges":"0","registration_charges":"0","accessories":"0",
            "service_plan":"3 year Solitaire","service_plan_amount":"0","ext_warranty":"4th yr upto 125000 Kms","ext_warranty_amount":"81532","total_onroad_amount":"13847718","net_transaction_amount":"12557162","expected_time":"13-12-2016","expected_budget":"2000000","octroi":"no","customer_discount":"0","downpayment":"81532","sugg_loan_amount":"11003630","options":"total_outflow,interest_rate,down_payment,emi_value,loan_tenure_years","scheme1":"12807820,9.7,81532,353508,3 Years","scheme2":"13401436,9.7,81532,277498,4 Years","scheme3":"14011972,9.7,81532,232174,5 Years","scheme4":"15283180,9.7,81532,180972,7 Years"}*/
    
    
    NSString *newcarvehiclemak=[[NSUserDefaults standardUserDefaults] objectForKey:@"newcarvehiclemake"];
    
    NSString *newcarvehiclemode=[[NSUserDefaults standardUserDefaults] objectForKey:@"newcarvehiclemodel"];
    
    NSString *newcarvehicletyp=[[NSUserDefaults standardUserDefaults] objectForKey:@"newcarvehicletype"];
    
    NSString *dwnpaymen=[[NSUserDefaults standardUserDefaults] objectForKey:@"dwnpayment"];
    
    NSString *SuggestedLoanAmn=[[NSUserDefaults standardUserDefaults] objectForKey:@"SuggestedLoanAmnt"];
    
    //for exshowroom price and totalonroad value..
    NSString *exShowroompric=[[NSUserDefaults standardUserDefaults] objectForKey:@"TotOnRoadValue"];
    
    NSString *insuranceresul=[[NSUserDefaults standardUserDefaults] objectForKey:@"insuranceresult"];
    
    NSString *logisticresul=[[NSUserDefaults standardUserDefaults] objectForKey:@"logisticresult"];
    
    NSString *registrationservicecharges_resul=[[NSUserDefaults standardUserDefaults] objectForKey:@"registrationservicecharges_result"];
    
    NSString *serviceplan_resul=[[NSUserDefaults standardUserDefaults] objectForKey:@"serviceplan_result"];
    
    NSString *extendedwarranty_resul=[[NSUserDefaults standardUserDefaults] objectForKey:@"extendedwarranty_result"];
    
    NSString *accessories_resul=[[NSUserDefaults standardUserDefaults] objectForKey:@"accessories_result"];
    
    
    // for fname ,lname ,customerEmailiD,customerContactNo, DisplayDate,ExpectedBudget ...
    NSString *CustFnamestr=[[NSUserDefaults standardUserDefaults] objectForKey:@"customername"];
    
    NSString *CustLastnamestr=[[NSUserDefaults standardUserDefaults] objectForKey:@"customerlastname"];
    NSString *customerEmailiDstr=[[NSUserDefaults standardUserDefaults] objectForKey:@"customerEmailiD"];
    
    NSString *customerContactNo_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"customerContactNo"];
    
    NSString *DisplayDate_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"DisplayDate"];
    
    NSString *ExpectedBudget_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"ExpectedBudget"];
    
    
    //for salutation...
    NSString *salutation_strr=[[NSUserDefaults standardUserDefaults] objectForKey:@"titles_salutation"];
    
    //for service and extended_warranty...
    NSString *service_strr=[[NSUserDefaults standardUserDefaults] objectForKey:@"Servicedropdown_newvehicle"];
    NSString *extended_warranty_strr=[[NSUserDefaults standardUserDefaults] objectForKey:@"extendedwarranty_newvehicle"];
    
    //for username(uid)...
    NSString *unaMe=[[NSUserDefaults standardUserDefaults]valueForKey:@"usernameE"];
    NSLog(@"username:%@",unaMe);
    
    //3 dummy strings & 4th dummy..net trans amnt.& reportid..totoutflow
    NSString *usedcarpurchasestr=@"0";
    NSString *outstanding_loan_amountstr=@"0";
    //   NSString *sugg_loan_amountstr=[NSString stringWithFormat:@"%@",@"0"];
    
    NSString *net_transaction_amount_str=@"13000";
    
    NSString *reportid_str=@"RNewveh_1300";
    NSString *custid_str=@"CN_24";
    
    
    //DUMMMY 16NOV...
    NSString *octroi_str=@"Y";
    NSString *balTradeForeClosure_str=@"130000";
    NSString *CBUCKD_str=@"Y";
    NSString *accidental_str=@"N";
    NSString *fuel_str=@"PETROL";
    NSString *oldrefurb_str=@"131313";
    
    NSString *customer_discount_str=@"0";
    NSString *ccmail_str=@"genie@mail.com";
    //
    
    
    NSString *totoutflow_str=@"13709";
    NSString *loantenure3yrs_str=@"3 Years";
    NSString *loantenure4yrs_str=@"4 Years";
    NSString *loantenure5yrs_str=@"5 Years";
    NSString *loantenure7yrs_str=@"7 Years";
    
    //emi's:-;;;;
    NSString *Emi3yrs_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EMIRESULT3yrs"];
    NSString *Emi4yrs_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EMIRESULT4yrs"];
    NSString *Emi5yrs_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EMIRESULT5yrs"];
    NSString *Emi7yrs_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EMIRESULT7yrs"];
    
    
    //evaluate fetching values...
    NSString *EvalExisvehicle_manufacturer_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_manufacturer"];
    NSString *EvalExisvehicle_model_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_model"];
    NSString *EvalExisvehicle_type_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_type"];
    NSString *year_val_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"year_val"];
    NSString *EvalExisvehicle_monthh_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_monthh"];
    NSString *road_val_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"road_val"];
    NSString *EvalExisvehicle_owner_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_owner"];
    NSString *EvalExisvehicle_color_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_color"];
    NSString *EvalExisvehicle_estimate_by_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_estimate_by"];
    NSString *EvalExisvehicle_insurance_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_insurance"];
    NSString *EvalExisvehicle_market_demnad_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_market_demnad"];
    NSString *EvalExisvehicle_kmss_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_kmss"];
    NSString *pricebymax_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"Final_price_value"];
    
    
    //loanamount fetching values...
    NSString *loanamount_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"loanamount"];
    NSString *rateintrest_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"selectedRateInterest"];
    NSString *loan_tenure_yrs_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"loan_tenure_yrs"];
    NSString *EMi_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EMII"];
    NSString *loan_foreclose_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"loan_foreclose"];
    
    NSString *FinalPRicee=[[NSUserDefaults standardUserDefaults] objectForKey:@"Final_price_value"];
    NSString *outstanding_loan_amount_strqq=[[NSUserDefaults standardUserDefaults] objectForKey:@"outstanding_loan_amount"];
    NSString *loanamnt_estimate_by_strqq=[[NSUserDefaults standardUserDefaults] objectForKey:@"loanamnt_estimate_by"];
    
    
    
    //options...
    NSString * tot=[NSString stringWithFormat:@"%@",@"total_outflow"];
    NSString * interest_rate_STR=[NSString stringWithFormat:@"%@",@"interest_rate"];
    NSString * down_payment=[NSString stringWithFormat:@"%@",@"down_payment"];
    NSString * emi_valuestr=[NSString stringWithFormat:@"%@",@"emi_value"];
    NSString * loan_tenure_yearsstr=[NSString stringWithFormat:@"%@",@"loan_tenure_years"];
    
    NSString *combinedstrings = [@[tot,interest_rate_STR,down_payment,emi_valuestr,loan_tenure_yearsstr] componentsJoinedByString:@","];
    
    NSLog(@"combinedstrings:%@",combinedstrings);
    NSString *scheme1_combinedstrings = [@[totoutflow_str,rateIntrst3yrs,dwnpaymen,Emi3yrs_str,loantenure3yrs_str] componentsJoinedByString:@","];
    NSString *scheme2_combinedstrings = [@[totoutflow_str,rateIntrst4yrs,dwnpaymen,Emi4yrs_str,loantenure4yrs_str] componentsJoinedByString:@","];
    NSString *scheme3_combinedstrings = [@[totoutflow_str,rateIntrst5yrs,dwnpaymen,Emi5yrs_str,loantenure5yrs_str] componentsJoinedByString:@","];
    NSString *scheme4_combinedstrings = [@[totoutflow_str,rateIntrst7yrs,dwnpaymen,Emi7yrs_str,loantenure7yrs_str] componentsJoinedByString:@","];
    
    
    
    /*  http://maximizer.mdei.info/jlrmaximizer_p2/api/api/insert_newcar_vehicle?data={"uid":"DLR139","custid":"32",
     "salutation":"Mr","fname":"nanu","lname":"parab","email":"eknath@gmail.com","phone":"7678321436",
     "cc_email":"heena@gmail.com", "report_id":"R53765233","newcar_make":"Jaguar",
     "newcar_model":"F-Type","newcar_model_type":"3.0 S/C Coupe S (ST2 380 PS)","ex_showroom_price":"13766186",
     "insurance":"13766186","logistics_charges":"0","registration_charges":"0","accessories":"0",
     "service_plan":"3 year Solitaire","service_plan_amount":"0","ext_warranty":"4th yr upto 125000 Kms",
     "ext_warranty_amount":"81532","total_onroad_amount":"13847718",
     
     
     
     
     "net_transaction_amount":"12557162","expected_time":"13-12-2016","expected_budget":"2000000",
     "octroi":"no","customer_discount":"0","downpayment":"81532","sugg_loan_amount":"11003630",
     
     
     
     "options":"total_outflow,interest_rate,down_payment,emi_value,loan_tenure_years",
     "scheme1":"12807820,9.7,81532,353508,3 Years",
     "scheme2":"13401436,9.7,81532,277498,4 Years",
     "scheme3":"14011972,9.7,81532,232174,5 Years",
     "scheme4":"15283180,9.7,81532,180972,7 Years"}*/
    
    
    //  PARSING BEGINS....34 entities...
    
    NSString *urlString=[NSString stringWithFormat:@"http://maximizer.mdei.info/jlrmaximizer_p2/api/api/insert_newcar_vehicle?data={\"uid\":\"%@\",\"custid\":\"%@\",\"salutation\":\"%@\",\"fname\":\"%@\",\"lname\":\"%@\",\"email\":\"%@\",\"phone\":\"%@\",\"cc_email\":\"%@\",\"report_id\":\"%@\",\"newcar_make\":\"%@\",\"newcar_model\":\"%@\",\"newcar_model_type\":\"%@\",\"ex_showroom_price\":\"%@\",\"insurance\":\"%@\",\"logistics_charges\":\"%@\",\"registration_charges\":\"%@\",\"accessories\":\"%@\",\"service_plan\":\"%@\",\"service_plan_amount\":\"%@\",\"ext_warranty\":\"%@\",\"ext_warranty_amount\":\"%@\",\"total_onroad_amount\":\"%@\",\"net_transaction_amount\":\"%@\",\"expected_time\":\"%@\",\"expected_budget\":\"%@\",\"octroi\":\"%@\",\"customer_discount\":\"%@\",\"downpayment\":\"%@\",\"sugg_loan_amount\":\"%@\",\"options\":\"%@\",\"scheme1\":\"%@\",\"scheme2\":\"%@\",\"scheme3\":\"%@\",\"scheme4\":\"%@\"}",unaMe,custid_str,salutation_strr,CustFnamestr,CustLastnamestr,customerEmailiDstr,customerContactNo_str,ccmail_str,concatt_Global_newvehicleflowSTR,newcarvehiclemak,newcarvehiclemode,newcarvehicletyp,exShowroompric,insuranceresul,logisticresul,registrationservicecharges_resul,accessories_resul,service_strr,serviceplan_resul,extended_warranty_strr,extendedwarranty_resul,exShowroompric,net_transaction_amount_str,DisplayDate_str,ExpectedBudget_str,octroi_str,customer_discount_str,dwnpaymen,SuggestedLoanAmn,combinedstrings,scheme1_combinedstrings,scheme2_combinedstrings,scheme3_combinedstrings,scheme4_combinedstrings];
    
    
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
            
            [database executeUpdate:@"UPDATE tbl_NEWVehicle_flow SET Sync_Status='Done' WHERE id = (SELECT max(id) FROM tbl_NEWVehicle_flow)"];
            
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


// for new vehicle...
-(void)LoaclDbInsertion_NewVehicle
{
    //submit btn clicked LOCAL DB integration...IMP
    NSString *str=[[NSUserDefaults standardUserDefaults]valueForKey:@"db_path"];
    
    NSLog(@"str:%@",str);
    
    database = [FMDatabase databaseWithPath:str];
    
    [database open];
    
    
    self.view.frame=CGRectMake(0, 0, 320, 568);
    [self.txt_financeoffer resignFirstResponder];
    [self.txt_TORV resignFirstResponder];
    [self.txt_BTIALF resignFirstResponder];
    
    if(self.txt_financeoffer.text.length==0)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Maximizer" message:@"Insert Loan Amount." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if (self.txt_TORV.text.length==0)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Maximizer" message:@"Insert Total On Road Value." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if (self.txt_BTIALF.text.length==0)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Maximizer" message:@"Insert Balance Trade field." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    
    else
    {
        NSString *str=[[NSUserDefaults standardUserDefaults]valueForKey:@"db_path"];
        
        NSLog(@"str:%@",str);
        
        
        NSInteger uid = 0;
        NSInteger EEVid = 0;
        NSInteger LAEid = 0;
        NSInteger NVid = 0;
        
        NSString *logint_status;
        
        
        
        
        NSString *namestr,*salutationstr,*lastnamestr,*contactnostr,*mailstr,*ccmailstr,*datestr,*budgetstr;
        
        
        NSString *manufacturerstr,*modelstr,*vehiclemodeltypestr,*datestr2,*monthstr,*onroadvaluestr,*ownerstr,*colorstr,*remnginsurancestr,*marketdemadstr,*kmsstr,*valuerupeestr,*estimationbystr,*pricebymaxstr;
        
        
        NSString *LoanAmountstr,*RateOfIntereststr,*loanTenurestr,*MonthlyPaymentstr,*EMIstr,*Percentstr,*FinalPricestr,*OutstandingLoanstr,*BalanceTradestr,*EstimationBystr;
        
        
        NSString *Makestr,*Modelstrr,*Typestr,*ExShowroomPricestr,*Insurancestr,*LogisticsChargesstr,*RegistrationServiceChargesstr,*ServicePlanstr,*ExtendedWarrantystr,*Accessoriesstr,*BenefitstoCustomerstr,*TotalOnRoadValuestr,*BalanceTradeInValuestr,*DownPaymentstr,*SuggestedLoanAmntstr;
        
        
        
        database = [FMDatabase databaseWithPath:str];
        
        [database open];
        
        
        //... FOR USERDETAILS TABLE...
        FMResultSet *results = [database executeQuery:@"select * from tbl_userdetails"];
        
        //NSLog(@"reslut:%@",[results next]);
        
        while([results next])
        {
            check=true;
            
            uid=[results intForColumn:@"id"];
            
            rep1300_newvehicleflow = [results stringForColumn:@"id"];
            
            salutationstr=[results stringForColumn:@"Salutation"]; //10d
            
            namestr=[results stringForColumn:@"Name"];
            lastnamestr=[results stringForColumn:@"LastName"];
            contactnostr=[results stringForColumn:@"ContactNo"];
            mailstr=[results stringForColumn:@"Mail"];
            ccmailstr=[results stringForColumn:@"CCMail"];
            datestr=[results stringForColumn:@"Date"];
            budgetstr=[results stringForColumn:@"Budget"];
            
            // NSLog(@"User: %ld - %@",(long)uid,logint_status);
            
        }
        
        
        //        //1dec..
        //        FMResultSet *results = [database executeQuery:@"SELECT id FROM tbl_userdetails ORDER BY id DESC LIMIT 1"];
        //
        //        while ([results next])
        //        {
        //
        //            name176 = [results stringForColumn:@"id"];
        //            NSLog(@"name176:%@",name176);
        //        }
        
        // NSString *string = @"5";
        //  int valuestr_ew = [rep1300 intValue]+1;
        
        
        int valuestr_ew = [rep1300_newvehicleflow intValue];
        
        NSString *strFromIntt = [NSString stringWithFormat:@"%d",valuestr_ew];
        
        NSString *Rr=@"RNvv";
        
        concatt_Global_newvehicleflowSTR =[Rr stringByAppendingString:strFromIntt];
        NSLog(@"concatt_Global_newvehicleflowSTR:%@",concatt_Global_newvehicleflowSTR);
        
        
        
        //for rep_id:--
        //1 dec..
        NSString *str_reppid_newvehicleflow=[NSString stringWithFormat:@"%@",concatt_Global_newvehicleflowSTR];
        NSLog(@"str_reppid_newvehicleflow:%@",str_reppid_newvehicleflow);
        
        
        
        
        
        //...USERDETAILS END....
        
        
        
        // FOR EVALUATE EXISTING VEHICLE TABLE...
        FMResultSet *results2 = [database executeQuery:@"select * from tbl_evaluate_existing_vehicle"];
        
        while([results2 next])
        {
            
            check=true;
            
            EEVid=[results2 intForColumn:@"id"];
            
            manufacturerstr=[results2 stringForColumn:@"Manufacturer"];
            modelstr=[results2 stringForColumn:@"Model"];
            vehiclemodeltypestr=[results2 stringForColumn:@"VehicleModelType"];
            datestr2=[results2 stringForColumn:@"Date"];
            monthstr=[results2 stringForColumn:@"Month"];
            onroadvaluestr=[results2 stringForColumn:@"OnRoadValue"];
            ownerstr=[results2 stringForColumn:@"Owner"];
            colorstr=[results2 stringForColumn:@"Color"];
            remnginsurancestr=[results2 stringForColumn:@"RemainingInsurance"];
            marketdemadstr=[results2 stringForColumn:@"MarketDemand"];
            kmsstr=[results2 stringForColumn:@"KMS"];
            valuerupeestr=[results2 stringForColumn:@"ValueRupee"];
            estimationbystr=[results2 stringForColumn:@"EstimationBy"];
            pricebymaxstr=[results2 stringForColumn:@"PriceByMax"];
            
            
            
            //    NSLog(@"User: %ld - %@",(long)uid,logint_status);
            
        }
        //..EVALUATE EXISTING VEHICLE TABLE ENDS...
        
        
        
        
        
        // ....FOR LOAN AMOUNT ESTIMATOR TABLE...
        FMResultSet *results3 = [database executeQuery:@"select * from tbl_loan_amount_estimator"];
        
        //NSLog(@"reslut:%@",[results next]);
        
        while([results3 next])
        {
            check=true;
            
            LAEid=[results3 intForColumn:@"id"];
            
            LoanAmountstr=[results3 stringForColumn:@"LoanAmount"];
            RateOfIntereststr=[results3 stringForColumn:@"RateOfInterest"];
            loanTenurestr=[results3 stringForColumn:@"loanTenure"];
            MonthlyPaymentstr=[results3 stringForColumn:@"MonthlyPayment"];
            EMIstr=[results3 stringForColumn:@"EMI"];
            Percentstr=[results3 stringForColumn:@"Percent"];
            FinalPricestr=[results3 stringForColumn:@"FinalPrice"];
            OutstandingLoanstr=[results3 stringForColumn:@"OutstandingLoan"];
            BalanceTradestr=[results3 stringForColumn:@"BalanceTrade"];
            EstimationBystr=[results3 stringForColumn:@"EstimationBy"];
            
            
            //  NSLog(@"User: %ld - %@",(long)uid,logint_status);
            
        }
        //..LOAN AMOUNT ESTIMATOR TABLE ENDS...
        
        
        
        
        
        //....FOR NEW VEHICLE TABLE...
        FMResultSet *results4 = [database executeQuery:@"select * from tbl_newvehicle"];
        
        //NSLog(@"reslut:%@",[results next]);
        
        while([results4 next])
        {
            check=true;
            
            NVid=[results4 intForColumn:@"id"];
            
            
            
            Makestr=[results4 stringForColumn:@"Make"];
            Modelstrr=[results4 stringForColumn:@"Model"];
            Typestr=[results4 stringForColumn:@"Type"];
            ExShowroomPricestr=[results4 stringForColumn:@"ExShowroomPrice"];
            Insurancestr=[results4 stringForColumn:@"Insurance"];
            LogisticsChargesstr=[results4 stringForColumn:@"LogisticsCharges"];
            RegistrationServiceChargesstr=[results4 stringForColumn:@"RegistrationServiceCharges"];
            ServicePlanstr=[results4 stringForColumn:@"ServicePlan"];
            ExtendedWarrantystr=[results4 stringForColumn:@"ExtendedWarranty"];
            Accessoriesstr=[results4 stringForColumn:@"Accessories"];
            BenefitstoCustomerstr=[results4 stringForColumn:@"BenefitstoCustomer"];
            TotalOnRoadValuestr=[results4 stringForColumn:@"TotalOnRoadValue"];
            BalanceTradeInValuestr=[results4 stringForColumn:@"BalanceTradeInValue"];
            DownPaymentstr=[results4 stringForColumn:@"DownPayment"];
            SuggestedLoanAmntstr=[results4 stringForColumn:@"SuggestedLoanAmnt"];
            
            
            //  NSLog(@"User: %ld - %@",(long)uid,logint_status);
            
        }
        //..NEW VEHICLE TABLE ENDS...
        
        
        
        //for evaluate...
        NSString *eval_cbuckd_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"cbuckd_str_resullt"];
        //self.lbl_fuel.text=[NSString stringWithFormat:@"%@",fuell_strz];
        
        NSString *eval_accidentallstr=[[NSUserDefaults standardUserDefaults] objectForKey:@"accidentallstrresullt"];
        
        NSString *eval_fuelcliked_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"fuelcliked_str_resullt"];
        
        
        //for New..
        NSString *New_OCtroistr=[[NSUserDefaults standardUserDefaults] objectForKey:@"newvehicle_octroi_resultt"];
        
        NSString *New_ServicedropdownTEXTVALUEstr=[[NSUserDefaults standardUserDefaults] objectForKey:@"ServicedropdownTEXTVALUE_newvehicle"];
        
        NSString *New_ExtendedropdownTEXTVALUEstr=[[NSUserDefaults standardUserDefaults] objectForKey:@"ExtendedropdownTEXTVALUE_newvehicle"];
        
        
        //for firstquattaion salutation...
        NSString *Salutation_strq=[[NSUserDefaults standardUserDefaults] objectForKey:@"titles_salutation"];
        
        //for loan amount
        NSString *monthlypayment_vall_strq=[[NSUserDefaults standardUserDefaults] objectForKey:@"monthlypayment_vall"];
        
        NSString *outstanding_loan_amount_strq=[[NSUserDefaults standardUserDefaults] objectForKey:@"outstanding_loan_amount"];
        
        
        
        SyncStatus=@"Pending";

        
        // NEW 10d
        //MAIN FINANCE TABLE INSERTION QUERY OF NEWVEHICLE...34
        [database executeUpdate:@"insert into tbl_NEWVehicle_flow(Report_id,Salutation,Name,LastName,ContactNo,Mail,CCMail,Date,Budget,NewVehicle_Make,NewVehicle_Model,NewVehicle_Type,NewVehicle_Octroi,NewVehicle_ExShowroomPrice,NewVehicle_Insurance,NewVehicle_LogisticsCharges,NewVehicle_RegistrationServiceCharges,NewVehicle_ServicePlan,NewVehicle_ServicePlan_text,NewVehicle_ExtendedWarranty,NewVehicle_ExtendedWarranty_text,NewVehicle_Accessories,NewVehicle_BenefitstoCustomer,NewVehicle_TotalOnRoadValue,NewVehicle_BalanceTradeInValueforeclose,NewVehicle_DownPayment,NewVehicle_SuggestedLoanAmnt,FinanceOffer_LoanAmount,FinanceOffer_TotalOnRoadValue,FinanceOffer_BalanceTrade_LoanForeClosure,FinanceOffer_scheme1,FinanceOffer_scheme2,FinanceOffer_scheme3,FinanceOffer_scheme4,Sync_Status) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",concatt_Global_newvehicleflowSTR,Salutation_strq,namestr,lastnamestr,contactnostr,mailstr,ccmailstr,datestr,budgetstr,Makestr,Modelstrr,Typestr,New_OCtroistr,ExShowroomPricestr,Insurancestr,LogisticsChargesstr,RegistrationServiceChargesstr,ServicePlanstr,New_ServicedropdownTEXTVALUEstr,ExtendedWarrantystr,New_ExtendedropdownTEXTVALUEstr,Accessoriesstr,BenefitstoCustomerstr,TotalOnRoadValuestr,BalanceTradeInValuestr,DownPaymentstr,SuggestedLoanAmntstr,self.txt_financeoffer.text,self.txt_TORV.text,self.txt_BTIALF.text,self.lbl_emi_3yrs.text,self.lbl_emi_4yrs.text,self.lbl_emi_5yrs.text,self.lbl_emi_7yrs.text,SyncStatus,nil];
        
        
        
        /*
        if([self isNetworkAvailable] == YES)
            
        {
            [self GetAllViewsDataThruTradeInnn_hit_NewVehicleFlow];
        }
         */

        
        
        //navigation to anotherr view...
        UIStoryboard *storyboard ;
        storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        
        FinanceOfferDetailedViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"FinanceOfferDetailedViewController"];
        [self.navigationController pushViewController:vw animated:YES];
        
        
    }
    
    
    [database close];
    
}



//16nov..//submit btn clicked LOCAL DB integration...IMP

//- (IBAction)submitcliked:(id)sender
//{
//    /*
//    if(app.selectindex==0 || app.selectindex==2)
//    {
//        UIStoryboard *storyboard ;
//        storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
//        EvaluateexistingvehcleViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"EvaluateexistingvehcleViewController"];
//        [self.navigationController pushViewController:vw animated:YES];
//    }
//    
//    if(app.selectindex==1)
//    {
//    
//    }
//*/
//    
//    
//    //for new vehicle flow...
//    if(app.selectindex==2)
//    {
//        //for new vehicle flow...
//        [self GetAllViewsDataThruTradeInnn_hit_NewVehicleFlow];
//        
//        // [self GetAllViewsDataThruTradeInnn_hit];
//
//        
//        //LOCAL DB integration here..
//        
//    }
//    
//    else
//    {
//    
//       
//    //for trade-in flow :----.......
//    [self GetAllViewsDataThruTradeInnn_hit];
//        
//        
//        
//    //for testing of new vehcile flow on submit clicked,,,,
//       // [self GetAllViewsDataThruTradeInnn_hit_NewVehicleFlow];
//        
//        
//        
//    //submit btn clicked LOCAL DB integration...IMP
//    NSString *str=[[NSUserDefaults standardUserDefaults]valueForKey:@"db_path"];
//    
//    NSLog(@"str:%@",str);
//    
//    database = [FMDatabase databaseWithPath:str];
//    
//    [database open];
//    
//    
//    self.view.frame=CGRectMake(0, 0, 320, 568);
//    [self.txt_financeoffer resignFirstResponder];
//    [self.txt_TORV resignFirstResponder];
//    [self.txt_BTIALF resignFirstResponder];
//    
//    if(self.txt_financeoffer.text.length==0)
//    {
//        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Maximizer" message:@"Insert Loan Amount." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//        [alert show];
//    }
//    else if (self.txt_TORV.text.length==0)
//    {
//        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Maximizer" message:@"Insert Total On Road Value." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//        [alert show];
//    }
//    else if (self.txt_BTIALF.text.length==0)
//    {
//        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Maximizer" message:@"Insert Balance Trade field." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//        [alert show];
//    }
//    
//    else
//    {
//        NSString *str=[[NSUserDefaults standardUserDefaults]valueForKey:@"db_path"];
//        
//        NSLog(@"str:%@",str);
//        
//        
//        NSInteger uid = 0;
//        NSInteger EEVid = 0;
//        NSInteger LAEid = 0;
//        NSInteger NVid = 0;
//        
//        NSString *logint_status;
//        
//        
//        
//        
//        NSString *namestr,*lastnamestr,*contactnostr,*mailstr,*ccmailstr,*datestr,*budgetstr;
//        
//        
//        NSString *manufacturerstr,*modelstr,*vehiclemodeltypestr,*datestr2,*monthstr,*onroadvaluestr,*ownerstr,*colorstr,*remnginsurancestr,*marketdemadstr,*kmsstr,*valuerupeestr,*estimationbystr,*pricebymaxstr;
//        
//        
//        NSString *LoanAmountstr,*RateOfIntereststr,*loanTenurestr,*MonthlyPaymentstr,*EMIstr,*Percentstr,*FinalPricestr,*OutstandingLoanstr,*BalanceTradestr,*EstimationBystr;
//        
//        
//        NSString *Makestr,*Modelstrr,*Typestr,*ExShowroomPricestr,*Insurancestr,*LogisticsChargesstr,*RegistrationServiceChargesstr,*ServicePlanstr,*ExtendedWarrantystr,*Accessoriesstr,*BenefitstoCustomerstr,*TotalOnRoadValuestr,*BalanceTradeInValuestr,*DownPaymentstr,*SuggestedLoanAmntstr;
//        
//        
//        
//        database = [FMDatabase databaseWithPath:str];
//        
//        [database open];
//        
//        
//        //... FOR USERDETAILS TABLE...
//        FMResultSet *results = [database executeQuery:@"select * from tbl_userdetails"];
//        
//        //NSLog(@"reslut:%@",[results next]);
//        
//        while([results next])
//        {
//            check=true;
//            
//            uid=[results intForColumn:@"id"];
//            
//            rep1300 = [results stringForColumn:@"id"];
//            
//            namestr=[results stringForColumn:@"Name"];
//            lastnamestr=[results stringForColumn:@"LastName"];
//            contactnostr=[results stringForColumn:@"ContactNo"];
//            mailstr=[results stringForColumn:@"Mail"];
//            ccmailstr=[results stringForColumn:@"CCMail"];
//            datestr=[results stringForColumn:@"Date"];
//            budgetstr=[results stringForColumn:@"Budget"];
//            
//            // NSLog(@"User: %ld - %@",(long)uid,logint_status);
//            
//        }
//        
//        
////        //1dec..
////        FMResultSet *results = [database executeQuery:@"SELECT id FROM tbl_userdetails ORDER BY id DESC LIMIT 1"];
////        
////        while ([results next])
////        {
////            
////            name176 = [results stringForColumn:@"id"];
////            NSLog(@"name176:%@",name176);
////        }
//        
//        // NSString *string = @"5";
//      //  int valuestr_ew = [rep1300 intValue]+1;
//        
//        
//        int valuestr_ew = [rep1300 intValue];
//
//        NSString *strFromIntt = [NSString stringWithFormat:@"%d",valuestr_ew];
//        
//        NSString *Rr=@"R";
//        
//        NSString * concatt =[Rr stringByAppendingString:strFromIntt];
//        NSLog(@"concatt:%@",concatt);
//
//        //for rep_id:--
//        //1 dec..
//        NSString *str_reppid=[NSString stringWithFormat:@"%@",concatt];
//        NSLog(@"str_reppid:%@",str_reppid);
//
//        [[NSUserDefaults standardUserDefaults]setValue:str_reppid forKey:@"Report_IDD"];
//        [[NSUserDefaults standardUserDefaults]synchronize];
//
//        
//        
//        
//        
//        
//        
//        //...USERDETAILS END....
//        
//        
//        
//        // FOR EVALUATE EXISTING VEHICLE TABLE...
//        FMResultSet *results2 = [database executeQuery:@"select * from tbl_evaluate_existing_vehicle"];
//        
//        while([results2 next])
//        {
//            
//            check=true;
//            
//            EEVid=[results2 intForColumn:@"id"];
//            
//            manufacturerstr=[results2 stringForColumn:@"Manufacturer"];
//            modelstr=[results2 stringForColumn:@"Model"];
//            vehiclemodeltypestr=[results2 stringForColumn:@"VehicleModelType"];
//            datestr2=[results2 stringForColumn:@"Date"];
//            monthstr=[results2 stringForColumn:@"Month"];
//            onroadvaluestr=[results2 stringForColumn:@"OnRoadValue"];
//            ownerstr=[results2 stringForColumn:@"Owner"];
//            colorstr=[results2 stringForColumn:@"Color"];
//            remnginsurancestr=[results2 stringForColumn:@"RemainingInsurance"];
//            marketdemadstr=[results2 stringForColumn:@"MarketDemand"];
//            kmsstr=[results2 stringForColumn:@"KMS"];
//            valuerupeestr=[results2 stringForColumn:@"ValueRupee"];
//            estimationbystr=[results2 stringForColumn:@"EstimationBy"];
//            pricebymaxstr=[results2 stringForColumn:@"PriceByMax"];
//            
//            
//            
//            //    NSLog(@"User: %ld - %@",(long)uid,logint_status);
//            
//        }
//        //..EVALUATE EXISTING VEHICLE TABLE ENDS...
//        
//        
//        
//        
//        
//        // ....FOR LOAN AMOUNT ESTIMATOR TABLE...
//        FMResultSet *results3 = [database executeQuery:@"select * from tbl_loan_amount_estimator"];
//        
//        //NSLog(@"reslut:%@",[results next]);
//        
//        while([results3 next])
//        {
//            check=true;
//            
//            LAEid=[results3 intForColumn:@"id"];
//            
//            LoanAmountstr=[results3 stringForColumn:@"LoanAmount"];
//            RateOfIntereststr=[results3 stringForColumn:@"RateOfInterest"];
//            loanTenurestr=[results3 stringForColumn:@"loanTenure"];
//            MonthlyPaymentstr=[results3 stringForColumn:@"MonthlyPayment"];
//            EMIstr=[results3 stringForColumn:@"EMI"];
//            Percentstr=[results3 stringForColumn:@"Percent"];
//            FinalPricestr=[results3 stringForColumn:@"FinalPrice"];
//            OutstandingLoanstr=[results3 stringForColumn:@"OutstandingLoan"];
//            BalanceTradestr=[results3 stringForColumn:@"BalanceTrade"];
//            EstimationBystr=[results3 stringForColumn:@"EstimationBy"];
//            
//            
//            //  NSLog(@"User: %ld - %@",(long)uid,logint_status);
//            
//        }
//        //..LOAN AMOUNT ESTIMATOR TABLE ENDS...
//        
//        
//        
//        
//        
//        //....FOR NEW VEHICLE TABLE...
//        FMResultSet *results4 = [database executeQuery:@"select * from tbl_newvehicle"];
//        
//        //NSLog(@"reslut:%@",[results next]);
//        
//        while([results4 next])
//        {
//            check=true;
//            
//            NVid=[results4 intForColumn:@"id"];
//            
//            
//            
//            Makestr=[results4 stringForColumn:@"Make"];
//            Modelstrr=[results4 stringForColumn:@"Model"];
//            Typestr=[results4 stringForColumn:@"Type"];
//            ExShowroomPricestr=[results4 stringForColumn:@"ExShowroomPrice"];
//            Insurancestr=[results4 stringForColumn:@"Insurance"];
//            LogisticsChargesstr=[results4 stringForColumn:@"LogisticsCharges"];
//            RegistrationServiceChargesstr=[results4 stringForColumn:@"RegistrationServiceCharges"];
//            ServicePlanstr=[results4 stringForColumn:@"ServicePlan"];
//            ExtendedWarrantystr=[results4 stringForColumn:@"ExtendedWarranty"];
//            Accessoriesstr=[results4 stringForColumn:@"Accessories"];
//            BenefitstoCustomerstr=[results4 stringForColumn:@"BenefitstoCustomer"];
//            TotalOnRoadValuestr=[results4 stringForColumn:@"TotalOnRoadValue"];
//            BalanceTradeInValuestr=[results4 stringForColumn:@"BalanceTradeInValue"];
//            DownPaymentstr=[results4 stringForColumn:@"DownPayment"];
//            SuggestedLoanAmntstr=[results4 stringForColumn:@"SuggestedLoanAmnt"];
//            
//            
//            //  NSLog(@"User: %ld - %@",(long)uid,logint_status);
//            
//        }
//        //..NEW VEHICLE TABLE ENDS...
//        
//        /*
//         
//         
//         
//         */
//        
//        //MAIN FINANCE TABLE INSERTION QUERY...
//        [database executeUpdate:@"insert into tbl_quotation(Report_id,Name,ContactNo,Mail,CCMail,Date,Budget,Manufacturer,ModelType,VehicleModelType,Datee,Month,OnRoadValue,Owner,Color,RemainingInsurance,MarketDemand,KMS,ValueRupee,EstimationByy,PriceByMax,LoanAmountTaken,RateOfInterest,loanTenure,MonthlyPayment,EMI,Percent,FinalPrice,OutstandingLoan,BalanceTrade,EstimationBy,Make,Model,Type,ExShowroomPrice,Insurance,LogisticsCharges,RegistrationServiceCharges,ServicePlan,ExtendedWarranty,Accessories,BenefitstoCustomer,TotalOnRoadValuee,BalanceTradeInValue,DownPayment,SuggestedLoanAmnt,LoanAmount,TotalOnRoadValue,LoanForeClosure) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",concatt,namestr,contactnostr,mailstr,ccmailstr,datestr,budgetstr,manufacturerstr,modelstr,vehiclemodeltypestr,datestr2,monthstr,onroadvaluestr,ownerstr,colorstr,remnginsurancestr,marketdemadstr,kmsstr,valuerupeestr,estimationbystr,pricebymaxstr,LoanAmountstr,RateOfIntereststr,loanTenurestr,MonthlyPaymentstr,EMIstr,Percentstr,FinalPricestr,OutstandingLoanstr,BalanceTradestr,EstimationBystr,Makestr,Modelstrr,Typestr,ExShowroomPricestr,Insurancestr,LogisticsChargesstr,RegistrationServiceChargesstr,ServicePlanstr,ExtendedWarrantystr,Accessoriesstr,BenefitstoCustomerstr,TotalOnRoadValuestr,BalanceTradeInValuestr,DownPaymentstr,SuggestedLoanAmntstr,self.txt_financeoffer.text,self.txt_TORV.text,self.txt_BTIALF.text,nil];
//        
//        
//        
//        
//        /*here reportid is extra...
//        [database executeUpdate:@"create table tbl_quotation(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,Report_id,Name varchar,ContactNo varchar,Mail varchar,CCMail varchar,Date varchar,Budget varchar,Manufacturer varchar,ModelType varchar,VehicleModelType varchar,Datee varchar,Month varchar,OnRoadValue varchar, Owner varchar,Color varchar,RemainingInsurance varchar, MarketDemand varchar,KMS varchar,ValueRupee varchar,EstimationByy varchar,PriceByMax varchar,LoanAmountTaken varchar, RateOfInterest varchar, loanTenure varchar, MonthlyPayment varchar, EMI varchar, Percent varchar, FinalPrice varchar, OutstandingLoan varchar, BalanceTrade varchar, EstimationBy varchar,Make varchar, Model varchar,Type varchar,ExShowroomPrice varchar, Insurance varchar, LogisticsCharges varchar, RegistrationServiceCharges varchar, ServicePlan varchar, ExtendedWarranty varchar, Accessories varchar, BenefitstoCustomer varchar, TotalOnRoadValuee varchar, BalanceTradeInValue varchar,DownPayment varchar,SuggestedLoanAmnt varchar,LoanAmount varchar,TotalOnRoadValue varchar,LoanForeClosure varchar)"];*/
//        
//        
//        
//        //navigation to anotherr view...
//        UIStoryboard *storyboard ;
//        storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
//        
//        FinanceOfferDetailedViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"FinanceOfferDetailedViewController"];
//        [self.navigationController pushViewController:vw animated:YES];
//

//        
//    }
//    
//    
//    [database close];
//    
//    
//    
//    
//}
//
//}




//submit modified...
-(IBAction)submitcliked:(id)sender
{
    
    //[self.monthly_pay_txt.text isEqualToString:@""] || [self.txt_emi.text isEqualToString:@""]
    if([self.txt_financeoffer.text isEqualToString:@""] && [self.txt_TORV.text isEqualToString:@""])
    {
        UIAlertView *aert=[[UIAlertView alloc]initWithTitle:@"Maximizer." message:@"Please Enter All The Fields." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [aert show];
    }
   else
    {
        
        
        if(app.selectindex==1)  // FOR NEW VEHICLE....
        {
            
            [self LoaclDbInsertion_NewVehicle];
          //  [self GetAllViewsDataThruTradeInnn_hit_NewVehicleFlow];

            
            
            
            UIStoryboard *storyboard ;
            storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
            
            FinanceOfferDetailedViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"FinanceOfferDetailedViewController"];
            [self.navigationController pushViewController:vw animated:YES];
        }
        
        else                    // FOR TRADEIN....
       // if(app.selectindex==2)
        {
            
            [self LocalDbinsertion_TradeIn];
  //        [self GetAllViewsDataThruTradeInnn_hit];
            
            
            
            UIStoryboard *storyboard ;
            storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
            
            FinanceOfferDetailedViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"FinanceOfferDetailedViewController"];
            [self.navigationController pushViewController:vw animated:YES];
            
        }
        
    }
    
}



- (IBAction)homecliked:(id)sender
{
    backimgview.hidden=NO;
    basetab.hidden=NO;
    self.menubtn.userInteractionEnabled=NO;
    self.sharebtn.userInteractionEnabled=NO;
    
    [self.view endEditing:YES];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.50];
    [UIView setAnimationBeginsFromCurrentState:YES];
    basetab.frame = CGRectMake(0, 68, 280, self.view.frame.size.height-50);
    [UIView commitAnimations];
    
}

- (IBAction)sharecliked:(id)sender
{
    
}



/*
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField == self.txt_financeoffer)
    {
        self.view.frame = CGRectMake(0, -50, 320, 568);
        
    }
    if (textField == self.txt_TORV)
    {
        self.view.frame = CGRectMake(0, -50, 320, 568);
        
    }
    if (textField == self.txt_BTIALF)
    {
        self.view.frame = CGRectMake(0, -50, 320, 568);
        
    }
    
   //   [self CALCULATION_EMI_3];

}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    
    if (textField == self.txt_financeoffer)
    {
        self.view.frame = CGRectMake(0, 0, 320, 568);
        
    }
    if (textField == self.txt_TORV)
    {
        self.view.frame = CGRectMake(0, 0, 320, 568);
        
    }
    if (textField == self.txt_BTIALF)
    {
        self.view.frame = CGRectMake(0, 0, 320, 568);
        
    }
    
    
    
    [self CALCULATION_EMI_3];
    [self CALCULATION_EMI_4];
    [self CALCULATION_EMI_5];
    [self CALCULATION_EMI_7];

    
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}
 
 -(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
 {
 self.menubtn.userInteractionEnabled=YES;
 self.sharebtn.userInteractionEnabled=YES;
 
 backimgview.hidden=YES;
 [self.view endEditing:YES];
 [UIView beginAnimations:nil context:NULL];
 [UIView setAnimationDelegate:self];
 [UIView setAnimationDuration:0.50];
 [UIView setAnimationBeginsFromCurrentState:YES];
 basetab.frame = CGRectMake(-320, 68, 280, self.view.frame.size.height-50);
 [UIView commitAnimations];
 
 [self.txt_financeoffer resignFirstResponder];
 [self.txt_TORV resignFirstResponder];
 [self.txt_BTIALF resignFirstResponder];
 }

 
 
 */

// for hide keyboard when touch anywer in view...
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}



-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"Text field did begin editing");
    
    
    //    if (textField==txt_passport||textField==txt_position||textField==txt_location||textField==txt_phnno)
    //    {
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.35f];
    CGRect frame = self.view.frame;
    frame.origin.y = -145;
    [self.view setFrame:frame];
    [UIView commitAnimations];
    
    
   
    
    //    }
    
}

// This method is called once we complete editing
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"Text field ended editing");
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.35f];
    CGRect frame = self.view.frame;
    frame.origin.y = 0;
    [self.view setFrame:frame];
    [UIView commitAnimations];
    
    
    [self CALCULATION_EMI_3];
    [self CALCULATION_EMI_4];
    [self CALCULATION_EMI_5];
    [self CALCULATION_EMI_7];

    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}


@end

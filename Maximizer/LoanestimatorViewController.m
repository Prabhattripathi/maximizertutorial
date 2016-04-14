//
//  LoanestimatorViewController.m
//  Maximizer
//
//  Created by Genie Technology on 08/08/15.
//  Copyright (c) 2015 Genie Soft Systems. All rights reserved.
//

#import "LoanestimatorViewController.h"
#import "NewvehcleViewController.h"
#import "BaseTableView.h"
#import "AppDelegate.h"
#import "dashboardViewController.h"
#import "NIDropDown.h"
#import "FinanceOfferDetailed2ViewController.h"
#include <netdb.h>




@interface LoanestimatorViewController ()
{
    UIImageView *backimgview;
    BaseTableView *basetab;
    AppDelegate *app;
    NIDropDown *dropdown;
    FMDatabase *database;
    NSMutableArray *arrayfmdb;
    NSString *name;

    UITapGestureRecognizer *tap;


    //slider..
    int result;
    
    //FOR OUTSTANDING LOAN AMOUNT..
    float emi;
    
    float multf;
    int mult;
    float RemainingBal;
    int FRB;
    
    BOOL check;
    
    NSString * rep1300_Usedvehicleflow,*concatt_Global_UsedVehicle;
    
    NSString*SyncStatus;

}

@end

@implementation LoanestimatorViewController

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
    
    
    if(app.selectindex==2)
    {
        [self.next_btn setTitle:@"Submit" forState:UIControlStateNormal];
        
    }
    self.orview.layer.cornerRadius=5;
    self.orview.layer.borderWidth=0.5;
    self.orview.layer.borderColor=[UIColor blackColor].CGColor;
    
    
    self.loan_tenure_btn.layer.cornerRadius=5;
    self.mention_loan_view.layer.cornerRadius=5;
    self.emi_view.layer.cornerRadius=5;
    self.finaal_price_view.layer.cornerRadius=5;
    self.outstanding_loan_amt_view.layer.cornerRadius=5;
    self.balance_trade_view.layer.cornerRadius=5;
    self.estimate_btn.layer.cornerRadius=5;
    self.next_btn.layer.cornerRadius=5;
    self.back_btn.layer.cornerRadius=5;
    
    
    self.loan_tenure_btn.layer.borderWidth=0.5;
    self.loan_tenure_btn.layer.borderColor=[UIColor blackColor].CGColor;
    
    self.mention_loan_view.layer.borderWidth=0.5;
    self.mention_loan_view.layer.borderColor=[UIColor colorWithRed: 133/255.0 green:25/255.0 blue:41/255.0 alpha:1.0].CGColor;
    
    self.emi_view.layer.borderWidth=0.5;
    self.emi_view.layer.borderColor=[UIColor colorWithRed: 133/255.0 green:25/255.0 blue:41/255.0 alpha:1.0].CGColor;
    
    self.finaal_price_view.layer.borderWidth=0.5;
    self.finaal_price_view.layer.borderColor=[UIColor colorWithRed: 133/255.0 green:25/255.0 blue:41/255.0 alpha:1.0].CGColor;
    
    self.outstanding_loan_amt_view.layer.borderWidth=0.5;
    self.outstanding_loan_amt_view.layer.borderColor=[UIColor colorWithRed: 133/255.0 green:25/255.0 blue:41/255.0 alpha:1.0].CGColor;
    
    self.balance_trade_view.layer.borderWidth=0.5;
    self.balance_trade_view.layer.borderColor=[UIColor colorWithRed: 133/255.0 green:25/255.0 blue:41/255.0 alpha:1.0].CGColor;
    
    self.estimate_btn.layer.borderWidth=0.5;
    self.estimate_btn.layer.borderColor=[UIColor blackColor].CGColor;
    
    self.next_btn.layer.borderWidth=0.5;
    self.next_btn.layer.borderColor=[UIColor blackColor].CGColor;
    
    self.back_btn.layer.borderWidth=0.5;
    self.back_btn.layer.borderColor=[UIColor blackColor].CGColor;
    
    self.rate_intrest_txt.layer.borderWidth=0.5;
    self.rate_intrest_txt.layer.borderColor=[UIColor colorWithRed: 133/255.0 green:25/255.0 blue:41/255.0 alpha:1.0].CGColor;
    
    self.monthly_pay_txt.layer.borderWidth=0.5;
    self.monthly_pay_txt.layer.borderColor=[UIColor colorWithRed: 133/255.0 green:25/255.0 blue:41/255.0 alpha:1.0].CGColor;
    
    
    self.slider_txt.layer.borderWidth=0.5;
    self.slider_txt.layer.borderColor=[UIColor colorWithRed: 133/255.0 green:25/255.0 blue:41/255.0 alpha:1.0].CGColor;
    
    self.or_lbl.layer.borderWidth=0.5;
    self.or_lbl.layer.cornerRadius=self.or_lbl.frame.size.height/2;
    self.or_lbl.clipsToBounds=YES;
    self.scroll.contentSize=CGSizeMake(0, 1530);
    
    [self.scroll setContentSize:CGSizeMake(0,1530)];

    
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
    
    [self.sliderview addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    
    
    
    
//    self.txt_pricebymax.text=[NSString stringWithFormat:@"%d",fr];
    NSString *FinalPRice=[[NSUserDefaults standardUserDefaults] objectForKey:@"Final_price_value"];

    self.txt_finalprice.text=[NSString stringWithFormat:@"%@",FinalPRice];
    
}




-(void)CALCULATION_EMI
{
    //calc EMI....
    
    int yr=[self.loan_tenure_btn.currentTitle intValue];
    NSLog(@"year:%d",yr);
    [[NSUserDefaults standardUserDefaults] setInteger:yr forKey:@"tenure_val"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    mult=yr*12;
    NSLog(@"mult:%d",mult);
    
    NSString *op=[NSString stringWithFormat:@"%d",mult];
     multf=[op floatValue];
    NSLog(@"multf:%f",multf);

    
    [[NSUserDefaults standardUserDefaults] setValue:self.rate_intrest_txt.text forKey:@"selectedRateInterest"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    NSString *rateIntrst=[[NSUserDefaults standardUserDefaults] objectForKey:@"selectedRateInterest"];
    
    float rateintrst=[rateIntrst floatValue];
    
    
    float RR=(rateintrst/100)/12;
    NSLog(@"rateintrst:%f",RR);
    
    //float finalresult= powf((1+RR),(float)mult);
    float finalresult=powf((1+RR),multf);

    NSLog(@"finalresult:%f",finalresult);
    
    float bottom=finalresult-1;
     NSLog(@"bottom:%f",bottom);
    
    float sp=finalresult/bottom;
     NSLog(@"sp:%f",sp);
    
    [[NSUserDefaults standardUserDefaults] setValue:self.txt_loanamt.text forKey:@"loanamount"];
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

    
    
    self.lbl_monthlypayment.text=[NSString stringWithFormat:@"%d",EMIRESULT];
    self.txt_emi.text=[NSString stringWithFormat:@"%d",EMIRESULT];
    
    
    //16nov..
    [[NSUserDefaults standardUserDefaults] setValue:self.txt_emi.text forKey:@"EMII"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    [[NSUserDefaults standardUserDefaults] setValue:self.lbl_monthlypayment.text forKey:@"monthlypayment_vall"];
    [[NSUserDefaults standardUserDefaults]synchronize];

    
}



-(void)BALANCETRADEINVALUE
{
    
    //CALCULATION OF "BALANCE TRADE IN VALUE AFTER FORECLOSURE" ....
    
    NSString *FinalPR=[[NSUserDefaults standardUserDefaults] objectForKey:@"Final_price_value"];
    float FINALPRc=[FinalPR floatValue];
    
  /*
  [[NSUserDefaults standardUserDefaults] setValue:self.txt_outstanding_loan.text forKey:@"OutStandingLoanAmount"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    NSString *OutStandingLoanAmount=[[NSUserDefaults standardUserDefaults] objectForKey:@"OutStandingLoanAmount"];
     float OLA=[OutStandingLoanAmount floatValue];*/
    
    
    //sum of all details...
    float BALANCETRADE_SUM=(FINALPRc-(FRB+FRB*((float)result/100)*1.1236));
    NSLog(@"BALANCETRADE_SUM%f",BALANCETRADE_SUM);
    
    
    NSString *BTS=[NSString stringWithFormat:@"%f",BALANCETRADE_SUM];
    int fr=[BTS intValue];
    self.txt_balance_trsde.text=[NSString stringWithFormat:@"%d",fr];
    
    [[NSUserDefaults standardUserDefaults] setInteger:fr forKey:@"BalanceTradeValue"];
    [[NSUserDefaults standardUserDefaults] synchronize];

        

}



//FOR CALCULATING OUTSTANDING LOANAMOUNT...
-(void)OUTSTANDINGLOANAMOUNT
{
    NSString *OutStndLoanAmnt=[[NSUserDefaults standardUserDefaults] objectForKey:@"tenure_val"];
    float OLAMNT=[OutStndLoanAmnt floatValue];
    NSLog(@"OLAMNT%f",OLAMNT);
    
    
    NSString *Totloanamount=[[NSUserDefaults standardUserDefaults] objectForKey:@"loanamount"];
    float TLA=[Totloanamount floatValue];
    NSLog(@"TLA%f",TLA);

    
    NSString *rateIntrstt=[[NSUserDefaults standardUserDefaults] objectForKey:@"selectedRateInterest"];
    float rateintrsttt=[rateIntrstt floatValue];
    NSLog(@"rateintrsttt%f",rateintrsttt);
    
    float RInt=rateintrsttt/1200;
    NSLog(@"RInt%f",RInt);

   // float RemainingBal = 0.0;
    
    int mnths;
    
//    NSString *EvaluateYrMonthStr=[[NSUserDefaults standardUserDefaults] objectForKey:@"dates_val"];
//    float EvYrMn=[EvaluateYrMonthStr floatValue];
//    NSLog(@"EvYrMn%f",EvYrMn);
    
    
 NSString *EvaluateYrMonthvalue=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvaluateYrMnthValue"];
    float EYMV=[EvaluateYrMonthvalue floatValue];
    NSLog(@"EYMV%f",EYMV);
    
    RemainingBal=TLA;
    
    //CALCULATION OF "OUTSTANDINGLOANAMOUNT" ....
    
   // for (OLAMNT=1; OLAMNT<=emi; OLAMNT++)
        for (mnths=1; mnths<=mult; mnths++)
    {
        
        float interest=RemainingBal*RInt;  //TLA :- loan amount that user enters.
        NSLog(@"interest%f",interest);

        float principle=roundf(emi-interest);
        NSLog(@"principle%f",principle);

        
        RemainingBal=roundf(RemainingBal-principle);
        NSLog(@"RemainingBal%f",RemainingBal);
        
        
        //float conversion to int...
        NSString * finalremainingbalance =[NSString stringWithFormat:@"%f",RemainingBal];
        FRB = [finalremainingbalance intValue]; //FRB:- final remianing bal in integer.,,
        NSLog(@"FRB%d",FRB);

        
       // if (OLAMNT==EvYrMn) break;
        if (mnths==EYMV)
        {
            break;
        }
        
    }
    
    if (RemainingBal<=0)
    //if (TLA<=0)
    {
        self.txt_outstanding_loan.text=[NSString stringWithFormat:@"%@",@"0"];
        
    }
    else
    {
        self.txt_outstanding_loan.text=[NSString stringWithFormat:@"%d",FRB];
    }
    
    
  //  self.txt_outstanding_loan.text=[NSString stringWithFormat:@"%f",RemainingBal];
    
    
    //16nov...
    [[NSUserDefaults standardUserDefaults] setValue:self.txt_outstanding_loan.text forKey:@"outstanding_loan_amount"];
    [[NSUserDefaults standardUserDefaults] synchronize];

}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



- (void) niDropDownDelegateMethod: (NIDropDown *) sender
{
    
    //1 click drpdwn...
    // for drpdown 1 time click...
//    NSString *loan_sttr=[NSString stringWithFormat:@"%@",self.loan_tenure_btn.currentTitle];
//    NSLog(@"loan_sttr:%@",loan_sttr);
//    
//    [[NSUserDefaults standardUserDefaults] setValue:loan_sttr forKey:@"EvalExisvehicle_model"];
//    [[NSUserDefaults standardUserDefaults]synchronize];

    
    //15dec...
    NSString *loan_tenure_sttr=[NSString stringWithFormat:@"%@",self.loan_tenure_btn.currentTitle];
    NSLog(@"loan_tenure_sttr:%@",loan_tenure_sttr);
    
    [[NSUserDefaults standardUserDefaults] setValue:loan_tenure_sttr forKey:@"loan_tenure_yrs"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    [self CALCULATION_EMI];


    
    [self rel];
    
}

-(void)rel
{
    dropdown = nil;
    
    tap = [[UITapGestureRecognizer alloc]
           initWithTarget:self
           action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];

    
}


-(void)dismissKeyboard
{
    /*for (UIView * txt in self.view.subviews)
     {
     if ([txt isKindOfClass:[UITextField class]])
     {
     [txt resignFirstResponder];
     }
     }*/
    
    //[self.notxt resignFirstResponder];
    [self.view endEditing:YES];
    self.scroll.contentSize=CGSizeMake(0, 1530);
    
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
    
    [self.txt_loanamt resignFirstResponder];
    [self.rate_intrest_txt resignFirstResponder];
    [self.slider_txt resignFirstResponder];
    [self.finaal_price_view resignFirstResponder];
    [self.txt_outstanding_loan resignFirstResponder];
    [self.txt_balance_trsde resignFirstResponder];
    
}

#pragma mark -
#pragma mark - Button method


- (void)sliderValueChanged:(UISlider *)sender
{
    /*NSLog(@"slider value = %f", sender.value*4000000);*/
    
    float temp=sender.value*10;
    result = (int)temp;
    NSLog(@"temp1:%f",temp);
    
    self.slider_txt.text=[NSString stringWithFormat:@"%.001f",temp];
    
    
    //16nov...
    [[NSUserDefaults standardUserDefaults] setValue:self.slider_txt.text forKey:@"loan_foreclose"];
    [[NSUserDefaults standardUserDefaults]synchronize];

    
}


- (IBAction)backcliked:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}





-(void)LocalDBInsertion_UsedVehicle
{
    //submit btn clicked LOCAL DB integration...IMP
    NSString *str=[[NSUserDefaults standardUserDefaults]valueForKey:@"db_path"];
    
    NSLog(@"str:%@",str);
    
    database = [FMDatabase databaseWithPath:str];
    
    [database open];
    
    
//    self.view.frame=CGRectMake(0, 0, 320, 568);
//    [self.txt_financeoffer resignFirstResponder];
//    [self.txt_TORV resignFirstResponder];
//    [self.txt_BTIALF resignFirstResponder];
    
    if(self.txt_loanamt.text.length==0)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Maximizer" message:@"Insert Loan Amount." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
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
            
            rep1300_Usedvehicleflow = [results stringForColumn:@"id"];
            
            
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
        
        
        int valuestr_ew = [rep1300_Usedvehicleflow intValue];
        
        NSString *strFromIntt = [NSString stringWithFormat:@"%d",valuestr_ew];
        
        NSString *Rr=@"RUsdd";
        
        concatt_Global_UsedVehicle =[Rr stringByAppendingString:strFromIntt];
        NSLog(@"concatt_Global_UsedVehicle:%@",concatt_Global_UsedVehicle);
        
        
        
        //for rep_id:--
        //1 dec..
      NSString *str_reppid_usedcar=[NSString stringWithFormat:@"%@",concatt_Global_UsedVehicle];
        NSLog(@"str_reppid_usedcar:%@",str_reppid_usedcar);
        
        [[NSUserDefaults standardUserDefaults]setValue:str_reppid_usedcar forKey:@"Report_IDD_usedd"];
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
        
        // USED 11d
        //MAIN INSERTION QUERY...36
        [database executeUpdate:@"insert into tbl_usedcar_details(Report_id,Salutation,Name,LastName,ContactNo,Mail,CCMail,Date,Budget,Evaluate_Manufacturer,Evaluate_ModelType,Evaluate_VehicleModelType,Evaluate_Date,Evaluate_Month,Evaluate_OnRoadValue,Evaluate_Owner,Evaluate_Color,Evaluate_RemainingInsurance,Evaluate_MarketDemand,Evaluate_KMS,Evaluate_CBUCKD,Evaluate_Accidental,Evaluate_Fuel,Evaluate_Refurbishment,Evaluate_EstimationBy,Evaluate_OfferPriceByMax,LoanAmountEstimator_LoanAmountTaken,LoanAmountEstimator_RateOfInterest,LoanAmountEstimator_loanTenure,LoanAmountEstimator_MonthlyPayment,LoanAmountEstimator_EMI,LoanAmountEstimator_Percent,LoanAmountEstimator_FinalPrice,LoanAmountEstimator_OutstandingLoan,LoanAmountEstimator_BalanceTradeforclose,LoanAmountEstimator_EstimationBy,Sync_Status) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",concatt_Global_UsedVehicle,Salutation_strq,namestr,lastnamestr,contactnostr,mailstr,ccmailstr,datestr,budgetstr,manufacturerstr,modelstr,vehiclemodeltypestr,datestr2,monthstr,onroadvaluestr,ownerstr,colorstr,remnginsurancestr,marketdemadstr,kmsstr,eval_cbuckd_str,eval_accidentallstr,eval_fuelcliked_str,valuerupeestr,estimationbystr,pricebymaxstr,LoanAmountstr,RateOfIntereststr,loanTenurestr,monthlypayment_vall_strq,EMIstr,Percentstr,FinalPricestr,outstanding_loan_amount_strq,BalanceTradestr,EstimationBystr,SyncStatus];
        
        
        
        if([self isNetworkAvailable] == YES)
            
        {
            [self GetAllViewsDataThruTradeInnn_hitt_UsedCAR];
        }

        
        
        //navigation to anotherr view...
        UIStoryboard *storyboard ;
        storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        FinanceOfferDetailed2ViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"FinanceOfferDetailed2ViewController"];
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
    else
    {
        //NSLog(@"-> connection established!\n");
        return YES;
    }
}





- (IBAction)nextcliked:(id)sender
{
    NSString *str=[[NSUserDefaults standardUserDefaults]valueForKey:@"db_path"];
    
    NSLog(@"str:%@",str);
    
    database = [FMDatabase databaseWithPath:str];
    
    [database open];
    
    //[self.monthly_pay_txt.text isEqualToString:@""] || [self.txt_emi.text isEqualToString:@""]
    if([self.txt_loanamt.text isEqualToString:@""] || [self.rate_intrest_txt.text isEqualToString:@""] || [[self.loan_tenure_btn titleForState:UIControlStateNormal] isEqualToString:@"Select"] || [self.slider_txt.text isEqualToString:@""] || [self.txt_finalprice.text isEqualToString:@""] || [self.txt_outstanding_loan.text isEqualToString:@""] || [self.txt_balance_trsde.text isEqualToString:@""] || [[self.estimate_btn titleForState:UIControlStateNormal] isEqualToString:@"Select"])
    {
        UIAlertView *aert=[[UIAlertView alloc]initWithTitle:@"Maximizer." message:@"Please Enter All The Fields." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [aert show];
    }
    else if([self.monthly_pay_txt.text isEqualToString:@""] && [self.txt_emi.text isEqualToString:@""])
        {
            UIAlertView *aert=[[UIAlertView alloc]initWithTitle:@"Maximizer." message:@"Please Enter All The Fields." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [aert show];
        }
    
    
        else

        
    {
        /*
         // create LOANAMOUNTESTIMATOR TABLE, FOR NEXT BTN
         [database executeUpdate:@"create table LOANAMOUNTESTIMATOR(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, LoanAmount varchar, RateOfInterest varchar, loanTenure varchar, MonthlyPayment varchar, EMI varchar, Percent varchar, FinalPrice varchar, OutstandingLoan varchar, BalanceTrade varchar, EstimationBy varchar)"];
         
         */
        
        [database executeUpdate:@"insert into tbl_loan_amount_estimator(LoanAmount,RateOfInterest,loanTenure,MonthlyPayment,EMI,Percent,FinalPrice,LoanAmount,BalanceTrade,EstimationBy) values(?,?,?,?,?,?,?,?,?,?)",self.txt_loanamt.text,self.rate_intrest_txt.text,[self.loan_tenure_btn titleForState:UIControlStateNormal],self.monthly_pay_txt.text,self.txt_emi.text,self.slider_txt.text,self.txt_finalprice.text,self.txt_outstanding_loan.text,self.txt_balance_trsde.text,[self.estimate_btn titleForState:UIControlStateNormal],nil];
        
        
        
        
        
        //Submit clicked from used vehicle....
        
        if(app.selectindex==2)
        {
            
            //By using local db..NEW..11D
            [self LocalDBInsertion_UsedVehicle];

            //BY USING API.......
           // [self GetAllViewsDataThruTradeInnn_hitt_UsedCAR];
            
            
            
            
            
            
            
            
            
//            //by using local db..OLD
//            NSString *str=[[NSUserDefaults standardUserDefaults]valueForKey:@"db_path"];
//            
//            NSLog(@"str:%@",str);
//            
//            database = [FMDatabase databaseWithPath:str];
//            
//            [database open];
//            
//                
//                NSInteger uid = 0;
//                NSInteger EEVid = 0;
//                NSInteger LAEid = 0;
//                NSInteger NVid = 0;
//                
//                NSString *logint_status;
//            
//                NSString *namestr,*lastnamestr,*contactnostr,*mailstr,*ccmailstr,*datestr,*budgetstr;
//                
//                
//                NSString *manufacturerstr,*modelstr,*vehiclemodeltypestr,*datestr2,*monthstr,*onroadvaluestr,*ownerstr,*colorstr,*remnginsurancestr,*marketdemadstr,*kmsstr,*valuerupeestr,*estimationbystr,*pricebymaxstr;
//                
//                
//                NSString *LoanAmountstr,*RateOfIntereststr,*loanTenurestr,*MonthlyPaymentstr,*EMIstr,*Percentstr,*FinalPricestr,*OutstandingLoanstr,*BalanceTradestr,*EstimationBystr;
//                
//                
//                NSString *Makestr,*Modelstrr,*Typestr,*ExShowroomPricestr,*Insurancestr,*LogisticsChargesstr,*RegistrationServiceChargesstr,*ServicePlanstr,*ExtendedWarrantystr,*Accessoriesstr,*BenefitstoCustomerstr,*TotalOnRoadValuestr,*BalanceTradeInValuestr,*DownPaymentstr,*SuggestedLoanAmntstr;
//                
//                
//                
//                database = [FMDatabase databaseWithPath:str];
//                
//                [database open];
//                
//                
//                //... FOR USERDETAILS TABLE...
//                FMResultSet *results = [database executeQuery:@"select * from tbl_userdetails"];
//                
//                //NSLog(@"reslut:%@",[results next]);
//                
//                while([results next])
//                {
//                    check=true;
//                    
//                    uid=[results intForColumn:@"id"];
//                    
//                    namestr=[results stringForColumn:@"Name"];
//                    lastnamestr=[results stringForColumn:@"LastName"];
//                    contactnostr=[results stringForColumn:@"ContactNo"];
//                    mailstr=[results stringForColumn:@"Mail"];
//                    ccmailstr=[results stringForColumn:@"CCMail"];
//                    datestr=[results stringForColumn:@"Date"];
//                    budgetstr=[results stringForColumn:@"Budget"];
//                    
//                    // NSLog(@"User: %ld - %@",(long)uid,logint_status);
//                    
//                }
//                //...USERDETAILS END....
//                
//            
//                // FOR EVALUATE EXISTING VEHICLE TABLE...
//                FMResultSet *results2 = [database executeQuery:@"select * from tbl_evaluate_existing_vehicle"];
//                
//                while([results2 next])
//                {
//                    
//                    check=true;
//                    
//                    EEVid=[results2 intForColumn:@"id"];
//                    
//                    manufacturerstr=[results2 stringForColumn:@"Manufacturer"];
//                    modelstr=[results2 stringForColumn:@"Model"];
//                    vehiclemodeltypestr=[results2 stringForColumn:@"VehicleModelType"];
//                    datestr2=[results2 stringForColumn:@"Date"];
//                    monthstr=[results2 stringForColumn:@"Month"];
//                    onroadvaluestr=[results2 stringForColumn:@"OnRoadValue"];
//                    ownerstr=[results2 stringForColumn:@"Owner"];
//                    colorstr=[results2 stringForColumn:@"Color"];
//                    remnginsurancestr=[results2 stringForColumn:@"RemainingInsurance"];
//                    marketdemadstr=[results2 stringForColumn:@"MarketDemand"];
//                    kmsstr=[results2 stringForColumn:@"KMS"];
//                    
//                    //cbuckd,accidental n fuel not taken yet...
//                    
//                    valuerupeestr=[results2 stringForColumn:@"ValueRupee"];//refurb..
//                    estimationbystr=[results2 stringForColumn:@"EstimationBy"];
//                    pricebymaxstr=[results2 stringForColumn:@"PriceByMax"];
//                    
//                    
//                    
//                    //    NSLog(@"User: %ld - %@",(long)uid,logint_status);
//                    
//                }
//                //..EVALUATE EXISTING VEHICLE TABLE ENDS...
//                
//                
//                
//                
//            
//                // ....FOR LOAN AMOUNT ESTIMATOR TABLE...
//                FMResultSet *results3 = [database executeQuery:@"select * from tbl_loan_amount_estimator"];
//                
//                //NSLog(@"reslut:%@",[results next]);
//                
//                while([results3 next])
//                {
//                    check=true;
//                    
//                    LAEid=[results3 intForColumn:@"id"];
//                    
//                    LoanAmountstr=[results3 stringForColumn:@"LoanAmount"];
//                    RateOfIntereststr=[results3 stringForColumn:@"RateOfInterest"];
//                    loanTenurestr=[results3 stringForColumn:@"loanTenure"];
//                    MonthlyPaymentstr=[results3 stringForColumn:@"MonthlyPayment"];
//                    EMIstr=[results3 stringForColumn:@"EMI"];
//                    Percentstr=[results3 stringForColumn:@"Percent"];
//                    FinalPricestr=[results3 stringForColumn:@"FinalPrice"];
//                    OutstandingLoanstr=[results3 stringForColumn:@"OutstandingLoan"];
//                    BalanceTradestr=[results3 stringForColumn:@"BalanceTrade"];
//                    EstimationBystr=[results3 stringForColumn:@"EstimationBy"];
//                    
//                    
//                    //  NSLog(@"User: %ld - %@",(long)uid,logint_status);
//                    
//                }
//                //..LOAN AMOUNT ESTIMATOR TABLE ENDS...*/
//            
//            
//            //MAIN LOAN AMOUNT ESTIMATOR table INSERTION QUERY...(tbl_usedcar_details)...
//            [database executeUpdate:@"insert into tbl_usedcar_details(Manufacturer,ModelType,VehicleModelType,Datee,Month,OnRoadValue,Owner,Color,RemainingInsurance,MarketDemand,KMS,ValueRupee,EstimationByy,PriceByMax,LoanAmountTaken,RateOfInterest,loanTenure,MonthlyPayment,EMI,Percent,FinalPrice,OutstandingLoan,BalanceTrade,EstimationBy) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",manufacturerstr,modelstr,vehiclemodeltypestr,datestr2,monthstr,onroadvaluestr,ownerstr,colorstr,remnginsurancestr,marketdemadstr,kmsstr,valuerupeestr,estimationbystr,pricebymaxstr,LoanAmountstr,RateOfIntereststr,loanTenurestr,MonthlyPaymentstr,EMIstr,Percentstr,FinalPricestr,OutstandingLoanstr,BalanceTradestr,EstimationBystr,nil];
//            
//            
//            
//            [database executeUpdate:@"create table tbl_usedcar_details(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,uid varchar,Cust_id varchar, Report_id varchar, Manufacturer varchar, ModelType varchar, VehicleModelType varchar, used_car_purchase_offer varchar, outstanding_loan_amount varchar, net_transaction_amount varchar, used_car_estimate_by varchar, outstanding_estimate_by varchar,expected_time varchar, expected_budget varchar, Datee varchar,Month varchar, OnRoadValue varchar, Owner varchar, Color varchar,RemainingInsurance varchar, MarketDemand varchar, KMS varchar, cbuckd varchar, accidental varchar, car_fuel_type varchar, ValueRupee varchar,loan_amount,interest_rate_percent,loan_tenure,actual_emi,estimated_foreclose_percent,balance_trade_foreclose,sync_type varchar,created_on varchar)"];
//            
//           
//            
//            
//            [database close];
//            
//            
//            
//            //Navigation to other view....
//            
//            UIStoryboard *storyboard ;
//            storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
//            FinanceOfferDetailed2ViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"FinanceOfferDetailed2ViewController"];
//            [self.navigationController pushViewController:vw animated:YES];
            

        }
        
        
        
        
        else    //Submit clicked from trade in....
        {
            UIStoryboard *storyboard ;
            storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
            NewvehcleViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"NewvehcleViewController"];
            [self.navigationController pushViewController:vw animated:YES];
        }
        
        
    }
    
    [database close];
    
}





//18Nov...
//do coding here for used vehicle SUBMIT click...

-(void)GetAllViewsDataThruTradeInnn_hitt_UsedCAR

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
    
   // NSString *registrationservicecharges_resul=[[NSUserDefaults standardUserDefaults] objectForKey:@"registrationservicecharges_result"];
    
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
    
    //for customer id :-- 1 dec...
    NSString *cust_id_strb=[[NSUserDefaults standardUserDefaults]valueForKey:@"Customer_Id"];
    NSLog(@"cust_id_strb:%@",cust_id_strb);
    
    //for report id:-- 1 dec...
 //   NSString *repp_id_strb=[[NSUserDefaults standardUserDefaults]valueForKey:@"Report_IDD"];
  //  NSLog(@"repp_id_strb:%@",repp_id_strb);
    
    //for report id:-- 1 dec...(modified)
    NSString *repp_id_strb=[[NSUserDefaults standardUserDefaults]valueForKey:@"Reporrt_Id"];
    NSLog(@"repp_id_strb:%@",repp_id_strb);

    
    
    
    //3 dummy strings & 4th dummy..net trans amnt.& reportid..totoutflow
    NSString *usedcarpurchasestr=@"0";
    NSString *outstanding_loan_amountstr=@"0";
    //   NSString *sugg_loan_amountstr=[NSString stringWithFormat:@"%@",@"0"];
    
    NSString *net_transaction_amount_str=@"1300760";
    
    NSString *reportid_str=@"R982033";
    NSString *custid_str=@"C822899";
    
    
    //DUMMMY 16NOV...
    NSString *octroi_str=@"Y";
    NSString *balTradeForeClosure_str=@"1300300";
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
    NSString *pricebymax_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"Final_price_value"];   //usedcarpurchaseofffer....
    
    
    
    
    //loanamount fetching values...
    NSString *loanamount_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"loanamount"];
    NSString *rateintrest_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"selectedRateInterest"];
    NSString *loan_tenure_yrs_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"loan_tenure_yrs"];
    NSString *EMi_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EMII"];
    NSString *loan_foreclose_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"loan_foreclose"];
    
    NSString *FinalPRicee=[[NSUserDefaults standardUserDefaults] objectForKey:@"Final_price_value"];
    NSString *outstanding_loan_amount_strqq=[[NSUserDefaults standardUserDefaults] objectForKey:@"outstanding_loan_amount"];
    NSString *loanamnt_estimate_by_strqq=[[NSUserDefaults standardUserDefaults] objectForKey:@"loanamnt_estimate_by"];
    
    
    
      //  PARSING BEGINS....
    
      /*lat changed....
     
     maximizer.mdei.info/jlrmaximizer_p2/api/api/insert_usedcar_vehicle?data={"uid":"DLR139","custid":"40",
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
    
    NSString *usedrep_stdsdsdsdr=[[NSUserDefaults standardUserDefaults]valueForKey:@"Report_IDD_usedd"];

    NSLog(@"usedrep_stdsdsdsdr:%@",usedrep_stdsdsdsdr);
    
    
    
    NSString *urlString=[NSString stringWithFormat:@"http://maximizer.mdei.info/jlrmaximizer_p2/api/api/insert_usedcar_vehicle?data={\"uid\":\"%@\",\"custid\":\"%@\",\"salutation\":\"%@\",\"fname\":\"%@\",\"lname\":\"%@\",\"email\":\"%@\",\"phone\":\"%@\",\"cc_email\":\"%@\",\"report_id\":\"%@\",\"used_car_purchase_offer\":\"%@\",\"outstanding_loan_amount\":\"%@\",\"net_transaction_amount\":\"%@\",\"used_car_estimate_by\":\"%@\",\"outstanding_estimate_by\":\"%@\",\"expected_time\":\"%@\",\"expected_budget\":\"%@\",\"car_make\":\"%@\",\"car_model\":\"%@\",\"car_model_type\":\"%@\",\"purchase_year\":\"%@\",\"purchase_month\":\"%@\",\"onroad_value\":\"%@\",\"owner\":\"%@\",\"colour\":\"%@\",\"remain_insurance\":\"%@\",\"car_speed_type\":\"%@\",\"car_kms\":\"%@\",\"cbuckd\":\"%@\",\"accidental\":\"%@\",\"car_fuel_type\":\"%@\",\"old_refurb\":\"%@\",\"estimation_by\":\"%@\",\"loan_amount\":\"%@\",\"interest_rate_percent\":\"%@\",\"loan_tenure\":\"%@\",\"actual_emi\":\"%@\",\"estimated_foreclose_percent\":\"%@\",\"final_offer_price\":\"%@\",\"outstanding_loan\":\"%@\",\"balance_trade_foreclose\":\"%@\"}",unaMe,cust_id_strb,salutation_strr,CustFnamestr,CustLastnamestr,customerEmailiDstr,customerContactNo_str,ccmail_str,concatt_Global_UsedVehicle,pricebymax_str,outstanding_loan_amount_strqq,net_transaction_amount_str,EvalExisvehicle_estimate_by_str,loanamnt_estimate_by_strqq,DisplayDate_str,ExpectedBudget_str,EvalExisvehicle_manufacturer_str,EvalExisvehicle_model_str,EvalExisvehicle_type_str,year_val_str,EvalExisvehicle_monthh_str,road_val_str,EvalExisvehicle_owner_str,EvalExisvehicle_color_str,EvalExisvehicle_insurance_str,EvalExisvehicle_market_demnad_str,EvalExisvehicle_kmss_str,CBUCKD_str,accidental_str,fuel_str,oldrefurb_str,EvalExisvehicle_estimate_by_str,loanamount_str,rateintrest_str,loan_tenure_yrs_str,EMi_str,loan_foreclose_str,FinalPRicee,outstanding_loan_amount_strqq,balTradeForeClosure_str];
    
    //usedrep_stdsdsdsdr:ws cmng null...
    //concatt_Global_UsedVehicle
    //repp_id_strb to rep1300_Usedvehicleflow
    
    
    //preiviosly entered static values of custid and reportid:-...
    //custid_str
    //reportid_str
    
    
    
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
            
            [database executeUpdate:@"UPDATE tbl_usedcar_details SET Sync_Status='Done' WHERE id = (SELECT max(id) FROM tbl_usedcar_details)"];

            
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

//do coding here for used vehicle SUBMIT click...ends....








- (IBAction)homercliked:(id)sender
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

- (IBAction)sharecliked:(id)sender
{
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.scroll.contentSize=CGSizeMake(0, 1530);

    
    
    if (textField == self.txt_loanamt)
    {
        self.view.frame = CGRectMake(0, -50, 320, 568);
        
    }
    if (textField == self.rate_intrest_txt)
    {
        self.view.frame = CGRectMake(0, -50, 320, 568);
        
    }
    if (textField == self.slider_txt)
    {
        self.view.frame = CGRectMake(0, -50, 320, 568);
        
    }
    if (textField == self.finaal_price_view)
    {
        self.view.frame = CGRectMake(0, -50, 320, 568);
        
    }
    if (textField == self.txt_outstanding_loan)
    {
        self.view.frame = CGRectMake(0, -50, 320, 568);
        
    }
    if (textField == self.txt_balance_trsde)
    {
        self.view.frame = CGRectMake(0, -100, 320, 568);
        
    }
    [self.scroll setContentSize:CGSizeMake(0,1630)];

    
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    /*
    if (textField == self.txt_loanamt)
    {
        self.view.frame = CGRectMake(0, 0, 320, 568);
     
    }
    if (textField == self.rate_intrest_txt)
    {
        self.view.frame = CGRectMake(0, 0, 320, 568);
     
    }
    if (textField == self.slider_txt)
    {
        self.view.frame = CGRectMake(0, 0, 320, 568);
     
    }
    if (textField == self.finaal_price_view)
    {
        self.view.frame = CGRectMake(0, 0, 320, 568);
     
    }
    if (textField == self.txt_outstanding_loan)
    {
        self.view.frame = CGRectMake(0, 0, 320, 568);
        
    }
    if (textField == self.txt_balance_trsde)
    {
        self.view.frame = CGRectMake(0, 0, 320, 568);
        
    }*/
    
    self.view.frame=CGRectMake(0, 0, 320, 568);
    [textField resignFirstResponder];
    
    
    
    
    [self OUTSTANDINGLOANAMOUNT];
    [self BALANCETRADEINVALUE];
    
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
     self.view.frame=CGRectMake(0, 0, 320, 568);
    [textField resignFirstResponder];
    
    return YES;
}



- (IBAction)btn_LoanTenure:(id)sender
{
    [self dismissKeyboard];
    
    [self.view removeGestureRecognizer:tap];
    NSString *str=[[NSUserDefaults standardUserDefaults]valueForKey:@"db_path"];
    database = [FMDatabase databaseWithPath:str];
    
    [database open];
    
    arrayfmdb = [[NSMutableArray alloc]init];
    
    FMResultSet *results = [database executeQuery:@"SELECT * FROM tbl_loan_tenure"];
    
    while ([results next])
        
    {
        
        name = [results stringForColumn:@"loantenure"];
        [arrayfmdb addObject:name];
        NSLog(@"arr:%@",arrayfmdb);
    }
    
    
    if(dropdown == nil)
    {
        CGFloat f =200;
        dropdown = [[NIDropDown alloc]showDropDown:sender :&f :arrayfmdb :Nil :@"down"];
        dropdown.delegate = (id)self;
        
    }
    else
    {
        [dropdown hideDropDown:sender];
        [self rel];
    }
    
    [database close];
    
    
    
    
  //  [self CALCULATION_EMI];
    
    
    
  //  [self BALANCETRADEINVALUE];
   // [self OUTSTANDINGLOANAMOUNT];

    //16 nov...
    
//    NSString *loan_tenure_sttr=[NSString stringWithFormat:@"%@",self.loan_tenure_btn.currentTitle];
//    NSLog(@"loan_tenure_sttr:%@",loan_tenure_sttr);
//    
//    [[NSUserDefaults standardUserDefaults] setValue:loan_tenure_sttr forKey:@"loan_tenure_yrs"];
//    [[NSUserDefaults standardUserDefaults]synchronize];

    
    
  /*
    //calc EMI....
    
    int yr=[self.loan_tenure_btn.currentTitle intValue];
    NSLog(@"year:%d",yr);
    [[NSUserDefaults standardUserDefaults] setInteger:yr forKey:@"tenure_val"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    int mult=yr*12;
    NSLog(@"mult:%d",mult);
    
    
    
    [[NSUserDefaults standardUserDefaults] setValue:self.rate_intrest_txt.text forKey:@"selectedRateInterest"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    NSString *rateIntrst=[[NSUserDefaults standardUserDefaults] objectForKey:@"selectedRateInterest"];
    int rateintrst=[rateIntrst intValue];
    

    int RR=(rateintrst/100)/12;
    NSLog(@"rateintrst:%d",RR);
    
   int finalresult= powf((1+RR),mult);
    NSLog(@"finalresult:%d",finalresult);

    int bottom=finalresult-1;
    int sp=finalresult/bottom;
    
    
    [[NSUserDefaults standardUserDefaults] setValue:self.txt_loanamt.text forKey:@"loanamount"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    NSString *loanamount=[[NSUserDefaults standardUserDefaults] objectForKey:@"loanamount"];
    int LA=[loanamount intValue];
    int emi=round((LA+RR)*sp);
    NSLog(@"emi:%d",emi);

    
  //  self.txt_emi.text=[NSString stringWithFormat:@"%d",emi];
 //   NSLog(@"txt_emi:%@",self.txt_emi.text);
    
    self.lbl_monthlypayment.text=[NSString stringWithFormat:@"%d",emi];
    NSLog(@"EMI:%d",emi);
   */
    
}


- (IBAction)btn_EstimationBy:(id)sender
{
    [self dismissKeyboard];
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
        
    }
    else{
        [dropdown hideDropDown:sender];
        [self rel];
    }
    
    [database close];
    
    [self.scroll setContentSize:CGSizeMake(0,1630)];
    
    
    
    //16nov..
    NSString *loanamnt_estimate_by_sttrq=[NSString stringWithFormat:@"%@",self.estimate_btn.currentTitle];
    NSLog(@"loanamnt_estimate_by_sttrq:%@",loanamnt_estimate_by_sttrq);
    
    [[NSUserDefaults standardUserDefaults] setValue:loanamnt_estimate_by_sttrq forKey:@"loanamnt_estimate_by"];
    [[NSUserDefaults standardUserDefaults]synchronize];


}




@end

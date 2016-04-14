//
//  ViewController.m
//  Maximizer
//
//  Created by Genie Technology on 07/08/15.
//  Copyright (c) 2015 Genie Soft Systems. All rights reserved.
//

#import "ViewController.h"
#import "editprofileViewController.h"
#import "Reachability.h"


@interface ViewController ()
{
    CGRect loginframe;
    FMDatabase *database;
    
    BOOL check;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    check=false;
    
    self.loginview.layer.cornerRadius=5;
    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:self.loginview.bounds];
    self.loginview.layer.masksToBounds = NO;
    self.loginview.layer.shadowColor = [UIColor blackColor].CGColor;
    self.loginview.layer.shadowOffset = CGSizeMake(1.0f, 1.0f);
    self.loginview.layer.shadowOpacity =0.8f;
    self.loginview.layer.shadowPath = shadowPath.CGPath;
    self.loginbtn.layer.cornerRadius=5;
    self.forgetbtn.layer.cornerRadius=5;
    self.loginview.layer.borderWidth=1.0;
    self.loginview.layer.borderColor=[UIColor colorWithRed:133/255.0 green:25/255.0 blue:41/255.0 alpha:1.0].CGColor;

    loginframe=self.loginview.frame;
    
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 25, 0)];
    self.useridtxt.leftView = paddingView;
    self.useridtxt.leftViewMode = UITextFieldViewModeAlways;
    UIView *paddingView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 25, 0)];
    self.passtxt.leftView = paddingView1;
    self.passtxt.leftViewMode = UITextFieldViewModeAlways;
    
            self.useridtxt.layer.borderWidth=0.5;
    self.useridtxt.layer.borderColor=[UIColor colorWithRed:133/255.0 green:25/255.0 blue:41/255.0 alpha:1.0].CGColor;
    self.useridtxt.layer.cornerRadius=5;
    
    
    self.passtxt.layer.borderWidth=0.5;
    self.passtxt.layer.borderColor=[UIColor colorWithRed:133/255.0 green:25/255.0 blue:41/255.0 alpha:1.0].CGColor;
    self.passtxt.layer.cornerRadius=5;

}





//ds method is for the internet connectivity...
-(BOOL)checkinternet
{
    
    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    
    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
    
    if (networkStatus == NotReachable)
    {
        UIAlertView *alert2=[[UIAlertView alloc]initWithTitle:@"Godrej Properties" message:@"Your Cell phone is not connected to internet." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert2 show];
        return false;
        
    }
    else
    {
        return true;
    }
    
}









- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark - TextField Delegate Method


-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if(textField==self.useridtxt)
    {
        self.useridtxt.keyboardType=UIKeyboardTypeEmailAddress;
        self.view.frame=CGRectMake(0, -50, 320, 568);
    }
    
    if(textField==self.passtxt)
    {
        self.passtxt.keyboardType=UIKeyboardTypeDefault;
        self.view.frame=CGRectMake(0, -70, 320, 568);
    }
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
     self.view.frame=CGRectMake(0, 0, 320, 568);
    
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    self.view.frame=CGRectMake(0, 0, 320, 568);
    [self.useridtxt resignFirstResponder];
    [self.passtxt resignFirstResponder];
    
    return YES;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
   // self.loginview.frame=loginframe;
    
    [self.useridtxt resignFirstResponder];
    [self.passtxt resignFirstResponder];
    
}

#pragma mark -
#pragma mark - Button Method

- (IBAction)loginbtncliked:(id)sender

{
    
    
     self.view.frame=CGRectMake(0, 0, 320, 568);
    [self.useridtxt resignFirstResponder];
    [self.passtxt resignFirstResponder];
    
    
    if(self.useridtxt.text.length==0)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Maximizer" message:@"Insert username." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if (self.passtxt.text.length==0)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Maximizer" message:@"Insert Password." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        NSString *str=[[NSUserDefaults standardUserDefaults]valueForKey:@"db_path"];
        
        NSLog(@"str:%@",str);
        
        NSInteger uid = 0;
        NSString *logint_status;
        
        //6Nov..
        NSString *Username;    //G123..
        
      
        database = [FMDatabase databaseWithPath:str];
        
        [database open];
        
        FMResultSet *results = [database executeQuery:@"select * from tbl_user WHERE username = ? and password = ?",[NSString stringWithFormat:@"%@",self.useridtxt.text],[NSString stringWithFormat:@"%@",self.passtxt.text]];
        //NSLog(@"reslut:%@",[results next]);
        
        
            while([results next])
            {
                check=true;
                
                uid=[results intForColumn:@"userid"];
                logint_status=[results stringForColumn:@"login_status"];
                NSLog(@"User: %ld - %@",(long)uid,logint_status);
                
                //6Nov..
                Username=[results stringForColumn:@"username"];

                
            }

        [database close];
        

        if (check==true)
        {
             NSString *str1=[NSString stringWithFormat:@"%ld",(long)uid];
            
            [[NSUserDefaults standardUserDefaults]setObject:str1 forKey:@"userid"];
            [[NSUserDefaults standardUserDefaults]synchronize];
            
            
            //6Nov..
            NSString *str_username=[NSString stringWithFormat:@"%@",Username];
            
            [[NSUserDefaults standardUserDefaults]setValue:str_username forKey:@"usernameE"];
            [[NSUserDefaults standardUserDefaults]synchronize];
            
          
            
            
            
            if([logint_status isEqualToString:@"0"])
            {
                
                UIStoryboard *storyboard ;
                storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
                editprofileViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"editprofileViewController"];
                [self.navigationController pushViewController:vw animated:YES];
            }
            else
            {
                [self performSegueWithIdentifier:@"dash" sender:nil];
            }
            
           
        }
        else
        {
            
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Maximizer" message:@"Please insert correct details" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        
       /* if(i==0)
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Maximizer" message:@"Insert Corrrect details." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            
        }
        else
        {
            
             // NSLog(@"log:%d",[results next]);
        
                        
        }*/
        
        
        [self get_mobileIdentification];

    }
    
     //[self performSegueWithIdentifier:@"dash" sender:nil];
}


-(void)get_mobileIdentification
{

    //maximizer.mdei.info/jlrmaximizer_p2/api/api/mobile_register?data={"uid":"DLR124","imei_no":"5454","pin_no":"U567","mobile_type":"iphone"}
    /*
     NSString *urlString=[NSString stringWithFormat:@"http://maximizer.mdei.info/jlrmaximizer_p2/api/api/insert_usedcar_vehicle?data={\"uid\":\"%@\",\"custid\":\"%@\",\"salutation\":\"%@\",\"fname\":\"%@\",\"lname\":\"%@\",\"email\":\"%@\",\"phone\":\"%@\",\"cc_email\":\"%@\",\"report_id\":\"%@\",\"used_car_purchase_offer\":\"%@\",\"outstanding_loan_amount\":\"%@\",\"net_transaction_amount\":\"%@\",\"used_car_estimate_by\":\"%@\",\"outstanding_estimate_by\":\"%@\",\"expected_time\":\"%@\",\"expected_budget\":\"%@\",\"car_make\":\"%@\",\"car_model\":\"%@\",\"car_model_type\":\"%@\",\"purchase_year\":\"%@\",\"purchase_month\":\"%@\",\"onroad_value\":\"%@\",\"owner\":\"%@\",\"colour\":\"%@\",\"remain_insurance\":\"%@\",\"car_speed_type\":\"%@\",\"car_kms\":\"%@\",\"cbuckd\":\"%@\",\"accidental\":\"%@\",\"car_fuel_type\":\"%@\",\"old_refurb\":\"%@\",\"estimation_by\":\"%@\",\"loan_amount\":\"%@\",\"interest_rate_percent\":\"%@\",\"loan_tenure\":\"%@\",\"actual_emi\":\"%@\",\"estimated_foreclose_percent\":\"%@\",\"final_offer_price\":\"%@\",\"outstanding_loan\":\"%@\",\"balance_trade_foreclose\":\"%@\"}",unaMe,cust_id_strb,salutation_strr,CustFnamestr,CustLastnamestr,customerEmailiDstr,customerContactNo_str,ccmail_str,repp_id_strb,pricebymax_str,outstanding_loan_amount_strqq,net_transaction_amount_str,EvalExisvehicle_estimate_by_str,loanamnt_estimate_by_strqq,DisplayDate_str,ExpectedBudget_str,EvalExisvehicle_manufacturer_str,EvalExisvehicle_model_str,EvalExisvehicle_type_str,year_val_str,EvalExisvehicle_monthh_str,road_val_str,EvalExisvehicle_owner_str,EvalExisvehicle_color_str,EvalExisvehicle_insurance_str,EvalExisvehicle_market_demnad_str,EvalExisvehicle_kmss_str,CBUCKD_str,accidental_str,fuel_str,oldrefurb_str,EvalExisvehicle_estimate_by_str,loanamount_str,rateintrest_str,loan_tenure_yrs_str,EMi_str,loan_foreclose_str,FinalPRicee,outstanding_loan_amount_strqq,balTradeForeClosure_str];

     */
    
    
    
    
    
    
    
    NSString *unaMe=[[NSUserDefaults standardUserDefaults]valueForKey:@"usernameE"];
    NSLog(@"username:%@",unaMe);

    
    NSString *urlString =[NSString stringWithFormat:@"http://maximizer.mdei.info/jlrmaximizer_p2/api/api/mobile_register?data={\"uid\":\"%@\",\"imei_no\":\"%@\",\"pin_no\":\"%@\",\"mobile_type\":\"%@\"}",unaMe,@"I9819",@"P9819",@"iPhone"];
    
    NSLog(@"urlString:%@",urlString);
    
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
        NSLog(@"Error");
    }

        

}










- (IBAction)forgtecliked:(id)sender
{
    
    self.loginview.frame=loginframe;
    
    self.view.frame=CGRectMake(0, 0, 320, 738);
    [self.useridtxt resignFirstResponder];
    [self.passtxt resignFirstResponder];
    
}

@end

//
//  firstquotationViewController.m
//  Maximizer
//
//  Created by Genie Technology on 07/08/15.
//  Copyright (c) 2015 Genie Soft Systems. All rights reserved.
//

#import "firstquotationViewController.h"
#import "dashboardViewController.h"
#import "ViewController.h"
#import "EvaluateexistingvehcleViewController.h"
#import "BaseTableView.h"
#import "AppDelegate.h"
#import "NewvehcleViewController.h"


@interface firstquotationViewController ()
{
    BaseTableView *basetab;
    UIImageView *backimgview;
    AppDelegate *app;
    
    FMDatabase *database;
    BOOL check;
    NSMutableArray *arrayfmdb;
    NSString *name;
    UITapGestureRecognizer *tap;
    
    NSString *name176,*name177;
    
    
}
@end

@implementation firstquotationViewController

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
    
    self.nextbtn.layer.cornerRadius=5;
    self.nameview.layer.cornerRadius=5;
    self.view_lastName.layer.cornerRadius=5;
    self.contactview.layer.cornerRadius=5;
    self.mailview.layer.cornerRadius=5;
    self.ccmialview.layer.cornerRadius=5;
    self.timeview.layer.cornerRadius=5;
    self.budgetview.layer.cornerRadius=5;
    
    self.nameview.layer.borderWidth=0.5;
    self.nameview.layer.borderColor=[UIColor blackColor].CGColor;

    self.view_lastName.layer.borderWidth=0.5;
    self.view_lastName.layer.borderColor=[UIColor blackColor].CGColor;
    
    self.contactview.layer.borderWidth=0.5;
    self.contactview.layer.borderColor=[UIColor blackColor].CGColor;
    
    self.mailview.layer.borderWidth=0.5;
    self.mailview.layer.borderColor=[UIColor blackColor].CGColor;
    
    self.ccmialview.layer.borderWidth=0.5;
    self.ccmialview.layer.borderColor=[UIColor blackColor].CGColor;
    
    self.timeview.layer.borderWidth=0.5;
    self.timeview.layer.borderColor=[UIColor blackColor].CGColor;
    
    self.budgetview.layer.borderWidth=0.5;
    self.budgetview.layer.borderColor=[UIColor blackColor].CGColor;
    
    self.selectbtn.layer.cornerRadius=5;
    self.selectbtn.layer.borderWidth=0.5;
    self.selectbtn.layer.borderColor=[UIColor blackColor].CGColor;
    
    
    
    /// ===  back image ==== /////
    
    backimgview=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 568)];
    backimgview.backgroundColor=[UIColor blackColor];
    backimgview.alpha=0.6;
    [self.view addSubview:backimgview];
    backimgview.hidden=YES;
    
    
    basetab=[[BaseTableView alloc]initWithFrame:CGRectMake(-280, 68, 280, self.view.frame.size.height-50)];
    [self.view addSubview:basetab];
    basetab.hidden=YES;
    
    
    
    UISwipeGestureRecognizer * swipeleft=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeleft:)];
    swipeleft.direction=UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeleft];
    
    UISwipeGestureRecognizer * swiperight=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swiperight:)];
    swiperight.direction=UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swiperight];
    
//         tap = [[UITapGestureRecognizer alloc]
//         initWithTarget:self
//         action:@selector(dismissKeyboard1)];
//    
//         [self.view addGestureRecognizer:tap];
    
    self.scroll_view.contentSize=CGSizeMake(0,500);


    //date view...
    self.VIEWPICKER.hidden=YES;

    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

/*
-(void)dismissKeyboard1
{
    self.menubtn.userInteractionEnabled=YES;
    self.sharebtn.userInteractionEnabled=YES;
    //  self.scroll.userInteractionEnabled=YES;
    
    backimgview.hidden=YES;
    [self.view endEditing:YES];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.50];
    [UIView setAnimationBeginsFromCurrentState:YES];
    basetab.frame = CGRectMake(-320, 68, 280, self.view.frame.size.height-50);
    [UIView commitAnimations];
    
   //  [self.view endEditing:YES];
   // self.scroll_view.contentSize=CGSizeMake(0, 500);
    
    
    // [self.view endEditing:YES];
    
    
    //edit..
    
    
        //[self.view endEditing:YES];
        self.scroll_view.contentSize=CGSizeMake(0, 700);
        
}
*/

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
    self.scroll_view.contentSize=CGSizeMake(0, 500);
    
}




/*
#pragma mark -
#pragma mark - Drop down delegate



//fr drpdown..

- (void) niDropDownDelegateMethod: (NIDropDown *) sender
{
    
    [self rel];
    
}

-(void)rel
{
    dropDown = nil;
}
*/



#pragma mark -
#pragma mark - dropdown Method


- (void) niDropDownDelegateMethod: (NIDropDown *) sender
{
  //  NSLog(@"btn cliked:%@",dropDown.selectedtext);
    NSString *namestrrrz=[NSString stringWithFormat:@"%@",self.selectbtn.currentTitle];
    NSLog(@"titles_salutation:%@",namestrrrz);
    
    [[NSUserDefaults standardUserDefaults] setValue:namestrrrz forKey:@"titles_salutation"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    [self rel];
}

-(void)rel
{
    
    dropDown = nil;
    tap = [[UITapGestureRecognizer alloc]
           initWithTarget:self
           action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
}




#pragma mark -
#pragma mark -Gesture method

-(void)viewWillAppear:(BOOL)animated
{
    
    tap = [[UITapGestureRecognizer alloc]
           initWithTarget:self
           action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
    self.scroll_view.userInteractionEnabled=YES;
    
    basetab.hidden=YES;
    backimgview.hidden=true;
    self.menubtn.userInteractionEnabled=YES;
    self.sharebtn.userInteractionEnabled=YES;
    // self.dashcollection.userInteractionEnabled=YES;
    
    [self.view endEditing:YES];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.50];
    [UIView setAnimationBeginsFromCurrentState:YES];
    basetab.frame = CGRectMake(-320, 68, 280, self.view.frame.size.height-50);
    [UIView commitAnimations];
    
}
/*
 -(void)swipeleft:(UISwipeGestureRecognizer*)gestureRecognizer
 {
 self.menubtn.userInteractionEnabled=YES;
 self.sharebtn.userInteractionEnabled=YES;
 // self.dashcollection.userInteractionEnabled=YES;
 
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
 // self.dashcollection.userInteractionEnabled=NO;
 
 [self.view endEditing:YES];
 [UIView beginAnimations:nil context:NULL];
 [UIView setAnimationDelegate:self];
 [UIView setAnimationDuration:0.50];
 [UIView setAnimationBeginsFromCurrentState:YES];
 basetab.frame = CGRectMake(0, 68, 280, self.view.frame.size.height-50);
 [UIView commitAnimations];
 }
 */

-(void)swipeleft:(UISwipeGestureRecognizer*)gestureRecognizer
{
    
    tap = [[UITapGestureRecognizer alloc]
     initWithTarget:self
     action:@selector(dismissKeyboard)];
     
     [self.view addGestureRecognizer:tap];
    
    
    self.menubtn.userInteractionEnabled=YES;
    self.sharebtn.userInteractionEnabled=YES;
    self.scroll_view.userInteractionEnabled=YES;
    
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
    self.scroll_view.userInteractionEnabled=NO;
    
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
    // self.dashcollection.userInteractionEnabled=YES;
    self.scroll_view.userInteractionEnabled=YES;
    
    backimgview.hidden=YES;
    [self.view endEditing:YES];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.50];
    [UIView setAnimationBeginsFromCurrentState:YES];
    basetab.frame = CGRectMake(-320, 68, 280, self.view.frame.size.height-50);
    [UIView commitAnimations];
    
    [self.txt_name resignFirstResponder];
    [self.txt_lastName resignFirstResponder];
    [self.txt_contact_no resignFirstResponder];
    [self.txt_email_ID resignFirstResponder];
    [self.txt_email_CC resignFirstResponder];
    [self.txt_date resignFirstResponder];
    [self.txt_exp_budj resignFirstResponder];
    
    // [self.view endEditing:YES];
}



#pragma mark -
#pragma mark - Button method




- (IBAction)nextbntcliked:(id)sender
{
    
    /*if()
     {
     alert view
     }
     else
     {
     
     below two if  put here
     }*/
    
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
    
    //....................
    
    
    NSString *str=[[NSUserDefaults standardUserDefaults]valueForKey:@"db_path"];
    
    NSLog(@"str:%@",str);
    
    database = [FMDatabase databaseWithPath:str];
    
    [database open];
    
    //[self.lbl_displaydate.text isEqualToString:@"mm/dd/yyyy"]
    if([[self.selectbtn titleForState:UIControlStateNormal] isEqualToString:@"Select"] || [self.txt_name.text isEqualToString:@""] || [self.txt_lastName.text isEqualToString:@""] || [self.txt_contact_no.text isEqualToString:@""] || [self.txt_email_ID.text isEqualToString:@""] || [self.lbl_displaydate.text isEqualToString:@""] || [self.txt_exp_budj.text isEqualToString:@""] || [self.lbl_displaydate.text isEqualToString:@"mm/dd/yyyy"])
        
    {
        UIAlertView *aert=[[UIAlertView alloc]initWithTitle:@"Maximizer." message:@"Please Enter All The Fields." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [aert show];
    }
    
    else if ([self validateEmailWithString:self.txt_email_ID.text]==false)
    {
        
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Alert" message:[ NSString stringWithFormat:@"Please enter valid email_id"] delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alertView show];
        
        
        
        //23Oct..
        
       [[NSUserDefaults standardUserDefaults] setValue:self.txt_email_ID.text forKey:@"emailid_form"];
       [[NSUserDefaults standardUserDefaults] synchronize];
        
        
    }
    
    
    
    
//    else if ([self validateEmailWithString:self.txt_email_CC.text]==false )
//    {
//        
//        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Alert" message:[ NSString stringWithFormat:@"Please enter valid email_id_cc"] delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
//        [alertView show];
//    }

    
    else if ([self validateMbNoWithString:self.txt_contact_no.text] ==false)
    {
        
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Alert" message:[ NSString stringWithFormat:@"Please enter valid Mb No"] delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alertView show];
    }
    
    
    else
    {
        
        NSString *str=[[NSUserDefaults standardUserDefaults]valueForKey:@"db_path"];
        database = [FMDatabase databaseWithPath:str];
        
        [database open];
        
        
        FMResultSet *results = [database executeQuery:@"SELECT id FROM tbl_userdetails ORDER BY id DESC LIMIT 1"];
        
        while ([results next])
        {
            
            name176 = [results stringForColumn:@"id"];
            NSLog(@"name176:%@",name176);
            
            
            //for trial report id...
            name177 = [results stringForColumn:@"id"];
            NSLog(@"name176:%@",name177);

            
            
        }

        //for Customer_id;-...
       // NSString *string = @"5";
        int valuestr_ew = [name176 intValue]+1;
        
        NSString *strFromIntt = [NSString stringWithFormat:@"%d",valuestr_ew];

        NSString *Cc=@"CI";
        
        NSString * concat =[Cc stringByAppendingString:strFromIntt];
        NSLog(@"concat:%@",concat);
       

        [database executeUpdate:@"insert into tbl_userdetails(Cust_id,Name,LastName,ContactNo,Mail,CCMail,Date,Budget) values(?,?,?,?,?,?,?,?)",concat,self.txt_name.text,self.txt_lastName.text,self.txt_contact_no.text,self.txt_email_ID.text,self.txt_email_CC.text,self.lbl_displaydate.text,self.txt_exp_budj.text,nil];
        
        
        //for cust_id:--
        //1 dec..
        NSString *str_custmr_id=[NSString stringWithFormat:@"%@",concat];
        
        [[NSUserDefaults standardUserDefaults]setValue:str_custmr_id forKey:@"Customer_Id"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        //for Customer_id ends;-...

        
        
        
        
        //for Report_id;-...
        // NSString *string = @"5";
        int valuestr_ew_reportid = [name177 intValue]+1;
        
        NSString *strFromInt_repid = [NSString stringWithFormat:@"%d",valuestr_ew_reportid];
        
        NSString *Rrr=@"RI";
        
        NSString * concat_repid =[Rrr stringByAppendingString:strFromInt_repid];
        NSLog(@"concat_repid:%@",concat_repid);
        
        
        //for report_id:--
        //1 dec..
        NSString *str_reprt_id=[NSString stringWithFormat:@"%@",concat_repid];
        NSLog(@"str_reprt_id:%@",str_reprt_id);

        
        [[NSUserDefaults standardUserDefaults]setValue:str_reprt_id forKey:@"Reporrt_Id"];
        [[NSUserDefaults standardUserDefaults]synchronize];

        
        
        /*
        rep1300 = [results stringForColumn:@"id"];
        
        int valuestr_ew = [rep1300 intValue];
        
        NSString *strFromIntt = [NSString stringWithFormat:@"%d",valuestr_ew];
        
        NSString *Rr=@"R";
        
        NSString * concatt =[Rr stringByAppendingString:strFromIntt];
        NSLog(@"concatt:%@",concatt);
        
        //for rep_id:--
        //1 dec..
        NSString *str_reppid=[NSString stringWithFormat:@"%@",concatt];
        NSLog(@"str_reppid:%@",str_reppid);
        
        [[NSUserDefaults standardUserDefaults]setValue:str_reppid forKey:@"Report_IDD"];
        [[NSUserDefaults standardUserDefaults]synchronize];*/

        
        
        
        
        
        
        

        //fname...
        [[NSUserDefaults standardUserDefaults] setValue:self.txt_name.text forKey:@"customername"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        //lname...
        [[NSUserDefaults standardUserDefaults] setValue:self.txt_lastName.text forKey:@"customerlastname"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        //email..
        [[NSUserDefaults standardUserDefaults] setValue:self.txt_email_ID.text forKey:@"customerEmailiD"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        //phoneno(contact_no)..
        [[NSUserDefaults standardUserDefaults] setValue:self.txt_contact_no.text forKey:@"customerContactNo"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        //Expected Time To Purchase...
        [[NSUserDefaults standardUserDefaults] setValue:self.lbl_displaydate.text forKey:@"DisplayDate"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        //Expected Budget...
        [[NSUserDefaults standardUserDefaults] setValue:self.txt_exp_budj.text forKey:@"ExpectedBudget"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        
        
        

        /*
        [database executeUpdate:@"insert into USERDETAILS(id,Name,ContactNo,Mail,CCMail,Date,Budget) values(?,?,?,?,?,?,?)",[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],self.txt_contact_no.text,nil];
        
        [database executeUpdate:@"insert into USERDETAILS(id,Name,ContactNo,Mail,CCMail,Date,Budget) values(?,?,?,?,?,?,?)",[NSNumber numberWithInt:3],[NSNumber numberWithInt:3],self.txt_email_ID.text,nil];
        
        [database executeUpdate:@"insert into USERDETAILS(id,Name,ContactNo,Mail,CCMail,Date,Budget) values(?,?,?,?,?,?,?)",[NSNumber numberWithInt:4],[NSNumber numberWithInt:4],self.txt_email_CC.text,nil];
        
        [database executeUpdate:@"insert into USERDETAILS(id,Name,ContactNo,Mail,CCMail,Date,Budget) values(?,?,?,?,?,?,?)",[NSNumber numberWithInt:5],[NSNumber numberWithInt:5],self.txt_date.text,nil];
        
        [database executeUpdate:@"insert into USERDETAILS(id,Name,ContactNo,Mail,CCMail,Date,Budget) values(?,?,?,?,?,?,?)",[NSNumber numberWithInt:6],[NSNumber numberWithInt:6],self.txt_exp_budj.text,nil];
         */
                 
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
        
        [database close];

    }
    
    [database close];
    
}

- (IBAction)titlescliked:(id)sender
{
    self.VIEWPICKER.hidden=YES;
    [self dismissKeyboard];
    
    [self.view removeGestureRecognizer:tap];

    NSMutableArray *arr=[[NSMutableArray alloc]init];
    NSArray *cntarr=[[NSArray alloc]initWithObjects:@"Mr.",@"Miss.",@"Mrs.",@"Sir.",@"Dr.",@"Prof.",@"M/s.", nil];
    
    for(int i=0;i<[cntarr count];i++)
    {
        
        NSString *namestr=[cntarr objectAtIndex:i];
       //namestr=[cntarr objectAtIndex:i];
        NSLog(@"namesalutation:%@",namestr);
        [arr addObject:namestr];
    }
    
    if(dropDown == nil)
    {
        CGFloat f;
        f = ([cntarr count]*41);
        dropDown = [[NIDropDown alloc]showDropDown:sender :&f :arr :nil :@"down"];
        dropDown.delegate = self;
    }
    else
    {
        [dropDown hideDropDown:sender];
        [self rel];
    }
    
    
    /*
    NSString *namestrrrz=[NSString stringWithFormat:@"%@",self.selectbtn.currentTitle];
    NSLog(@"titles_salutation:%@",namestrrrz);
    
    [[NSUserDefaults standardUserDefaults] setValue:namestrrrz forKey:@"titles_salutation"];
    [[NSUserDefaults standardUserDefaults]synchronize];*/

    
}


/*
 NSString *str=[[NSUserDefaults standardUserDefaults]valueForKey:@"db_path"];
 database = [FMDatabase databaseWithPath:str];
 
 [database open];
 
 arrayfmdb = [[NSMutableArray alloc]init];
 
 FMResultSet *results = [database executeQuery:@"SELECT * FROM TitlesClicked"];
 
 while ([results next])
 
 {
 
 name = [results stringForColumn:@"TC"];
 [arrayfmdb addObject:name];
 NSLog(@"arr:%@",arrayfmdb);
 }
 
 
 if(dropdown == nil)
 {
 CGFloat f =200;
 dropdown = [[NIDropDown alloc]showDropDown:sender :&f :arrayfmdb :Nil :@"down"];
 dropdown.delegate = (id)self;
 
 }
 else{
 [dropdown hideDropDown:sender];
 [self rel];
 }
 
 [database close];
 */



- (IBAction)homercliked:(id)sender
{
    [self.view removeGestureRecognizer:tap];
     self.scroll_view.userInteractionEnabled=NO;
    backimgview.hidden=NO;
    basetab.hidden=NO;
    self.menubtn.userInteractionEnabled=NO;
    self.sharebtn.userInteractionEnabled=NO;
    // self.dashcollection.userInteractionEnabled=NO;
    
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

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    //[dropDown hideDropDown:textField];
    dropDown.hidden=YES;
    self.VIEWPICKER.hidden=YES;

    self.scroll_view.contentSize=CGSizeMake(0, 500);
    
    if (textField == self.txt_name)
    {
        
        self.view.frame = CGRectMake(0, -50, 320, 568);
    }
    if (textField == self.txt_lastName)
    {
        
        self.view.frame = CGRectMake(0, -50, 320, 568);
    }

    if (textField == self.txt_contact_no)
    {
        self.view.frame = CGRectMake(0, -50, 320, 568);
       
    }
    if (textField == self.txt_email_ID)
    {
        
        self.view.frame = CGRectMake(0, -50, 320, 568);
        
    }
    if (textField == self.txt_email_CC)
    {
        self.view.frame = CGRectMake(0, -50, 320, 620);
        // self.scroll_view.contentSize=CGSizeMake(0, 700);
        
    }
    if (textField == self.txt_date)
    {
        self.view.frame = CGRectMake(0, -50, 320, 620);
        // self.scroll_view.contentSize=CGSizeMake(0, 700);
        
    }
    if (textField == self.txt_exp_budj)
    {
        self.view.frame = CGRectMake(0, -120, 320, 688);
         //self.scroll_view.contentSize=CGSizeMake(0, 700);
        
    }
     self.scroll_view.contentSize=CGSizeMake(0, 700);
   
    
}


/*
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField == self.txt_name)
    {
        self.view.frame = CGRectMake(0, 0, 320, 568);
    }
    if (textField == self.txt_contact_no)
    {
        self.view.frame = CGRectMake(0, 0, 320, 568);
    }
    if (textField == self.txt_email_ID)
    {
        self.view.frame = CGRectMake(0, 0, 320, 568);
    }
    if (textField == self.txt_email_CC)
    {
        self.view.frame = CGRectMake(0, 0, 320, 568);
    }
    if (textField == self.txt_date)
    {
        self.view.frame = CGRectMake(0, 0, 320, 568);
    }
    if (textField == self.txt_exp_budj)
    {
        self.view.frame = CGRectMake(0, 0, 320, 568);
    }
    
}
*/


 -(void)textFieldDidEndEditing:(UITextField *)textField
 {
     
 
 self.view.frame=CGRectMake(0, 0, 320, 568);
 [textField resignFirstResponder];
     
 }



- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    self.view.frame=CGRectMake(0, 0, 320, 568);
    [textField resignFirstResponder];
    return YES;
}



- (BOOL)validateEmailWithString:(NSString*)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}



- (BOOL)validateMbNoWithString:(NSString*)MbNo
{
    NSString *Mbno = @"[0-9]{10}";
    NSPredicate *MbNoTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", Mbno];
    return [MbNoTest evaluateWithObject:MbNo];
}


///for dates....

//1....
- (IBAction)btn_dateclick:(id)sender
{
    dropDown.hidden=YES;
    [self dismissKeyboard];
    self.VIEWPICKER.hidden=NO;
    //    self.date_picker =[[UIDatePicker alloc]initWithFrame:CGRectMake(0, 0,10, 50)];
    //  self.date_picker.datePickerMode=UIDatePickerModeDate;
    self.date_picker.hidden=NO;
    self.date_picker.date=[NSDate date];
    [self.date_picker addTarget:self action:@selector(LabelTitle:) forControlEvents:UIControlEventValueChanged];
    self.date_picker.backgroundColor=[UIColor lightGrayColor];
    [self.VIEWPICKER addSubview:self.date_picker];
    
   // self.VIEWPICKER2.hidden=YES;
    
    
}

-(void)LabelTitle:(id)sender
{
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
    dateFormat.dateStyle=NSDateFormatterMediumStyle;
    [dateFormat setDateFormat:@"MM/dd/yyyy"];
    NSString *str=[NSString stringWithFormat:@"%@",[dateFormat  stringFromDate:self.date_picker.date]];
    self.lbl_displaydate.text=str;
}

- (IBAction)btn_set:(id)sender
{
    self.VIEWPICKER.hidden=YES;
}




@end

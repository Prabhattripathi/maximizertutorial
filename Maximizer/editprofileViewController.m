//
//  editprofileViewController.m
//  Maximizer
//
//  Created by Genie Technology on 10/08/15.
//  Copyright (c) 2015 Genie Soft Systems. All rights reserved.
//

#import "editprofileViewController.h"
#import "BaseTableView.h"
#import "ViewController.h"
#import "dashboardViewController.h"
@interface editprofileViewController ()
{
    UIImageView *backimgview;
    BaseTableView *basetab;
    UITapGestureRecognizer *tap;
    FMDatabase *database;
    
    NSString *current_pass;
    

   
    
    
}

@end

@implementation editprofileViewController

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
    
    
    
    for (int i = 0; i <self.mytextfileds.count; i++)
    {
        UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 0)];
        UITextField *myField = [self.mytextfileds objectAtIndex:i];
        
        paddingView.backgroundColor = [UIColor clearColor];
        myField.leftView = paddingView;
        myField.leftViewMode = UITextFieldViewModeAlways;
    }
    
    
    
    self.scroll.contentSize=CGSizeMake(0, 700);
    
    self.nametxt.layer.borderWidth=0.5;
    self.mailtxt.layer.borderWidth=0.5;
    self.notxt.layer.borderWidth=0.5;
    self.adresstxt.layer.borderWidth=0.5;
    self.citytxt.layer.borderWidth=0.5;
    self.statetxt.layer.borderWidth=0.5;
    self.pincodetxt.layer.borderWidth=0.5;
    self.departmentbtn.layer.borderWidth=0.5;
    self.current_passtxt.layer.borderWidth=0.5;
    self.newpasstxt.layer.borderWidth=0.5;
    self.confirm_passtxt.layer.borderWidth=0.5;
    
    
    self.nametxt.layer.borderColor=[UIColor blackColor].CGColor;
    self.mailtxt.layer.borderColor=[UIColor blackColor].CGColor;
    self.notxt.layer.borderColor=[UIColor blackColor].CGColor;
    self.adresstxt.layer.borderColor=[UIColor blackColor].CGColor;
    self.citytxt.layer.borderColor=[UIColor blackColor].CGColor;
    self.statetxt.layer.borderColor=[UIColor blackColor].CGColor;
    self.pincodetxt.layer.borderColor=[UIColor blackColor].CGColor;
    self.departmentbtn.layer.borderColor=[UIColor blackColor].CGColor;
    self.current_passtxt.layer.borderColor=[UIColor blackColor].CGColor;
    self.newpasstxt.layer.borderColor=[UIColor blackColor].CGColor;
    self.confirm_passtxt.layer.borderColor=[UIColor blackColor].CGColor;
    
    
    self.nametxt.layer.cornerRadius=5;
    self.mailtxt.layer.cornerRadius=5;
    self.notxt.layer.cornerRadius=5;
    self.adresstxt.layer.cornerRadius=5;
    self.citytxt.layer.cornerRadius=5;
    self.statetxt.layer.cornerRadius=5;
    self.pincodetxt.layer.cornerRadius=5;
    self.departmentbtn.layer.cornerRadius=5;
    self.current_passtxt.layer.cornerRadius=5;
    self.newpasstxt.layer.cornerRadius=5;
    self.confirm_passtxt.layer.cornerRadius=5;
    
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
    
    
    NSString *str=[[NSUserDefaults standardUserDefaults]valueForKey:@"db_path"];
    NSString *uid=[[NSUserDefaults standardUserDefaults]valueForKey:@"userid"];
    
    //5nov..
    NSString *uname=[[NSUserDefaults standardUserDefaults]valueForKey:@"username"];

    
    NSString *logint_status;
    
    NSString *mail;
    NSString *name;
    NSString *phno;
    NSString *address;
    NSString *city;
    NSString *state;
    NSString *pincdoe;
    NSString *department;
    NSString *passwprd;
    
    
    //30 sept..
     NSString *Fname;
     NSString *Lname;
     NSString *Zone;
     NSString *Suspended;
     NSString *Zonehead;
    

    database = [FMDatabase databaseWithPath:str];
    
    [database open];
    
    FMResultSet *results = [database executeQuery:@"select * from tbl_user WHERE userid = ?",[NSString stringWithFormat:@"%@",uid]];
    //NSLog(@"reslut:%@",[results next]);
    NSLog(@"results:%@",results);

    
    /*
     [database executeUpdate:@"create table tbl_user(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, userid int, Fname varchar, Lname varchar ,username varchar, password varchar,  emailid varchar, contactno varchar, address varchar, city varchar, state varchar, pincode varchar, department varchar, checkname varchar, created_on varchar, modified_on varchar, status varchar, type varchar, dealerID varchar, login_status varchar, Zone varchar, Suspended varchar, Zonehead varchar)"];

     */
    
    while([results next])
    {
        name=[results stringForColumn:@"Fname"];
        NSLog(@"name:%@",name);
        
        mail=[results stringForColumn:@"emailid"];
        logint_status=[results stringForColumn:@"login_status"];
        phno=[results stringForColumn:@"contactno"];
        address=[results stringForColumn:@"address"];
        city=[results stringForColumn:@"city"];
        state=[results stringForColumn:@"state"];
        pincdoe=[results stringForColumn:@"pincode"];
        department=[results stringForColumn:@"department"];
        passwprd=[results stringForColumn:@"password"];
        
        //insert Fname,Lname,Zone,Suspended,Zonehead like above....
        
    }
    
    [database close];

    
    if([logint_status isEqualToString:@"0"])
    {
        self.nametxt.text=name;
        self.mailtxt.text=mail;
        //self.current_passtxt.text=passwprd;

        
        NSString *status=@"1";
        
        database = [FMDatabase databaseWithPath:str];
        
        [database open];
        
        BOOL success = [database executeUpdate:@"UPDATE tbl_user SET login_status = ? WHERE userid = ?",status,uid];
        
        if(success)
        {
            NSLog(@"update success");
        }
        
        [database close];
        
        
    }
    else
    {
        self.nametxt.text=name;
        self.mailtxt.text=mail;
        self.notxt.text=phno;
        self.adresstxt.text=address;
        self.citytxt.text=city;
        self.statetxt.text=state;
        self.pincodetxt.text=pincdoe;
        if(department.length!=0)
        [self.departmentbtn setTitle:department forState:UIControlStateNormal];
        //self.current_passtxt.text=passwprd;
        
    }
    
    current_pass=passwprd;
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
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
    self.scroll.contentSize=CGSizeMake(0, 700);
    
}

#pragma mark -
#pragma mark -Gesture method

-(void)viewWillAppear:(BOOL)animated
{
    
    // [tap rem]
    tap = [[UITapGestureRecognizer alloc]
           initWithTarget:self
           action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
    self.scroll.userInteractionEnabled=YES;
    
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
    tap = [[UITapGestureRecognizer alloc]
           initWithTarget:self
           action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
    self.scroll.userInteractionEnabled=YES;
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
    
    [self.view removeGestureRecognizer:tap];
    self.scroll.userInteractionEnabled=NO;
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



-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    tap = [[UITapGestureRecognizer alloc]
           initWithTarget:self
           action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
    self.scroll.userInteractionEnabled=YES;
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

    [self.view endEditing:YES];
    
    
    
}


- (BOOL)validateMbNoWithString:(NSString*)MbNo
{
    NSString *Mbno = @"[0-9]{10}";
    NSPredicate *MbNoTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", Mbno];
    return [MbNoTest evaluateWithObject:MbNo];
}

- (BOOL)validateEmailWithString:(NSString*)mail
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:mail];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    
    if([title isEqualToString:@"OK"])
    {
        UIStoryboard *storyboard ;
        storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        ViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
        [self.navigationController pushViewController:vw animated:YES];
    }
    if([title isEqualToString:@"ok"])
    {
        UIStoryboard *storyboard ;
        storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        dashboardViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"dashboardViewController"];
        [self.navigationController pushViewController:vw animated:YES];
    }
}


#pragma mark -
#pragma mark - TextField Delegate Method


-(void)textFieldDidBeginEditing:(UITextField *)textField
{
   
    self.scroll.contentSize=CGSizeMake(0, 700);
    
    if (textField == self.nametxt)
    {
        self.view.frame = CGRectMake(0, -50, 320, 568);
        
    }
    if (textField == self.mailtxt)
    {
        self.view.frame = CGRectMake(0, -50, 320, 568);
        self.mailtxt.keyboardType=UIKeyboardTypeEmailAddress;
        
    }
    if (textField == self.notxt)
    {
        self.view.frame = CGRectMake(0, -50, 320, 568);
        self.notxt.keyboardType=UIKeyboardTypeNumberPad;
    }
    if (textField == self.adresstxt)
    {
        self.view.frame = CGRectMake(0, -50, 320, 568);
        
    }
    if (textField == self.citytxt)
    {
        self.view.frame = CGRectMake(0, -50, 320, 568);
        
    }
    if (textField == self.statetxt)
    {
        self.view.frame = CGRectMake(0, -50, 320, 568);
        
    }
    if (textField == self.pincodetxt)
    {
        self.view.frame = CGRectMake(0, -50, 320, 568);
        self.pincodetxt.keyboardType=UIKeyboardTypeNumberPad;
    }
    
    if (textField == self.current_passtxt)
    {
        self.view.frame = CGRectMake(0, -50, 320, 568);
        
    }
    if (textField == self.newpasstxt)
    {
        self.view.frame = CGRectMake(0, -100, 320, 568);
        
    }
    if (textField == self.confirm_passtxt)
    {
        self.view.frame = CGRectMake(0, -150, 320, 568);
        
    }
    
    self.scroll.contentSize=CGSizeMake(0, 800);
    
}



-(void)textFieldDidEndEditing:(UITextField *)textField
{
    self.view.frame=CGRectMake(0, 0, 320, 568);
    [textField resignFirstResponder];
    
}

 
 

-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    self.view.frame=CGRectMake(0, 0, 320, 568);
    [textField resignFirstResponder];
    
    return YES;
}

#pragma mark -
#pragma mark - dropdown Method


- (void) niDropDownDelegateMethod: (NIDropDown *) sender
{
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
#pragma mark - Button Method



- (IBAction)sharecliekd:(id)sender
{
    
}
- (IBAction)menucliked:(id)sender
{
    [self.view removeGestureRecognizer:tap];
    self.scroll.userInteractionEnabled=NO;
    
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




- (IBAction)submitcliked:(id)sender
{
    NSString *department=[self.departmentbtn titleForState:UIControlStateNormal];
    

    
    if(self.newpasstxt.text.length==0)
    {
        if(self.nametxt.text.length==0 || self.mailtxt.text.length==0 || self.notxt.text.length==0 || self.adresstxt.text.length==0 || self.citytxt.text.length==0 || self.statetxt.text.length==0 || self.pincodetxt.text.length==0 || department.length==0)
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Maximizer" message:@"Please Enter all necessary details" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
            [alert show];
            
        }
        else if([self validateEmailWithString:self.mailtxt.text]==false)
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Maximizer" message:@"Please Enter valid email" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
            [alert show];
        }
        else if([self validateMbNoWithString:self.notxt.text]==false)
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Maximizer" message:@"Please Enter valid Mobile number" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
            [alert show];
        }
        else
        {
            NSString *str=[[NSUserDefaults standardUserDefaults]valueForKey:@"db_path"];
            NSString *uid=[[NSUserDefaults standardUserDefaults]valueForKey:@"userid"];
            
            
            database = [FMDatabase databaseWithPath:str];
            
            [database open];
            
            BOOL success = [database executeUpdate:@"UPDATE tbl_user SET Fname = ?, emailid = ?, contactno = ?, address = ?, city = ?, state = ?, pincode = ?, department = ? WHERE userid = ?",self.nametxt.text,self.mailtxt.text,self.notxt.text,self.adresstxt.text,self.citytxt.text,self.statetxt.text,self.pincodetxt.text,department,uid];
            
            if(success)
            {
                NSLog(@"update success");
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Maximizer" message:@"Profile is updataed successfully." delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
                [alert show];
            }
            
            [database close];
        }

    }
    else
    {
        if(self.nametxt.text.length==0 || self.mailtxt.text.length==0 || self.notxt.text.length==0 || self.adresstxt.text.length==0 || self.citytxt.text.length==0 || self.statetxt.text.length==0 || self.pincodetxt.text.length==0 || department.length==0)
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Maximizer" message:@"Please Enter all necessary details" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
            [alert show];

        }
        else if([self validateEmailWithString:self.mailtxt.text]==false)
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Maximizer" message:@"Please Enter valid email" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
            [alert show];
        }
        else if([self validateMbNoWithString:self.notxt.text]==false)
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Maximizer" message:@"Please Enter valid Mobile number" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
            [alert show];
        }
        else if([self.current_passtxt.text isEqualToString:current_pass])
        {
            if(self.newpasstxt.text.length==0)
            {
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Maximizer" message:@"Please Enter new password" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
                [alert show];
            }
            else if(self.confirm_passtxt.text.length==0)
            {
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Maximizer" message:@"Please Enter confirm password" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
                [alert show];
            }
            else if(![self.confirm_passtxt.text isEqualToString:self.newpasstxt.text])
            {
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Maximizer" message:@"Confirm and new passwrod must be same" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
                [alert show];
            }
            else
            {
                NSString *str=[[NSUserDefaults standardUserDefaults]valueForKey:@"db_path"];
                NSString *uid=[[NSUserDefaults standardUserDefaults]valueForKey:@"userid"];
                
                
                database = [FMDatabase databaseWithPath:str];
                
                [database open];
                
                BOOL success = [database executeUpdate:@"UPDATE tbl_user SET Fname = ?, emailid = ?, contactno = ?, address = ?, city = ?, state = ?, pincode = ?, department = ?, password = ? WHERE userid = ?",self.nametxt.text,self.mailtxt.text,self.notxt.text,self.adresstxt.text,self.citytxt.text,self.statetxt.text,self.pincodetxt.text,department,self.newpasstxt.text,uid];
                
                if(success)
                {
                    NSLog(@"update success");
                    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Maximizer" message:@"Profile is updataed successfully." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    [alert show];
                }
                
                [database close];
            }
        }
        else
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Maximizer" message:@"Please Enter current password correctly first" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
            [alert show];
        }
    }
    
}

- (IBAction)departmentcliked:(id)sender
{
    
    [self.view removeGestureRecognizer:tap];
    
    NSMutableArray *arr=[[NSMutableArray alloc]init];
    
    NSArray *brandnamearr=[[NSArray alloc]initWithObjects:@"Sales",@"Service",nil];
    

    for(int i=0;i<[brandnamearr count];i++)
    {
        
        NSString *namestr1=[brandnamearr objectAtIndex:i];
        [arr addObject:namestr1];
    }
    
    if(dropDown == nil)
    {
        CGFloat f;
        f = 80;
        dropDown = [[NIDropDown alloc]showDropDown:sender :&f :arr :nil :@"down"];
        dropDown.delegate = self;
    }
    else
    {
        [dropDown hideDropDown:sender];
        [self rel];
    }

}



@end

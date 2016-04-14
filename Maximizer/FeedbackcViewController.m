//
//  FeedbackcViewController.m
//  Maximizer
//
//  Created by Genie Technology on 10/08/15.
//  Copyright (c) 2015 Genie Soft Systems. All rights reserved.
//

#import "FeedbackcViewController.h"
#import "BaseTableView.h"
#import "dashboardViewController.h"

@interface FeedbackcViewController ()
{
    UIImageView *backimgview;
    BaseTableView *basetab;
    
    FMDatabase *database;

}

@end

@implementation FeedbackcViewController

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
    
    self.textview.layer.borderWidth=0.5;
    self.textview.layer.borderColor=[UIColor blackColor].CGColor;
    
    
    self.view1.layer.cornerRadius=5;
    self.view1.layer.borderWidth=0.5;
    self.view1.layer.borderColor=[UIColor blackColor].CGColor;
    
    self.submit.layer.cornerRadius=5;
    

    
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

    
    
    
}

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
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    
    if([title isEqualToString:@"Ok"])
    {
        UIStoryboard *storyboard ;
        storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        dashboardViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"dashboardViewController"];
        [self.navigationController pushViewController:vw animated:YES];
    }
    
}



#pragma mark -
#pragma mark - Textview Delegate Method

/// i m using this because you want more text with nwxt line


- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if ([self.textview.text isEqualToString:@"Please enter your text..."])
    {
        self.textview.text = @"";
        self.textview.textColor = [UIColor blackColor];
        //scroll.contentOffset=CGPointMake(0, enquirytext.frame.origin.y);
        //optional
    }
    [self.textview becomeFirstResponder];
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    if ([self.textview.text isEqualToString:@""])
    {
        self.textview.text = @"Please enter your text...";
        self.textview.textColor = [UIColor lightGrayColor]; //optional
        [self.textview resignFirstResponder];
    }
    [self.textview resignFirstResponder];
}

#pragma mark -
#pragma mark - Textview Delegate Method


- (IBAction)submitcliked:(id)sender
{
    
    NSString *str=[[NSUserDefaults standardUserDefaults]valueForKey:@"db_path"];
    
    NSLog(@"str:%@",str);
    
    
    
    if([self.textview.text isEqualToString:@""] || [self.textview.text isEqualToString:@"Please enter your text..."])
    {
        UIAlertView *aert=[[UIAlertView alloc]initWithTitle:@"Maximizer." message:@"Please Enter your feedback." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [aert show];
    }
    else
    {
        database = [FMDatabase databaseWithPath:str];
        
        [database open];
       

        BOOL success = [database executeUpdate:@"insert into tbl_feedback(userid,Feedback) values(?,?)",[NSNumber numberWithInt:1],self.textview.text,nil];
        
        if(success)
        {
            NSLog(@"update success");
            UIAlertView *messageBox = [[UIAlertView alloc]initWithTitle:@"Maximizer" message:@"Your Details have been sucessfully sent." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
             [messageBox show];
            
            
        }
        
       [database close];
        
        
    }
    
   

    
}

- (IBAction)homercliked:(id)sender
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
@end

//
//  statusreportViewController.m
//  Maximizer
//
//  Created by Genie Technology on 10/08/15.
//  Copyright (c) 2015 Genie Soft Systems. All rights reserved.
//

#import "statusreportViewController.h"
#import "detialstatusViewController.h"
#import "BaseTableView.h"


@interface statusreportViewController ()
{
    UIImageView *backimgview;
    BaseTableView *basetab;
}

@end

@implementation statusreportViewController

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
    
    
    
    
    //show n start webview over here..
    
    //http://mobilestyx.org/jlrDemo/Jrl_StatusReportUser.aspx
    
    
    //new link..
  //  http://maximizer.mdei.info/jlrmaximizer_p2/mobile/mobile_reports
    
    
    
  //  NSURL *URL=[NSURL URLWithString:@"http://mobilestyx.org/jlrDemo/Jrl_StatusReportUser.aspx"];
    
    NSURL *URL=[NSURL URLWithString:@"http://maximizer.mdei.info/jlrmaximizer_p2/mobile/mobile_reports"];
    NSURLRequest *request =[NSURLRequest requestWithURL:URL];
    [self.web_view loadRequest:request];
    
    
    
    //http://maximizer.mdei.info/jlrmaximizer_p2/mobile/mobile_reports?uid=" + User_Id + "&pin_no="
	//			+ pinId
    
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



- (IBAction)btn_TradingExchange:(id)sender
{
    detialstatusViewController *hvc=[self.storyboard instantiateViewControllerWithIdentifier:@"detialstatusViewController"];
    [self.navigationController pushViewController:hvc animated:YES];
    
}

- (IBAction)btn_PreownedVehicle:(id)sender
{
    detialstatusViewController *hvc=[self.storyboard instantiateViewControllerWithIdentifier:@"detialstatusViewController"];
    [self.navigationController pushViewController:hvc animated:YES];
    
}

- (IBAction)btn_NewVehicle:(id)sender
{
    detialstatusViewController *hvc=[self.storyboard instantiateViewControllerWithIdentifier:@"detialstatusViewController"];
    [self.navigationController pushViewController:hvc animated:YES];
    
}


- (IBAction)sharecliked:(id)sender
{
    
}

- (IBAction)menucliked:(id)sender
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


- (IBAction)btn_backkk:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];

}



@end

//
//  FinanceOfferDetailed2ViewController.m
//  Maximizer
//
//  Created by Mobilestyx on 02/11/15.
//  Copyright (c) 2015 Genie Soft Systems. All rights reserved.
//

#import "FinanceOfferDetailed2ViewController.h"
#import <MessageUI/MessageUI.h>
#import "APLPrintPageRenderer.h"
#import "BaseTableView.h"
#import "AppDelegate.h"
#import <QuartzCore/QuartzCore.h>
#import "ScrollViewToPDF.h"
#import "FinanceOfferDetailedViewController.h"


@interface FinanceOfferDetailed2ViewController ()

{
    UIImageView *backimgview;
    BaseTableView *basetab;
    AppDelegate *app;
}

@end

@implementation FinanceOfferDetailed2ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    app=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    
    //    self.tabview.layer.borderWidth=0.5;
    //    self.tabview.layer.borderColor=[UIColor blackColor].CGColor;
    //
    //    self.backbtn.layer.cornerRadius=5;
    //    self.submitbtn.layer.cornerRadius=5;
    
    
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
    
    self.scroll_view.contentSize=CGSizeMake(0, 4600);
    
    
    //......
    NSString *Custnamestr=[[NSUserDefaults standardUserDefaults] objectForKey:@"customername"];
    self.lbl_custFirstName.text=[NSString stringWithFormat:@"%@",Custnamestr];
    
    NSString *Custlastnamestr=[[NSUserDefaults standardUserDefaults] objectForKey:@"customerlastname"];
    self.lbl_CustLastName.text=[NSString stringWithFormat:@"%@",Custlastnamestr];
    
    
    ////hidden labels...
    
    //for newcarvehiclemake...
    
      NSString *newcarvehiclemake=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_manufacturer"];
    self.lbl_vehicleManufacturer.text=[NSString stringWithFormat:@"%@",newcarvehiclemake];
    self.lbl_carName.text=[NSString stringWithFormat:@"%@",newcarvehiclemake];
    
    
    
    //for newcarvehiclemodel...
    NSString *newcarvehiclemodel=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_model"];
    self.lbl_vehicleModel.text=[NSString stringWithFormat:@"%@",newcarvehiclemodel];
    
    
    //for newcarvehicletype...
    NSString *newcarvehicletype=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_type"];
    self.lbl_vehicleSubModel.text=[NSString stringWithFormat:@"%@",newcarvehicletype];
    
    
    
    //for yr ..
    NSString *yrstr=[[NSUserDefaults standardUserDefaults] objectForKey:@"year_val"];
    self.lbl_Year.text=[NSString stringWithFormat:@"%@",yrstr];
    
    //for month..
    NSString *mnthstrr=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_monthh"];
    self.lbl_Month.text=[NSString stringWithFormat:@"%@",mnthstrr];

    
    //for color..
    NSString *clr_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_color"];
    self.lbl_color.text=[NSString stringWithFormat:@"%@",clr_str];

    
    //for insuarnce...
   NSString *insurnace_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_insurance"];
    self.lbl_Insurance.text=[NSString stringWithFormat:@"%@",insurnace_str];
    
    
    //for kmss..
  NSString *kmsss_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_kmss"];
    self.lbl_KMSS.text=[NSString stringWithFormat:@"%@",kmsss_str];

    
    //for on road-value..
    NSString *onroadvalue_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"road_val"];
    self.lbl_onroadvalue.text=[NSString stringWithFormat:@"%@",onroadvalue_str];

    
    //for offer price by maximizer..
   NSString *offerpricebyMax_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"Final_price_value"];
    self.lbl_offerprice.text=[NSString stringWithFormat:@"%@",offerpricebyMax_str];

    
    //for refurbishment value..
    NSString *refurbishment_value_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"refurbishment_result"];
    self.lbl_refurbishment.text=[NSString stringWithFormat:@"%@",refurbishment_value_str];
    
    
    //for cbuckd..
    NSString *cbuckdd_strz=[[NSUserDefaults standardUserDefaults] objectForKey:@"cbuckd_str_resullt"];
    self.lbl_cbutockd.text=[NSString stringWithFormat:@"%@",cbuckdd_strz];
    
    
    
    //for accidental..
  NSString *accidental_strz=[[NSUserDefaults standardUserDefaults] objectForKey:@"accidentallstrresullt"];
    self.lbl_accidental.text=[NSString stringWithFormat:@"%@",accidental_strz];
    
    
    //..for fuel..p or d..
   NSString *fuell_strz=[[NSUserDefaults standardUserDefaults] objectForKey:@"fuelcliked_str_resullt"];
    self.lbl_fuel.text=[NSString stringWithFormat:@"%@",fuell_strz];
           

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btn_Print:(id)sender
{
    //** conversion of scroll_view to pdf...
    
    NSData *pdfData = [ScrollViewToPDF pdfDataOfScrollView:self.scroll_view];
    NSString *tmpDirectory = NSTemporaryDirectory();
    NSString *path = [tmpDirectory stringByAppendingPathComponent:@"image.pdf"];
    [pdfData writeToFile:path atomically:NO];
    if (path)
    {
        [self tryPrintPdf:path];
    }

}

- (void) tryPrintPdf:(NSString*)path
{
    
    
    NSData *myData = [NSData dataWithContentsOfFile:path];
    
    UIPrintInteractionController *pic = [UIPrintInteractionController sharedPrintController];
    
    if ( pic && [UIPrintInteractionController canPrintData: myData] ) {
        pic.delegate = self;
        
        UIPrintInfo *printInfo = [UIPrintInfo printInfo];
        printInfo.outputType = UIPrintInfoOutputGeneral;
        printInfo.jobName = [path lastPathComponent];
        printInfo.duplex = UIPrintInfoDuplexLongEdge;
        pic.printInfo = printInfo;
        pic.showsPageRange = YES;
        pic.printingItem = myData;
        
        void (^completionHandler)(UIPrintInteractionController *, BOOL, NSError *) = ^(UIPrintInteractionController *pic, BOOL completed, NSError *error)
        {
            if (!completed && error)
            {
                NSLog(@"FAILED! due to error in domain %@ with error code %u", error.domain, error.code);
            }
        };
        
        [pic presentAnimated:YES completionHandler:completionHandler];
    }
}




- (IBAction)btn_sendEmail:(id)sender
{

    

}



-(void)swipeleft:(UISwipeGestureRecognizer*)gestureRecognizer
{
    self.btn_menu_outlet.userInteractionEnabled=YES;
    self.btn_share_outlet.userInteractionEnabled=YES;
    
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
    self.btn_menu_outlet.userInteractionEnabled=NO;
    self.btn_share_outlet.userInteractionEnabled=NO;
    
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
    self.btn_menu_outlet.userInteractionEnabled=YES;
    self.btn_share_outlet.userInteractionEnabled=YES;
    
    backimgview.hidden=YES;
    [self.view endEditing:YES];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.50];
    [UIView setAnimationBeginsFromCurrentState:YES];
    basetab.frame = CGRectMake(-320, 68, 280, self.view.frame.size.height-50);
    [UIView commitAnimations];
    
    //  [self.txt_BTIALF resignFirstResponder];
}



- (IBAction)btn_menu:(id)sender
{
    backimgview.hidden=NO;
    basetab.hidden=NO;
    self.btn_menu_outlet.userInteractionEnabled=NO;
    self.btn_share_outlet.userInteractionEnabled=NO;
    
    [self.view endEditing:YES];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.50];
    [UIView setAnimationBeginsFromCurrentState:YES];
    basetab.frame = CGRectMake(0, 68, 280, self.view.frame.size.height-50);
    [UIView commitAnimations];
    
}




- (NSInteger)numberOfPages
{
    return 5;
}


- (IBAction)btn_share:(id)sender
{
    
}

@end

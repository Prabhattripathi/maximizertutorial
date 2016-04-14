//
//  FinanceOfferDetailedViewController.m
//  Maximizer
//
//  Created by Mobilestyx on 20/10/15.
//  Copyright (c) 2015 Genie Soft Systems. All rights reserved.
//

#import "FinanceOfferDetailedViewController.h"
#import <MessageUI/MessageUI.h>
#import "APLPrintPageRenderer.h"
#import "BaseTableView.h"
#import "AppDelegate.h"
#import <QuartzCore/QuartzCore.h>
#import "ScrollViewToPDF.h"


@interface FinanceOfferDetailedViewController ()

{
    UIImageView *backimgview;
    BaseTableView *basetab;
    AppDelegate *app;
    
    NSMutableArray *totoutflow_array;
    NSMutableArray *downpayment_array;
    
    
    NSString *rateIntrst3yrs,*rateIntrst4yrs,*rateIntrst5yrs,*rateIntrst7yrs;


}



@end

@implementation FinanceOfferDetailedViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
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
    
    
    self.scroll_view.contentSize=CGSizeMake(0, 5450);
    
    
    ////customer name.........
    
    NSString *Custnamestr=[[NSUserDefaults standardUserDefaults] objectForKey:@"customername"];
    self.lbl_custname.text=[NSString stringWithFormat:@"%@",Custnamestr];
    
    NSString *Custlastnamestr=[[NSUserDefaults standardUserDefaults] objectForKey:@"customerlastname"];
    self.lbl_custlastname.text=[NSString stringWithFormat:@"%@",Custlastnamestr];

    
    ////hidden labels...
    
    //for newcarvehiclemake...
    NSString *newcarvehiclemake=[[NSUserDefaults standardUserDefaults] objectForKey:@"newcarvehiclemake"];
    self.lbl_vehiclemake.text=[NSString stringWithFormat:@"%@",newcarvehiclemake];
    self.lbl_SelectingCarname.text=[NSString stringWithFormat:@"%@",newcarvehiclemake];

    
    
    //for newcarvehiclemodel...
    NSString *newcarvehiclemodel=[[NSUserDefaults standardUserDefaults] objectForKey:@"newcarvehiclemodel"];
    self.lbl_vehiclemodel.text=[NSString stringWithFormat:@"%@",newcarvehiclemodel];


    //for newcarvehicletype...
    NSString *newcarvehicletype=[[NSUserDefaults standardUserDefaults] objectForKey:@"newcarvehicletype"];
    self.lbl_vehiclesubmodel.text=[NSString stringWithFormat:@"%@",newcarvehicletype];

    
    
    //for exshowroom price and totalonroad value..
    NSString *exShowroomprice=[[NSUserDefaults standardUserDefaults] objectForKey:@"TotOnRoadValue"];
    self.lbl_exshowroomprize.text=[NSString stringWithFormat:@"%@",exShowroomprice];
    
    
    
    NSString *totalonroadvalue=[[NSUserDefaults standardUserDefaults] objectForKey:@"TotOnRoadValue"];
    
    self.lbl_totalonrdvalue.text=[NSString stringWithFormat:@"%@",totalonroadvalue];
    self.lbl_onrdvalueS1.text=[NSString stringWithFormat:@"%@",totalonroadvalue];
    self.lbl_onrdvalueS2.text=[NSString stringWithFormat:@"%@",totalonroadvalue];
    self.lbl_onrdvalueS3.text=[NSString stringWithFormat:@"%@",totalonroadvalue];
    self.lbl_onrdvalueS4.text=[NSString stringWithFormat:@"%@",totalonroadvalue];

    
    
    //for downpayment...
    NSString *dwnpayment=[[NSUserDefaults standardUserDefaults] objectForKey:@"dwnpayment"];
    
    self.lbl_downpaymentS1.text=[NSString stringWithFormat:@"%@",dwnpayment];
    self.lbl_downpaymentS2.text=[NSString stringWithFormat:@"%@",dwnpayment];
    self.lbl_downpaymentS3.text=[NSString stringWithFormat:@"%@",dwnpayment];
    self.lbl_downpaymentS4.text=[NSString stringWithFormat:@"%@",dwnpayment];


    
    //for loan amount..
    NSString *SuggestedLoanAmnt=[[NSUserDefaults standardUserDefaults] objectForKey:@"SuggestedLoanAmnt"];
    
    self.lbl_loanvalueS1.text=[NSString stringWithFormat:@"%@",SuggestedLoanAmnt];
    self.lbl_loanvalueS2.text=[NSString stringWithFormat:@"%@",SuggestedLoanAmnt];
    self.lbl_loanvalueS3.text=[NSString stringWithFormat:@"%@",SuggestedLoanAmnt];
    self.lbl_loanvalueS4.text=[NSString stringWithFormat:@"%@",SuggestedLoanAmnt];

    
    
    //for EMI :-  3,4,5,7 yrs...
    
    NSString *EMIRESULT3yrs=[[NSUserDefaults standardUserDefaults] objectForKey:@"EMIRESULT3yrs"];
    self.lbl_EMIvalueS1.text=[NSString stringWithFormat:@"%@",EMIRESULT3yrs];

    NSString *EMIRESULT4yrs=[[NSUserDefaults standardUserDefaults] objectForKey:@"EMIRESULT4yrs"];
    self.lbl_EMIvalueS2.text=[NSString stringWithFormat:@"%@",EMIRESULT4yrs];

    NSString *EMIRESULT5yrs=[[NSUserDefaults standardUserDefaults] objectForKey:@"EMIRESULT5yrs"];
    self.lbl_EMIvalueS3.text=[NSString stringWithFormat:@"%@",EMIRESULT5yrs];
    
    NSString *EMIRESULT7yrs=[[NSUserDefaults standardUserDefaults] objectForKey:@"EMIRESULT7yrs"];
    self.lbl_EMIvalueS4.text=[NSString stringWithFormat:@"%@",EMIRESULT7yrs];

    
    
    
    //26 OCT...for txtfields...
    
    //26Oct...
    
    NSString *insuranceresult=[[NSUserDefaults standardUserDefaults] objectForKey:@"insuranceresult"];
    self.lbl_insurance.text=[NSString stringWithFormat:@"%@",insuranceresult];
    
    NSString *logisticresult=[[NSUserDefaults standardUserDefaults] objectForKey:@"logisticresult"];
    self.lbl_logisticscharge.text=[NSString stringWithFormat:@"%@",logisticresult];
    
    NSString *registrationservicecharges_result=[[NSUserDefaults standardUserDefaults] objectForKey:@"registrationservicecharges_result"];
    self.lbl_regchargesincludingroadtax.text=[NSString stringWithFormat:@"%@",registrationservicecharges_result];

    NSString *serviceplan_result=[[NSUserDefaults standardUserDefaults] objectForKey:@"serviceplan_result"];
    self.lbl_serviceplan.text=[NSString stringWithFormat:@"%@",serviceplan_result];

    NSString *extendedwarranty_result=[[NSUserDefaults standardUserDefaults] objectForKey:@"extendedwarranty_result"];
    self.lbl_extwarranty.text=[NSString stringWithFormat:@"%@",extendedwarranty_result];
    
    NSString *accessories_result=[[NSUserDefaults standardUserDefaults] objectForKey:@"accessories_result"];
    self.lbl_accesories.text=[NSString stringWithFormat:@"%@",accessories_result];
    
    
    // CREATE DB TABLE FOR TRADE-IN & NEW-VEHICLE OVER HERE IN VIEWDIDLOAD....ON THE SUBMIT CLICK OF FINANCE OFFER....
    
    //
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//method to print......
/*
 //select path for saving the pdf
 
 NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
 NSLog(@"paths%@",paths);
 
 NSString *documentsDirectory = [paths objectAtIndex:0]; // Get documents folder
 NSLog(@"documentsDirectory%@",documentsDirectory);
 
 
 NSString *dataPath = [documentsDirectory stringByAppendingPathComponent:@"MyFolder"];
 
 dataPath = [dataPath stringByAppendingPathComponent:@"Mypdf.pdf"];
 NSLog(@"dataPath%@",dataPath);
 
 
 NSString *pdfFileName = dataPath;
 NSLog(@"pdfFileName%@",pdfFileName);
 
 
 
 //define a cgrect for drawing the pdf content
 
 CGRect PDFRect = CGRectMake(0, 0, 832, 612);
 CGRect mainPDFRect = CGRectMake(0, 0, 832, 612);
 
 //starting pdf context
 
 UIGraphicsBeginPDFContextToFile(pdfFileName, CGRectZero, nil);
 
 
 //starting a new page
 
 UIGraphicsBeginPDFPageWithInfo(mainPDFRect, nil);//you have to write this line of code whenever you want to start a new page
 
 //here you have to draw any thing that you want to write to the pdf
 
 [@"Its a text drawn to the pdf" drawInRect:CGRectMake(PDFRect.origin.x+20, PDFRect.origin.y+20, 150, 80) withFont:[UIFont systemFontOfSize:22]];
 
 
 
 //end the pdf context
 
 UIGraphicsEndPDFContext();
 
 
 //for taking screenshot...
 UIGraphicsBeginImageContext(self.view.bounds.size);
 [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
 UIImage *imageView = UIGraphicsGetImageFromCurrentImageContext();
 UIGraphicsEndImageContext();
 UIImageWriteToSavedPhotosAlbum(imageView, nil, nil, nil); //if you need to save
 //return imageView;
 */

//.....



- (IBAction)btn_PDF:(id)sender
{
    /*
    //hit..
    
    NSString *uid=@"DLR1339";
    NSString *custid=@"439";
    NSString *report_id=@"R57399091";
    
    NSString *urlString=[NSString stringWithFormat:@"http://maximizer.mdei.info/jlrmaximizer_p2/api/api/dummy_check?data={\"uid\":\"%@\",\"custid\":\"%@\",\"report_id\":\"%@\"}",uid,custid,report_id];
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
    
    */
    
    
    
    
    
    
    /*
    //lat...

    
    NSString *dum_uid=[NSString stringWithFormat:@"%@",@"Genie_dummy"];
    NSString *dum_custid=[NSString stringWithFormat:@"%@",@"C1923"];
    NSString *dum_reportid=[NSString stringWithFormat:@"%@",@"R71300"];

      //parsing begins...
    NSMutableDictionary *mydict=[[NSMutableDictionary alloc]init];
    
    [mydict setObject:dum_uid forKey:@"uid"];
    [mydict setObject:dum_reportid forKey:@"report_id"];
    [mydict setObject:dum_custid forKey:@"custid"];
    
    
       NSString *str=@"http://maximizer.mdei.info/jlrmaximizer_p2/api/api/dummy_check?";
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
     NSLog(@"body:%@",body);
    NSData *paramsJSONDictionaryData = [NSJSONSerialization dataWithJSONObject:mydict options:NSJSONWritingPrettyPrinted error:&error];
     NSLog(@"paramsJSONDictionaryData:%@",paramsJSONDictionaryData);
    NSString *jsonParamsString = [[NSString alloc] initWithData:paramsJSONDictionaryData encoding:NSUTF8StringEncoding];
    
    NSLog(@"jsonParamsString :%@",jsonParamsString );
    
    [body appendData:[[NSString stringWithFormat:@"%@\r\n",jsonParamsString] dataUsingEncoding:NSUTF8StringEncoding]];
    [request setHTTPBody:body];
    NSHTTPURLResponse *response = [[NSHTTPURLResponse alloc] init];
    NSLog(@"response:%@",response);
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    // NSLog(@"respopsedata:%@",responseData);
    NSDictionary *jsonResponseDictionary = [NSJSONSerialization JSONObjectWithData:responseData
                                                                           options:kNilOptions error:&error];
    NSLog(@"resp:%@",jsonResponseDictionary);
    
    
    NSString  *responsestr =[jsonResponseDictionary valueForKey:@"response"];
    
    if([responsestr isEqualToString:@"success"])
    {
        
        UIAlertView *messageBox = [[UIAlertView alloc]initWithTitle:@"Maximizer" message:@"Dummy Details sent successfully!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        
        [messageBox show];
    }
    
    else if([responsestr isEqualToString:@"failure"])
    {
        UIAlertView *messageBox = [[UIAlertView alloc]initWithTitle:@"Maximizer" message:@"Dummy Details not sent!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        
        [messageBox show];
    }

    */
    
    
    
    
    
    
    
    
    
    /*
//http://maximizer.mdei.info/jlrmaximizer_p2/api/api/dummy_check?data={%22uid%22:%22DLR139%22,%22custid%22:%2239%22,%22report_id%22:%22R573483%22}
    
    
    
    NSString *dum_uid=@"DLR1339";
    NSString *dum_custid=@"439";
    NSString *dum_reportid=@"R57399091";

    
   // NSString *dum_uid=[NSString stringWithFormat:@"%@",@"Genie_dummy"];
  //  NSString *dum_custid=[NSString stringWithFormat:@"%@",@"C1923000"];
   // NSString *dum_reportid=[NSString stringWithFormat:@"%@",@"R713000"];

  //  NSString *reportid_str=[NSString stringWithFormat:@"%@",@"R1234432999"];

        NSString *urlstring=[NSString stringWithFormat:@"http://maximizer.mdei.info/jlrmaximizer_p2/api/api/dummy_check?data={\"uid\":\"%@\",\"custid\":\"%@\",\"report_id\":\"%@\"}",dum_uid,dum_custid,dum_reportid];
    
        NSLog(@"urlstring:%@",urlstring);
        
        NSURL *addurl = [[NSURL alloc]initWithString:[urlstring stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        NSData *jsonData = [NSData dataWithContentsOfURL:addurl];
        NSError *error = nil;
        NSMutableDictionary  *dict = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
        
        if(error)
        {
            UIAlertView *alert3=[[UIAlertView alloc]initWithTitle:@"Failed!!!" message:@"Server response error." delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
            [alert3 show];
        }
        else
        {
            NSLog(@"Response Edit Contact any :%@ ",dict);
            NSString *response=[dict objectForKey:@"response"];
            
            
            if ([response isEqualToString:@"success"])
            {
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Success!!!" message:@"Review added successfully." delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
                [alert show];
                
            }
            else
            {
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Failed!!!" message:@"Review is not added." delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
                [alert show];
                
            }
            
        }
    */
    
    

    
    
    
    
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


// callback for UIImageWriteToSavedPhotosAlbum
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    
    if (error)
    {
        // Handle if the image could not be saved to the photo album
    }
    else
    {
        // The save was successful and all is well
    }
}



-(void)show_mail
{
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate =(id) self;
    NSArray *toRecipents = [NSArray arrayWithObject:@"geniesoft_testingdemo@mail.com"];
    [mc setToRecipients:toRecipents];
    
    [self presentViewController:mc animated:YES completion:nil];
    
}
- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    switch (result) {
        case MessageComposeResultCancelled:
            break;
        case MessageComposeResultFailed:
            break;
        case MessageComposeResultSent:
            
            break;
        default:
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
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


- (IBAction)btn_share:(id)sender
{
    
}




- (NSInteger)numberOfPages
{
    return 5;
}

//- (void) drawPrintFormatter:(UIPrintFormatter *)printFormatter forPageAtIndex:(NSInteger)pageIndex
//{
//    [printFormatter drawInRect:self.printableRect forPageAtIndex:0];
//}






@end

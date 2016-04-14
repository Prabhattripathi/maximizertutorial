//
//  NewvehcleViewController.m
//  Maximizer
//
//  Created by Genie Technology on 08/08/15.
//  Copyright (c) 2015 Genie Soft Systems. All rights reserved.
//

#import "NewvehcleViewController.h"
#import "financeofferViewController.h"
#import "BaseTableView.h"
#import "NIDropDown.h"


@interface NewvehcleViewController ()
{
    UIImageView *backimgview;
    BaseTableView *basetab;
    
    AppDelegate *app;
    FMDatabase *database;
    NSMutableArray *arrayfmdb,*arrayfmdb_id,*arrayfmdb_serviceplan,*arrayfmdb_extendedwarranty;
    NSMutableArray *arrayfmdb2,*arrayfmdb_id2,*arrayfmdb_id3,*array_octroi;

    NSString *name,*name_newvwhicleserviplan_value,*name_newvwhicle_extendedwarranty;
    
    NIDropDown *dropdown,*dropdown1,*dropdown2;
//    NSMutableArray *model_arr,*model_id_arr,*model_type_arr,*price_arr,*DownPayment_arr,*SuggestedLoan_arr;
    NSMutableArray *model_arr,*model_id_arr,*model_type_arr,*price_arr,*Insurance_arr,*LogisticsCharges_arr,*RegistrationServiceCharges_arr,*octroiNo_arr;

    
     BOOL manufacture,model,type;
   // NSString *manuid;
    UITapGestureRecognizer *tap;

    NSString *manuid,*modid,*Typeid,*NEWCAROCTROISTR;
 //   NSString *prizestr,*DownPaymentstr,*SuggestLoanAmntStr;
    NSString *prizestr,*Insurancestr,*LogisticsChargesStr,*RegistrationServiceChargesStr,*octroiNostr;

    NSString *strr_index;
    
    
    NSMutableArray *array_brand_name,*array_brand_id,*array_model_name,*array_model_id,*array_version_name,*array_version_id;
    
    NSString *octroi_str_newvehicle;
    
    //for vehicle make..
 //   NSString*makestr,*modelstr,*typestr;

    
    NSString *foreclosre_BalanceTradeValue;

}

@end

@implementation NewvehcleViewController

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
    
    self.make_btn.layer.cornerRadius=5;
    self.model_btn.layer.cornerRadius=5;
    self.type_btn.layer.cornerRadius=5;
    self.shworoomprice_view.layer.cornerRadius=5;
    self.insurance_view.layer.cornerRadius=5;
    self.logstic_view.layer.cornerRadius=5;
    self.road_tax_view.layer.cornerRadius=5;
    self.servive_btn.layer.cornerRadius=5;
    self.servie_btn1.layer.cornerRadius=5;
    self.extended_warrenty_btn.layer.cornerRadius=5;
    self.extendetd_warrenty_btn1.layer.cornerRadius=5;
    self.slider_view.layer.cornerRadius=5;
    self.benifit_view.layer.cornerRadius=5;
    self.total_road_val_view.layer.cornerRadius=5;
    self.balance_trade_after_loan_view.layer.cornerRadius=5;
    self.down_pay_view.layer.cornerRadius=5;
    self.backbtn.layer.cornerRadius=5;
    self.nextbtn.layer.cornerRadius=5;
    self.load_amount_view.layer.cornerRadius=5;
    
    
    self.make_btn.layer.borderWidth=0.5;
    self.make_btn.layer.borderColor=[UIColor blackColor].CGColor;
    
    self.model_btn.layer.borderWidth=0.5;
    self.model_btn.layer.borderColor=[UIColor blackColor].CGColor;
    
    self.type_btn.layer.borderWidth=0.5;
    self.type_btn.layer.borderColor=[UIColor blackColor].CGColor;
    
    self.shworoomprice_view.layer.borderWidth=0.5;
    self.shworoomprice_view.layer.borderColor=[UIColor colorWithRed: 133/255.0 green:25/255.0 blue:41/255.0 alpha:1.0].CGColor;
    
    self.insurance_view.layer.borderWidth=0.5;
    self.insurance_view.layer.borderColor=[UIColor colorWithRed: 133/255.0 green:25/255.0 blue:41/255.0 alpha:1.0].CGColor;
    
    self.logstic_view.layer.borderWidth=0.5;
    self.logstic_view.layer.borderColor=[UIColor colorWithRed: 133/255.0 green:25/255.0 blue:41/255.0 alpha:1.0].CGColor;
    
    self.road_tax_view.layer.borderWidth=0.5;
    self.road_tax_view.layer.borderColor=[UIColor colorWithRed: 133/255.0 green:25/255.0 blue:41/255.0 alpha:1.0].CGColor;
    
    self.servive_btn.layer.borderWidth=0.5;
    self.servive_btn.layer.borderColor=[UIColor blackColor].CGColor;
    
    self.servie_btn1.layer.borderWidth=0.5;
    self.servie_btn1.layer.borderColor=[UIColor blackColor].CGColor;
    
    self.extended_warrenty_btn.layer.borderWidth=0.5;
    self.extended_warrenty_btn.layer.borderColor=[UIColor blackColor].CGColor;
    
    self.extendetd_warrenty_btn1.layer.borderWidth=0.5;
    self.extendetd_warrenty_btn1.layer.borderColor=[UIColor blackColor].CGColor;
    
    self.slider_view.layer.borderWidth=0.5;
    self.slider_view.layer.borderColor=[UIColor colorWithRed: 133/255.0 green:25/255.0 blue:41/255.0 alpha:1.0].CGColor;
    
    self.benifit_view.layer.borderWidth=0.5;
    self.benifit_view.layer.borderColor=[UIColor colorWithRed: 133/255.0 green:25/255.0 blue:41/255.0 alpha:1.0].CGColor;
    
    self.total_road_val_view.layer.borderWidth=0.5;
    self.total_road_val_view.layer.borderColor=[UIColor colorWithRed: 133/255.0 green:25/255.0 blue:41/255.0 alpha:1.0].CGColor;
    
    
    self.balance_trade_after_loan_view.layer.borderWidth=0.5;
    self.balance_trade_after_loan_view.layer.borderColor=[UIColor colorWithRed: 133/255.0 green:25/255.0 blue:41/255.0 alpha:1.0].CGColor;
    
    self.down_pay_view.layer.borderWidth=0.5;
    self.down_pay_view.layer.borderColor=[UIColor colorWithRed: 133/255.0 green:25/255.0 blue:41/255.0 alpha:1.0].CGColor;
    
    /*self.backbtn.layer.borderWidth=0.5;
     self.backbtn.layer.borderColor=[UIColor blackColor].CGColor;
     
     self.nextbtn.layer.borderWidth=0.5;
     self.nextbtn.layer.borderColor=[UIColor blackColor].CGColor;*/
    self.extented_view.layer.cornerRadius=5;
    self.extented_view.layer.borderWidth=0.5;
    self.extented_view.layer.borderColor=[UIColor colorWithRed: 133/255.0 green:25/255.0 blue:41/255.0 alpha:1.0].CGColor;
    
    self.service_view.layer.cornerRadius=5;
    self.service_view.layer.borderWidth=0.5;
    self.service_view.layer.borderColor=[UIColor colorWithRed: 133/255.0 green:25/255.0 blue:41/255.0 alpha:1.0].CGColor;
    
    self.load_amount_view.layer.borderWidth=0.5;
    self.load_amount_view.layer.borderColor=[UIColor colorWithRed: 133/255.0 green:25/255.0 blue:41/255.0 alpha:1.0].CGColor;
    
    self.segment_btn.layer.borderColor=[UIColor colorWithRed: 133/255.0 green:25/255.0 blue:41/255.0 alpha:1.0].CGColor;
    self.segment_btn.tintColor=[UIColor colorWithRed: 133/255.0 green:25/255.0 blue:41/255.0 alpha:1.0];
    
    
    self.scroll.contentSize=CGSizeMake(0, 2550);
   // [self.scroll setContentSize:CGSizeMake(0,2350)];

    
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
    
    
    [self.slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    
    //for time being...
//    NSString *BalanceTradeStr=[[NSUserDefaults standardUserDefaults] objectForKey:@"BalanceTradeValue"];
//    int BalanceTrade=[BalanceTradeStr intValue];
//    
//   self.txt_balance_trade.text=[NSString stringWithFormat:@"%d",BalanceTrade];
    
    
    
    //3nov..
    octroi_str_newvehicle=[NSString stringWithFormat:@"%@",[self.segment_btn titleForSegmentAtIndex:[self.segment_btn selectedSegmentIndex]]];
    NSLog(@"octroi_str_newvehicle:%@",octroi_str_newvehicle);
    
    
    [[NSUserDefaults standardUserDefaults] setValue:octroi_str_newvehicle forKey:@"newvehicle_octroi_resultt"];
    [[NSUserDefaults standardUserDefaults]synchronize];

    
    
    
//    if(app.selectindex==1)
//    {
//      //  [self.submitbtn setTitle:@"Sub_Newvehicle" forState:UIControlStateNormal];
//        
//        
//    }
//
    
    
    
    
//    if (app.selectindex==1)
//    {
//        foreclosre_BalanceTradeValue=@"0";
//    }
//    
//    else
//    {
//        
//        foreclosre_BalanceTradeValue=[[NSUserDefaults standardUserDefaults] objectForKey:@"BalanceTradeValue"];
//        NSLog(@"foreclosre_BalanceTradeValue:%@",foreclosre_BalanceTradeValue);
//        
//        
//        //////........
//      /*  NSString *BalanceTradeStr=[[NSUserDefaults standardUserDefaults] objectForKey:@"BalanceTradeValue"];
//        int BalanceTrade=[BalanceTradeStr intValue];*/
//        
//        self.txt_balance_trade.text=[NSString stringWithFormat:@"%@",foreclosre_BalanceTradeValue];
//
//        
//    }

    
    
    
}





/*
// for make model type starts...

-(void)getSelctMakeDrpDown

{
    //http://maximizer.mdei.info/jlrmaximizer_p2/api/api/get_Retail_Finance
    // http://maximizer.mdei.info/jlrmaximizer_p2/api/api/getNewvehicalMake?data={%22dlrid%22:%22dlr124%22}
 //   NSString *urlString =@"http://maximizer.mdei.info/jlrmaximizer_p2/api/api/getNewvehicalMake?data={%22dlrid%22:%22dlr124%22}";
    
     NSString *urlString =[NSString stringWithFormat:@"http://maximizer.mdei.info/jlrmaximizer_p2/api/api/getNewvehicalMake?data={\"dlrid\":\"%@\"}",@"dlr124"];
    
    NSURL *URL = [[NSURL alloc]initWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSData * jsondata= [NSData dataWithContentsOfURL:URL];
    
    
    id jsonObjects = [NSJSONSerialization JSONObjectWithData:
                      jsondata options:NSJSONReadingMutableContainers error:nil];
    
    NSLog(@"Output :%@",jsonObjects);
    
    NSMutableDictionary * respdic = [[NSMutableDictionary alloc]init];
    
    respdic = [jsonObjects valueForKey:@"userdata"];
    
    
    array_brand_name = [respdic valueForKey:@"brand_name"];
    array_brand_id = [respdic valueForKey:@"brand_id"];
    NSLog(@"afgjjkljh%@",array_brand_id);
    
    
    
    // for names and usernames together:-
    
    //    for (int i=0; i<[respdic count];i++)
    //    {
    //        NSString *name=[[respdic valueForKey:@"Username name"] objectAtIndex:i];
    //        NSString *idis=[[respdic valueForKey:@"id"] objectAtIndex:i];
    //        [array addObject:[NSString stringWithFormat:@"id: %@ Name =%@",idis,name]];
    //    }
    
}


-(void)getSelctModelDrpDown

{
    
    
    //    NSString *str1=[NSString stringWithFormat:@"%@",app.modeldrpdownid];
    //    NSLog(@"Output :%@",app.modeldrpdownid);
    
    NSString *urlString =[NSString stringWithFormat:@"http://demo1.geniesoftsystem.com/vahanindia/api/index.php/api/modeldropdwon?data={\"brand_id\":\"%@\"}",brandstr];
    
    
    
    //    NSString *urlString =[NSString stringWithFormat:@"http://demo1.geniesoftsystem.com/vahanindia/api/index.php/api/modeldropdwon?data={\"brand_id\":\"%@\"}"];
    
    NSLog(@"urlstyju%@",urlString);
    
    NSURL *URL = [[NSURL alloc]initWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSData * jsondata= [NSData dataWithContentsOfURL:URL];
    
    
    id jsonObjects = [NSJSONSerialization JSONObjectWithData:
                      jsondata options:NSJSONReadingMutableContainers error:nil];
    
    NSLog(@"Output :%@",jsonObjects);
    
    NSMutableDictionary * respdic = [[NSMutableDictionary alloc]init];
    
    respdic = [jsonObjects valueForKey:@"text"];
    
    
    array_model_name = [respdic valueForKey:@"model_name"];
    array_model_id = [respdic valueForKey:@"model_id"];
    
}


-(void)getSelctTypeDrpDown

{
    
    
    //    NSString *str1=[NSString stringWithFormat:@"%@",app.modeldrpdownid];
    //    NSLog(@"Output :%@",app.modeldrpdownid);
    
    
    NSString *urlString =[NSString stringWithFormat:@"http://demo1.geniesoftsystem.com/vahanindia/api/index.php/api/versiondropdwon?data={\"model_id\":\"%@\"}",modelstr];
    NSLog(@"urlstr is %@",urlString);
    
    
    //http://demo1.geniesoftsystem.com/vahanindia/api/index.php/api/versiondropdwon?data={%22model_id%22:%2217%22}
    
    
    // NSString *urlString =[NSString stringWithFormat:@"http://demo1.geniesoftsystem.com/vahanindia/api/index.php/api/versiondropdwon?data={\"model_id\":\"%@\"}",self.btn_outlet_selectbrand.titleLabel.text];
    
    
    
    NSURL *URL = [[NSURL alloc]initWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSData * jsondata= [NSData dataWithContentsOfURL:URL];
    
    
    id jsonObjects = [NSJSONSerialization JSONObjectWithData:
                      jsondata options:NSJSONReadingMutableContainers error:nil];
    
    NSLog(@"Output :%@",jsonObjects);
    
    NSMutableDictionary * respdic = [[NSMutableDictionary alloc]init];
    
    respdic = [jsonObjects valueForKey:@"version"];
    
    
    array_version_name = [respdic valueForKey:@"version_name"];
    NSLog(@"abnkl%@",array_version_name);
    
    array_version_id = [respdic valueForKey:@"versionid"];
    array_carid = [respdic valueForKey:@"carid"];
    array_carname = [respdic valueForKey:@"carname"];
    array_carimage = [respdic valueForKey:@"carimage"];
    
    
    
}

*/
// for make model type ends...











//for new vehicle calculation .....

/*
 protected void calculation()
 {
 try
 {
 
 long Ex_ExShowroomPrice_Value = Long.parseLong(ExShowroomPrice_ET
 .getText().toString());
 
 long insurace = Long.parseLong(Insurance_ET.getText().toString());
 
 long logictic_charges = Long.parseLong(LogisticsCharges_ET
 .getText().toString());
 
 long RSCinclude_roadTax = Long.parseLong(ServiceCharges_ET
 .getText().toString());
 
 long forclose = Long.parseLong(AfterLoanForecloser_ET.getText()
 .toString());
 
 long accessories = Long.parseLong(AccessoriesNv_ET.getText()
 .toString());
 long servicep = Long.parseLong(ServicePlan_ET.getText().toString());
 long extwarr = Long.parseLong(ExtendedWarranty_ET.getText()
 .toString());
 
 String benifit_value = BenefitsToCustomer_ET.getText().toString();
 int BenefitsToCustomer_value;
 
 if (!benifit_value.equals("")) {
 
 BenefitsToCustomer_value = Integer
 .parseInt(BenefitsToCustomer_ET.getText().toString());
 } else {
 BenefitsToCustomer_value = 0;
 }
 
 
 
 
 
 
 long onroadval = Ex_ExShowroomPrice_Value + insurace
 + logictic_charges + RSCinclude_roadTax;
 
 long sugg_loan = (onroadval - forclose) - 0; // /0 initial
 
 long downpay;
 
 long value_of_persent = Math.round(onroadval * 0.9);// (90/100)=0.9
 
 if (sugg_loan > value_of_persent)
 {
 int d1 = 0;
 
 downpay = Math
 .round(((onroadval - forclose) - value_of_persent - d1) + 100);
 sugg_loan = Math.round(sugg_loan - downpay);
 
 } else
 {
 downpay = 0;
 sugg_loan = Math.round((onroadval - forclose - downpay) - 0);
 
 }
 
 downpay = Math.round(downpay + servicep + extwarr + accessories);
 sugg_loan = sugg_loan - BenefitsToCustomer_value;
 onroadval = onroadval + servicep + extwarr + accessories
 - BenefitsToCustomer_value;
 
 SuggestedLoanAmount_ET.setText("" + sugg_loan);
 DownPayment_ET.setText("" + downpay);
 TotalOnRoadValue_ET.setText("" + onroadval);
 
 } catch (Exception e) {
 e.printStackTrace();
 
 }
 
 }
 */
-(void)NEWVEHICLECALC
{
    NSString *str0=[NSString stringWithFormat:@"%@",self.txt_show_room_price.text];
    NSString *str1=[NSString stringWithFormat:@"%@",self.txt_insurance.text];
    NSString *str2=[NSString stringWithFormat:@"%@",self.txt_logistic_charges.text];
    NSString *str3=[NSString stringWithFormat:@"%@",self.txt_RSCIRT.text];
 
    
    float show_room_price=[str0 floatValue];
    float insurance=[str1 floatValue];
    float logistic_charges=[str2 floatValue];
    float RSCIRT=[str3 floatValue];
    
    //sum of all details
    float SUM_onroadval=show_room_price+insurance+logistic_charges+RSCIRT;
    NSLog(@"SUM_onroadval:%f",SUM_onroadval);
    
 //   NSString *foreclosre_BalanceTradeValue;
    
    
    if (app.selectindex==1)
    {
        foreclosre_BalanceTradeValue=@"0";
    }
    
    else
    {
        
        foreclosre_BalanceTradeValue=[[NSUserDefaults standardUserDefaults] objectForKey:@"BalanceTradeValue"];
        NSLog(@"foreclosre_BalanceTradeValue:%@",foreclosre_BalanceTradeValue);
        
        
        //////........
        /*  NSString *BalanceTradeStr=[[NSUserDefaults standardUserDefaults] objectForKey:@"BalanceTradeValue"];
         int BalanceTrade=[BalanceTradeStr intValue];*/
        
        self.txt_balance_trade.text=[NSString stringWithFormat:@"%@",foreclosre_BalanceTradeValue];
        
        
    }
    
    /*
    if (app.selectindex==1)
    {
        foreclosre_BalanceTradeValue=@"0";
    }
    
    else
    {
    
        foreclosre_BalanceTradeValue=[[NSUserDefaults standardUserDefaults] objectForKey:@"BalanceTradeValue"];
        NSLog(@"foreclosre_BalanceTradeValue:%@",foreclosre_BalanceTradeValue);

    }*/


//    NSString *foreclosre_BalanceTradeValue=[[NSUserDefaults standardUserDefaults] objectForKey:@"BalanceTradeValue"];
//    NSLog(@"foreclosre_BalanceTradeValue:%@",foreclosre_BalanceTradeValue);


    float foreclosre_BalanceTradeValueee=[foreclosre_BalanceTradeValue floatValue];
    NSLog(@"foreclosre_BalanceTradeValueee:%f",foreclosre_BalanceTradeValueee);
    

    float sugg_loan = (SUM_onroadval - foreclosre_BalanceTradeValueee) - 0;
    NSLog(@"sugg_loan:%f",sugg_loan);
    
   // float principle=roundf(emi-interest);

    float value_of_persent = roundf(SUM_onroadval * 0.9);// (90/100)=0.9
    NSLog(@"value_of_persent:%f",value_of_persent);

    
    float downpay;
    
    if (sugg_loan > value_of_persent)
    {
        int d1 = 0;
        
        downpay = roundf(((SUM_onroadval - foreclosre_BalanceTradeValueee) - value_of_persent - d1) + 100);
        
        sugg_loan = roundf(sugg_loan - downpay);
        
    }
    else
    {
        downpay = 0;
        
        sugg_loan = roundf((SUM_onroadval - foreclosre_BalanceTradeValueee - downpay) - 0);
        
    }
    

    NSString *str_serplan=[NSString stringWithFormat:@"%@",self.service_txt.text];
    NSString *str_extwarr=[NSString stringWithFormat:@"%@",self.extented_txt.text];
    NSString *str_accessories=[NSString stringWithFormat:@"%@",self.txt_value1.text];
    NSString *str_benifitTC=[NSString stringWithFormat:@"%@",self.txt_benifitTC.text];


    float serplan=[str_serplan floatValue];
    float extwarr=[str_extwarr floatValue];
    float accessor=[str_accessories floatValue];
    float benifitTC=[str_benifitTC floatValue];

    
    downpay = roundf(downpay + serplan + extwarr + accessor);
    
    sugg_loan = sugg_loan - benifitTC;
    
    SUM_onroadval = SUM_onroadval + serplan + extwarr + accessor
    - benifitTC;
    
   // SuggestedLoanAmount_ET.setText("" + sugg_loan);
  //  DownPayment_ET.setText("" + downpay);
   // TotalOnRoadValue_ET.setText("" + onroadval);
    
    
    
    //NEW....
    NSString *sugg_loanstrr=[NSString stringWithFormat:@"%f",sugg_loan];
    int sugg_loans_finalintvalue= [sugg_loanstrr intValue];
    
    NSString *downpaystrr=[NSString stringWithFormat:@"%f",downpay];
    int downpay_finalintvalue= [downpaystrr intValue];

    NSString *SUM_onroadvalstrr=[NSString stringWithFormat:@"%f",SUM_onroadval];
    int SUM_onroadval_finalintvalue= [SUM_onroadvalstrr intValue];


    
    
    
    //OLD...
//    self.txt_suggested_loan_amt.text=[NSString stringWithFormat:@"%f",sugg_loan];
//    self.txt_down_payment.text=[NSString stringWithFormat:@"%f",downpay];
//    self.txt_TORV.text=[NSString stringWithFormat:@"%f",SUM_onroadval];
    
    
    
    //NEW...
    self.txt_suggested_loan_amt.text=[NSString stringWithFormat:@"%d",sugg_loans_finalintvalue];
    self.txt_down_payment.text=[NSString stringWithFormat:@"%d",downpay_finalintvalue];
    self.txt_TORV.text=[NSString stringWithFormat:@"%d",SUM_onroadval_finalintvalue];

    
    
    
    [[NSUserDefaults standardUserDefaults] setValue:self.txt_suggested_loan_amt.text forKey:@"SuggestedLoanAmnt"];
    [[NSUserDefaults standardUserDefaults] synchronize];

    [[NSUserDefaults standardUserDefaults] setValue:self.txt_down_payment.text forKey:@"dwnpayment"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    [[NSUserDefaults standardUserDefaults] setValue:self.txt_TORV.text forKey:@"TotOnRoadValue"];
    [[NSUserDefaults standardUserDefaults]synchronize];

    

    

//catch (Exception e)
//{
//    e.printStackTrace();
//    
//}

        


    //sum of all details
    
    //    float onroadvalue=datee_val+fuel_val+kms_val+colour_val+owner_val+Insurance_val+Accidential_val+MDOVV_val+CBUCKDD_val;
    //    NSLog(@"onroadvalue%f",onroadvalue);
    //
    //
    //    float rdata=[[NSUserDefaults standardUserDefaults] integerForKey:@"refurbishment_val"];
    //    NSLog(@"rdata%f",rdata);
    //    //int output=txt_road_val-SUM;
    //
    //
    //    float tempval=txt_road_val*SUM;
    //    NSLog(@"tempval%f",tempval);
    //
    //
    //    float DEDUCTOR=tempval+(float)result;//- - = +
    //    NSLog(@"deductor%f",DEDUCTOR);
    //
    //
    //    float OFFER_PRICE=txt_road_val-DEDUCTOR;
    //    NSLog(@"OFFER_Price:%f",OFFER_PRICE);
    //
    //
    //    NSString *op=[NSString stringWithFormat:@"%f",OFFER_PRICE];
    //
    //    int fr=[op intValue];
    //
    //    self.txt_pricebymax.text=[NSString stringWithFormat:@"%d",fr];
    
    //txt_TORV;
    // txt_balance_trade;
    //  txt_suggested_loan_amt;
    
    
    
    /*
     [[NSUserDefaults standardUserDefaults] setValue:prizestr forKey:@"TotOnRoadValue"];
     [[NSUserDefaults standardUserDefaults] synchronize];
     
     [[NSUserDefaults standardUserDefaults] setValue:prizestr forKey:@"TotOnRoadValue"];
     [[NSUserDefaults standardUserDefaults] synchronize];
     
     [[NSUserDefaults standardUserDefaults] setValue:prizestr forKey:@"TotOnRoadValue"];
     [[NSUserDefaults standardUserDefaults] synchronize];*/
    
}

- (void) niDropDownDelegateMethod: (NIDropDown *) sender
{
    
  //  [self rel];
    
    ///7thsept
    
    if(model==true)
    {
        //1 click drpdown..
        
        NSString *modelstr=[NSString stringWithFormat:@"%@",self.model_btn.currentTitle];
        NSLog(@"modelstr:%@",modelstr);
        
        [[NSUserDefaults standardUserDefaults] setValue:modelstr forKey:@"newcarvehiclemodel"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        
        //8sept
        
        app=(AppDelegate *)[[UIApplication sharedApplication]delegate];
        
        NSInteger index=[app.drop_index integerValue];
        
        modid=[NSString stringWithFormat:@"%@",[arrayfmdb_id2 objectAtIndex:index]];
        NSLog(@"modid:%@",modid);
        
        [self rel1];
    }
    
    
    
    else if(manufacture==true)
    {
        //1 click drpdown...
        NSString *makestr=[NSString stringWithFormat:@"%@",self.make_btn.currentTitle];
        NSLog(@"makestr:%@",makestr);
        
        [[NSUserDefaults standardUserDefaults] setValue:makestr forKey:@"newcarvehiclemake"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        
        //..
        app=(AppDelegate *)[[UIApplication sharedApplication]delegate];
        
        NSInteger index=[app.drop_index integerValue];
        
        manuid=[NSString stringWithFormat:@"%@",[arrayfmdb_id objectAtIndex:index]];
        
        NSLog(@"manuid:%@",manuid);
        
        
        [self rel];
    }
    else if(type==true)
    {
        //1 click drpdown..
        NSString *typestr=[NSString stringWithFormat:@"%@",self.type_btn.currentTitle];
        NSLog(@"typestr:%@",typestr);
        
        [[NSUserDefaults standardUserDefaults] setValue:typestr forKey:@"newcarvehicletype"];
        [[NSUserDefaults standardUserDefaults]synchronize];

        
        
        //25sept
        app=(AppDelegate *)[[UIApplication sharedApplication]delegate];
        
        NSInteger index=[app.drop_index integerValue];
        
        Typeid=[NSString stringWithFormat:@"%@",[arrayfmdb_id3 objectAtIndex:index]];
        NSLog(@"Typeid:%@",Typeid);

        //Typeid=[NSString stringWithFormat:@"%@",[price_arr objectAtIndex:index]];
        
        
        
        //1)
        prizestr=[NSString stringWithFormat:@"%@",[price_arr objectAtIndex:index]];
        
        self.txt_show_room_price.text=prizestr;
        //self.txt_TORV.text=prizestr;
        
        self.txt_TORV.text=prizestr;
        
      //  NSLog(@"Typeid:%@",Typeid);
        
        //19oct...
//        [[NSUserDefaults standardUserDefaults] setValue:prizestr forKey:@"TotOnRoadValue"];
//        [[NSUserDefaults standardUserDefaults] synchronize];
        
       /* //23OCT...
        [[NSUserDefaults standardUserDefaults] setValue:self.txt_show_room_price.text forKey:@"exShowroomprice"];
        [[NSUserDefaults standardUserDefaults] synchronize];*/

        
        //2)    NSString *prizestr,*Insurancestr,*LogisticsChargesStr,*RegistrationServiceChargesStr;
        
        Insurancestr=[NSString stringWithFormat:@"%@",[Insurance_arr objectAtIndex:index]];
        self.txt_insurance.text=Insurancestr;
        
        
        //3)
        LogisticsChargesStr=[NSString stringWithFormat:@"%@",[LogisticsCharges_arr objectAtIndex:index]];
        self.txt_logistic_charges.text=LogisticsChargesStr;
        

        //4)
        
        RegistrationServiceChargesStr=[NSString stringWithFormat:@"%@",[RegistrationServiceCharges_arr objectAtIndex:index]];
        self.txt_RSCIRT.text=RegistrationServiceChargesStr;

        //5)
        
        octroiNostr=[NSString stringWithFormat:@"%@",[octroiNo_arr objectAtIndex:index]];
       // self.txt_RSCIRT.text=RegistrationServiceChargesStr;
        
        
        
        
    //20oct...
        
//        [[NSUserDefaults standardUserDefaults] setValue:prizestr forKey:@"TotOnRoadValue"];
//        [[NSUserDefaults standardUserDefaults] synchronize];
        
//     [[NSUserDefaults standardUserDefaults] setValue:self.txt_down_payment.text forKey:@"dwnpayment"];
//       [[NSUserDefaults standardUserDefaults]synchronize];


        
        
//        //3)
//        SuggestLoanAmntStr=[NSString stringWithFormat:@"%@",[SuggestedLoan_arr objectAtIndex:index]];
//        
//        self.txt_suggested_loan_amt.text=SuggestLoanAmntStr;
//        
//        
//        //19oct...
//        [[NSUserDefaults standardUserDefaults] setValue:SuggestLoanAmntStr forKey:@"SuggestedLoanAmnt"];
//        [[NSUserDefaults standardUserDefaults] synchronize];

        
        app=(AppDelegate *)[[UIApplication sharedApplication]delegate];
        
       // NSInteger index=[app.drop_index integerValue];
       
        
        /*
        NEWCAROCTROISTR=[NSString stringWithFormat:@"%@",[array_octroi objectAtIndex:index]];
        NSLog(@"NEWCAROCTROISTR:%@",NEWCAROCTROISTR);*/

        
        [self NEWVEHICLECALC];
        [self rel2];
    }
    else
    {
        //for service plan....
        NSString *service_str=[NSString stringWithFormat:@"%@",self.servive_btn.currentTitle];
        NSLog(@"service_str:%@",service_str);
        
        [[NSUserDefaults standardUserDefaults] setValue:service_str forKey:@"Servicedropdown_newvehicle"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        //for values in txtfld...
        NSInteger index=[app.drop_index integerValue];
        NSString * serviceplanStr=[NSString stringWithFormat:@"%@",[arrayfmdb_serviceplan objectAtIndex:index]];
        NSLog(@"serviceplanStr:%@",serviceplanStr);
        
        self.service_txt.text=serviceplanStr;
        
        
        [[NSUserDefaults standardUserDefaults] setValue:self.service_txt.text forKey:@"ServicedropdownTEXTVALUE_newvehicle"];
        [[NSUserDefaults standardUserDefaults]synchronize];

        
        
        //for extended warranty...
        NSString *extendedwarranty_str=[NSString stringWithFormat:@"%@",self.extended_warrenty_btn.currentTitle];
        NSLog(@"extendedwarranty_str:%@",extendedwarranty_str);
        
        [[NSUserDefaults standardUserDefaults] setValue:extendedwarranty_str forKey:@"extendedwarranty_newvehicle"];
        [[NSUserDefaults standardUserDefaults]synchronize];

        //for vlaues in txtfld...
      //  NSInteger index=[app.drop_index integerValue];
        NSString * extwarrtyStr=[NSString stringWithFormat:@"%@",[arrayfmdb_extendedwarranty objectAtIndex:index]];
        NSLog(@"extwarrtyStr:%@",extwarrtyStr);
        
        self.extented_txt.text=extwarrtyStr;
        
        
        [[NSUserDefaults standardUserDefaults] setValue:self.extented_txt.text forKey:@"ExtendedropdownTEXTVALUE_newvehicle"];
        [[NSUserDefaults standardUserDefaults]synchronize];

        
        
        
        
        
        [self NEWVEHICLECALC];
        
        
        [self rel];
    }

    
}

-(void)rel
{
    dropdown = nil;
    
    tap = [[UITapGestureRecognizer alloc]
           initWithTarget:self
           action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];

    
}

-(void)rel1
{
    dropdown1 = nil;
    
    tap = [[UITapGestureRecognizer alloc]
           initWithTarget:self
           action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];

}

-(void)rel2
{
   // self.txt_show_room_price.text=[NSString stringWithFormat:@"%@",prizestr];
    dropdown2 = nil;
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
    self.scroll.contentSize=CGSizeMake(0, 2550);
    
}






/*
 New car calculation
 
 onroadval = ex_showroom_price+insurance+logistic_charge+regcharg_roadtax;
 sugg_loan = (onroadval - forclose) - 0; ///0 initial
 
 downpayment
 if(sugg_loan > (onroadval*(90 / 100)))
 {
 d1 = 0;
 downpay = ((onroadval-forclose) - onroadval*
 
 (90 / 100) - d1) + 100;
 sugg_loan = round(sugg_loan-downpay);
 }
 else
 {
 downpay = 0;
 sugg_loan = (onroadval - forclose - downpay)
 
 - 0;
 }
 downpay = downpay+servicep+extwarr+accessories;
 sugg_loan = sugg_loan-cust_disc;
 onroadval = onroadval+servicep+extwarr+accessories -
 
 cust_disc;
 */


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
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
    
   /* tap = [[UITapGestureRecognizer alloc]
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
    
    [self.txt_show_room_price resignFirstResponder];
    [self.txt_insurance resignFirstResponder];
    [self.txt_logistic_charges resignFirstResponder];
    [self.txt_RSCIRT resignFirstResponder];
    [self.txt_value1 resignFirstResponder];
    [self.txt_benifitTC resignFirstResponder];
    [self.txt_TORV resignFirstResponder];
    [self.txt_benifitTC resignFirstResponder];
    [self.txt_balance_trade resignFirstResponder];
    [self.txt_down_payment resignFirstResponder];
}

#pragma mark -
#pragma mark - Button method

- (void)sliderValueChanged:(UISlider *)sender
{
    /*NSLog(@"slider value = %f", sender.value*4000000);*/
    
    float temp=sender.value*1000000;
    int result = (int)temp;
    NSLog(@"temp1:%d",result);
    
    self.txt_value1.text=[NSString stringWithFormat:@"%d",result];
    
    
    //1.for torv...
    int number = result;
    
    int tremp=[prizestr intValue];
    int final=tremp+number;
    
    
    self.txt_TORV.text=[NSString stringWithFormat:@"%d",final];
    
    [[NSUserDefaults standardUserDefaults] setInteger:final forKey:@"refurbishment_val"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    //1.for downpayment...
    int number2 = result;
    
   // int tremp2=[DownPaymentstr intValue];
  //  int final2=tremp2+number2;

    
   // self.txt_down_payment.text=[NSString stringWithFormat:@"%d",final2];
    
    
 // self.txt_TORV.text=[NSString stringWithFormat:@"%d",result];
 // self.txt_down_payment.text=[NSString stringWithFormat:@"%d",result];
    
}



//New Year Calculation...

/*
New car calculation

onroadval = ex_showroom_price+insurance+logistic_charge+regcharg_roadtax;
sugg_loan = (onroadval - forclose) - 0; ///0 initial

downpayment
if(sugg_loan > (onroadval*(90 / 100)))
{
    d1 = 0;
    downpay = ((onroadval-forclose) - onroadval*
               
               (90 / 100) - d1) + 100;
    sugg_loan = round(sugg_loan-downpay);
}
else
{
    downpay = 0;
    sugg_loan = (onroadval - forclose - downpay)
    
    - 0;
}
downpay = downpay+servicep+extwarr+accessories;
sugg_loan = sugg_loan-cust_disc;
onroadval = onroadval+servicep+extwarr+accessories -

cust_disc;
*/







- (IBAction)backbtncliked:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (IBAction)nextcliked:(id)sender
{
    /*
    UIStoryboard *storyboard ;
    storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    financeofferViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"financeofferViewController"];
    [self.navigationController pushViewController:vw animated:YES];*/
    
    
    NSString *str=[[NSUserDefaults standardUserDefaults]valueForKey:@"db_path"];
    
    NSLog(@"str:%@",str);
    
    database = [FMDatabase databaseWithPath:str];
    
    [database open];
    
    if([[self.make_btn titleForState:UIControlStateNormal] isEqualToString:@"Select"]||[[self.model_btn titleForState:UIControlStateNormal] isEqualToString:@"Select"]||[[self.type_btn titleForState:UIControlStateNormal] isEqualToString:@"Select"]||[self.txt_show_room_price.text isEqualToString:@""]||[self.txt_insurance.text isEqualToString:@""]||[self.txt_logistic_charges.text isEqualToString:@""]||[self.txt_RSCIRT.text isEqualToString:@""] || [[self.servive_btn titleForState:UIControlStateNormal] isEqualToString:@"Select"]||[[self.extended_warrenty_btn titleForState:UIControlStateNormal] isEqualToString:@"Select"]||[self.txt_value1.text isEqualToString:@""]||[self.txt_benifitTC.text isEqualToString:@""]||[self.txt_TORV.text isEqualToString:@""]||[self.txt_balance_trade.text isEqualToString:@""]||[self.txt_down_payment.text isEqualToString:@""]||[self.txt_suggested_loan_amt.text isEqualToString:@""])
        
        
    {
        UIAlertView *aert=[[UIAlertView alloc]initWithTitle:@"Maximizer." message:@"Please Enter All The Fields." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [aert show];
    }
    else
    {
        /*
         [database executeUpdate:@"create table NEWVEHICLE(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, Make varchar, Model varchar, Type varchar, ExShowroomPrice varchar, Insurance varchar, LogisticsCharges varchar, RegistrationServiceCharges varchar, ServicePlan varchar, ExtendedWarranty varchar, Accessories varchar, BenefitstoCustomer varchar, TotalOnRoadValue varchar, BalanceTradeInValue varchar,DownPayment varchar,SuggestedLoanAmnt varchar)"];
         */
        //BOOL success =  ....
        
        
        //Type n [self.type_btn titleForState:UIControlStateNormal]
          [database executeUpdate:@"insert into tbl_newvehicle(Make,Model,Type,ExShowroomPrice,Insurance,LogisticsCharges,RegistrationServiceCharges,ServicePlan,ExtendedWarranty,Accessories,BenefitstoCustomer,TotalOnRoadValue,BalanceTradeInValue,DownPayment,SuggestedLoanAmnt) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",[self.make_btn titleForState:UIControlStateNormal],[self.model_btn titleForState:UIControlStateNormal],[self.type_btn titleForState:UIControlStateNormal],self.txt_show_room_price.text,self.txt_insurance.text,self.txt_logistic_charges.text,self.txt_RSCIRT.text,[self.servive_btn titleForState:UIControlStateNormal],[self.extended_warrenty_btn titleForState:UIControlStateNormal],self.txt_value1.text,self.txt_benifitTC.text,self.txt_TORV.text,self.txt_balance_trade.text,self.txt_down_payment.text,self.txt_suggested_loan_amt.text,nil];
        
      //  if(success==true)
        //{
            UIStoryboard *storyboard ;
            storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
            financeofferViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"financeofferViewController"];
            [self.navigationController pushViewController:vw animated:YES];
        
        
        
        
        
            //26Oct...
        
        [[NSUserDefaults standardUserDefaults] setValue:self.txt_insurance.text forKey:@"insuranceresult"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        [[NSUserDefaults standardUserDefaults] setValue:self.txt_logistic_charges.text forKey:@"logisticresult"];
        [[NSUserDefaults standardUserDefaults]synchronize];

        [[NSUserDefaults standardUserDefaults] setValue:self.txt_RSCIRT.text forKey:@"registrationservicecharges_result"];
        [[NSUserDefaults standardUserDefaults]synchronize];

        [[NSUserDefaults standardUserDefaults] setValue:self.service_txt.text forKey:@"serviceplan_result"];
        [[NSUserDefaults standardUserDefaults]synchronize];

        [[NSUserDefaults standardUserDefaults] setValue:self.extented_txt.text forKey:@"extendedwarranty_result"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        [[NSUserDefaults standardUserDefaults] setValue:self.txt_value1.text forKey:@"accessories_result"];
        [[NSUserDefaults standardUserDefaults]synchronize];


        
        
        

       /* }
        else
        {
            NSLog(@"Insertion Failed!");
            
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Maximizer" message:@"Insertion Failed!" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
            [alert show];
            
            
        }*/
        
    }
    
    [database close];

}



//octroi...
- (IBAction)segmentcliked:(id)sender
{
    for (int i=0; i<2; i++)
    {
        if ([[self.segment_btn.subviews objectAtIndex:i]isSelected] )
        {
            UIColor *tintcolor=[UIColor colorWithRed:133/255.0 green:25/255.0 blue:41/255.0 alpha:1.0];
            [[self.segment_btn.subviews objectAtIndex:i] setTintColor:tintcolor];
            
            
            
            [self NEWVEHICLECALC];
        }
        else
        {
            [[self.segment_btn.subviews objectAtIndex:i] setTintColor:nil];
            
            [self NEWVEHICLECALC];
        }
    }
}




- (IBAction)homecliked:(id)sender
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
- (IBAction)sharebtn:(id)sender
{
    
}

- (IBAction)sharebtncliked:(id)sender
{
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.scroll.contentSize=CGSizeMake(0, 2550);

    
    if (textField == self.txt_show_room_price)
    {
        self.view.frame = CGRectMake(0, -50, 320, 568);
        
    }
    if (textField == self.txt_insurance)
    {
        self.view.frame = CGRectMake(0, -50, 320, 568);
        
    }
    if (textField == self.txt_logistic_charges)
    {
        self.view.frame = CGRectMake(0, -50, 320, 568);
        
    }
    if (textField == self.txt_RSCIRT)
    {
        self.view.frame = CGRectMake(0, -50, 320, 568);
        
    }
    if (textField == self.txt_value1)
    {
        self.view.frame = CGRectMake(0, -50, 320, 568);
        
    }
    if (textField == self.txt_benifitTC)
    {
        self.view.frame = CGRectMake(0, -50, 320, 568);
        
    }
    if (textField == self.txt_TORV)
    {
        self.view.frame = CGRectMake(0, -50, 320, 568);
        
    }
    if (textField == self.txt_balance_trade)
    {
        self.view.frame = CGRectMake(0, -50, 320, 568);
        
    }
    if (textField == self.txt_down_payment)
    {
        self.view.frame = CGRectMake(0, -50, 320, 568);
        
    }
    if (textField == self.txt_suggested_loan_amt)
    {
        self.view.frame = CGRectMake(0, -120, 320, 568);
        
    }
    self.scroll.contentSize=CGSizeMake(0, 2550);

    
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    /*
    if (textField == self.txt_show_room_price)
    {
        self.view.frame = CGRectMake(0, 0, 320, 568);
        
    }
    if (textField == self.txt_insurance)
    {
        self.view.frame = CGRectMake(0, 0, 320, 568);
        
    }
    if (textField == self.txt_logistic_charges)
    {
        self.view.frame = CGRectMake(0, 0, 320, 568);
        
    }
    if (textField == self.txt_RSCIRT)
    {
        self.view.frame = CGRectMake(0, 0, 320, 568);
        
    }
    if (textField == self.txt_value1)
    {
        self.view.frame = CGRectMake(0, 0, 320, 568);
        
    }
    if (textField == self.txt_benifitTC)
    {
        self.view.frame = CGRectMake(0, 0, 320, 568);
        
    }
    if (textField == self.txt_TORV)
    {
        self.view.frame = CGRectMake(0, 0, 320, 568);
        
    }
    if (textField == self.txt_balance_trade)
    {
        self.view.frame = CGRectMake(0, 0, 320, 568);
        
    }
    if (textField == self.txt_down_payment)
    {
        self.view.frame = CGRectMake(0, 0, 320, 568);
        
    }
    if (textField == self.txt_suggested_loan_amt)
    {
        self.view.frame = CGRectMake(0, 0, 320, 568);
        
    }*/
    
    self.view.frame=CGRectMake(0, 0, 320, 568);
    [textField resignFirstResponder];
    
    [self NEWVEHICLECALC];

    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    self.view.frame=CGRectMake(0, 0, 320, 568);

    [textField resignFirstResponder];
    
    return YES;
}

- (IBAction)btn_Make:(id)sender
{
/*
    NSString *str=[[NSUserDefaults standardUserDefaults]valueForKey:@"db_path"];
    database = [FMDatabase databaseWithPath:str];
    
    [database open];
    
    arrayfmdb = [[NSMutableArray alloc]init];
     arrayfmdb_id=[[NSMutableArray alloc]init];
    
    FMResultSet *results = [database executeQuery:@"SELECT * FROM NewVehicleMake"];
    
    while ([results next])
    {
        
        name = [results stringForColumn:@"NVM"];
        NSInteger id1=[results intForColumn:@"userid"];
        [arrayfmdb addObject:name];
        [arrayfmdb_id addObject:[NSString stringWithFormat:@"%ld",(long)id1]];
        
        // NSLog(@"arr:%@",arrayfmdb);
        NSLog(@"arr:%@",arrayfmdb_id);

        
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
    [self dismissKeyboard];
    
    [self.view removeGestureRecognizer:tap];

    manufacture=true;
    model=false;
    type=false;
    
    NSString *str=[[NSUserDefaults standardUserDefaults]valueForKey:@"db_path"];
    database = [FMDatabase databaseWithPath:str];
    
    [database open];
    
    arrayfmdb = [[NSMutableArray alloc]init];
    arrayfmdb_id=[[NSMutableArray alloc]init];
    
    
    FMResultSet *results = [database executeQuery:@"SELECT * FROM tbl_newvehicle_make"];
    
    while ([results next])
        
    {
        
        name = [results stringForColumn:@"NVM"];
        NSLog(@"carname:%@",name);
        NSInteger id1=[results intForColumn:@"id"];
        
        [arrayfmdb addObject:name];
        [arrayfmdb_id addObject:[NSString stringWithFormat:@"%ld",(long)id1]];
        
        // NSLog(@"arr:%@",arrayfmdb);
        NSLog(@"arrayfmdb_id:%@",arrayfmdb_id);
        NSLog(@"arrayfmdb:%@",arrayfmdb);
        
        
        
    }
    
    
    if(dropdown == nil)
    {
        CGFloat f =200;
        dropdown = [[NIDropDown alloc]showDropDown:sender :&f :arrayfmdb :Nil :@"down"];
        dropdown.delegate = (id)self;
        
        
        //for hiding remaining 2 dropdowns..
        dropdown1.hidden=YES;
        dropdown2.hidden=YES;
        
    }
    else
    {
        [dropdown hideDropDown:sender];
        [self rel];
    }
    
    [database close];
    
    
    
    //1 click drpdown..
    
//    NSString *makestr=[NSString stringWithFormat:@"%@",self.make_btn.currentTitle];
//    NSLog(@"makestr:%@",makestr);
//    
//    [[NSUserDefaults standardUserDefaults] setValue:makestr forKey:@"newcarvehiclemake"];
//    [[NSUserDefaults standardUserDefaults]synchronize];

    
    
    
    /*
    //implementation of selected particular drpdwn of   MAKE ..
    
    if ([[self.make_btn titleForState:UIControlStateNormal] isEqualToString:@"BMW"])
    {
        makestr=[NSString stringWithFormat:@"%@",@"BMW"];
        
        NSLog(@"makestr:%@",makestr);
        
    }
    else if ([[self.make_btn titleForState:UIControlStateNormal] isEqualToString:@"Honda"])
    {
        
        makestr=[NSString stringWithFormat:@"%@",@"Honda"];
        
        NSLog(@"makestr:%@",makestr);
        
    }
    else if ([[self.make_btn titleForState:UIControlStateNormal] isEqualToString:@"Jaguar"])
    {
        
        makestr=[NSString stringWithFormat:@"%@",@"Jaguar"];
        
        NSLog(@"makestr:%@",makestr);
        
    }
    else if ([[self.make_btn titleForState:UIControlStateNormal] isEqualToString:@"Land Rover"])
    {
        
        makestr=[NSString stringWithFormat:@"%@",@"Land Rover"];
        
        NSLog(@"makestr:%@",makestr);
        
    }
    else if ([[self.make_btn titleForState:UIControlStateNormal] isEqualToString:@"Nissan"])
    {
        
        makestr=[NSString stringWithFormat:@"%@",@"Nissan"];
        
        NSLog(@"makestr:%@",makestr);
        
    }
    

        [[NSUserDefaults standardUserDefaults] setValue:makestr forKey:@"newcarvehiclemake"];
         [[NSUserDefaults standardUserDefaults]synchronize];*/
    
}



- (IBAction)btn_vehicleModel:(id)sender
{
    [self dismissKeyboard];
    [self.view removeGestureRecognizer:tap];
    if(manuid.length==0)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Maximizer" message:@"Select manufacturer first." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        
        
    }
    else
    {
        model=true;
        manufacture=false;
        type=false;
        

        NSString *str=[[NSUserDefaults standardUserDefaults]valueForKey:@"db_path"];
        database = [FMDatabase databaseWithPath:str];
        
        [database open];
        
        model_arr = [[NSMutableArray alloc]init];
        arrayfmdb_id2= [[NSMutableArray alloc]init];

        
        FMResultSet *results = [database executeQuery:@"SELECT * FROM tbl_newvehicle_model WHERE makeid = ?",[NSString stringWithFormat:@"%@",manuid]];
        
        while ([results next])
        {
            
            NSString *name1 = [results stringForColumn:@"modelname"];
            [model_arr addObject:name1];
            NSLog(@"model_arr:%@",model_arr);

            
            [arrayfmdb_id2 addObject:[results stringForColumn:@"modelid"]];
            NSLog(@"arrayfmdb_id2:%@",arrayfmdb_id2);

        }
        
        
        if(dropdown1 == nil)
        {
            CGFloat f =40*(model_arr.count);
            dropdown1 = [[NIDropDown alloc]showDropDown:sender :&f :model_arr :Nil :@"down"];
            dropdown1.delegate = (id)self;
            
            
            //for hiding remaining 2 dropdowns..
            dropdown.hidden=YES;
            dropdown2.hidden=YES;
        }
        
        else
        {
            [dropdown1 hideDropDown:sender];
            [self rel1];
        }
        
        [database close];
        
        
//        //1 click drpdown..
//        
//            NSString *modelstr=[NSString stringWithFormat:@"%@",self.model_btn.currentTitle];
//            NSLog(@"modelstr:%@",modelstr);
//        
//        [[NSUserDefaults standardUserDefaults] setValue:modelstr forKey:@"newcarvehiclemodel"];
//        [[NSUserDefaults standardUserDefaults]synchronize];
        
        
        
        
        /*
        //implementation of selected particular drpdwn of    MODEL....
        
        if ([[self.model_btn titleForState:UIControlStateNormal] isEqualToString:@"1 Series"])
        {
            modelstr=[NSString stringWithFormat:@"%@",@"1 Series"];
            
            NSLog(@"modelstr:%@",modelstr);
            
        }
        else if ([[self.model_btn titleForState:UIControlStateNormal] isEqualToString:@"3 Series"])
        {
            
            modelstr=[NSString stringWithFormat:@"%@",@"3 Series"];
            
            NSLog(@"modelstr:%@",modelstr);
            
        }
        else if ([[self.model_btn titleForState:UIControlStateNormal] isEqualToString:@"Accord"])
        {
            
            modelstr=[NSString stringWithFormat:@"%@",@"Accord"];
            
            NSLog(@"modelstr:%@",modelstr);
            
        }
        else if ([[self.model_btn titleForState:UIControlStateNormal] isEqualToString:@"Amaze"])
        {
            
            modelstr=[NSString stringWithFormat:@"%@",@"Amaze"];
            
            NSLog(@"modelstr:%@",modelstr);
            
        }
        else if ([[self.model_btn titleForState:UIControlStateNormal] isEqualToString:@"F-Type"])
        {
            
            modelstr=[NSString stringWithFormat:@"%@",@"F-Type"];
            
            NSLog(@"modelstr:%@",modelstr);
            
        }
        else if ([[self.model_btn titleForState:UIControlStateNormal] isEqualToString:@"XF"])
        {
            
            modelstr=[NSString stringWithFormat:@"%@",@"XF"];
            
            NSLog(@"modelstr:%@",modelstr);
            
        }
        else if ([[self.model_btn titleForState:UIControlStateNormal] isEqualToString:@"Discovery"])
        {
            
            modelstr=[NSString stringWithFormat:@"%@",@"Discovery"];
            
            NSLog(@"modelstr:%@",modelstr);
            
        }
        else if ([[self.model_btn titleForState:UIControlStateNormal] isEqualToString:@"Freelander 2"])
        {
            
            modelstr=[NSString stringWithFormat:@"%@",@"Freelander 2"];
            
            NSLog(@"modelstr:%@",modelstr);
            
        }
        else if ([[self.model_btn titleForState:UIControlStateNormal] isEqualToString:@"370Z"])
        {
            
            modelstr=[NSString stringWithFormat:@"%@",@"370Z"];
            
            NSLog(@"modelstr:%@",modelstr);
            
        }
        else if ([[self.model_btn titleForState:UIControlStateNormal] isEqualToString:@"Evalia"])
        {
            
            modelstr=[NSString stringWithFormat:@"%@",@"Evalia"];
            
            NSLog(@"modelstr:%@",modelstr);
            
        }

        
        
        [[NSUserDefaults standardUserDefaults] setValue:modelstr forKey:@"newcarvehiclemodel"];
        [[NSUserDefaults standardUserDefaults]synchronize];*/

        
    }

}



- (IBAction)btn_selectType:(id)sender
{
    [self dismissKeyboard];
    
    [self.view removeGestureRecognizer:tap];
    
    if(modid.length==0)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Maximizer" message:@"Select Model first." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        
    }
    
    else
    {
        manufacture=false;
        model=false;
        type=true;
        
        NSString *str=[[NSUserDefaults standardUserDefaults]valueForKey:@"db_path"];
        database = [FMDatabase databaseWithPath:str];
        
        [database open];
        
        NSLog(@"model id:%@",modid);
        
        model_type_arr = [[NSMutableArray alloc]init];
        
        price_arr= [[NSMutableArray alloc]init];
    //    DownPayment_arr= [[NSMutableArray alloc]init];
     //   SuggestedLoan_arr= [[NSMutableArray alloc]init];
        Insurance_arr= [[NSMutableArray alloc]init];
        LogisticsCharges_arr= [[NSMutableArray alloc]init];
        RegistrationServiceCharges_arr= [[NSMutableArray alloc]init];

        
        arrayfmdb_id3= [[NSMutableArray alloc]init];
        array_octroi= [[NSMutableArray alloc]init];

        //typeid,modelid,type_name,Prize
        
      //  NSString *newOutput = [NSString stringWithFormat:@"%@ \" = \" %@", @"foo", @"bar"];
       //NSString *newOutput = [NSString stringWithFormat:@"\"%@\" = \"%@\"", @"foo", @"bar"];
       // NSString *queryString = [NSString stringWithFormat:@"select * from category where sub_Category='%@'", appDelegate.subCategory];

        
        
        //FMResultSet *results = [database executeQuery:@"SELECT * FROM tbl_newvehicle_model_type WHERE modelid = ? and Newcar_Octroi = ?",[NSString stringWithFormat:@"%@",modid],[NSString stringWithFormat:@"%@",strr_index]];
        
        [self.segment_btn titleForSegmentAtIndex:self.segment_btn.selectedSegmentIndex];
        NSLog(@"index:%@",[self.segment_btn titleForSegmentAtIndex:self.segment_btn.selectedSegmentIndex]);
        strr_index=[NSString stringWithFormat:@"%@",[self.segment_btn titleForSegmentAtIndex:self.segment_btn.selectedSegmentIndex]];
        NSLog(@"strr_index:%@",strr_index);
        
        

        NSString *newOutputgf = [NSString stringWithFormat:@"\'%@\'",strr_index];
        NSLog(@"newOutputgf:%@",newOutputgf);
        
        NSString *NEWCAROCTROISTRstwr = [NSString stringWithFormat:@"\'%@\'",NEWCAROCTROISTR];
        NSLog(@"NEWCAROCTROISTRstwr:%@",NEWCAROCTROISTRstwr);

     //  FMResultSet *results = [database executeQuery:@"SELECT * FROM tbl_newvehicle_model_type WHERE modelid = 3 AND Newcar_Octroi = 'No'"];
        
         FMResultSet *results = [database executeQuery:@"SELECT * FROM tbl_newvehicle_model_type WHERE modelid = ? and Newcar_Octroi =?",[NSString stringWithFormat:@"%@",modid],[NSString stringWithFormat:@"%@",strr_index]];
        
        
        while ([results next])
        {
            
            NSString *name1 = [results stringForColumn:@"type_name"];
             NSLog(@"name1:%@",name1);
            [model_type_arr addObject:name1];
            NSLog(@"model_type_arr:%@",model_type_arr);
            
           /*[arrayfmdb_id3 addObject:[results stringForColumn:@"typeid"]];
             NSLog(@"arrayfmdb_id3:%@",arrayfmdb_id3);*/
            
            [arrayfmdb_id3 addObject:[results stringForColumn:@"typeid"]];
            NSLog(@"arrayfmdb_id3:%@",arrayfmdb_id3);

            
            
    //fr exshrumprice,totalontoadvalue,downpayment,suggestedloan....
            
            //NSString *prizestr = [results stringForColumn:@"Prize"];
            prizestr = [results stringForColumn:@"Prize"];
            NSLog(@"prizestr:%@",prizestr);
            [price_arr addObject:prizestr];
            NSLog(@"price_arr:%@",price_arr);

           /* DownPaymentstr = [results stringForColumn:@"DownPayment"];
            NSLog(@"DownPaymentstr:%@",DownPaymentstr);
            [DownPayment_arr addObject:DownPaymentstr];

            SuggestLoanAmntStr = [results stringForColumn:@"SuggestedLoanAmnt"];
            NSLog(@"SuggestLoanAmntStr:%@",SuggestLoanAmntStr);
            [SuggestedLoan_arr addObject:SuggestLoanAmntStr];*/


            Insurancestr = [results stringForColumn:@"Newcar_Insurance"];
            NSLog(@"Insurancestr:%@",Insurancestr);
            [Insurance_arr addObject:Insurancestr];
            
            LogisticsChargesStr = [results stringForColumn:@"Newcar_LogisticsCharges"];
            NSLog(@"LogisticsChargesStr:%@",LogisticsChargesStr);
            [LogisticsCharges_arr addObject:LogisticsChargesStr];
            
            RegistrationServiceChargesStr = [results stringForColumn:@"Newcar_RegistrationServiceChargesIncludingRoadTax"];
            NSLog(@"RegistrationServiceChargesStr:%@",RegistrationServiceChargesStr);
            [RegistrationServiceCharges_arr addObject:RegistrationServiceChargesStr];
            

            octroiNostr = [results stringForColumn:@"Newcar_Octroi"];
            NSLog(@"octroiNostr:%@",octroiNostr);
            [octroiNo_arr addObject:octroiNostr];
            
            
            
            /*
        //  [self.segment_btn setSelectedSegmentIndex:0];
            [self.segment_btn titleForSegmentAtIndex:self.segment_btn.selectedSegmentIndex];
            NSLog(@"index:%@",[self.segment_btn titleForSegmentAtIndex:self.segment_btn.selectedSegmentIndex]);
           strr_index=[NSString stringWithFormat:@"%@",[self.segment_btn titleForSegmentAtIndex:self.segment_btn.selectedSegmentIndex]];
            NSLog(@"strr_index:%@",strr_index);*/


            
           /* NSString *txtshowroomstr = [results stringForColumn:@"typeid"];
            NSLog(@"txtshowroomstr:%@",txtshowroomstr);
            [arrayfmdb_id3 addObject:txtshowroomstr];*/
            
            
          //self.txt_show_room_price.text=[NSString stringWithFormat:@"%@",prizestr];
            
            
           /* NSString *prizestr = [results stringForColumn:@"Prize"];
            [price_arr addObject:prizestr];
            NSLog(@"price_arr:%@",price_arr);*/
            
        }
        
        
        if(dropdown2 == nil)
        {
            CGFloat f =40*(model_type_arr.count);
            dropdown2 = [[NIDropDown alloc]showDropDown:sender :&f :model_type_arr :Nil :@"down"];
            dropdown2.delegate = (id)self;
            
            //for hiding remaining 2 dropdowns..
            dropdown.hidden=YES;
            dropdown1.hidden=YES;
            
            
        }
        
        else
        {
           
            [dropdown2 hideDropDown:sender];
            [self rel2];

        }
        
        [database close];
        
    //    [self NEWVEHICLECALC];
        
//        //1 click drpdown..
//        NSString *typestr=[NSString stringWithFormat:@"%@",self.type_btn.currentTitle];
//        NSLog(@"typestr:%@",typestr);
//        
//        [[NSUserDefaults standardUserDefaults] setValue:typestr forKey:@"newcarvehicletype"];
//        [[NSUserDefaults standardUserDefaults]synchronize];
        
    
        
        
        /*
        //implementation of selected particular drpdwn of   TYPE....
        
        if ([[self.type_btn titleForState:UIControlStateNormal] isEqualToString:@"1 Series 116i Hatchback(Petrol)"])
        {
            typestr=[NSString stringWithFormat:@"%@",@"1 Series 116i Hatchback(Petrol)"];
            
            NSLog(@"makestr:%@",typestr);
            
        }
        else if ([[self.type_btn titleForState:UIControlStateNormal] isEqualToString:@"1 Series 118d Hatchback(Diesel)"])
        {
            
            typestr=[NSString stringWithFormat:@"%@",@"1 Series 118d Hatchback(Diesel)"];
            
            NSLog(@"makestr:%@",typestr);
            
        }
        else if ([[self.type_btn titleForState:UIControlStateNormal] isEqualToString:@"3 Series 320d Luxury Line(Diesel)"])
        {
            
            typestr=[NSString stringWithFormat:@"%@",@"3 Series 320d Luxury Line(Diesel)"];
            
            NSLog(@"makestr:%@",typestr);
            
        }
        else if ([[self.type_btn titleForState:UIControlStateNormal] isEqualToString:@"3 Series 320d Sport Line(Diesel)"])
        {
            
            typestr=[NSString stringWithFormat:@"%@",@"3 Series 320d Sport Line(Diesel)"];
            
            NSLog(@"makestr:%@",typestr);
            
        }
        else if ([[self.type_btn titleForState:UIControlStateNormal] isEqualToString:@"2.4 A/T"])
        {
            
            typestr=[NSString stringWithFormat:@"%@",@"2.4 A/T"];
            
            NSLog(@"makestr:%@",typestr);
            
        }
        else if ([[self.type_btn titleForState:UIControlStateNormal] isEqualToString:@"Other"])
        {
            
            typestr=[NSString stringWithFormat:@"%@",@"Other"];
            
            NSLog(@"makestr:%@",typestr);
            
        }
        else if ([[self.type_btn titleForState:UIControlStateNormal] isEqualToString:@"1.2 E MT(i-VTEC) Petrol"])
        {
            
            typestr=[NSString stringWithFormat:@"%@",@"1.2 E MT(i-VTEC) Petrol"];
            
            NSLog(@"makestr:%@",typestr);
            
        }
        else if ([[self.type_btn titleForState:UIControlStateNormal] isEqualToString:@"1.2 EX MT(i-VTEC) Petrol"])
        {
            
            typestr=[NSString stringWithFormat:@"%@",@"1.2 EX MT(i-VTEC) Petrol"];
            
            NSLog(@"makestr:%@",typestr);
            
        }
        else if ([[self.type_btn titleForState:UIControlStateNormal] isEqualToString:@"3.0 S/C Convertible S(ST2 380 PS)"])
        {
            
            typestr=[NSString stringWithFormat:@"%@",@"3.0 S/C Convertible S(ST2 380 PS)"];
            
            NSLog(@"makestr:%@",typestr);
            
        }
        else if ([[self.type_btn titleForState:UIControlStateNormal] isEqualToString:@"3.0 S/C Coupe S(ST1 340 PS)"])
        {
            
            typestr=[NSString stringWithFormat:@"%@",@"3.0 S/C Coupe S(ST1 340 PS)"];
            
            NSLog(@"makestr:%@",typestr);
            
        }
        else if ([[self.type_btn titleForState:UIControlStateNormal] isEqualToString:@"2.0L Petrol luxury"])
        {
            
            typestr=[NSString stringWithFormat:@"%@",@"2.0L Petrol luxury"];
            
            NSLog(@"makestr:%@",typestr);
            
        }
        else if ([[self.type_btn titleForState:UIControlStateNormal] isEqualToString:@"2.2L Diesel Executive Edition"])
        {
            
            typestr=[NSString stringWithFormat:@"%@",@"2.2L Diesel Executive Edition"];
            
            NSLog(@"makestr:%@",typestr);
            
        }
        
        else if ([[self.type_btn titleForState:UIControlStateNormal] isEqualToString:@"3.0L SDV6 Diesel HSE"])
        {
            
            typestr=[NSString stringWithFormat:@"%@",@"3.0L SDV6 Diesel HSE"];
            
            NSLog(@"makestr:%@",typestr);
            
        }
        else if ([[self.type_btn titleForState:UIControlStateNormal] isEqualToString:@"3.0L SDV6 Diesel SE"])
        {
            
            typestr=[NSString stringWithFormat:@"%@",@"3.0L SDV6 Diesel SE"];
            
            NSLog(@"makestr:%@",typestr);
            
        }
        else if ([[self.type_btn titleForState:UIControlStateNormal] isEqualToString:@"2 2.2L TD4 S"])
        {
            
            typestr=[NSString stringWithFormat:@"%@",@"2 2.2L TD4 S"];
            
            NSLog(@"makestr:%@",typestr);
            
        }
        else if ([[self.type_btn titleForState:UIControlStateNormal] isEqualToString:@"2 2.2L TD4 SE Limited Edition"])
        {
            
            typestr=[NSString stringWithFormat:@"%@",@"2 2.2L TD4 SE Limited Edition"];
            
            NSLog(@"makestr:%@",typestr);
            
        }
        
        else if ([[self.type_btn titleForState:UIControlStateNormal] isEqualToString:@"Touring Coupe AT"])
        {
            
            typestr=[NSString stringWithFormat:@"%@",@"Touring Coupe AT"];
            
            NSLog(@"makestr:%@",typestr);
            
        }
        else if ([[self.type_btn titleForState:UIControlStateNormal] isEqualToString:@"Touring Coupe MT"])
        {
            
            typestr=[NSString stringWithFormat:@"%@",@"Touring Coupe MT"];
            
            NSLog(@"makestr:%@",typestr);
            
        }

        else if ([[self.type_btn titleForState:UIControlStateNormal] isEqualToString:@"XE"])
        {
            
            typestr=[NSString stringWithFormat:@"%@",@"XE"];
            
            NSLog(@"makestr:%@",typestr);
            
        }
        else if ([[self.type_btn titleForState:UIControlStateNormal] isEqualToString:@"XE Plus"])
        {
            
            typestr=[NSString stringWithFormat:@"%@",@"XE Plus"];
            
            NSLog(@"makestr:%@",typestr);
            
        }
        
        [[NSUserDefaults standardUserDefaults] setValue:typestr forKey:@"newcarvehicletype"];
        [[NSUserDefaults standardUserDefaults]synchronize];*/

    }

}



- (IBAction)btn_serviceplan:(id)sender
{
    [self dismissKeyboard];

    [self.view removeGestureRecognizer:tap];
    
    manufacture=false;
    model=false;
    type=false;
    
    NSString *str=[[NSUserDefaults standardUserDefaults]valueForKey:@"db_path"];
    database = [FMDatabase databaseWithPath:str];
    
    [database open];
    
    arrayfmdb = [[NSMutableArray alloc]init];
    arrayfmdb_serviceplan= [[NSMutableArray alloc]init];
    
  //  FMResultSet *results = [database executeQuery:@"SELECT * FROM tbl_newvehicle_serviceplan"];
    
    FMResultSet *results = [database executeQuery:@"SELECT * FROM tbl_newvehicle_serviceplan WHERE typeid = ?",[NSString stringWithFormat:@"%@",Typeid]];

    while ([results next])
    {
        
        name = [results stringForColumn:@"NVSP"];
        [arrayfmdb addObject:name];
        NSLog(@"arrayfmdb_serviceplan:%@",arrayfmdb);
        
        
        //for value...
        name_newvwhicleserviplan_value = [results stringForColumn:@"NVSP_value"];
        [arrayfmdb_serviceplan addObject:name_newvwhicleserviplan_value];
        NSLog(@"arrayfmdb_serviceplan:%@",arrayfmdb_serviceplan);
        
    }
    
    
   // self.service_txt.text = arrayfmdb_serviceplan[indexPath.row]
    
        //self.service_txt.text;
    
    
    
    
    
    /*  
     
     [ wrote in nidropdwon method.... ]   :-----
    
    //for vlaues in txtfld...
    NSInteger index=[app.drop_index integerValue];
    NSString * serviceplanStr=[NSString stringWithFormat:@"%@",[arrayfmdb_serviceplan objectAtIndex:index]];
    NSLog(@"serviceplanStr:%@",serviceplanStr);

    self.service_txt.text=serviceplanStr;


    [[NSUserDefaults standardUserDefaults] setValue:self.service_txt.text forKey:@"ServicedropdownTEXTVALUE_newvehicle"];
    [[NSUserDefaults standardUserDefaults]synchronize];
     
     */
    
   

    
    
    if(dropdown == nil)
    {
        CGFloat f =200;
        dropdown = [[NIDropDown alloc]showDropDown:sender :&f :arrayfmdb :Nil :@"down"];
        dropdown.delegate = (id)self;
        
        
        //for hiding remaining 2 dropdowns..
        dropdown1.hidden=YES;
        dropdown2.hidden=YES;

        
    }
    else
    {
        [dropdown hideDropDown:sender];
        [self rel];
    }
    
    [database close];
    
    
    
    /*        
     
     [ wrote in nidropdwon method.... ]   :-----

    NSString *service_str=[NSString stringWithFormat:@"%@",self.servive_btn.currentTitle];
    NSLog(@"service_str:%@",service_str);
    
    [[NSUserDefaults standardUserDefaults] setValue:service_str forKey:@"Servicedropdown_newvehicle"];
    [[NSUserDefaults standardUserDefaults]synchronize];
     
     */
    
    
    
   // [self NEWVEHICLECALC];


}


- (IBAction)btn_extendedwarranty:(id)sender
{
    [self dismissKeyboard];

    [self.view removeGestureRecognizer:tap];
    

    manufacture=false;
    model=false;
    type=false;
    
    
    NSString *str=[[NSUserDefaults standardUserDefaults]valueForKey:@"db_path"];
    database = [FMDatabase databaseWithPath:str];
    
    [database open];
    
    arrayfmdb = [[NSMutableArray alloc]init];
    arrayfmdb_extendedwarranty= [[NSMutableArray alloc]init];

    
    FMResultSet *results = [database executeQuery:@"SELECT * FROM tbl_newvehicle_extendedwarranty WHERE typeid = ?",[NSString stringWithFormat:@"%@",Typeid]];
    
   // FMResultSet *results = [database executeQuery:@"SELECT * FROM tbl_newvehicle_extendedwarranty"];
    
    while ([results next])
    {
        
        name = [results stringForColumn:@"NVEW"];
        [arrayfmdb addObject:name];
        NSLog(@"arr:%@",arrayfmdb);
        
        
        
        //for values..
        name_newvwhicle_extendedwarranty = [results stringForColumn:@"NVEW_value"];
        [arrayfmdb_extendedwarranty addObject:name_newvwhicle_extendedwarranty];
        NSLog(@"arrayfmdb_extendedwarranty:%@",arrayfmdb_extendedwarranty);

        
    }
    
    
    
    /*
    //for vlaues in txtfld...
    NSInteger index=[app.drop_index integerValue];
    NSString * extwarrtyStr=[NSString stringWithFormat:@"%@",[arrayfmdb_extendedwarranty objectAtIndex:index]];
    NSLog(@"extwarrtyStr:%@",extwarrtyStr);
    
    self.extented_txt.text=extwarrtyStr;
    
    
    [[NSUserDefaults standardUserDefaults] setValue:self.extented_txt.text forKey:@"ExtendedropdownTEXTVALUE_newvehicle"];
    [[NSUserDefaults standardUserDefaults]synchronize];
*/

    
    if(dropdown == nil)
    {
        CGFloat f =80;
        dropdown = [[NIDropDown alloc]showDropDown:sender :&f :arrayfmdb :Nil :@"down"];
        dropdown.delegate = (id)self;
        
        
        //for hiding remaining 2 dropdowns..
        dropdown1.hidden=YES;
        dropdown2.hidden=YES;
        
        
    }
    else
    {
        [dropdown hideDropDown:sender];
        [self rel];
    }
    
    [database close];

    
    
    /*
    NSString *extendedwarranty_str=[NSString stringWithFormat:@"%@",self.extended_warrenty_btn.currentTitle];
    NSLog(@"extendedwarranty_str:%@",extendedwarranty_str);
    
    [[NSUserDefaults standardUserDefaults] setValue:extendedwarranty_str forKey:@"extendedwarranty_newvehicle"];
    [[NSUserDefaults standardUserDefaults]synchronize];*/
    
   // [self NEWVEHICLECALC];

    
}


@end

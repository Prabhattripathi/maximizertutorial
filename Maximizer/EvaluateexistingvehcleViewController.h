//
//  EvaluateexistingvehcleViewController.h
//  Maximizer
//
//  Created by Genie Technology on 08/08/15.
//  Copyright (c) 2015 Genie Soft Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"



@interface EvaluateexistingvehcleViewController : UIViewController<UIDocumentInteractionControllerDelegate,MBProgressHUDDelegate>
@property (strong, nonatomic) IBOutlet UIButton *manufacture_btn;
@property (strong, nonatomic) IBOutlet UIButton *model_btn;
@property (strong, nonatomic) IBOutlet UIButton *modeltype_btn;
@property (strong, nonatomic) IBOutlet UIButton *datebtn;
@property (strong, nonatomic) IBOutlet UIButton *month_btn;
@property (strong, nonatomic) IBOutlet UIButton *owner_btn;
@property (strong, nonatomic) IBOutlet UIButton *color_btn;
@property (strong, nonatomic) IBOutlet UIButton *remian_insurance_btn;
@property (strong, nonatomic) IBOutlet UIButton *market_demnad_btn;
@property (strong, nonatomic) IBOutlet UIButton *kms_btn;
@property (strong, nonatomic) IBOutlet UISlider *slider;
@property (strong, nonatomic) IBOutlet UIView *offerprice_view;
@property (strong, nonatomic) IBOutlet UIView *slider_amount_view;
@property (strong, nonatomic) IBOutlet UIButton *sharebtn;
@property (strong, nonatomic) IBOutlet UIView *onroadvalue_view;
@property (strong, nonatomic) IBOutlet UIButton *next_btn;
@property (strong, nonatomic) IBOutlet UIButton *menubtn;

@property (strong, nonatomic) IBOutlet UIButton *estimate_btn;
@property (strong, nonatomic) IBOutlet UIScrollView *scroll;
- (IBAction)valuchangedcliked:(id)sender;
- (IBAction)accidentialcliked:(id)sender;
- (IBAction)fuelcliked:(id)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *valuesgement;
@property (weak, nonatomic) IBOutlet UISegmentedControl *accidentail_segment;
@property (weak, nonatomic) IBOutlet UISegmentedControl *fuel_segment;
- (IBAction)homecliekd:(id)sender;
- (IBAction)logoutcliked:(id)sender;
- (IBAction)nextcliked:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *txt_roadvalue;
@property (strong, nonatomic) IBOutlet UITextField *txt_value1;
@property (strong, nonatomic) IBOutlet UITextField *txt_pricebymax;


- (IBAction)btn_manufacturer:(id)sender;
- (IBAction)btn_model:(id)sender;
- (IBAction)btn_VMT:(id)sender;
- (IBAction)btn_date:(id)sender;
- (IBAction)btn_month:(id)sender;
- (IBAction)btn_owner:(id)sender;
- (IBAction)btn_color:(id)sender;
- (IBAction)btn_RI:(id)sender;
- (IBAction)btn_MDOV:(id)sender;
- (IBAction)btn_KMS:(id)sender;
- (IBAction)btn_EstimationBy:(id)sender;












/*tradein---
 
 1) for insert data on submit button when net is avail
 //http://maximizer.mdei.info/jlrmaximizer_p2
 
 http://maximizer.mdei.info/jlrmaximizer_p2/api/api/insert_tradein_vehicle?data={"uid":"DLR139","custid":"39",
 "salutation":"Mr","fname":"manmeet","lname":"singh","email":"manmeet@gmail.com","phone":"7678321436",
 "cc_email":"heena@gmail.com","report_id":"R52233","newcar_make":"Jaguar",
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
 
 
 2)for sync all tradein data
 
 http://localhost/jlrmaximizer_p2/api/api/getAllTradeindata
 
 3)for sync data send data from local to server database in for loop
 
 localhost/jlrmaximizer_p2/api/api/sync_tradein_vehicle?data={"uid":"DLR139","custid":"39",
 "salutation":"Mr","fname":"manmeet","lname":"singh","email":"manmeet@gmail.com","phone":"7678321436",
 "cc_email":"heena@gmail.com","report_id":"R52233","newcar_make":"Jaguar",
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






/*used:--
 
 1)for insert used car data on submit if net is avail
 
 localhost/jlrmaximizer_p2/api/api/insert_usedcar_vehicle?data={"uid":"DLR139","custid":"40",
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
 
 
 2)get all data from server database to local database
 
 http://localhost/jlrmaximizer_p2/api/api/getAllUsedcardata
 
 
 3)for sync data from local db to server db when net is avail
 
 localhost/jlrmaximizer_p2/api/api/sync_usedcar_vehicle?data={"uid":"DLR139","custid":"40",
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





@end

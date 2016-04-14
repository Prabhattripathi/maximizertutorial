//
//  NewvehcleViewController.h
//  Maximizer
//
//  Created by Genie Technology on 08/08/15.
//  Copyright (c) 2015 Genie Soft Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewvehcleViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIScrollView *scroll;
@property (strong, nonatomic) IBOutlet UIButton *make_btn;
@property (strong, nonatomic) IBOutlet UIButton *model_btn;
@property (strong, nonatomic) IBOutlet UIButton *type_btn;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segment_btn;
@property (strong, nonatomic) IBOutlet UIView *shworoomprice_view;
@property (strong, nonatomic) IBOutlet UIView *insurance_view;
@property (strong, nonatomic) IBOutlet UIView *logstic_view;
@property (strong, nonatomic) IBOutlet UIView *road_tax_view;
@property (strong, nonatomic) IBOutlet UIButton *servive_btn;
@property (strong, nonatomic) IBOutlet UIButton *servie_btn1;
@property (strong, nonatomic) IBOutlet UIButton *extended_warrenty_btn;
@property (strong, nonatomic) IBOutlet UIButton *extendetd_warrenty_btn1;
@property (strong, nonatomic) IBOutlet UISlider *slider;
@property (strong, nonatomic) IBOutlet UIView *slider_view;
@property (strong, nonatomic) IBOutlet UIView *benifit_view;
@property (strong, nonatomic) IBOutlet UIView *total_road_val_view;
@property (strong, nonatomic) IBOutlet UIView *balance_trade_after_loan_view;
@property (strong, nonatomic) IBOutlet UIView *down_pay_view;
@property (strong, nonatomic) IBOutlet UIButton *backbtn;
@property (strong, nonatomic) IBOutlet UIButton *nextbtn;
@property (strong, nonatomic) IBOutlet UIView *load_amount_view;
- (IBAction)backbtncliked:(id)sender;
- (IBAction)nextcliked:(id)sender;
- (IBAction)segmentcliked:(id)sender;
- (IBAction)homecliked:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *menubtn;
- (IBAction)sharebtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *sharebtn;
- (IBAction)sharebtncliked:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *txt_show_room_price;
@property (strong, nonatomic) IBOutlet UITextField *txt_insurance;
@property (strong, nonatomic) IBOutlet UITextField *txt_logistic_charges;
@property (strong, nonatomic) IBOutlet UITextField *txt_RSCIRT;
@property (strong, nonatomic) IBOutlet UITextField *txt_value1;
@property (strong, nonatomic) IBOutlet UITextField *txt_benifitTC;
@property (strong, nonatomic) IBOutlet UITextField *txt_TORV;
@property (strong, nonatomic) IBOutlet UITextField *txt_balance_trade;
@property (strong, nonatomic) IBOutlet UITextField *txt_down_payment;
@property (strong, nonatomic) IBOutlet UIView *extented_view;
@property (strong, nonatomic) IBOutlet UITextField *txt_suggested_loan_amt;

@property (strong, nonatomic) IBOutlet UITextField *extented_txt;
@property (strong, nonatomic) IBOutlet UITextField *service_txt;
@property (strong, nonatomic) IBOutlet UIView *service_view;


- (IBAction)btn_Make:(id)sender;
- (IBAction)btn_vehicleModel:(id)sender;
- (IBAction)btn_selectType:(id)sender;




- (IBAction)btn_serviceplan:(id)sender;
- (IBAction)btn_extendedwarranty:(id)sender;




/*newvhicle..
 
 1)get all retail finance which is common for new car and tradein
 
 http://localhost/jlrmaximizer_p2/api/api/get_Retail_Finance
 
 2)get all manufacturer for drop down
 
 http://localhost/jlrmaximizer_p2/api/api/getAllManufacturer
 
 3)get all model based on manufacturer
 
 http://localhost/jlrmaximizer_p2/api/api/getModel?data={%22manufacturer%22:%22Toyota%22}
 
 4) get all type based on model
 
 http://localhost/jlrmaximizer_p2/api/api/getModel_type?data={%22model%22:%22A3%22}
 
 
 
 
 5)for new car drop down for new car make
 
 http://localhost/jlrmaximizer_p2/api/api/getNewvehicalMake?data={%22dlrid%22:%22dlr124%22}
 
 6) for new car drop down for new car model based on make
 
 http://localhost/jlrmaximizer_p2/api/api/getNewvehicalModel?data={%22dlrid%22:%22dlr124%22,%22car_make%22:%22Land%20Rover%22}
 
 7) for insert new car data when net is avail
 
 localhost/jlrmaximizer_p2/api/api/insert_newcar_vehicle?data={"uid":"DLR139","custid":"32",
 "salutation":"Mr","fname":"nanu","lname":"parab","email":"eknath@gmail.com","phone":"7678321436",
 "cc_email":"heena@gmail.com", "report_id":"R53765233","newcar_make":"Jaguar",
 "newcar_model":"F-Type","newcar_model_type":"3.0 S/C Coupe S (ST2 380 PS)","ex_showroom_price":"13766186",
 "insurance":"13766186","logistics_charges":"0","registration_charges":"0","accessories":"0",
 "service_plan":"3 year Solitaire","service_plan_amount":"0","ext_warranty":"4th yr upto 125000 Kms",
 "ext_warranty_amount":"81532","total_onroad_amount":"13847718",
 "net_transaction_amount":"12557162","expected_time":"13-12-2016","expected_budget":"2000000",
 "octroi":"no","customer_discount":"0","downpayment":"81532","sugg_loan_amount":"11003630",
 "options":"total_outflow,interest_rate,down_payment,emi_value,loan_tenure_years",
 "scheme1":"12807820,9.7,81532,353508,3 Years",
 "scheme2":"13401436,9.7,81532,277498,4 Years",
 "scheme3":"14011972,9.7,81532,232174,5 Years",
 "scheme4":"15283180,9.7,81532,180972,7 Years"}
 
 8)for get alll new car data to save on local data base
 
 http://localhost/jlrmaximizer_p2/api/api/getAllNewcardata
 
 
 9)for sync data from local data base to server database in for loop
 
 
 localhost/jlrmaximizer_p2/api/api/sync_newcar_vehicle?data={"uid":"DLR139","custid":"32",
 "salutation":"Mr","fname":"nanu","lname":"parab","email":"eknath@gmail.com","phone":"7678321436",
 "cc_email":"heena@gmail.com", "report_id":"R53765233","newcar_make":"Jaguar",
 "newcar_model":"F-Type","newcar_model_type":"3.0 S/C Coupe S (ST2 380 PS)","ex_showroom_price":"13766186",
 "insurance":"13766186","logistics_charges":"0","registration_charges":"0","accessories":"0",
 "service_plan":"3 year Solitaire","service_plan_amount":"0","ext_warranty":"4th yr upto 125000 Kms",
 "ext_warranty_amount":"81532","total_onroad_amount":"13847718",
 "net_transaction_amount":"12557162","expected_time":"13-12-2016","expected_budget":"2000000",
 "octroi":"no","customer_discount":"0","downpayment":"81532","sugg_loan_amount":"11003630",
 "options":"total_outflow,interest_rate,down_payment,emi_value,loan_tenure_years",
 "scheme1":"12807820,9.7,81532,353508,3 Years",
 "scheme2":"13401436,9.7,81532,277498,4 Years",
 "scheme3":"14011972,9.7,81532,232174,5 Years",
 "scheme4":"15283180,9.7,81532,180972,7 Years"}
 
 */





@end

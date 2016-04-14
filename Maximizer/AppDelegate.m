//
//  AppDelegate.m
//  Maximizer
//
//  Created by Genie Technology on 07/08/15.
//  Copyright (c) 2015 Genie Soft Systems. All rights reserved.
//

#import "AppDelegate.h"
#import "Reachability.h"
#include <netdb.h>



@implementation AppDelegate

{
    FMDatabase *database;
    NSString *rateIntrst3yrs,*rateIntrst4yrs,*rateIntrst5yrs,*rateIntrst7yrs,*rep1300,*rep1300_newvehicleflow;
    
    NSMutableArray * array1, * array2;

}





- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    
    
   //
    
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:
     (UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)];
    
    //
    
    
    if(![[NSUserDefaults standardUserDefaults]boolForKey:@"firsttime"])
    {
        
        [[NSUserDefaults standardUserDefaults]setBool:true forKey:@"firsttime"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docsPath = [paths objectAtIndex:0];
        NSString *path = [docsPath stringByAppendingPathComponent:@"maximizer.sqlite"];
        
        NSLog(@"path:%@",path);
        
        
        [[NSUserDefaults standardUserDefaults]setObject:path forKey:@"db_path"];
        [[NSUserDefaults standardUserDefaults]synchronize];
     
        
        database = [FMDatabase databaseWithPath:path];
        
        [database open];
        
        // Create user_table...
        
        // [database executeUpdate:@"create table user_table(Id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, Userid int, Name varchar, Username varchar, Password varchar,  EmailID varchar, Contact_No varchar, Address varchar, City varchar, State varchar, Pincode int, Department varchar, Checkname varchar, Created_on varchar, Modified_on varchar, Status varchar, Type varchar, DealerID varchar, Login_status varchar)"];
        
        /*[database executeUpdate:@"create table tbl_user(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, userid int, name varchar, username varchar, password varchar,  emailid varchar, contactno varchar, address varchar, city varchar, state varchar, pincode varchar, department varchar, checkname varchar, created_on varchar, modified_on varchar, status varchar, type varchar, dealerID varchar, login_status varchar)"];*/
        
        [database executeUpdate:@"create table tbl_user(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, userid int, Fname varchar, Lname varchar ,username varchar, password varchar,  emailid varchar, contactno varchar, address varchar, city varchar, state varchar, pincode varchar, department varchar, checkname varchar, created_on varchar, modified_on varchar, status varchar, type varchar, dealerID varchar, login_status varchar, Zone varchar, Suspended varchar, Zonehead varchar)"];

        
        [database executeUpdate:@"insert into tbl_user(userid, Fname, Lname, username, password, emailid, contactno, address, city, state, pincode, department, checkname, created_on, modified_on, status, type, dealerID, login_status, Zone, Suspended, Zonehead) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",[NSNumber numberWithInt:1],@"Genie Test",@"",@"G123",@"123",@"Gtest@gmail.com",@"",@"",@"",@"",@"",@"",@"",@"19/08/2015",@"",@"Active",@"normal user",@"1",@"0",@"",@"",@"",nil];
        
        
        
        // create manufacture table.(UNDER EVALUATION VC)
        
        [database executeUpdate:@"create table tbl_manufacturure(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, brandname varchar)"];
        
        
        [database executeUpdate:@"insert into tbl_manufacturure(brandname) values(?)",@"Audi",nil];
        
        [database executeUpdate:@"insert into tbl_manufacturure(brandname) values(?)",@"Bently",nil];
        
        [database executeUpdate:@"insert into tbl_manufacturure(brandname) values(?)",@"BMW",nil];
        
        [database executeUpdate:@"insert into tbl_manufacturure(brandname) values(?)",@"Chervolet",nil];
        
        [database executeUpdate:@"insert into tbl_manufacturure(brandname) values(?)",@"Ford",nil];
        
        [database executeUpdate:@"insert into tbl_manufacturure(brandname) values(?)",@"Honda",nil];
        
        [database executeUpdate:@"insert into tbl_manufacturure(brandname) values(?)",@"Hyundai",nil];
        
        [database executeUpdate:@"insert into tbl_manufacturure(brandname) values(?)",@"jaguar",nil];
        
        
        
        
        // create model table.(UNDER EVALUATION VC)
        
        
         [database executeUpdate:@"create table tbl_model(modelid INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, manufacturureid int, model_name varchar)"];
        
        [database executeUpdate:@"insert into tbl_model(modelid,manufacturureid, model_name) values(?,?,?)",[NSNumber numberWithInt:1],[NSNumber numberWithInt:1],@"A3",nil];
        
        [database executeUpdate:@"insert into tbl_model(modelid,manufacturureid, model_name) values(?,?,?)",[NSNumber numberWithInt:2],[NSNumber numberWithInt:1],@"Cabriolet",nil];
        
        [database executeUpdate:@"insert into tbl_model(modelid,manufacturureid, model_name) values(?,?,?)",[NSNumber numberWithInt:3],[NSNumber numberWithInt:2],@"Continental Flying Spur",nil];
        [database executeUpdate:@"insert into tbl_model(modelid,manufacturureid, model_name) values(?,?,?)",[NSNumber numberWithInt:4],[NSNumber numberWithInt:2],@"Continental GT",nil];
        [database executeUpdate:@"insert into tbl_model(modelid,manufacturureid, model_name) values(?,?,?)",[NSNumber numberWithInt:5],[NSNumber numberWithInt:3],@"1 Serires",nil];
         [database executeUpdate:@"insert into tbl_model(modelid,manufacturureid, model_name) values(?,?,?)",[NSNumber numberWithInt:6],[NSNumber numberWithInt:3],@"3 Serires",nil];
         [database executeUpdate:@"insert into tbl_model(modelid,manufacturureid, model_name) values(?,?,?)",[NSNumber numberWithInt:7],[NSNumber numberWithInt:4],@"AVEO",nil];
        [database executeUpdate:@"insert into tbl_model(modelid,manufacturureid, model_name) values(?,?,?)",[NSNumber numberWithInt:8],[NSNumber numberWithInt:4],@"AVEO U-VA",nil];
        [database executeUpdate:@"insert into tbl_model(modelid,manufacturureid, model_name) values(?,?,?)",[NSNumber numberWithInt:9],[NSNumber numberWithInt:5],@"Endeavor",nil];
        [database executeUpdate:@"insert into tbl_model(modelid,manufacturureid, model_name) values(?,?,?)",[NSNumber numberWithInt:10],[NSNumber numberWithInt:5],@"Fiesta",nil];
        [database executeUpdate:@"insert into tbl_model(modelid,manufacturureid, model_name) values(?,?,?)",[NSNumber numberWithInt:11],[NSNumber numberWithInt:6],@"Accord",nil];
        [database executeUpdate:@"insert into tbl_model(modelid,manufacturureid, model_name) values(?,?,?)",[NSNumber numberWithInt:12],[NSNumber numberWithInt:6],@"Amaze",nil];
        [database executeUpdate:@"insert into tbl_model(modelid,manufacturureid, model_name) values(?,?,?)",[NSNumber numberWithInt:13],[NSNumber numberWithInt:7],@"Accent",nil];
        [database executeUpdate:@"insert into tbl_model(modelid,manufacturureid, model_name) values(?,?,?)",[NSNumber numberWithInt:14],[NSNumber numberWithInt:7],@"EON",nil];
        [database executeUpdate:@"insert into tbl_model(modelid,manufacturureid, model_name) values(?,?,?)",[NSNumber numberWithInt:15],[NSNumber numberWithInt:8],@"F-type",nil];
        [database executeUpdate:@"insert into tbl_model(modelid,manufacturureid, model_name) values(?,?,?)",[NSNumber numberWithInt:16],[NSNumber numberWithInt:8],@"XF",nil];
        
        
        
        
        // create type tabel.(UNDER EVALUATION VC)
        
        [database executeUpdate:@"create table tbl_model_type(typeid INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, modelid int, type_name varchar)"];
        
        
        // 1.audi
        [database executeUpdate:@"insert into tbl_model_type(typeid,modelid, type_name) values(?,?,?)",[NSNumber numberWithInt:1],[NSNumber numberWithInt:1],@"3 5DTI Attraction",nil];
        [database executeUpdate:@"insert into tbl_model_type(typeid,modelid, type_name) values(?,?,?)",[NSNumber numberWithInt:2],[NSNumber numberWithInt:1],@"3 5DTI Premium",nil];
        
        [database executeUpdate:@"insert into tbl_model_type(typeid,modelid, type_name) values(?,?,?)",[NSNumber numberWithInt:3],[NSNumber numberWithInt:2],@"40 TFSI",nil];
        [database executeUpdate:@"insert into tbl_model_type(typeid,modelid, type_name) values(?,?,?)",[NSNumber numberWithInt:4],[NSNumber numberWithInt:2],@"Other",nil];
        
        // 2.bently
        [database executeUpdate:@"insert into tbl_model_type(typeid,modelid, type_name) values(?,?,?)",[NSNumber numberWithInt:5],[NSNumber numberWithInt:3],@"Continental Flying Spur V8(Petrol)",nil];
        [database executeUpdate:@"insert into tbl_model_type(typeid,modelid, type_name) values(?,?,?)",[NSNumber numberWithInt:6],[NSNumber numberWithInt:3],@"Continental Flying Spur W12(Petrol)",nil];
        
        [database executeUpdate:@"insert into tbl_model_type(typeid,modelid, type_name) values(?,?,?)",[NSNumber numberWithInt:7],[NSNumber numberWithInt:4],@"Continental GT Coupe(Petrol)",nil];
        [database executeUpdate:@"insert into tbl_model_type(typeid,modelid, type_name) values(?,?,?)",[NSNumber numberWithInt:8],[NSNumber numberWithInt:4],@"Continental GT Speed",nil];
        
        
        // 3.BMW
        [database executeUpdate:@"insert into tbl_model_type(typeid,modelid, type_name) values(?,?,?)",[NSNumber numberWithInt:9],[NSNumber numberWithInt:5],@"1 Series 116I Hatch Back(Petrol)",nil];
        [database executeUpdate:@"insert into tbl_model_type(typeid,modelid, type_name) values(?,?,?)",[NSNumber numberWithInt:10],[NSNumber numberWithInt:5],@"1 Series 118I Hatch Back(Diesel)",nil];
        
        [database executeUpdate:@"insert into tbl_model_type(typeid,modelid, type_name) values(?,?,?)",[NSNumber numberWithInt:11],[NSNumber numberWithInt:6],@"3 Series 320 Luxury Line(Diesel)",nil];
        [database executeUpdate:@"insert into tbl_model_type(typeid,modelid, type_name) values(?,?,?)",[NSNumber numberWithInt:12],[NSNumber numberWithInt:6],@"3 Series 320 Sport Line(Diesel)",nil];
        
        
        //4.Chevrolet
        [database executeUpdate:@"insert into tbl_model_type(typeid,modelid, type_name) values(?,?,?)",[NSNumber numberWithInt:13],[NSNumber numberWithInt:7],@"1.4",nil];
        [database executeUpdate:@"insert into tbl_model_type(typeid,modelid, type_name) values(?,?,?)",[NSNumber numberWithInt:14],[NSNumber numberWithInt:7],@"1.4 LS",nil];
        
        [database executeUpdate:@"insert into tbl_model_type(typeid,modelid, type_name) values(?,?,?)",[NSNumber numberWithInt:15],[NSNumber numberWithInt:8],@"1.2",nil];
        [database executeUpdate:@"insert into tbl_model_type(typeid,modelid, type_name) values(?,?,?)",[NSNumber numberWithInt:16],[NSNumber numberWithInt:8],@"1.2 LS",nil];
        
        
        //5.Ford
        [database executeUpdate:@"insert into tbl_model_type(typeid,modelid, type_name) values(?,?,?)",[NSNumber numberWithInt:17],[NSNumber numberWithInt:9],@"4*2 Club Series",nil];
        [database executeUpdate:@"insert into tbl_model_type(typeid,modelid, type_name) values(?,?,?)",[NSNumber numberWithInt:18],[NSNumber numberWithInt:9],@"4*4 Club Series",nil];
        
        [database executeUpdate:@"insert into tbl_model_type(typeid,modelid, type_name) values(?,?,?)",[NSNumber numberWithInt:19],[NSNumber numberWithInt:10],@"1.4 Duratec EXI",nil];
        [database executeUpdate:@"insert into tbl_model_type(typeid,modelid, type_name) values(?,?,?)",[NSNumber numberWithInt:20],[NSNumber numberWithInt:10],@"1.4 Duratec ZX",nil];
        
        
        //6.Honda
        [database executeUpdate:@"insert into tbl_model_type(typeid,modelid, type_name) values(?,?,?)",[NSNumber numberWithInt:21],[NSNumber numberWithInt:11],@"2.4 A/T",nil];
        [database executeUpdate:@"insert into tbl_model_type(typeid,modelid, type_name) values(?,?,?)",[NSNumber numberWithInt:22],[NSNumber numberWithInt:11],@"Other",nil];
        
        [database executeUpdate:@"insert into tbl_model_type(typeid,modelid, type_name) values(?,?,?)",[NSNumber numberWithInt:23],[NSNumber numberWithInt:12],@"1.2 E MT(i_VTEC)",nil];
        [database executeUpdate:@"insert into tbl_model_type(typeid,modelid, type_name) values(?,?,?)",[NSNumber numberWithInt:24],[NSNumber numberWithInt:12],@"1.2 EX MT(i_VTEC)",nil];
        
        
        //7.Hyundai
        [database executeUpdate:@"insert into tbl_model_type(typeid,modelid, type_name) values(?,?,?)",[NSNumber numberWithInt:25],[NSNumber numberWithInt:13],@"Executive",nil];
        [database executeUpdate:@"insert into tbl_model_type(typeid,modelid, type_name) values(?,?,?)",[NSNumber numberWithInt:26],[NSNumber numberWithInt:13],@"Executive-LPG",nil];
        
        [database executeUpdate:@"insert into tbl_model_type(typeid,modelid, type_name) values(?,?,?)",[NSNumber numberWithInt:27],[NSNumber numberWithInt:14],@"D_Lite(M)",nil];
        [database executeUpdate:@"insert into tbl_model_type(typeid,modelid, type_name) values(?,?,?)",[NSNumber numberWithInt:28],[NSNumber numberWithInt:14],@"D_Lite(S)",nil];
        
        
        //8.Jaguar
        [database executeUpdate:@"insert into tbl_model_type(typeid,modelid, type_name) values(?,?,?)",[NSNumber numberWithInt:29],[NSNumber numberWithInt:15],@"F_Type Coupe(Petrol)",nil];
        [database executeUpdate:@"insert into tbl_model_type(typeid,modelid, type_name) values(?,?,?)",[NSNumber numberWithInt:30],[NSNumber numberWithInt:15],@"F_Type R(Petrol)",nil];
        
        [database executeUpdate:@"insert into tbl_model_type(typeid,modelid, type_name) values(?,?,?)",[NSNumber numberWithInt:31],[NSNumber numberWithInt:16],@"XF 2.2 Diesel Luxury(Diesel)",nil];
        [database executeUpdate:@"insert into tbl_model_type(typeid,modelid, type_name) values(?,?,?)",[NSNumber numberWithInt:32],[NSNumber numberWithInt:16],@"XF 2.2 Diesel(Diesel)",nil];
        
        
        
        
        
        
        
        // create date table.
        
        [database executeUpdate:@"create table tbl_year_purchase(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, date varchar)"];
        
        
        
        [database executeUpdate:@"insert into tbl_year_purchase(date) values(?)",@"2005",nil];
        
        [database executeUpdate:@"insert into tbl_year_purchase(date) values(?)",@"2006",nil];
        
        [database executeUpdate:@"insert into tbl_year_purchase(date) values(?)",@"2007",nil];
        
        [database executeUpdate:@"insert into tbl_year_purchase(date) values(?)",@"2008",nil];
        
        [database executeUpdate:@"insert into tbl_year_purchase(date) values(?)",@"2009",nil];
        
        [database executeUpdate:@"insert into tbl_year_purchase(date) values(?)",@"2010",nil];
        
        [database executeUpdate:@"insert into tbl_year_purchase(date) values(?)",@"2011",nil];
        
        [database executeUpdate:@"insert into tbl_year_purchase(date) values(?)",@"2012",nil];
        
        [database executeUpdate:@"insert into tbl_year_purchase(date) values(?)",@"2013",nil];
        
        [database executeUpdate:@"insert into tbl_year_purchase(date) values(?)",@"2014",nil];
        
        [database executeUpdate:@"insert into tbl_year_purchase(date) values(?)",@"2015",nil];
        
        
        
        
        
        //create month table
        
        [database executeUpdate:@"create table tbl_month_purchase(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, month varchar)"];
        
        
        
        [database executeUpdate:@"insert into tbl_month_purchase(month) values(?)",@"January",nil];
        
        [database executeUpdate:@"insert into tbl_month_purchase(month) values(?)",@"february",nil];
        
        [database executeUpdate:@"insert into tbl_month_purchase(month) values(?)",@"March",nil];
        
        [database executeUpdate:@"insert into tbl_month_purchase(month) values(?)",@"April",nil];
        
        [database executeUpdate:@"insert into tbl_month_purchase(month) values(?)",@"May",nil];
        
        [database executeUpdate:@"insert into tbl_month_purchase(month) values(?)",@"June",nil];
        
        [database executeUpdate:@"insert into tbl_month_purchase(month) values(?)",@"July",nil];
        
        [database executeUpdate:@"insert into tbl_month_purchase(month) values(?)",@"August",nil];
        
        [database executeUpdate:@"insert into tbl_month_purchase(month) values(?)",@"September",nil];
        
        [database executeUpdate:@"insert into tbl_month_purchase(month) values(?)",@"October",nil];
        
        [database executeUpdate:@"insert into tbl_month_purchase(month) values(?)",@"November",nil];
        
        [database executeUpdate:@"insert into tbl_month_purchase(month) values(?)",@"December",nil];
        
        
        
        
        // create owner table 
        
        [database executeUpdate:@"create table tbl_owner(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, owner varchar)"];
        
        
        
        [database executeUpdate:@"insert into tbl_owner(owner) values(?)",@"1",nil];
        
        [database executeUpdate:@"insert into tbl_owner(owner) values(?)",@"2",nil];
        
        [database executeUpdate:@"insert into tbl_owner(owner) values(?)",@"3",nil];
        
        
        
        
        
        // create color table.
        
        [database executeUpdate:@"create table tbl_Color(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,color varchar)"];
        
        
        
        [database executeUpdate:@"insert into tbl_Color(color) values(?)",@"Blue",nil];
        
        [database executeUpdate:@"insert into tbl_Color(color) values(?)",@"Red",nil];
        
        [database executeUpdate:@"insert into tbl_Color(color) values(?)",@"Black",nil];
        
        [database executeUpdate:@"insert into tbl_Color(color) values(?)",@"White",nil];
        
        [database executeUpdate:@"insert into tbl_Color(color) values(?)",@"Silver",nil];
        
        [database executeUpdate:@"insert into tbl_Color(color) values(?)",@"Green",nil];
        
        [database executeUpdate:@"insert into tbl_Color(color) values(?)",@"Orange",nil];
        
        [database executeUpdate:@"insert into tbl_Color(color) values(?)",@"Yellow",nil];
        
        [database executeUpdate:@"insert into tbl_Color(color) values(?)",@"Purple",nil];
        
        [database executeUpdate:@"insert into tbl_Color(color) values(?)",@"Others",nil];
        
        
        
        
        // create Remaining Insurance table...
        
        [database executeUpdate:@"create table tbl_remaining_insurance(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, ri varchar)"];
    
        
        
        
        [database executeUpdate:@"insert into tbl_remaining_insurance(ri) values(?)",@"10 months",nil];
        
        [database executeUpdate:@"insert into tbl_remaining_insurance(ri) values(?)",@"6 months",nil];
        
        [database executeUpdate:@"insert into tbl_remaining_insurance(ri) values(?)",@"4 months",nil];
        
        [database executeUpdate:@"insert into tbl_remaining_insurance(ri) values(?)",@"0 months",nil];
        
        
        
        
        
        
        // create market demand ..mdov table.
        
        [database executeUpdate:@"create table tbl_market_demand_vehicle(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, mdov varchar)"];
        
        
        [database executeUpdate:@"insert into tbl_market_demand_vehicle(mdov) values(?)",@"Fast",nil];
        [database executeUpdate:@"insert into tbl_market_demand_vehicle(mdov) values(?)",@"Average",nil];
        [database executeUpdate:@"insert into tbl_market_demand_vehicle(mdov) values(?)",@"Slow",nil];
        
        
        
        
        //create KMS table...
        
        [database executeUpdate:@"create table tbl_kms(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,kms varchar)"];
        
        
        
        /*
        [database executeUpdate:@"insert into tbl_kms(kms) values(?)",@"0-10000",nil];
        
        [database executeUpdate:@"insert into tbl_kms(kms) values(?)",@"10000-15000",nil];
        
        [database executeUpdate:@"insert into tbl_kms(kms) values(?)",@"15000-20000",nil];
        
        [database executeUpdate:@"insert into tbl_kms(kms) values(?)",@"20000-25000",nil];
        
        [database executeUpdate:@"insert into tbl_kms(kms) values(?)",@"25000-30000",nil];
        
        [database executeUpdate:@"insert into tbl_kms(kms) values(?)",@"30000-35000",nil];
        
        [database executeUpdate:@"insert into tbl_kms(kms) values(?)",@"35000-40000",nil];
        
        [database executeUpdate:@"insert into tbl_kms(kms) values(?)",@"40000-45000",nil];
        
        [database executeUpdate:@"insert into tbl_kms(kms) values(?)",@"50000-60000",nil];
        
        [database executeUpdate:@"insert into tbl_kms(kms) values(?)",@"60000-70000",nil];
        
        [database executeUpdate:@"insert into tbl_kms(kms) values(?)",@"70000-80000",nil];
        
        [database executeUpdate:@"insert into tbl_kms(kms) values(?)",@"90000-100000",nil];
        
        [database executeUpdate:@"insert into tbl_kms(kms) values(?)",@"100000-200000",nil];
        
        [database executeUpdate:@"insert into tbl_kms(kms) values(?)",@"200000-300000",nil];
        
        [database executeUpdate:@"insert into tbl_kms(kms) values(?)",@"300000-400000",nil];
        
        [database executeUpdate:@"insert into tbl_kms(kms) values(?)",@"400000-500000",nil];
        */
        
        [database executeUpdate:@"insert into tbl_kms(kms) values(?)",@"0-10000",nil];
        
        [database executeUpdate:@"insert into tbl_kms(kms) values(?)",@"10000-15000",nil];
        
        [database executeUpdate:@"insert into tbl_kms(kms) values(?)",@"15000-25000",nil];
        
        [database executeUpdate:@"insert into tbl_kms(kms) values(?)",@"25000-35000",nil];
        
        [database executeUpdate:@"insert into tbl_kms(kms) values(?)",@"35000-45000",nil];
        
        [database executeUpdate:@"insert into tbl_kms(kms) values(?)",@"45000-50000",nil];
        
        [database executeUpdate:@"insert into tbl_kms(kms) values(?)",@"50000-60000",nil];
        
        [database executeUpdate:@"insert into tbl_kms(kms) values(?)",@"60000-70000",nil];
        
        [database executeUpdate:@"insert into tbl_kms(kms) values(?)",@"70000-80000",nil];
        
        [database executeUpdate:@"insert into tbl_kms(kms) values(?)",@"80000-90000",nil];
        
        [database executeUpdate:@"insert into tbl_kms(kms) values(?)",@"90000-100000",nil];
        
        [database executeUpdate:@"insert into tbl_kms(kms) values(?)",@"100000-200000",nil];
        
        [database executeUpdate:@"insert into tbl_kms(kms) values(?)",@"200000-300000",nil];
        
        [database executeUpdate:@"insert into tbl_kms(kms) values(?)",@"300000-400000",nil];
        
        [database executeUpdate:@"insert into tbl_kms(kms) values(?)",@"400000-500000",nil];

        
        
        
        
        
        
        
        
        
        // create LoanTenure table
        
        [database executeUpdate:@"create table tbl_loan_tenure(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, loantenure varchar)"];
        
        
        
        [database executeUpdate:@"insert into tbl_loan_tenure(loantenure) values(?)",@"2 Years",nil];
        
        [database executeUpdate:@"insert into tbl_loan_tenure(loantenure) values(?)",@"3 Years",nil];
        
        [database executeUpdate:@"insert into tbl_loan_tenure(loantenure) values(?)",@"4 Years",nil];
        
        [database executeUpdate:@"insert into tbl_loan_tenure(loantenure) values(?)",@"5 Years",nil];
        
        [database executeUpdate:@"insert into tbl_loan_tenure(loantenure) values(?)",@"6 Years",nil];
        
        [database executeUpdate:@"insert into tbl_loan_tenure(loantenure) values(?)",@"7 Years",nil];
        
        
        
        // create EstimationBy table
        
        
        [database executeUpdate:@"create table tbl_EstimationBy(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, estimationby varchar)"];
        
        
        [database executeUpdate:@"insert into tbl_EstimationBy(estimationby) values(?)",@"Estimate By Customer",nil];
        
        [database executeUpdate:@"insert into tbl_EstimationBy(estimationby) values(?)",@"Estimate By Customer Representative",nil];
        
        [database executeUpdate:@"insert into tbl_EstimationBy(estimationby) values(?)",@"Estimate By Product Specialist",nil];
        
        [database executeUpdate:@"insert into tbl_EstimationBy(estimationby) values(?)",@"Actuals",nil];
      
        
        
        
        //titles clicked...mr,mrs..
       /* [database executeUpdate:@"create table tbl_honorific(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, userid int, TC varchar)"];
        
        [database executeUpdate:@"insert into tbl_honorific(id,userid, TC) values(?,?,?)",[NSNumber numberWithInt:1],[NSNumber numberWithInt:1],@"Mr.",nil];
        [database executeUpdate:@"insert into tbl_honorific(id,userid, TC) values(?,?,?)",[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],@"Miss.",nil];
        [database executeUpdate:@"insert into tbl_honorific(id,userid, TC) values(?,?,?)",[NSNumber numberWithInt:3],[NSNumber numberWithInt:3],@"Mrs.",nil];
        [database executeUpdate:@"insert into tbl_honorific(id,userid, TC) values(?,?,?)",[NSNumber numberWithInt:4],[NSNumber numberWithInt:4],@"Sir.",nil];
        [database executeUpdate:@"insert into tbl_honorific(id,userid, TC) values(?,?,?)",[NSNumber numberWithInt:5],[NSNumber numberWithInt:5],@"Dr.",nil];
        [database executeUpdate:@"insert into tbl_honorific(id,userid, TC) values(?,?,?)",[NSNumber numberWithInt:6],[NSNumber numberWithInt:6],@"Prof.",nil];
        [database executeUpdate:@"insert into tbl_honorific(id,userid, TC) values(?,?,?)",[NSNumber numberWithInt:7],[NSNumber numberWithInt:7],@"M/s.",nil];
*/

        
        
        //new vehicle..make//14sept(UNDER NEWVEHICLE VC)
        [database executeUpdate:@"create table tbl_newvehicle_make(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, NVM varchar)"];
        
        
        [database executeUpdate:@"insert into tbl_newvehicle_make(NVM) values(?)",@"BMW",nil];
        
        [database executeUpdate:@"insert into tbl_newvehicle_make(NVM) values(?)",@"Honda",nil];
        
        [database executeUpdate:@"insert into tbl_newvehicle_make(NVM) values(?)",@"Jaguar",nil];
        
        [database executeUpdate:@"insert into tbl_newvehicle_make(NVM) values(?)",@"Land Rover",nil];
        
        [database executeUpdate:@"insert into tbl_newvehicle_make(NVM) values(?)",@"Nissan",nil];
        
        
        
        
        // new vehicle...Model//14sept(UNDER NEWVEHICLE VC)

        // model table.(UNDER NEWVEHICLE VC)
        [database executeUpdate:@"create table tbl_newvehicle_model(modelid INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,makeid int,modelname varchar)"];
        
        
        [database executeUpdate:@"insert into tbl_newvehicle_model(modelid,makeid,modelname) values(?,?,?)",[NSNumber numberWithInt:1],[NSNumber numberWithInt:1],@"1 Series",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_model(modelid,makeid,modelname) values(?,?,?)",[NSNumber numberWithInt:2],[NSNumber numberWithInt:1],@"3 Series",nil];
        
        [database executeUpdate:@"insert into tbl_newvehicle_model(modelid,makeid,modelname) values(?,?,?)",[NSNumber numberWithInt:3],[NSNumber numberWithInt:2],@"Accord",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_model(modelid,makeid,modelname) values(?,?,?)",[NSNumber numberWithInt:4],[NSNumber numberWithInt:2],@"Amaze",nil];
        
        [database executeUpdate:@"insert into tbl_newvehicle_model(modelid,makeid,modelname) values(?,?,?)",[NSNumber numberWithInt:5],[NSNumber numberWithInt:3],@"F-Type",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_model(modelid,makeid,modelname) values(?,?,?)",[NSNumber numberWithInt:6],[NSNumber numberWithInt:3],@"XF",nil];
        
        [database executeUpdate:@"insert into tbl_newvehicle_model(modelid,makeid,modelname) values(?,?,?)",[NSNumber numberWithInt:7],[NSNumber numberWithInt:4],@"Discovery",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_model(modelid,makeid,modelname) values(?,?,?)",[NSNumber numberWithInt:8],[NSNumber numberWithInt:4],@"Freelander 2",nil];
        
        [database executeUpdate:@"insert into tbl_newvehicle_model(modelid,makeid,modelname) values(?,?,?)",[NSNumber numberWithInt:9],[NSNumber numberWithInt:5],@"370Z",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_model(modelid,makeid,modelname) values(?,?,?)",[NSNumber numberWithInt:10],[NSNumber numberWithInt:5],@"Evalia",nil];
        
        
        
        

        
       
        //new vehicle...Type//14sept(UNDER NEWVEHICLE VC)
        //....
        
        [database executeUpdate:@"create table tbl_newvehicle_model_type(typeid INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, modelid int,type_name varchar,Prize varchar,Newcar_Insurance varchar,Newcar_LogisticsCharges varchar,Newcar_RegistrationServiceChargesIncludingRoadTax varchar,Newcar_Octroi varchar)"];
        
        
        // FOR THE OCTROI NO :----
        
        
        // 1.BMW
        [database executeUpdate:@"insert into tbl_newvehicle_model_type(typeid,modelid,type_name,Prize,Newcar_Insurance,Newcar_LogisticsCharges,Newcar_RegistrationServiceChargesIncludingRoadTax,Newcar_Octroi) values(?,?,?,?,?,?,?,?)",[NSNumber numberWithInt:1],[NSNumber numberWithInt:1],@"1 Series 116i Hatchback(Petrol)",@"2500000",@"0",@"0",@"0",@"No",nil];
        
        [database executeUpdate:@"insert into tbl_newvehicle_model_type(typeid,modelid,type_name,Prize,Newcar_Insurance,Newcar_LogisticsCharges,Newcar_RegistrationServiceChargesIncludingRoadTax,Newcar_Octroi) values(?,?,?,?,?,?,?,?)",[NSNumber numberWithInt:2],[NSNumber numberWithInt:1],@"1 Series 118d Hatchback(Diesel)",@"2500000",@"0",@"0",@"0",@"No",nil];
        
        
        
        [database executeUpdate:@"insert into tbl_newvehicle_model_type(typeid,modelid,type_name,Prize,Newcar_Insurance,Newcar_LogisticsCharges,Newcar_RegistrationServiceChargesIncludingRoadTax,Newcar_Octroi) values(?,?,?,?,?,?,?,?)",[NSNumber numberWithInt:3],[NSNumber numberWithInt:2],@"3 Series 320d Luxury Line(Diesel)",@"2500000",@"0",@"0",@"0",@"No",nil];
        
        [database executeUpdate:@"insert into tbl_newvehicle_model_type(typeid,modelid,type_name,Prize,Newcar_Insurance,Newcar_LogisticsCharges,Newcar_RegistrationServiceChargesIncludingRoadTax,Newcar_Octroi) values(?,?,?,?,?,?,?,?)",[NSNumber numberWithInt:4],[NSNumber numberWithInt:2],@"3 Series 320d Sport Line(Diesel)",@"2500000",@"0",@"0",@"0",@"No",nil];
        
        
        
        // 2.HONDA
        [database executeUpdate:@"insert into tbl_newvehicle_model_type(typeid,modelid,type_name,Prize,Newcar_Insurance,Newcar_LogisticsCharges,Newcar_RegistrationServiceChargesIncludingRoadTax,Newcar_Octroi) values(?,?,?,?,?,?,?,?)",[NSNumber numberWithInt:5],[NSNumber numberWithInt:3],@"2.4 A/T",@"2184250",@"0",@"0",@"0",@"No",nil];
        
        [database executeUpdate:@"insert into tbl_newvehicle_model_type(typeid,modelid,type_name,Prize,Newcar_Insurance,Newcar_LogisticsCharges,Newcar_RegistrationServiceChargesIncludingRoadTax,Newcar_Octroi) values(?,?,?,?,?,?,?,?)",[NSNumber numberWithInt:6],[NSNumber numberWithInt:3],@"Other",@"0",@"0",@"0",@"0",@"No",nil];
        
        
        
        [database executeUpdate:@"insert into tbl_newvehicle_model_type(typeid,modelid,type_name,Prize,Newcar_Insurance,Newcar_LogisticsCharges,Newcar_RegistrationServiceChargesIncludingRoadTax,Newcar_Octroi) values(?,?,?,?,?,?,?,?)",[NSNumber numberWithInt:7],[NSNumber numberWithInt:4],@"1.2 E MT(i-VTEC) Petrol",@"535067",@"0",@"0",@"0",@"No",nil];
        
        [database executeUpdate:@"insert into tbl_newvehicle_model_type(typeid,modelid,type_name,Prize,Newcar_Insurance,Newcar_LogisticsCharges,Newcar_RegistrationServiceChargesIncludingRoadTax,Newcar_Octroi) values(?,?,?,?,?,?,?,?)",[NSNumber numberWithInt:8],[NSNumber numberWithInt:4],@"1.2 EX MT(i-VTEC) Petrol",@"564445",@"0",@"0",@"0",@"No",nil];
        
        
        
        // 3.JAGUAR
        [database executeUpdate:@"insert into tbl_newvehicle_model_type(typeid,modelid,type_name,Prize,Newcar_Insurance,Newcar_LogisticsCharges,Newcar_RegistrationServiceChargesIncludingRoadTax,Newcar_Octroi) values(?,?,?,?,?,?,?,?)",[NSNumber numberWithInt:9],[NSNumber numberWithInt:5],@"3.0 S/C Convertible S(ST2 380 PS)",@"152334761",@"20001",@"30001",@"40001",@"No",nil];
        
        [database executeUpdate:@"insert into tbl_newvehicle_model_type(typeid,modelid,type_name,Prize,Newcar_Insurance,Newcar_LogisticsCharges,Newcar_RegistrationServiceChargesIncludingRoadTax,Newcar_Octroi) values(?,?,?,?,?,?,?,?)",[NSNumber numberWithInt:10],[NSNumber numberWithInt:5],@"3.0 S/C Coupe S(ST1 340 PS)",@"12475630",@"0",@"0",@"0",@"No",nil];
        
        
        [database executeUpdate:@"insert into tbl_newvehicle_model_type(typeid,modelid,type_name,Prize,Newcar_Insurance,Newcar_LogisticsCharges,Newcar_RegistrationServiceChargesIncludingRoadTax,Newcar_Octroi) values(?,?,?,?,?,?,?,?)",[NSNumber numberWithInt:11],[NSNumber numberWithInt:6],@"2.0L Petrol luxury",@"4969912",@"0",@"0",@"0",@"No",nil];
        
        [database executeUpdate:@"insert into tbl_newvehicle_model_type(typeid,modelid,type_name,Prize,Newcar_Insurance,Newcar_LogisticsCharges,Newcar_RegistrationServiceChargesIncludingRoadTax,Newcar_Octroi) values(?,?,?,?,?,?,?,?)",[NSNumber numberWithInt:12],[NSNumber numberWithInt:6],@"2.2L Diesel Executive Edition",@"4618715",@"0",@"0",@"0",@"No",nil];
        
        
        
        //4.LANDROVER
        [database executeUpdate:@"insert into tbl_newvehicle_model_type(typeid,modelid,type_name,Prize,Newcar_Insurance,Newcar_LogisticsCharges,Newcar_RegistrationServiceChargesIncludingRoadTax,Newcar_Octroi) values(?,?,?,?,?,?,?,?)",[NSNumber numberWithInt:13],[NSNumber numberWithInt:7],@"3.0L SDV6 Diesel HSE",@"0",@"0",@"0",@"0",@"No",nil];
        
        [database executeUpdate:@"insert into tbl_newvehicle_model_type(typeid,modelid,type_name,Prize,Newcar_Insurance,Newcar_LogisticsCharges,Newcar_RegistrationServiceChargesIncludingRoadTax,Newcar_Octroi) values(?,?,?,?,?,?,?,?)",[NSNumber numberWithInt:14],[NSNumber numberWithInt:7],@"3.0L SDV6 Diesel SE",@"0",@"0",@"0",@"0",@"No",nil];
        
        
        [database executeUpdate:@"insert into tbl_newvehicle_model_type(typeid,modelid,type_name,Prize,Newcar_Insurance,Newcar_LogisticsCharges,Newcar_RegistrationServiceChargesIncludingRoadTax,Newcar_Octroi) values(?,?,?,?,?,?,?,?)",[NSNumber numberWithInt:15],[NSNumber numberWithInt:8],@"2 2.2L TD4 S",@"4106313",@"0",@"0",@"0",@"No",nil];
        
        [database executeUpdate:@"insert into tbl_newvehicle_model_type(typeid,modelid,type_name,Prize,Newcar_Insurance,Newcar_LogisticsCharges,Newcar_RegistrationServiceChargesIncludingRoadTax,Newcar_Octroi) values(?,?,?,?,?,?,?,?)",[NSNumber numberWithInt:16],[NSNumber numberWithInt:8],@"2 2.2L TD4 SE Limited Edition",@"4648639",@"0",@"0",@"0",@"No",nil];
        
        
        
        //5.NISSAN
        [database executeUpdate:@"insert into tbl_newvehicle_model_type(typeid,modelid,type_name,Prize,Newcar_Insurance,Newcar_LogisticsCharges,Newcar_RegistrationServiceChargesIncludingRoadTax,Newcar_Octroi) values(?,?,?,?,?,?,?,?)",[NSNumber numberWithInt:17],[NSNumber numberWithInt:9],@"Touring Coupe AT",@"5500000",@"0",@"0",@"0",@"No",nil];
        
        [database executeUpdate:@"insert into tbl_newvehicle_model_type(typeid,modelid,type_name,Prize,Newcar_Insurance,Newcar_LogisticsCharges,Newcar_RegistrationServiceChargesIncludingRoadTax,Newcar_Octroi) values(?,?,?,?,?,?,?,?)",[NSNumber numberWithInt:18],[NSNumber numberWithInt:9],@"Touring Coupe MT",@"5500000",@"0",@"0",@"0",@"No",nil];
        
        
        [database executeUpdate:@"insert into tbl_newvehicle_model_type(typeid,modelid,type_name,Prize,Newcar_Insurance,Newcar_LogisticsCharges,Newcar_RegistrationServiceChargesIncludingRoadTax,Newcar_Octroi) values(?,?,?,?,?,?,?,?)",[NSNumber numberWithInt:19],[NSNumber numberWithInt:10],@"XE",@"915031",@"0",@"0",@"0",@"No",nil];
        
        [database executeUpdate:@"insert into tbl_newvehicle_model_type(typeid,modelid,type_name,Prize,Newcar_Insurance,Newcar_LogisticsCharges,Newcar_RegistrationServiceChargesIncludingRoadTax,Newcar_Octroi) values(?,?,?,?,?,?,?,?)",[NSNumber numberWithInt:20],[NSNumber numberWithInt:10],@"XE Plus",@"961260",@"0",@"0",@"0",@"No",nil];
        
        // FOR THE OCTROI NO "ENDS" :----
        
        
        
        
        
        
        
        // FOR THE OCTROI YES :----

        
        // 1.BMW
        [database executeUpdate:@"insert into tbl_newvehicle_model_type(typeid,modelid,type_name,Prize,Newcar_Insurance,Newcar_LogisticsCharges,Newcar_RegistrationServiceChargesIncludingRoadTax,Newcar_Octroi) values(?,?,?,?,?,?,?,?)",[NSNumber numberWithInt:21],[NSNumber numberWithInt:1],@"1 Series 116i Hatchback(Petrol)",@"2500000",@"0",@"0",@"0",@"Yes",nil];
        
        [database executeUpdate:@"insert into tbl_newvehicle_model_type(typeid,modelid,type_name,Prize,Newcar_Insurance,Newcar_LogisticsCharges,Newcar_RegistrationServiceChargesIncludingRoadTax,Newcar_Octroi) values(?,?,?,?,?,?,?,?)",[NSNumber numberWithInt:22],[NSNumber numberWithInt:1],@"1 Series 118d Hatchback(Diesel)",@"2500000",@"0",@"0",@"0",@"Yes",nil];
        
        
        
        [database executeUpdate:@"insert into tbl_newvehicle_model_type(typeid,modelid,type_name,Prize,Newcar_Insurance,Newcar_LogisticsCharges,Newcar_RegistrationServiceChargesIncludingRoadTax,Newcar_Octroi) values(?,?,?,?,?,?,?,?)",[NSNumber numberWithInt:23],[NSNumber numberWithInt:2],@"3 Series 320d Luxury Line(Diesel)",@"2500000",@"0",@"0",@"0",@"Yes",nil];
        
        [database executeUpdate:@"insert into tbl_newvehicle_model_type(typeid,modelid,type_name,Prize,Newcar_Insurance,Newcar_LogisticsCharges,Newcar_RegistrationServiceChargesIncludingRoadTax,Newcar_Octroi) values(?,?,?,?,?,?,?,?)",[NSNumber numberWithInt:24],[NSNumber numberWithInt:2],@"3 Series 320d Sport Line(Diesel)",@"2500000",@"0",@"0",@"0",@"Yes",nil];
        
        
        
        // 2.HONDA
        [database executeUpdate:@"insert into tbl_newvehicle_model_type(typeid,modelid,type_name,Prize,Newcar_Insurance,Newcar_LogisticsCharges,Newcar_RegistrationServiceChargesIncludingRoadTax,Newcar_Octroi) values(?,?,?,?,?,?,?,?)",[NSNumber numberWithInt:25],[NSNumber numberWithInt:3],@"2.4 A/T",@"2184250",@"0",@"0",@"0",@"Yes",nil];
        
        [database executeUpdate:@"insert into tbl_newvehicle_model_type(typeid,modelid,type_name,Prize,Newcar_Insurance,Newcar_LogisticsCharges,Newcar_RegistrationServiceChargesIncludingRoadTax,Newcar_Octroi) values(?,?,?,?,?,?,?,?)",[NSNumber numberWithInt:26],[NSNumber numberWithInt:3],@"Other",@"0",@"0",@"0",@"0",@"Yes",nil];
        
        
        
        [database executeUpdate:@"insert into tbl_newvehicle_model_type(typeid,modelid,type_name,Prize,Newcar_Insurance,Newcar_LogisticsCharges,Newcar_RegistrationServiceChargesIncludingRoadTax,Newcar_Octroi) values(?,?,?,?,?,?,?,?)",[NSNumber numberWithInt:27],[NSNumber numberWithInt:4],@"1.2 E MT(i-VTEC) Petrol",@"535067",@"0",@"0",@"0",@"Yes",nil];
        
        [database executeUpdate:@"insert into tbl_newvehicle_model_type(typeid,modelid,type_name,Prize,Newcar_Insurance,Newcar_LogisticsCharges,Newcar_RegistrationServiceChargesIncludingRoadTax,Newcar_Octroi) values(?,?,?,?,?,?,?,?)",[NSNumber numberWithInt:28],[NSNumber numberWithInt:4],@"1.2 EX MT(i-VTEC) Petrol",@"564445",@"0",@"0",@"0",@"Yes",nil];
        
        
        
        // 3.JAGUAR
        [database executeUpdate:@"insert into tbl_newvehicle_model_type(typeid,modelid,type_name,Prize,Newcar_Insurance,Newcar_LogisticsCharges,Newcar_RegistrationServiceChargesIncludingRoadTax,Newcar_Octroi) values(?,?,?,?,?,?,?,?)",[NSNumber numberWithInt:29],[NSNumber numberWithInt:5],@"3.0 S/C Convertible S(ST2 380 PS)",@"400000",@"20000",@"100000",@"1000000",@"Yes",nil];
        
        [database executeUpdate:@"insert into tbl_newvehicle_model_type(typeid,modelid,type_name,Prize,Newcar_Insurance,Newcar_LogisticsCharges,Newcar_RegistrationServiceChargesIncludingRoadTax,Newcar_Octroi) values(?,?,?,?,?,?,?,?)",[NSNumber numberWithInt:30],[NSNumber numberWithInt:5],@"3.0 S/C Coupe S(ST1 340 PS)",@"13013330",@"0",@"0",@"0",@"Yes",nil];
        
        
        [database executeUpdate:@"insert into tbl_newvehicle_model_type(typeid,modelid,type_name,Prize,Newcar_Insurance,Newcar_LogisticsCharges,Newcar_RegistrationServiceChargesIncludingRoadTax,Newcar_Octroi) values(?,?,?,?,?,?,?,?)",[NSNumber numberWithInt:31],[NSNumber numberWithInt:6],@"2.0L Petrol luxury",@"5184115",@"0",@"0",@"0",@"Yes",nil];
        
        [database executeUpdate:@"insert into tbl_newvehicle_model_type(typeid,modelid,type_name,Prize,Newcar_Insurance,Newcar_LogisticsCharges,Newcar_RegistrationServiceChargesIncludingRoadTax,Newcar_Octroi) values(?,?,?,?,?,?,?,?)",[NSNumber numberWithInt:32],[NSNumber numberWithInt:6],@"2.2L Diesel Executive Edition",@"4817782",@"0",@"0",@"0",@"Yes",nil];
        
        
        
        //4.LANDROVER
        [database executeUpdate:@"insert into tbl_newvehicle_model_type(typeid,modelid,type_name,Prize,Newcar_Insurance,Newcar_LogisticsCharges,Newcar_RegistrationServiceChargesIncludingRoadTax,Newcar_Octroi) values(?,?,?,?,?,?,?,?)",[NSNumber numberWithInt:33],[NSNumber numberWithInt:7],@"3.0L SDV6 Diesel HSE",@"0",@"0",@"0",@"0",@"Yes",nil];
        
        [database executeUpdate:@"insert into tbl_newvehicle_model_type(typeid,modelid,type_name,Prize,Newcar_Insurance,Newcar_LogisticsCharges,Newcar_RegistrationServiceChargesIncludingRoadTax,Newcar_Octroi) values(?,?,?,?,?,?,?,?)",[NSNumber numberWithInt:34],[NSNumber numberWithInt:7],@"3.0L SDV6 Diesel SE",@"0",@"0",@"0",@"0",@"Yes",nil];
        
        
        [database executeUpdate:@"insert into tbl_newvehicle_model_type(typeid,modelid,type_name,Prize,Newcar_Insurance,Newcar_LogisticsCharges,Newcar_RegistrationServiceChargesIncludingRoadTax,Newcar_Octroi) values(?,?,?,?,?,?,?,?)",[NSNumber numberWithInt:35],[NSNumber numberWithInt:8],@"2 2.2L TD4 S",@"4283295",@"0",@"0",@"0",@"Yes",nil];
        
        [database executeUpdate:@"insert into tbl_newvehicle_model_type(typeid,modelid,type_name,Prize,Newcar_Insurance,Newcar_LogisticsCharges,Newcar_RegistrationServiceChargesIncludingRoadTax,Newcar_Octroi) values(?,?,?,?,?,?,?,?)",[NSNumber numberWithInt:36],[NSNumber numberWithInt:8],@"2 2.2L TD4 SE Limited Edition",@"4848995",@"0",@"0",@"0",@"Yes",nil];
        
        
        
        //5.NISSAN
        [database executeUpdate:@"insert into tbl_newvehicle_model_type(typeid,modelid,type_name,Prize,Newcar_Insurance,Newcar_LogisticsCharges,Newcar_RegistrationServiceChargesIncludingRoadTax,Newcar_Octroi) values(?,?,?,?,?,?,?,?)",[NSNumber numberWithInt:37],[NSNumber numberWithInt:9],@"Touring Coupe AT",@"5500000",@"0",@"0",@"0",@"Yes",nil];
        
        [database executeUpdate:@"insert into tbl_newvehicle_model_type(typeid,modelid,type_name,Prize,Newcar_Insurance,Newcar_LogisticsCharges,Newcar_RegistrationServiceChargesIncludingRoadTax,Newcar_Octroi) values(?,?,?,?,?,?,?,?)",[NSNumber numberWithInt:38],[NSNumber numberWithInt:9],@"Touring Coupe MT",@"5500000",@"0",@"0",@"0",@"Yes",nil];
        
        
        [database executeUpdate:@"insert into tbl_newvehicle_model_type(typeid,modelid,type_name,Prize,Newcar_Insurance,Newcar_LogisticsCharges,Newcar_RegistrationServiceChargesIncludingRoadTax,Newcar_Octroi) values(?,?,?,?,?,?,?,?)",[NSNumber numberWithInt:39],[NSNumber numberWithInt:10],@"XE",@"915031",@"0",@"0",@"0",@"Yes",nil];
        
        [database executeUpdate:@"insert into tbl_newvehicle_model_type(typeid,modelid,type_name,Prize,Newcar_Insurance,Newcar_LogisticsCharges,Newcar_RegistrationServiceChargesIncludingRoadTax,Newcar_Octroi) values(?,?,?,?,?,?,?,?)",[NSNumber numberWithInt:40],[NSNumber numberWithInt:10],@"XE Plus",@"961260",@"0",@"0",@"0",@"Yes",nil];
        

        // FOR THE OCTROI YES "ENDS" :----

        
        
        
        
        
        
        
        
        
        
        

        
        
        
       /* //new vehicle..service plan
        
        [database executeUpdate:@"create table tbl_newvehicle_serviceplan(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,NVSP varchar)"];
        
        
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(NVSP) values(?)",@"3 Year Diamond(PMS+VAS+Wear & Tear)",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(NVSP) values(?)",@"3 Year Solitaire(Diamond Pack+Insurance)",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(NVSP) values(?)",@"3 Year Goldpack(Only PMS)",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(NVSP) values(?)",@"3 Year Platinum(PMS+VAS)",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(NVSP) values(?)",@"5 Year Diamond(PMS+VAS+Wear & Tear)",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(NVSP) values(?)",@"5 Year Solitaire(Diamond Pack+Insurance)",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(NVSP) values(?)",@"5 Year Goldpack(Only PMS)",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(NVSP) values(?)",@"5 Year Platinum(PMS+VAS)",nil];*/
        
        
       /* [database executeUpdate:@"create table tbl_newvehicle_model(modelid INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,makeid int,modelname varchar)"];
        
        [database executeUpdate:@"insert into tbl_newvehicle_model(modelid,makeid,modelname) values(?,?,?)",[NSNumber numberWithInt:1],[NSNumber numberWithInt:1],@"1 Series",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_model(modelid,makeid,modelname) values(?,?,?)",[NSNumber numberWithInt:2],[NSNumber numberWithInt:1],@"3 Series",nil];
        
        [database executeUpdate:@"insert into tbl_newvehicle_model(modelid,makeid,modelname) values(?,?,?)",[NSNumber numberWithInt:3],[NSNumber numberWithInt:2],@"Accord",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_model(modelid,makeid,modelname) values(?,?,?)",[NSNumber numberWithInt:4],[NSNumber numberWithInt:2],@"Amaze",nil];
        
        [database executeUpdate:@"insert into tbl_newvehicle_model(modelid,makeid,modelname) values(?,?,?)",[NSNumber numberWithInt:5],[NSNumber numberWithInt:3],@"F-Type",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_model(modelid,makeid,modelname) values(?,?,?)",[NSNumber numberWithInt:6],[NSNumber numberWithInt:3],@"XF",nil];
        
        [database executeUpdate:@"insert into tbl_newvehicle_model(modelid,makeid,modelname) values(?,?,?)",[NSNumber numberWithInt:7],[NSNumber numberWithInt:4],@"Discovery",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_model(modelid,makeid,modelname) values(?,?,?)",[NSNumber numberWithInt:8],[NSNumber numberWithInt:4],@"Freelander 2",nil];
        
        [database executeUpdate:@"insert into tbl_newvehicle_model(modelid,makeid,modelname) values(?,?,?)",[NSNumber numberWithInt:9],[NSNumber numberWithInt:5],@"370Z",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_model(modelid,makeid,modelname) values(?,?,?)",[NSNumber numberWithInt:10],[NSNumber numberWithInt:5],@"Evalia",nil];*/
        
        //new vehicle..service plan
        
        [database executeUpdate:@"create table tbl_newvehicle_serviceplan(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,typeid int,NVSP varchar,NVSP_value varchar)"];
        
        
        //1)for typeid 9:---
        
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:9],@"3 Year Diamond(PMS+VAS+Wear & Tear)",@"40000",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:9],@"3 Year Solitaire(Diamond Pack+Insurance)",@"8880",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:9],@"3 Year Goldpack(Only PMS)",@"1000",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:9],@"3 Year Platinum(PMS+VAS)",@"3000",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:9],@"5 Year Diamond(PMS+VAS+Wear & Tear)",@"7770",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:9],@"5 Year Solitaire(Diamond Pack+Insurance)",@"6660",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:9],@"5 Year Goldpack(Only PMS)",@"2000",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:9],@"5 Year Platinum(PMS+VAS)",@"100000",nil];
        
        
        //2)for typeid 10:---
        
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:10],@"3 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:10],@"3 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:10],@"3 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:10],@"3 Year Platinum(PMS+VAS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:10],@"5 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:10],@"5 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:10],@"5 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:10],@"5 Year Platinum(PMS+VAS)",@"0",nil];

        //3)for typeid 11:---
        
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:11],@"3 Year Diamond(PMS+VAS+Wear & Tear)",@"276450",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:11],@"3 Year Solitaire(Diamond Pack+Insurance)",@"276450",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:11],@"3 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:11],@"3 Year Platinum(PMS+VAS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:11],@"5 Year Diamond(PMS+VAS+Wear & Tear)",@"438330",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:11],@"5 Year Solitaire(Diamond Pack+Insurance)",@"438330",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:11],@"5 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:11],@"5 Year Platinum(PMS+VAS)",@"0",nil];
        
        
        //4)for typeid 12:---
        
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:12],@"3 Year Diamond(PMS+VAS+Wear & Tear)",@"276450",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:12],@"3 Year Solitaire(Diamond Pack+Insurance)",@"276450",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:12],@"3 Year Goldpack(Only PMS)",@"69000",nil];
        
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:12],@"3 Year Platinum(PMS+VAS)",@"102000",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:12],@"5 Year Diamond(PMS+VAS+Wear & Tear)",@"438330",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:12],@"5 Year Solitaire(Diamond Pack+Insurance)",@"438330",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:12],@"5 Year Goldpack(Only PMS)",@"113000",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:12],@"5 Year Platinum(PMS+VAS)",@"166500",nil];


        
        
        //5)for typeid 13:---landrover 1
        
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:13],@"3 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:13],@"3 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:13],@"3 Year Goldpack(Only PMS)",@"0",nil];
        
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:13],@"3 Year Platinum(PMS+VAS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:13],@"5 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:13],@"5 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:13],@"5 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:13],@"5 Year Platinum(PMS+VAS)",@"0",nil];
        


        //6)for typeid 14:---landrover 2
        
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:14],@"3 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:14],@"3 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:14],@"3 Year Goldpack(Only PMS)",@"0",nil];
        
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:14],@"3 Year Platinum(PMS+VAS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:14],@"5 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:14],@"5 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:14],@"5 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:14],@"5 Year Platinum(PMS+VAS)",@"0",nil];

        
        //7)for typeid 15:---landrover 3
        
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:15],@"3 Year Diamond(PMS+VAS+Wear & Tear)",@"288420",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:15],@"3 Year Solitaire(Diamond Pack+Insurance)",@"288420",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:15],@"3 Year Goldpack(Only PMS)",@"0",nil];
        
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:15],@"3 Year Platinum(PMS+VAS)",@"0",nil];
        
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:15],@"5 Year Diamond(PMS+VAS+Wear & Tear)",@"475380",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:15],@"5 Year Solitaire(Diamond Pack+Insurance)",@"475380",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:15],@"5 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:15],@"5 Year Platinum(PMS+VAS)",@"0",nil];

        
        
        //8)for typeid 16:---landrover 4
        
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:16],@"3 Year Diamond(PMS+VAS+Wear & Tear)",@"288420",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:16],@"3 Year Solitaire(Diamond Pack+Insurance)",@"288420",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:16],@"3 Year Goldpack(Only PMS)",@"0",nil];
        
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:16],@"3 Year Platinum(PMS+VAS)",@"0",nil];
        
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:16],@"5 Year Diamond(PMS+VAS+Wear & Tear)",@"475380",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:16],@"5 Year Solitaire(Diamond Pack+Insurance)",@"475380",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:16],@"5 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:16],@"5 Year Platinum(PMS+VAS)",@"0",nil];
        
        
        
        
        //17dec..donk..for typeid 1-8 and 17-40  Service-Plan:------
        
        //for typeid 1:-
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:1],@"3 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:1],@"3 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:1],@"3 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:1],@"3 Year Platinum(PMS+VAS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:1],@"5 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:1],@"5 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:1],@"5 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:1],@"5 Year Platinum(PMS+VAS)",@"0",nil];

        //for typeid 2:-
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:2],@"3 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:2],@"3 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:2],@"3 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:2],@"3 Year Platinum(PMS+VAS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:2],@"5 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:2],@"5 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:2],@"5 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:2],@"5 Year Platinum(PMS+VAS)",@"0",nil];

        //for typeid 3:-
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:3],@"3 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:3],@"3 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:3],@"3 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:3],@"3 Year Platinum(PMS+VAS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:3],@"5 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:3],@"5 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:3],@"5 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:3],@"5 Year Platinum(PMS+VAS)",@"0",nil];

        //for typeid 4:-
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:4],@"3 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:4],@"3 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:4],@"3 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:4],@"3 Year Platinum(PMS+VAS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:4],@"5 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:4],@"5 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:4],@"5 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:4],@"5 Year Platinum(PMS+VAS)",@"0",nil];
        
        //for typeid 5:-
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:5],@"3 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:5],@"3 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:5],@"3 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:5],@"3 Year Platinum(PMS+VAS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:5],@"5 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:5],@"5 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:5],@"5 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:5],@"5 Year Platinum(PMS+VAS)",@"0",nil];

        //for typeid 6:-
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:6],@"3 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:6],@"3 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:6],@"3 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:6],@"3 Year Platinum(PMS+VAS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:6],@"5 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:6],@"5 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:6],@"5 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:6],@"5 Year Platinum(PMS+VAS)",@"0",nil];

        //for typeid 7:-
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:7],@"3 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:7],@"3 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:7],@"3 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:7],@"3 Year Platinum(PMS+VAS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:7],@"5 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:7],@"5 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:7],@"5 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:7],@"5 Year Platinum(PMS+VAS)",@"0",nil];
        
        //for typeid 8:-
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:8],@"3 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:8],@"3 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:8],@"3 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:8],@"3 Year Platinum(PMS+VAS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:8],@"5 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:8],@"5 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:8],@"5 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:8],@"5 Year Platinum(PMS+VAS)",@"0",nil];

        //for typeid 17:-
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:17],@"3 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:17],@"3 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:17],@"3 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:17],@"3 Year Platinum(PMS+VAS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:17],@"5 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:17],@"5 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:17],@"5 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:17],@"5 Year Platinum(PMS+VAS)",@"0",nil];

        //for typeid 18:-
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:18],@"3 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:18],@"3 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:18],@"3 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:18],@"3 Year Platinum(PMS+VAS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:18],@"5 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:18],@"5 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:18],@"5 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:18],@"5 Year Platinum(PMS+VAS)",@"0",nil];

        //for typeid 19:-
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:19],@"3 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:19],@"3 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:19],@"3 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:19],@"3 Year Platinum(PMS+VAS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:19],@"5 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:19],@"5 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:19],@"5 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:19],@"5 Year Platinum(PMS+VAS)",@"0",nil];

        //for typeid 20:-
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:20],@"3 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:20],@"3 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:20],@"3 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:20],@"3 Year Platinum(PMS+VAS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:20],@"5 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:20],@"5 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:20],@"5 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:20],@"5 Year Platinum(PMS+VAS)",@"0",nil];

        //for typeid 21:-
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:21],@"3 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:21],@"3 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:21],@"3 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:21],@"3 Year Platinum(PMS+VAS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:21],@"5 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:21],@"5 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:21],@"5 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:21],@"5 Year Platinum(PMS+VAS)",@"0",nil];

        //for typeid 22:-
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:22],@"3 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:22],@"3 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:22],@"3 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:22],@"3 Year Platinum(PMS+VAS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:22],@"5 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:22],@"5 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:22],@"5 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:22],@"5 Year Platinum(PMS+VAS)",@"0",nil];

        //for typeid 23:-
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:23],@"3 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:23],@"3 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:23],@"3 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:23],@"3 Year Platinum(PMS+VAS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:23],@"5 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:23],@"5 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:23],@"5 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:23],@"5 Year Platinum(PMS+VAS)",@"0",nil];

        //for typeid 24:-
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:24],@"3 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:24],@"3 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:24],@"3 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:24],@"3 Year Platinum(PMS+VAS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:24],@"5 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:24],@"5 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:24],@"5 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:24],@"5 Year Platinum(PMS+VAS)",@"0",nil];

        //for typeid 25:-
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:25],@"3 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:25],@"3 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:25],@"3 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:25],@"3 Year Platinum(PMS+VAS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:25],@"5 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:25],@"5 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:25],@"5 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:25],@"5 Year Platinum(PMS+VAS)",@"0",nil];

        //for typeid 26:-
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:26],@"3 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:26],@"3 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:26],@"3 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:26],@"3 Year Platinum(PMS+VAS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:26],@"5 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:26],@"5 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:26],@"5 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:26],@"5 Year Platinum(PMS+VAS)",@"0",nil];

        //for typeid 27:-
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:27],@"3 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:27],@"3 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:27],@"3 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:27],@"3 Year Platinum(PMS+VAS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:27],@"5 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:27],@"5 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:27],@"5 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:27],@"5 Year Platinum(PMS+VAS)",@"0",nil];

        //for typeid 28:-
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:28],@"3 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:28],@"3 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:28],@"3 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:28],@"3 Year Platinum(PMS+VAS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:28],@"5 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:28],@"5 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:28],@"5 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:28],@"5 Year Platinum(PMS+VAS)",@"0",nil];

        //for typeid 29:-
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:29],@"3 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:29],@"3 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:29],@"3 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:29],@"3 Year Platinum(PMS+VAS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:29],@"5 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:29],@"5 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:29],@"5 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:29],@"5 Year Platinum(PMS+VAS)",@"0",nil];
        
        //for typeid 30:-
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:30],@"3 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:30],@"3 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:30],@"3 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:30],@"3 Year Platinum(PMS+VAS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:30],@"5 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:30],@"5 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:30],@"5 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:30],@"5 Year Platinum(PMS+VAS)",@"0",nil];

        //for typeid 31:-
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:31],@"3 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:31],@"3 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:31],@"3 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:31],@"3 Year Platinum(PMS+VAS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:31],@"5 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:31],@"5 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:31],@"5 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:31],@"5 Year Platinum(PMS+VAS)",@"0",nil];

        //for typeid 32:-
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:32],@"3 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:32],@"3 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:32],@"3 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:32],@"3 Year Platinum(PMS+VAS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:32],@"5 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:32],@"5 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:32],@"5 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:32],@"5 Year Platinum(PMS+VAS)",@"0",nil];

        //for typeid 33:-
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:33],@"3 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:33],@"3 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:33],@"3 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:33],@"3 Year Platinum(PMS+VAS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:33],@"5 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:33],@"5 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:33],@"5 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:33],@"5 Year Platinum(PMS+VAS)",@"0",nil];

        //for typeid 34:-
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:34],@"3 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:34],@"3 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:34],@"3 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:34],@"3 Year Platinum(PMS+VAS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:34],@"5 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:34],@"5 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:34],@"5 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:34],@"5 Year Platinum(PMS+VAS)",@"0",nil];
        
        //for typeid 35:-
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:35],@"3 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:35],@"3 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:35],@"3 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:35],@"3 Year Platinum(PMS+VAS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:35],@"5 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:35],@"5 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:35],@"5 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:35],@"5 Year Platinum(PMS+VAS)",@"0",nil];

        //for typeid 36:-
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:36],@"3 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:36],@"3 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:36],@"3 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:36],@"3 Year Platinum(PMS+VAS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:36],@"5 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:36],@"5 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:36],@"5 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:36],@"5 Year Platinum(PMS+VAS)",@"0",nil];

        //for typeid 37:-
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:37],@"3 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:37],@"3 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:37],@"3 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:37],@"3 Year Platinum(PMS+VAS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:37],@"5 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:37],@"5 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:37],@"5 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:37],@"5 Year Platinum(PMS+VAS)",@"0",nil];

        //for typeid 38:-
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:38],@"3 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:38],@"3 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:38],@"3 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:38],@"3 Year Platinum(PMS+VAS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:38],@"5 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:38],@"5 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:38],@"5 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:38],@"5 Year Platinum(PMS+VAS)",@"0",nil];

        //for typeid 39:-
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:39],@"3 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:39],@"3 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:39],@"3 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:39],@"3 Year Platinum(PMS+VAS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:39],@"5 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:39],@"5 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:39],@"5 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:39],@"5 Year Platinum(PMS+VAS)",@"0",nil];

        //for typeid 40:-
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:40],@"3 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:40],@"3 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:40],@"3 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:40],@"3 Year Platinum(PMS+VAS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:40],@"5 Year Diamond(PMS+VAS+Wear & Tear)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:40],@"5 Year Solitaire(Diamond Pack+Insurance)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:40],@"5 Year Goldpack(Only PMS)",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_serviceplan(typeid,NVSP,NVSP_value) values(?,?,?)",[NSNumber numberWithInt:40],@"5 Year Platinum(PMS+VAS)",@"0",nil];

        
        
        
        
        
        
        

        
        
        
        
        
        
        
        
        

        
        //new vehicle..Extended warranty
        [database executeUpdate:@"create table tbl_newvehicle_extendedwarranty(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,typeid int,NVEW varchar,NVEW_value varchar)"];
        
        //1)for typeid 9:---

        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:9],@"4th yr upto 125000 Kms",@"5550",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:9],@"4th 5th yr upto 125000 Kms",@"4440",nil];
        
        //1)for typeid 10:---
        
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:10],@"4th yr upto 125000 Kms",@"81532",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:10],@"4th 5th yr upto 125000 Kms",@"122878",nil];

        //1)for typeid 11:---
        
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:11],@"4th yr upto 125000 Kms",@"64530",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:11],@"4th 5th yr upto 125000 Kms",@"96731",nil];

        //1)for typeid 12:---
        
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:12],@"4th yr upto 125000 Kms",@"64530",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:12],@"4th 5th yr upto 125000 Kms",@"96731",nil];

        //1)for typeid 13:---
        
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:13],@"4th yr upto 125000 Kms",@"97762",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:13],@"4th 5th yr upto 125000 Kms",@"147480",nil];

        //1)for typeid 14:---
        
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:14], @"4th yr upto 125000 Kms",@"97762",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:14],@"4th 5th yr upto 125000 Kms",@"147480",nil];

        //1)for typeid 15:---
        
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:15],@"4th yr upto 125000 Kms",@"77797",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:15],@" 4th 5th yr upto 125000 Kms",@"116696",nil];

        //1)for typeid 16:---
        
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:16],@"4th yr upto 125000 Kms",@"77797",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:16],@"4th 5th yr upto 125000 Kms",@"116696",nil];

        
        //17dec..donk..for typeid 1-8 and 17-40  Extendedwarranty:------

        
        //for typeid 1:---
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:1],@"4th yr upto 125000 Kms",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:1],@"4th 5th yr upto 125000 Kms",@"0",nil];

        //for typeid 2:---
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:2],@"4th yr upto 125000 Kms",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:2],@"4th 5th yr upto 125000 Kms",@"0",nil];
        
        //for typeid 3:---
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:3],@"4th yr upto 125000 Kms",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:3],@"4th 5th yr upto 125000 Kms",@"0",nil];
        
        //for typeid 4:---
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:4],@"4th yr upto 125000 Kms",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:4],@"4th 5th yr upto 125000 Kms",@"0",nil];
        
        //for typeid 5:---
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:5],@"4th yr upto 125000 Kms",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:5],@"4th 5th yr upto 125000 Kms",@"0",nil];

        //for typeid 6:---
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:6],@"4th yr upto 125000 Kms",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:6],@"4th 5th yr upto 125000 Kms",@"0",nil];

        //for typeid 7:---
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:7],@"4th yr upto 125000 Kms",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:7],@"4th 5th yr upto 125000 Kms",@"0",nil];

        //for typeid 8:---
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:8],@"4th yr upto 125000 Kms",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:8],@"4th 5th yr upto 125000 Kms",@"0",nil];


        //for typeid 17:---
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:17],@"4th yr upto 125000 Kms",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:17],@"4th 5th yr upto 125000 Kms",@"0",nil];

        //for typeid 18:---
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:18],@"4th yr upto 125000 Kms",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:18],@"4th 5th yr upto 125000 Kms",@"0",nil];

        //for typeid 19:---
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:19],@"4th yr upto 125000 Kms",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:19],@"4th 5th yr upto 125000 Kms",@"0",nil];

        //for typeid 20:---
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:20],@"4th yr upto 125000 Kms",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:20],@"4th 5th yr upto 125000 Kms",@"0",nil];

        //for typeid 21:---
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:21],@"4th yr upto 125000 Kms",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:21],@"4th 5th yr upto 125000 Kms",@"0",nil];

        //for typeid 22:---
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:22],@"4th yr upto 125000 Kms",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:22],@"4th 5th yr upto 125000 Kms",@"0",nil];

        //for typeid 23:---
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:23],@"4th yr upto 125000 Kms",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:23],@"4th 5th yr upto 125000 Kms",@"0",nil];

        //for typeid 24:---
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:24],@"4th yr upto 125000 Kms",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:24],@"4th 5th yr upto 125000 Kms",@"0",nil];

        //for typeid 25:---
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:25],@"4th yr upto 125000 Kms",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:25],@"4th 5th yr upto 125000 Kms",@"0",nil];

        //for typeid 26:---
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:26],@"4th yr upto 125000 Kms",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:26],@"4th 5th yr upto 125000 Kms",@"0",nil];

        //for typeid 27:---
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:27],@"4th yr upto 125000 Kms",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:27],@"4th 5th yr upto 125000 Kms",@"0",nil];

        //for typeid 28:---
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:28],@"4th yr upto 125000 Kms",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:28],@"4th 5th yr upto 125000 Kms",@"0",nil];

        //for typeid 29:---
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:29],@"4th yr upto 125000 Kms",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:29],@"4th 5th yr upto 125000 Kms",@"0",nil];
        
        //for typeid 30:---
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:30],@"4th yr upto 125000 Kms",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:30],@"4th 5th yr upto 125000 Kms",@"0",nil];

        //for typeid 31:---
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:31],@"4th yr upto 125000 Kms",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:31],@"4th 5th yr upto 125000 Kms",@"0",nil];

        //for typeid 32:---
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:32],@"4th yr upto 125000 Kms",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:32],@"4th 5th yr upto 125000 Kms",@"0",nil];

        //for typeid 33:---
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:33],@"4th yr upto 125000 Kms",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:33],@"4th 5th yr upto 125000 Kms",@"0",nil];

        //for typeid 34:---
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:34],@"4th yr upto 125000 Kms",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:34],@"4th 5th yr upto 125000 Kms",@"0",nil];

        //for typeid 35:---
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:35],@"4th yr upto 125000 Kms",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:35],@"4th 5th yr upto 125000 Kms",@"0",nil];

        //for typeid 36:---
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:36],@"4th yr upto 125000 Kms",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:36],@"4th 5th yr upto 125000 Kms",@"0",nil];

        //for typeid 37:---
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:37],@"4th yr upto 125000 Kms",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:37],@"4th 5th yr upto 125000 Kms",@"0",nil];

        //for typeid 38:---
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:38],@"4th yr upto 125000 Kms",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:38],@"4th 5th yr upto 125000 Kms",@"0",nil];

        //for typeid 39:---
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:39],@"4th yr upto 125000 Kms",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:39],@"4th 5th yr upto 125000 Kms",@"0",nil];

        //for typeid 40:---
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:40],@"4th yr upto 125000 Kms",@"0",nil];
        [database executeUpdate:@"insert into tbl_newvehicle_extendedwarranty(typeid,NVEW,NVEW_value) values(?,?,?)",[NSNumber numberWithInt:40],@"4th 5th yr upto 125000 Kms",@"0",nil];

      
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        

        // 7sept...create NEWVEHICLE TABLE, FOR NEXT BTN
        //Type varchar
        [database executeUpdate:@"create table tbl_newvehicle(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, Make varchar, Model varchar,Type varchar,ExShowroomPrice varchar, Insurance varchar, LogisticsCharges varchar, RegistrationServiceCharges varchar, ServicePlan varchar, ExtendedWarranty varchar, Accessories varchar, BenefitstoCustomer varchar, TotalOnRoadValue varchar, BalanceTradeInValue varchar,DownPayment varchar,SuggestedLoanAmnt varchar)"];

        
        
        
        // create USERDETAILS table, FOR NEXT BTN
        [database executeUpdate:@"create table tbl_userdetails(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,Cust_id varchar, Name varchar, LastName varchar , ContactNo varchar, Mail varchar, CCMail varchar, Date varchar, Budget varchar)"];
        
        
        
        //19nov...
        //// create tp table,
        [database executeUpdate:@"create table tbl_tp(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, Name varchar, tName varchar , ctNo varchar, Mail varchar, CCMail varchar, Date varchar, Budget varchar)"];

        
        
        // create EVALUATE EXISTING VEHICLE TABLE, FOR NEXT BTN
        [database executeUpdate:@"create table tbl_evaluate_existing_vehicle(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, Manufacturer varchar, Model varchar, VehicleModelType varchar, Date varchar, Month varchar, OnRoadValue varchar, Owner varchar, Color varchar, RemainingInsurance varchar, MarketDemand varchar, KMS varchar, ValueRupee varchar, EstimationBy varchar, PriceByMax varchar)"];
        
        
        // create LOANAMOUNTESTIMATOR TABLE, FOR NEXT BTN
        [database executeUpdate:@"create table tbl_loan_amount_estimator(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, LoanAmount varchar, RateOfInterest varchar, loanTenure varchar, MonthlyPayment varchar, EMI varchar, Percent varchar, FinalPrice varchar, OutstandingLoan varchar, BalanceTrade varchar, EstimationBy varchar)"];
        
        
        /*
        // create NEWVEHICLE TABLE, FOR NEXT BTN
        [database executeUpdate:@"create table NEWVEHICLE(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, Make varchar, VehicleModel varchar, SelectType varchar, Octroi varchar, ExShowroomPrice varchar, Insurance varchar, LogisticsCharges varchar, OutstandingLoan varchar, BalanceTrade varchar, EstimationBy varchar)"];
         */
        
        //12th sept...
        [database executeUpdate:@"create table tbl_feedback(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, userid int, Feedback varchar)"];
        
        
        
        
        
        //OLD TABLE OF TRADE-IN FLOW
        //15sept..for 1st three entities...in submit btn(Finance offer VC)..
        //..26th
        
        /*[database executeUpdate:@"create table tbl_quotation(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,Report_id,Name varchar,ContactNo varchar,Mail varchar,CCMail varchar,Date varchar,Budget varchar,Manufacturer varchar,ModelType varchar,VehicleModelType varchar,Datee varchar,Month varchar,OnRoadValue varchar, Owner varchar,Color varchar,RemainingInsurance varchar, MarketDemand varchar,KMS varchar,ValueRupee varchar,EstimationByy varchar,PriceByMax varchar,LoanAmountTaken varchar, RateOfInterest varchar, loanTenure varchar, MonthlyPayment varchar, EMI varchar, Percent varchar, FinalPrice varchar, OutstandingLoan varchar, BalanceTrade varchar, EstimationBy varchar,Make varchar, Model varchar,Type varchar,ExShowroomPrice varchar, Insurance varchar, LogisticsCharges varchar, RegistrationServiceCharges varchar, ServicePlan varchar, ExtendedWarranty varchar, Accessories varchar, BenefitstoCustomer varchar, TotalOnRoadValuee varchar, BalanceTradeInValue varchar,DownPayment varchar,SuggestedLoanAmnt varchar,LoanAmount varchar,TotalOnRoadValue varchar,LoanForeClosure varchar)"];*/
        
        
        
        //10dec..//NEW TABLE OF TRADE-IN FLOW
        [database executeUpdate:@"create table tbl_TradeInVehicle(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,Report_id varchar,Salutation varchar,Name varchar,LastName varchar,ContactNo varchar,Mail varchar,CCMail varchar,Date varchar,Budget varchar,Evaluate_Manufacturer varchar,Evaluate_ModelType varchar,Evaluate_VehicleModelType varchar,Evaluate_Date varchar,Evaluate_Month varchar,Evaluate_OnRoadValue varchar, Evaluate_Owner varchar,Evaluate_Color varchar,Evaluate_RemainingInsurance varchar, Evaluate_MarketDemand varchar,Evaluate_KMS varchar   ,Evaluate_CBUCKD varchar,Evaluate_Accidental varchar,Evaluate_Fuel varchar    ,Evaluate_Refurbishment varchar,Evaluate_EstimationBy varchar,Evaluate_OfferPriceByMax varchar,LoanAmountEstimator_LoanAmountTaken varchar, LoanAmountEstimator_RateOfInterest varchar, LoanAmountEstimator_loanTenure varchar, LoanAmountEstimator_MonthlyPayment varchar, LoanAmountEstimator_EMI varchar, LoanAmountEstimator_Percent varchar, LoanAmountEstimator_FinalPrice varchar, LoanAmountEstimator_OutstandingLoan varchar, LoanAmountEstimator_BalanceTradeforclose varchar, LoanAmountEstimator_EstimationBy varchar,NewVehicle_Make varchar, NewVehicle_Model varchar,NewVehicle_Type varchar,NewVehicle_Octroi varchar,NewVehicle_ExShowroomPrice varchar, NewVehicle_Insurance varchar, NewVehicle_LogisticsCharges varchar, NewVehicle_RegistrationServiceCharges varchar, NewVehicle_ServicePlan varchar,NewVehicle_ServicePlan_text varchar, NewVehicle_ExtendedWarranty varchar,NewVehicle_ExtendedWarranty_text varchar, NewVehicle_Accessories varchar, NewVehicle_BenefitstoCustomer varchar, NewVehicle_TotalOnRoadValue varchar, NewVehicle_BalanceTradeInValueforeclose varchar,NewVehicle_DownPayment varchar,NewVehicle_SuggestedLoanAmnt varchar,FinanceOffer_LoanAmount varchar,FinanceOffer_TotalOnRoadValue varchar,FinanceOffer_BalanceTrade_LoanForeClosure varchar,FinanceOffer_scheme1 varchar,FinanceOffer_scheme2 varchar,FinanceOffer_scheme3 varchar,FinanceOffer_scheme4 varchar ,Sync_Status varchar)"];
        //valuerupee to refurbishment
        
        
        
        //NEW VEHICLE TABLE FLOW...
        //10dec..//NEW TABLE OF NEW VEHICLE FLOW...
        [database executeUpdate:@"create table tbl_NEWVehicle_flow(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,Report_id varchar,Salutation varchar,Name varchar,LastName varchar,ContactNo varchar,Mail varchar,CCMail varchar,Date varchar,Budget varchar,NewVehicle_Make varchar, NewVehicle_Model varchar,NewVehicle_Type varchar,NewVehicle_Octroi varchar,NewVehicle_ExShowroomPrice varchar, NewVehicle_Insurance varchar, NewVehicle_LogisticsCharges varchar, NewVehicle_RegistrationServiceCharges varchar, NewVehicle_ServicePlan varchar,NewVehicle_ServicePlan_text varchar, NewVehicle_ExtendedWarranty varchar,NewVehicle_ExtendedWarranty_text varchar, NewVehicle_Accessories varchar, NewVehicle_BenefitstoCustomer varchar, NewVehicle_TotalOnRoadValue varchar, NewVehicle_BalanceTradeInValueforeclose varchar,NewVehicle_DownPayment varchar,NewVehicle_SuggestedLoanAmnt varchar,FinanceOffer_LoanAmount varchar,FinanceOffer_TotalOnRoadValue varchar,FinanceOffer_BalanceTrade_LoanForeClosure varchar,FinanceOffer_scheme1 varchar,FinanceOffer_scheme2 varchar,FinanceOffer_scheme3 varchar,FinanceOffer_scheme4 varchar ,Sync_Status varchar)"];

        
        
        //11dec..//Used TABLE flow...
        [database executeUpdate:@"create table tbl_usedcar_details(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,Report_id varchar,Salutation varchar,Name varchar,LastName varchar,ContactNo varchar,Mail varchar,CCMail varchar,Date varchar,Budget varchar,Evaluate_Manufacturer varchar,Evaluate_ModelType varchar,Evaluate_VehicleModelType varchar,Evaluate_Date varchar,Evaluate_Month varchar,Evaluate_OnRoadValue varchar, Evaluate_Owner varchar,Evaluate_Color varchar,Evaluate_RemainingInsurance varchar, Evaluate_MarketDemand varchar,Evaluate_KMS varchar,Evaluate_CBUCKD varchar,Evaluate_Accidental varchar,Evaluate_Fuel varchar,Evaluate_Refurbishment varchar,Evaluate_EstimationBy varchar,Evaluate_OfferPriceByMax varchar,LoanAmountEstimator_LoanAmountTaken varchar, LoanAmountEstimator_RateOfInterest varchar, LoanAmountEstimator_loanTenure varchar, LoanAmountEstimator_MonthlyPayment varchar, LoanAmountEstimator_EMI varchar, LoanAmountEstimator_Percent varchar, LoanAmountEstimator_FinalPrice varchar, LoanAmountEstimator_OutstandingLoan varchar, LoanAmountEstimator_BalanceTradeforclose varchar, LoanAmountEstimator_EstimationBy varchar, Sync_Status varchar)"];
        //valuerupee to refurbishment

        
        
        
        
        
        
        
        
        
        
        
        
        // create REMARK table..21sept..
        [database executeUpdate:@"create table tbl_remark(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,CustomerName varchar,Status varchar, ReportId varchar,Remark varchar,Date varchar)"];
        
        
        
        // create STATUSREPORT table..21sept..
        [database executeUpdate:@"create table tbl_status_report(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, customerName varchar, EmailId varchar, PhoneNo varchar, status varchar,reportId varchar, CreatedOn varchar)"];
        
        
        
        // 30 sept...create DEALER_NEWVEHICLE TABLE...
        
        [database executeUpdate:@"create table tbl_newvehicleDealer(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, Make varchar, Model varchar,Type varchar,Octroi varchar,ExShowroomPrice varchar, Insurance varchar, LogisticsCharges varchar, RegistrationServiceCharges varchar, ServicePlan varchar, ExtendedWarranty varchar , dealerID varchar, location varchar, createdOn varchar, modifiedOn varchar ,OnRoadValue varchar)"];
        
        
        /*
         Accessories varchar, BenefitstoCustomer varchar, TotalOnRoadValue varchar, BalanceTradeInValue varchar,DownPayment varchar,SuggestedLoanAmnt varchar
         */
        
        
        
        // 5 nov..Quotation table....
        [database executeUpdate:@"create table tbl_Quotation(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, Make varchar, Model varchar,Type varchar,Octroi varchar,ExShowroomPrice varchar, Insurance varchar, LogisticsCharges varchar, RegistrationServiceCharges varchar, ServicePlan varchar, ExtendedWarranty varchar , dealerID varchar, location varchar, createdOn varchar, modifiedOn varchar ,OnRoadValue varchar)"];
        
        //create custid na d reportid....here
        
        // 14 nov..Quotation table....
        [database executeUpdate:@"create table tbl_Quotation_New(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, Report_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, Cust_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,Type varchar,Octroi varchar,ExShowroomPrice varchar, Insurance varchar, LogisticsCharges varchar, RegistrationServiceCharges varchar, ServicePlan varchar, ExtendedWarranty varchar , dealerID varchar, location varchar, createdOn varchar, modifiedOn varchar ,OnRoadValue varchar)"];

        
        
    

        
        
//        //19 nov..
//        [database executeUpdate:@"create table tbl_usedcar_details(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,uid varchar,Cust_id varchar, Report_id varchar unique, car_make varchar, car_model varchar, car_model_type varchar, used_car_purchase_offer varchar, outstanding_loan_amount varchar, net_transaction_amount varchar, used_car_estimate_by varchar, outstanding_estimate_by varchar,expected_time varchar, expected_budget varchar, purchase_year varchar,purchase_month varchar, onroad_value varchar, owner varchar, colour varchar,remain_insurance varchar, car_speed_type varchar, car_kms varchar, cbuckd varchar, accidental varchar, car_fuel_type varchar, refurbishment varchar,loan_amount,interest_rate_percent,loan_tenure,actual_emi,estimated_foreclose_percent,balance_trade_foreclose,sync_type varchar,created_on varchar)"];
        
        
        
        
        //29 march..
        
        [database executeUpdate:@"create table tbl_LoginDetails(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,UserId varchar,Password varchar)"];
        
        
        
        
        
    
        //created_on NOT NULL DEFAULT GETDATE()
        
        [database close];
        
    }
    else
    {
        [self GetLoginnn_29march];
        
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docsPath = [paths objectAtIndex:0];
        NSString *path = [docsPath stringByAppendingPathComponent:@"maximizer.sqlite"];
        
        NSLog(@"path:%@",path);
        
        
        [[NSUserDefaults standardUserDefaults]setObject:path forKey:@"db_path"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        
        
        //USED>...
        //
        NSString *str=[[NSUserDefaults standardUserDefaults]valueForKey:@"db_path"];
        
        NSLog(@"str:%@",str);
        
        database = [FMDatabase databaseWithPath:str];
        
        [database open];
        
        
        
        if([self isNetworkAvailable] == YES)
            
        {
            
            // 1)UsedVehicle sync.....

            NSLog(@"App is ONLINE n USEDVEHICLE flow");
            
            FMResultSet *rs = [database executeQuery:@"SELECT * FROM  tbl_usedcar_details WHERE Sync_Status='Pending'"];
            
            while ([rs next])
            {
                NSLog(@" ============== %@", [[rs resultDictionary] description]);
                
                NSString *sId = [rs stringForColumn:@"id"];
                NSLog(@"sId :%@", sId);
                [[NSUserDefaults standardUserDefaults] setValue:sId forKey:@"sId"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                
                NSString *sReport_id = [rs stringForColumn:@"Report_id"];
                NSLog(@"sReport_id :%@", sReport_id);
                [[NSUserDefaults standardUserDefaults] setValue:sReport_id forKey:@"sReport_id"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                
                NSString *sSalutation = [rs stringForColumn:@"Salutation"];
                NSLog(@"sSalutation :%@", sSalutation);
                [[NSUserDefaults standardUserDefaults] setValue:sSalutation forKey:@"sSalutation"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                
                NSString *sName = [rs stringForColumn:@"Name"];
                NSLog(@"sName :%@", sName);
                [[NSUserDefaults standardUserDefaults] setValue:sName forKey:@"sName"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                
                NSString *sLastName = [rs stringForColumn:@"LastName"];
                [[NSUserDefaults standardUserDefaults] setValue:sLastName forKey:@"sLastName"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                
                NSString *sContactNo = [rs stringForColumn:@"ContactNo"];
                [[NSUserDefaults standardUserDefaults] setValue:sContactNo forKey:@"sContactNo"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                
                NSString *sMail = [rs stringForColumn:@"Mail"];
                [[NSUserDefaults standardUserDefaults] setValue:sMail forKey:@"sMail"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                
                NSString *sCCMail = [rs stringForColumn:@"CCMail"];
                [[NSUserDefaults standardUserDefaults] setValue:sCCMail forKey:@"sCCMail"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                
                
                NSString *sDate = [rs stringForColumn:@"Date"];
                [[NSUserDefaults standardUserDefaults] setValue:sDate forKey:@"sDate"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                
                NSString *sBudget = [rs stringForColumn:@"Budget"];
                [[NSUserDefaults standardUserDefaults] setValue:sBudget forKey:@"sBudget"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                
                NSString *sEvaluate_Manufacturer = [rs stringForColumn:@"Evaluate_Manufacturer"];
                [[NSUserDefaults standardUserDefaults] setValue:sEvaluate_Manufacturer forKey:@"sEvaluate_Manufacturer"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                
                
                NSString *sEvaluate_ModelType = [rs stringForColumn:@"Evaluate_ModelType"];
                [[NSUserDefaults standardUserDefaults] setValue:sEvaluate_ModelType forKey:@"sEvaluate_ModelType"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                
                NSString *sEvaluate_VehicleModelType = [rs stringForColumn:@"Evaluate_VehicleModelType"];
              [[NSUserDefaults standardUserDefaults] setValue:sEvaluate_VehicleModelType forKey:@"sEvaluate_VehicleModelType"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                
                NSString *sEvaluate_Date = [rs stringForColumn:@"Evaluate_Date"];
                [[NSUserDefaults standardUserDefaults] setValue:sEvaluate_Date forKey:@"sEvaluate_Date"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                
                NSString *sEvaluate_Month = [rs stringForColumn:@"Evaluate_Month"];
                [[NSUserDefaults standardUserDefaults] setValue:sEvaluate_Month forKey:@"sEvaluate_Month"];
                [[NSUserDefaults standardUserDefaults]synchronize];

                NSString *sEvaluate_OnRoadValue = [rs stringForColumn:@"Evaluate_OnRoadValue"];
                [[NSUserDefaults standardUserDefaults] setValue:sEvaluate_OnRoadValue forKey:@"sEvaluate_OnRoadValue"];
                [[NSUserDefaults standardUserDefaults]synchronize];

                NSString *sEvaluate_Owner = [rs stringForColumn:@"Evaluate_Owner"];
                [[NSUserDefaults standardUserDefaults] setValue:sEvaluate_Owner forKey:@"sEvaluate_Owner"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *sEvaluate_Color = [rs stringForColumn:@"Evaluate_Color"];
                [[NSUserDefaults standardUserDefaults] setValue:sEvaluate_Color forKey:@"sEvaluate_Color"];
                [[NSUserDefaults standardUserDefaults]synchronize];

                NSString *sEvaluate_RemainingInsurance = [rs stringForColumn:@"Evaluate_RemainingInsurance"];
                [[NSUserDefaults standardUserDefaults] setValue:sEvaluate_RemainingInsurance forKey:@"sEvaluate_RemainingInsurance"];
                [[NSUserDefaults standardUserDefaults]synchronize];

                NSString *sEvaluate_MarketDemand = [rs stringForColumn:@"Evaluate_MarketDemand"];
                [[NSUserDefaults standardUserDefaults] setValue:sEvaluate_MarketDemand forKey:@"sEvaluate_MarketDemand"];
                [[NSUserDefaults standardUserDefaults]synchronize];

                NSString *sEvaluate_KMS = [rs stringForColumn:@"Evaluate_KMS"];
                [[NSUserDefaults standardUserDefaults] setValue:sEvaluate_KMS forKey:@"sEvaluate_KMS"];
                [[NSUserDefaults standardUserDefaults]synchronize];

                NSString *sEvaluate_CBUCKD = [rs stringForColumn:@"Evaluate_CBUCKD"];
                [[NSUserDefaults standardUserDefaults] setValue:sEvaluate_CBUCKD forKey:@"sEvaluate_CBUCKD"];
                [[NSUserDefaults standardUserDefaults]synchronize];

                NSString *sEvaluate_Accidental = [rs stringForColumn:@"Evaluate_Accidental"];
                [[NSUserDefaults standardUserDefaults] setValue:sEvaluate_Accidental forKey:@"sEvaluate_Accidental"];
                [[NSUserDefaults standardUserDefaults]synchronize];

                NSString *sEvaluate_Fuel = [rs stringForColumn:@"Evaluate_Fuel"];
                [[NSUserDefaults standardUserDefaults] setValue:sEvaluate_Fuel forKey:@"sEvaluate_Fuel"];
                [[NSUserDefaults standardUserDefaults]synchronize];

                NSString *sEvaluate_Refurbishment = [rs stringForColumn:@"Evaluate_Refurbishment"];
                [[NSUserDefaults standardUserDefaults] setValue:sEvaluate_Refurbishment forKey:@"sEvaluate_Refurbishment"];
                [[NSUserDefaults standardUserDefaults]synchronize];

                NSString *sEvaluate_EstimationBy = [rs stringForColumn:@"Evaluate_EstimationBy"];
                [[NSUserDefaults standardUserDefaults] setValue:sEvaluate_EstimationBy forKey:@"sEvaluate_EstimationBy"];
                [[NSUserDefaults standardUserDefaults]synchronize];

                NSString *sEvaluate_OfferPriceByMax = [rs stringForColumn:@"Evaluate_OfferPriceByMax"];
                [[NSUserDefaults standardUserDefaults] setValue:sEvaluate_OfferPriceByMax forKey:@"sEvaluate_OfferPriceByMax"];
                [[NSUserDefaults standardUserDefaults]synchronize];

                NSString *sLoanAmountEstimator_LoanAmountTaken = [rs stringForColumn:@"LoanAmountEstimator_LoanAmountTaken"];
                [[NSUserDefaults standardUserDefaults] setValue:sLoanAmountEstimator_LoanAmountTaken forKey:@"sLoanAmountEstimator_LoanAmountTaken"];
                [[NSUserDefaults standardUserDefaults]synchronize];

                NSString *sLoanAmountEstimator_RateOfInterest = [rs stringForColumn:@"LoanAmountEstimator_RateOfInterest"];
                [[NSUserDefaults standardUserDefaults] setValue:sLoanAmountEstimator_RateOfInterest forKey:@"sLoanAmountEstimator_RateOfInterest"];
                [[NSUserDefaults standardUserDefaults]synchronize];

                NSString *sLoanAmountEstimator_loanTenure = [rs stringForColumn:@"LoanAmountEstimator_loanTenure"];
                [[NSUserDefaults standardUserDefaults] setValue:sLoanAmountEstimator_loanTenure forKey:@"sLoanAmountEstimator_loanTenure"];
                [[NSUserDefaults standardUserDefaults]synchronize];

                NSString *sLoanAmountEstimator_MonthlyPayment = [rs stringForColumn:@"LoanAmountEstimator_MonthlyPayment"];
                [[NSUserDefaults standardUserDefaults] setValue:sLoanAmountEstimator_MonthlyPayment forKey:@"sLoanAmountEstimator_MonthlyPayment"];
                [[NSUserDefaults standardUserDefaults]synchronize];

                NSString *sLoanAmountEstimator_EMI = [rs stringForColumn:@"LoanAmountEstimator_EMI"];
                [[NSUserDefaults standardUserDefaults] setValue:sLoanAmountEstimator_EMI forKey:@"sLoanAmountEstimator_EMI"];
                [[NSUserDefaults standardUserDefaults]synchronize];

                NSString *sLoanAmountEstimator_Percent = [rs stringForColumn:@"LoanAmountEstimator_Percent"];
                [[NSUserDefaults standardUserDefaults] setValue:sLoanAmountEstimator_Percent forKey:@"sLoanAmountEstimator_Percent"];
                [[NSUserDefaults standardUserDefaults]synchronize];

                NSString *sLoanAmountEstimator_FinalPrice = [rs stringForColumn:@"LoanAmountEstimator_FinalPrice"];
                [[NSUserDefaults standardUserDefaults] setValue:sLoanAmountEstimator_FinalPrice forKey:@"sLoanAmountEstimator_FinalPrice"];
                [[NSUserDefaults standardUserDefaults]synchronize];

                NSString *sLoanAmountEstimator_OutstandingLoan = [rs stringForColumn:@"LoanAmountEstimator_OutstandingLoan"];
                [[NSUserDefaults standardUserDefaults] setValue:sLoanAmountEstimator_OutstandingLoan forKey:@"sLoanAmountEstimator_OutstandingLoan"];
                [[NSUserDefaults standardUserDefaults]synchronize];

                NSString *sLoanAmountEstimator_BalanceTradeforclose = [rs stringForColumn:@"LoanAmountEstimator_BalanceTradeforclose"];
                [[NSUserDefaults standardUserDefaults] setValue:sLoanAmountEstimator_BalanceTradeforclose forKey:@"sLoanAmountEstimator_BalanceTradeforclose"];
                [[NSUserDefaults standardUserDefaults]synchronize];

                NSString *sLoanAmountEstimator_EstimationBy = [rs stringForColumn:@"LoanAmountEstimator_EstimationBy"];
                [[NSUserDefaults standardUserDefaults] setValue:sLoanAmountEstimator_EstimationBy forKey:@"sLoanAmountEstimator_EstimationBy"];
                [[NSUserDefaults standardUserDefaults]synchronize];

                NSString *sSync_Status = [rs stringForColumn:@"Sync_Status"];
                [[NSUserDefaults standardUserDefaults] setValue:sSync_Status forKey:@"sSync_Status"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                
                
                [self GetUsedVehicleDetails_Data];
                
            }  //while ends of USED SYNC....
            
            
            
            // 2)trade-in sync.....
            NSLog(@"App is ONLINE n TRADEIN flow");
            
            FMResultSet *rs_tradein = [database executeQuery:@"SELECT * FROM  tbl_TradeInVehicle WHERE Sync_Status='Pending'"];
            
            while ([rs_tradein next])
            {
                
                /*
                 [database executeUpdate:@"create table tbl_TradeInVehicle(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,Report_id varchar,Salutation varchar,Name varchar,LastName varchar,ContactNo varchar,Mail varchar,CCMail varchar,Date varchar,Budget varchar,Evaluate_Manufacturer varchar,Evaluate_ModelType varchar,Evaluate_VehicleModelType varchar,Evaluate_Date varchar,Evaluate_Month varchar,Evaluate_OnRoadValue varchar, Evaluate_Owner varchar,Evaluate_Color varchar,Evaluate_RemainingInsurance varchar, Evaluate_MarketDemand varchar,Evaluate_KMS varchar   ,Evaluate_CBUCKD varchar,Evaluate_Accidental varchar,Evaluate_Fuel varchar,Evaluate_Refurbishment varchar,Evaluate_EstimationBy varchar,Evaluate_OfferPriceByMax varchar,LoanAmountEstimator_LoanAmountTaken varchar, LoanAmountEstimator_RateOfInterest varchar, LoanAmountEstimator_loanTenure varchar, LoanAmountEstimator_MonthlyPayment varchar, LoanAmountEstimator_EMI varchar, LoanAmountEstimator_Percent varchar, LoanAmountEstimator_FinalPrice varchar, LoanAmountEstimator_OutstandingLoan varchar, LoanAmountEstimator_BalanceTradeforclose varchar, LoanAmountEstimator_EstimationBy varchar         ,NewVehicle_Make varchar, NewVehicle_Model varchar,NewVehicle_Type varchar,NewVehicle_Octroi varchar,NewVehicle_ExShowroomPrice varchar, NewVehicle_Insurance varchar, NewVehicle_LogisticsCharges varchar, NewVehicle_RegistrationServiceCharges varchar, NewVehicle_ServicePlan varchar,NewVehicle_ServicePlan_text varchar, NewVehicle_ExtendedWarranty varchar,NewVehicle_ExtendedWarranty_text varchar, NewVehicle_Accessories varchar, NewVehicle_BenefitstoCustomer varchar, NewVehicle_TotalOnRoadValue varchar, NewVehicle_BalanceTradeInValueforeclose varchar,NewVehicle_DownPayment varchar,NewVehicle_SuggestedLoanAmnt varchar,FinanceOffer_LoanAmount varchar,FinanceOffer_TotalOnRoadValue varchar,FinanceOffer_BalanceTrade_LoanForeClosure varchar,FinanceOffer_scheme1 varchar,FinanceOffer_scheme2 varchar,FinanceOffer_scheme3 varchar,FinanceOffer_scheme4 varchar)"];
                 */
                
                
                
                
                
                NSLog(@" ============== %@", [[rs_tradein resultDictionary] description]);
                
                NSString *trId = [rs_tradein stringForColumn:@"id"];
                NSLog(@"trId :%@", trId);
                [[NSUserDefaults standardUserDefaults] setValue:trId forKey:@"trId"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *trReport_id = [rs_tradein stringForColumn:@"Report_id"];
                NSLog(@"trReport_id :%@", trReport_id);
                [[NSUserDefaults standardUserDefaults] setValue:trReport_id forKey:@"trReport_id"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *trSalutation = [rs_tradein stringForColumn:@"Salutation"];
                NSLog(@"trSalutation :%@", trSalutation);
                [[NSUserDefaults standardUserDefaults] setValue:trSalutation forKey:@"trSalutation"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *trName = [rs_tradein stringForColumn:@"Name"];
                NSLog(@"trName :%@", trName);
                [[NSUserDefaults standardUserDefaults] setValue:trName forKey:@"trName"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *trLastName = [rs_tradein stringForColumn:@"LastName"];
                [[NSUserDefaults standardUserDefaults] setValue:trLastName forKey:@"trLastName"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *trContactNo = [rs_tradein stringForColumn:@"ContactNo"];
                [[NSUserDefaults standardUserDefaults] setValue:trContactNo forKey:@"trContactNo"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *trMail = [rs_tradein stringForColumn:@"Mail"];
                [[NSUserDefaults standardUserDefaults] setValue:trMail forKey:@"trMail"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *trCCMail = [rs_tradein stringForColumn:@"CCMail"];
                [[NSUserDefaults standardUserDefaults] setValue:trCCMail forKey:@"trCCMail"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *trDate = [rs_tradein stringForColumn:@"Date"];
                [[NSUserDefaults standardUserDefaults] setValue:trDate forKey:@"trDate"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *trBudget = [rs_tradein stringForColumn:@"Budget"];
                [[NSUserDefaults standardUserDefaults] setValue:trBudget forKey:@"trBudget"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *trEvaluate_Manufacturer = [rs_tradein stringForColumn:@"Evaluate_Manufacturer"];
                [[NSUserDefaults standardUserDefaults] setValue:trEvaluate_Manufacturer forKey:@"trEvaluate_Manufacturer"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *trEvaluate_ModelType = [rs_tradein stringForColumn:@"Evaluate_ModelType"];
                [[NSUserDefaults standardUserDefaults] setValue:trEvaluate_ModelType forKey:@"trEvaluate_ModelType"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *trEvaluate_VehicleModelType = [rs_tradein stringForColumn:@"Evaluate_VehicleModelType"];
                [[NSUserDefaults standardUserDefaults] setValue:trEvaluate_VehicleModelType forKey:@"trEvaluate_VehicleModelType"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *trEvaluate_Date = [rs_tradein stringForColumn:@"Evaluate_Date"];
                [[NSUserDefaults standardUserDefaults] setValue:trEvaluate_Date forKey:@"trEvaluate_Date"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *trEvaluate_Month = [rs_tradein stringForColumn:@"Evaluate_Month"];
                [[NSUserDefaults standardUserDefaults] setValue:trEvaluate_Month forKey:@"trEvaluate_Month"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *trEvaluate_OnRoadValue = [rs_tradein stringForColumn:@"Evaluate_OnRoadValue"];
                [[NSUserDefaults standardUserDefaults] setValue:trEvaluate_OnRoadValue forKey:@"trEvaluate_OnRoadValue"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *trEvaluate_Owner = [rs_tradein stringForColumn:@"Evaluate_Owner"];
                [[NSUserDefaults standardUserDefaults] setValue:trEvaluate_Owner forKey:@"trEvaluate_Owner"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *trEvaluate_Color = [rs_tradein stringForColumn:@"Evaluate_Color"];
                [[NSUserDefaults standardUserDefaults] setValue:trEvaluate_Color forKey:@"trEvaluate_Color"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *trEvaluate_RemainingInsurance = [rs_tradein stringForColumn:@"Evaluate_RemainingInsurance"];
                [[NSUserDefaults standardUserDefaults] setValue:trEvaluate_RemainingInsurance forKey:@"trEvaluate_RemainingInsurance"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *trEvaluate_MarketDemand = [rs_tradein stringForColumn:@"Evaluate_MarketDemand"];
                [[NSUserDefaults standardUserDefaults] setValue:trEvaluate_MarketDemand forKey:@"trEvaluate_MarketDemand"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *trEvaluate_KMS = [rs_tradein stringForColumn:@"Evaluate_KMS"];
                [[NSUserDefaults standardUserDefaults] setValue:trEvaluate_KMS forKey:@"trEvaluate_KMS"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *trEvaluate_CBUCKD = [rs_tradein stringForColumn:@"Evaluate_CBUCKD"];
                [[NSUserDefaults standardUserDefaults] setValue:trEvaluate_CBUCKD forKey:@"trEvaluate_CBUCKD"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *trEvaluate_Accidental = [rs_tradein stringForColumn:@"Evaluate_Accidental"];
                [[NSUserDefaults standardUserDefaults] setValue:trEvaluate_Accidental forKey:@"trEvaluate_Accidental"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *trEvaluate_Fuel = [rs_tradein stringForColumn:@"Evaluate_Fuel"];
                [[NSUserDefaults standardUserDefaults] setValue:trEvaluate_Fuel forKey:@"trEvaluate_Fuel"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *trEvaluate_Refurbishment = [rs_tradein stringForColumn:@"Evaluate_Refurbishment"];
                [[NSUserDefaults standardUserDefaults] setValue:trEvaluate_Refurbishment forKey:@"trEvaluate_Refurbishment"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *trEvaluate_EstimationBy = [rs_tradein stringForColumn:@"Evaluate_EstimationBy"];
                [[NSUserDefaults standardUserDefaults] setValue:trEvaluate_EstimationBy forKey:@"trEvaluate_EstimationBy"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *trEvaluate_OfferPriceByMax = [rs_tradein stringForColumn:@"Evaluate_OfferPriceByMax"];
                [[NSUserDefaults standardUserDefaults] setValue:trEvaluate_OfferPriceByMax forKey:@"trEvaluate_OfferPriceByMax"];
                [[NSUserDefaults standardUserDefaults]synchronize];

                
                NSString *trLoanAmountEstimator_LoanAmountTaken = [rs_tradein stringForColumn:@"LoanAmountEstimator_LoanAmountTaken"];
                [[NSUserDefaults standardUserDefaults] setValue:trLoanAmountEstimator_LoanAmountTaken forKey:@"trLoanAmountEstimator_LoanAmountTaken"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *trLoanAmountEstimator_RateOfInterest = [rs_tradein stringForColumn:@"LoanAmountEstimator_RateOfInterest"];
                [[NSUserDefaults standardUserDefaults] setValue:trLoanAmountEstimator_RateOfInterest forKey:@"trLoanAmountEstimator_RateOfInterest"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *trLoanAmountEstimator_loanTenure = [rs_tradein stringForColumn:@"LoanAmountEstimator_loanTenure"];
                [[NSUserDefaults standardUserDefaults] setValue:trLoanAmountEstimator_loanTenure forKey:@"trLoanAmountEstimator_loanTenure"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *trLoanAmountEstimator_MonthlyPayment = [rs_tradein stringForColumn:@"LoanAmountEstimator_MonthlyPayment"];
                [[NSUserDefaults standardUserDefaults] setValue:trLoanAmountEstimator_MonthlyPayment forKey:@"trLoanAmountEstimator_MonthlyPayment"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *trLoanAmountEstimator_EMI = [rs_tradein stringForColumn:@"LoanAmountEstimator_EMI"];
                [[NSUserDefaults standardUserDefaults] setValue:trLoanAmountEstimator_EMI forKey:@"trLoanAmountEstimator_EMI"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *trLoanAmountEstimator_Percent = [rs_tradein stringForColumn:@"LoanAmountEstimator_Percent"];
                [[NSUserDefaults standardUserDefaults] setValue:trLoanAmountEstimator_Percent forKey:@"trLoanAmountEstimator_Percent"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *trLoanAmountEstimator_FinalPrice = [rs_tradein stringForColumn:@"LoanAmountEstimator_FinalPrice"];
                [[NSUserDefaults standardUserDefaults] setValue:trLoanAmountEstimator_FinalPrice forKey:@"trLoanAmountEstimator_FinalPrice"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *trLoanAmountEstimator_OutstandingLoan = [rs_tradein stringForColumn:@"LoanAmountEstimator_OutstandingLoan"];
                [[NSUserDefaults standardUserDefaults] setValue:trLoanAmountEstimator_OutstandingLoan forKey:@"trLoanAmountEstimator_OutstandingLoan"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *trLoanAmountEstimator_BalanceTradeforclose = [rs_tradein stringForColumn:@"LoanAmountEstimator_BalanceTradeforclose"];
                [[NSUserDefaults standardUserDefaults] setValue:trLoanAmountEstimator_BalanceTradeforclose forKey:@"trLoanAmountEstimator_BalanceTradeforclose"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *trLoanAmountEstimator_EstimationBy = [rs_tradein stringForColumn:@"LoanAmountEstimator_EstimationBy"];
                [[NSUserDefaults standardUserDefaults] setValue:trLoanAmountEstimator_EstimationBy forKey:@"trLoanAmountEstimator_EstimationBy"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *trNewVehicle_Make = [rs_tradein stringForColumn:@"NewVehicle_Make"];
                [[NSUserDefaults standardUserDefaults] setValue:trNewVehicle_Make forKey:@"trNewVehicle_Make"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *trNewVehicle_Model = [rs_tradein stringForColumn:@"NewVehicle_Model"];
                [[NSUserDefaults standardUserDefaults] setValue:trNewVehicle_Model forKey:@"trNewVehicle_Model"];
                [[NSUserDefaults standardUserDefaults]synchronize];

                NSString *trNewVehicle_Type = [rs_tradein stringForColumn:@"NewVehicle_Type"];
                [[NSUserDefaults standardUserDefaults] setValue:trNewVehicle_Type forKey:@"trNewVehicle_Type"];
                [[NSUserDefaults standardUserDefaults]synchronize];

                NSString *trNewVehicle_Octroi = [rs_tradein stringForColumn:@"NewVehicle_Octroi"];
                [[NSUserDefaults standardUserDefaults] setValue:trNewVehicle_Octroi forKey:@"trNewVehicle_Octroi"];
                [[NSUserDefaults standardUserDefaults]synchronize];

                NSString *trNewVehicle_ExShowroomPrice = [rs_tradein stringForColumn:@"NewVehicle_ExShowroomPrice"];
                [[NSUserDefaults standardUserDefaults] setValue:trNewVehicle_ExShowroomPrice forKey:@"trNewVehicle_ExShowroomPrice"];
                [[NSUserDefaults standardUserDefaults]synchronize];

                NSString *trNewVehicle_Insurance = [rs_tradein stringForColumn:@"NewVehicle_Insurance"];
                [[NSUserDefaults standardUserDefaults] setValue:trNewVehicle_Insurance forKey:@"trNewVehicle_Insurance"];
                [[NSUserDefaults standardUserDefaults]synchronize];

                NSString *trNewVehicle_LogisticsCharges = [rs_tradein stringForColumn:@"NewVehicle_LogisticsCharges"];
                [[NSUserDefaults standardUserDefaults] setValue:trNewVehicle_LogisticsCharges forKey:@"trNewVehicle_LogisticsCharges"];
                [[NSUserDefaults standardUserDefaults]synchronize];

                NSString *trNewVehicle_RegistrationServiceCharges = [rs_tradein stringForColumn:@"NewVehicle_RegistrationServiceCharges"];
                [[NSUserDefaults standardUserDefaults] setValue:trNewVehicle_RegistrationServiceCharges forKey:@"trNewVehicle_RegistrationServiceCharges"];
                [[NSUserDefaults standardUserDefaults]synchronize];

                NSString *trNewVehicle_ServicePlan = [rs_tradein stringForColumn:@"NewVehicle_ServicePlan"];
                [[NSUserDefaults standardUserDefaults] setValue:trNewVehicle_ServicePlan forKey:@"trNewVehicle_ServicePlan"];
                [[NSUserDefaults standardUserDefaults]synchronize];

                NSString *trNewVehicle_ServicePlan_text = [rs_tradein stringForColumn:@"NewVehicle_ServicePlan_text"];
                [[NSUserDefaults standardUserDefaults] setValue:trNewVehicle_ServicePlan_text forKey:@"trNewVehicle_ServicePlan_text"];
                [[NSUserDefaults standardUserDefaults]synchronize];

                NSString *trNewVehicle_ExtendedWarranty = [rs_tradein stringForColumn:@"NewVehicle_ExtendedWarranty"];
                [[NSUserDefaults standardUserDefaults] setValue:trNewVehicle_ExtendedWarranty forKey:@"trNewVehicle_ExtendedWarranty"];
                [[NSUserDefaults standardUserDefaults]synchronize];

                NSString *trNewVehicle_ExtendedWarranty_text = [rs_tradein stringForColumn:@"NewVehicle_ExtendedWarranty_text"];
                [[NSUserDefaults standardUserDefaults] setValue:trNewVehicle_ExtendedWarranty_text forKey:@"trNewVehicle_ExtendedWarranty_text"];
                [[NSUserDefaults standardUserDefaults]synchronize];

                NSString *trNewVehicle_Accessories = [rs_tradein stringForColumn:@"NewVehicle_Accessories"];
                [[NSUserDefaults standardUserDefaults] setValue:trNewVehicle_Accessories forKey:@"trNewVehicle_Accessories"];
                [[NSUserDefaults standardUserDefaults]synchronize];

                NSString *trNewVehicle_BenefitstoCustomer = [rs_tradein stringForColumn:@"NewVehicle_BenefitstoCustomer"];
                [[NSUserDefaults standardUserDefaults] setValue:trNewVehicle_BenefitstoCustomer forKey:@"trNewVehicle_BenefitstoCustomer"];
                [[NSUserDefaults standardUserDefaults]synchronize];

                NSString *trNewVehicle_TotalOnRoadValue = [rs_tradein stringForColumn:@"NewVehicle_TotalOnRoadValue"];
                [[NSUserDefaults standardUserDefaults] setValue:trNewVehicle_TotalOnRoadValue forKey:@"trNewVehicle_TotalOnRoadValue"];
                [[NSUserDefaults standardUserDefaults]synchronize];

                NSString *trNewVehicle_BalanceTradeInValueforeclose = [rs_tradein stringForColumn:@"NewVehicle_BalanceTradeInValueforeclose"];
                [[NSUserDefaults standardUserDefaults] setValue:trNewVehicle_BalanceTradeInValueforeclose forKey:@"trNewVehicle_BalanceTradeInValueforeclose"];
                [[NSUserDefaults standardUserDefaults]synchronize];

                NSString *trNewVehicle_DownPayment = [rs_tradein stringForColumn:@"NewVehicle_DownPayment"];
                [[NSUserDefaults standardUserDefaults] setValue:trNewVehicle_DownPayment forKey:@"trNewVehicle_DownPayment"];
                [[NSUserDefaults standardUserDefaults]synchronize];

                NSString *trNewVehicle_SuggestedLoanAmnt = [rs_tradein stringForColumn:@"NewVehicle_SuggestedLoanAmnt"];
                [[NSUserDefaults standardUserDefaults] setValue:trNewVehicle_SuggestedLoanAmnt forKey:@"trNewVehicle_SuggestedLoanAmnt"];
                [[NSUserDefaults standardUserDefaults]synchronize];

                NSString *trFinanceOffer_LoanAmount = [rs_tradein stringForColumn:@"FinanceOffer_LoanAmount"];
                [[NSUserDefaults standardUserDefaults] setValue:trFinanceOffer_LoanAmount forKey:@"trFinanceOffer_LoanAmount"];
                [[NSUserDefaults standardUserDefaults]synchronize];

                NSString *trFinanceOffer_TotalOnRoadValue = [rs_tradein stringForColumn:@"FinanceOffer_TotalOnRoadValue"];
                [[NSUserDefaults standardUserDefaults] setValue:trFinanceOffer_TotalOnRoadValue forKey:@"trFinanceOffer_TotalOnRoadValue"];
                [[NSUserDefaults standardUserDefaults]synchronize];

                NSString *trFinanceOffer_BalanceTrade_LoanForeClosure = [rs_tradein stringForColumn:@"FinanceOffer_BalanceTrade_LoanForeClosure"];
                [[NSUserDefaults standardUserDefaults] setValue:trFinanceOffer_BalanceTrade_LoanForeClosure forKey:@"trFinanceOffer_BalanceTrade_LoanForeClosure"];
                [[NSUserDefaults standardUserDefaults]synchronize];

                NSString *trFinanceOffer_scheme1 = [rs_tradein stringForColumn:@"FinanceOffer_scheme1"];
                [[NSUserDefaults standardUserDefaults] setValue:trFinanceOffer_scheme1 forKey:@"trFinanceOffer_scheme1"];
                [[NSUserDefaults standardUserDefaults]synchronize];

                NSString *trFinanceOffer_scheme2 = [rs_tradein stringForColumn:@"FinanceOffer_scheme2"];
                [[NSUserDefaults standardUserDefaults] setValue:trFinanceOffer_scheme2 forKey:@"trFinanceOffer_scheme2"];
                [[NSUserDefaults standardUserDefaults]synchronize];

                NSString *trFinanceOffer_scheme3 = [rs_tradein stringForColumn:@"FinanceOffer_scheme3"];
                [[NSUserDefaults standardUserDefaults] setValue:trFinanceOffer_scheme3 forKey:@"trFinanceOffer_scheme3"];
                [[NSUserDefaults standardUserDefaults]synchronize];

                NSString *trFinanceOffer_scheme4 = [rs_tradein stringForColumn:@"FinanceOffer_scheme4"];
                [[NSUserDefaults standardUserDefaults] setValue:trFinanceOffer_scheme4 forKey:@"trFinanceOffer_scheme4"];
                [[NSUserDefaults standardUserDefaults]synchronize];

                
                NSString *trSync_Status = [rs_tradein stringForColumn:@"Sync_Status"];
                [[NSUserDefaults standardUserDefaults] setValue:trSync_Status forKey:@"trSync_Status"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                
                
                [self GetTradeinVehicleSynccDetailsdata];
                
            } //while ends of Trade-in sync...

            
            
            
            
            
            // 3)Newvehicle sync.....
            NSLog(@"App is ONLINE n NEWVEHICLE flow");
            
            FMResultSet *rs_NewVehicle = [database executeQuery:@"SELECT * FROM  tbl_NEWVehicle_flow WHERE Sync_Status='Pending'"];
            
            while ([rs_NewVehicle next])
            {
                NSLog(@" ============== %@", [[rs_NewVehicle resultDictionary] description]);
                
                NSString *NId = [rs_NewVehicle stringForColumn:@"id"];
                NSLog(@"NId :%@", NId);
                [[NSUserDefaults standardUserDefaults] setValue:NId forKey:@"NId"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *NReport_id = [rs_NewVehicle stringForColumn:@"Report_id"];
                NSLog(@"NReport_id :%@", NReport_id);
                [[NSUserDefaults standardUserDefaults] setValue:NReport_id forKey:@"NReport_id"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *NSalutation = [rs_NewVehicle stringForColumn:@"Salutation"];
                NSLog(@"NSalutation :%@", NSalutation);
                [[NSUserDefaults standardUserDefaults] setValue:NSalutation forKey:@"NSalutation"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *NName = [rs_NewVehicle stringForColumn:@"Name"];
                NSLog(@"NName :%@", NName);
                [[NSUserDefaults standardUserDefaults] setValue:NName forKey:@"NName"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *NLastName = [rs_NewVehicle stringForColumn:@"LastName"];
                [[NSUserDefaults standardUserDefaults] setValue:NLastName forKey:@"NLastName"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *NContactNo = [rs_NewVehicle stringForColumn:@"ContactNo"];
                [[NSUserDefaults standardUserDefaults] setValue:NContactNo forKey:@"NContactNo"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *NMail = [rs_NewVehicle stringForColumn:@"Mail"];
                [[NSUserDefaults standardUserDefaults] setValue:NMail forKey:@"NMail"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *NCCMail = [rs_NewVehicle stringForColumn:@"CCMail"];
                [[NSUserDefaults standardUserDefaults] setValue:NCCMail forKey:@"NCCMail"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *NDate = [rs_NewVehicle stringForColumn:@"Date"];
                [[NSUserDefaults standardUserDefaults] setValue:NDate forKey:@"NDate"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *NBudget = [rs_NewVehicle stringForColumn:@"Budget"];
                [[NSUserDefaults standardUserDefaults] setValue:NBudget forKey:@"NBudget"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                
                NSString *NNewVehicle_Make = [rs_NewVehicle stringForColumn:@"NewVehicle_Make"];
                [[NSUserDefaults standardUserDefaults] setValue:NNewVehicle_Make forKey:@"NNewVehicle_Make"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *NNewVehicle_Model = [rs_NewVehicle stringForColumn:@"NewVehicle_Model"];
                [[NSUserDefaults standardUserDefaults] setValue:NNewVehicle_Model forKey:@"NNewVehicle_Model"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *NNewVehicle_Type = [rs_NewVehicle stringForColumn:@"NewVehicle_Type"];
                [[NSUserDefaults standardUserDefaults] setValue:NNewVehicle_Type forKey:@"NNewVehicle_Type"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *NNewVehicle_Octroi = [rs_NewVehicle stringForColumn:@"NewVehicle_Octroi"];
                [[NSUserDefaults standardUserDefaults] setValue:NNewVehicle_Octroi forKey:@"NNewVehicle_Octroi"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *NNewVehicle_ExShowroomPrice = [rs_NewVehicle stringForColumn:@"NewVehicle_ExShowroomPrice"];
                [[NSUserDefaults standardUserDefaults] setValue:NNewVehicle_ExShowroomPrice forKey:@"NNewVehicle_ExShowroomPrice"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *NNewVehicle_Insurance = [rs_NewVehicle stringForColumn:@"NewVehicle_Insurance"];
                [[NSUserDefaults standardUserDefaults] setValue:NNewVehicle_Insurance forKey:@"NNewVehicle_Insurance"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *NNewVehicle_LogisticsCharges = [rs_NewVehicle stringForColumn:@"NewVehicle_LogisticsCharges"];
                [[NSUserDefaults standardUserDefaults] setValue:NNewVehicle_LogisticsCharges forKey:@"NNewVehicle_LogisticsCharges"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *NNewVehicle_RegistrationServiceCharges = [rs_NewVehicle stringForColumn:@"NewVehicle_RegistrationServiceCharges"];
                [[NSUserDefaults standardUserDefaults] setValue:NNewVehicle_RegistrationServiceCharges forKey:@"NNewVehicle_RegistrationServiceCharges"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *NNewVehicle_ServicePlan = [rs_NewVehicle stringForColumn:@"NewVehicle_ServicePlan"];
                [[NSUserDefaults standardUserDefaults] setValue:NNewVehicle_ServicePlan forKey:@"NNewVehicle_ServicePlan"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *NNewVehicle_ServicePlan_text = [rs_NewVehicle stringForColumn:@"NewVehicle_ServicePlan_text"];
                [[NSUserDefaults standardUserDefaults] setValue:NNewVehicle_ServicePlan_text forKey:@"NNewVehicle_ServicePlan_text"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *NNewVehicle_ExtendedWarranty = [rs_NewVehicle stringForColumn:@"NewVehicle_ExtendedWarranty"];
                [[NSUserDefaults standardUserDefaults] setValue:NNewVehicle_ExtendedWarranty forKey:@"NNewVehicle_ExtendedWarranty"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *NNewVehicle_ExtendedWarranty_text = [rs_NewVehicle stringForColumn:@"NewVehicle_ExtendedWarranty_text"];
                [[NSUserDefaults standardUserDefaults] setValue:NNewVehicle_ExtendedWarranty_text forKey:@"NNewVehicle_ExtendedWarranty_text"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *NNewVehicle_Accessories = [rs_NewVehicle stringForColumn:@"NewVehicle_Accessories"];
                [[NSUserDefaults standardUserDefaults] setValue:NNewVehicle_Accessories forKey:@"NNewVehicle_Accessories"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *NNewVehicle_BenefitstoCustomer = [rs_NewVehicle stringForColumn:@"NewVehicle_BenefitstoCustomer"];
                [[NSUserDefaults standardUserDefaults] setValue:NNewVehicle_BenefitstoCustomer forKey:@"NNewVehicle_BenefitstoCustomer"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *NNewVehicle_TotalOnRoadValue = [rs_NewVehicle stringForColumn:@"NewVehicle_TotalOnRoadValue"];
                [[NSUserDefaults standardUserDefaults] setValue:NNewVehicle_TotalOnRoadValue forKey:@"NNewVehicle_TotalOnRoadValue"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *NNewVehicle_BalanceTradeInValueforeclose = [rs_NewVehicle stringForColumn:@"NewVehicle_BalanceTradeInValueforeclose"];
                [[NSUserDefaults standardUserDefaults] setValue:NNewVehicle_BalanceTradeInValueforeclose forKey:@"NNewVehicle_BalanceTradeInValueforeclose"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *NNewVehicle_DownPayment = [rs_NewVehicle stringForColumn:@"NewVehicle_DownPayment"];
                [[NSUserDefaults standardUserDefaults] setValue:NNewVehicle_DownPayment forKey:@"NNewVehicle_DownPayment"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *NNewVehicle_SuggestedLoanAmnt = [rs_NewVehicle stringForColumn:@"NewVehicle_SuggestedLoanAmnt"];
                [[NSUserDefaults standardUserDefaults] setValue:NNewVehicle_SuggestedLoanAmnt forKey:@"NNewVehicle_SuggestedLoanAmnt"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *NFinanceOffer_LoanAmount = [rs_NewVehicle stringForColumn:@"FinanceOffer_LoanAmount"];
                [[NSUserDefaults standardUserDefaults] setValue:NFinanceOffer_LoanAmount forKey:@"NFinanceOffer_LoanAmount"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *NFinanceOffer_TotalOnRoadValue = [rs_NewVehicle stringForColumn:@"FinanceOffer_TotalOnRoadValue"];
                [[NSUserDefaults standardUserDefaults] setValue:NFinanceOffer_TotalOnRoadValue forKey:@"NFinanceOffer_TotalOnRoadValue"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *NFinanceOffer_BalanceTrade_LoanForeClosure = [rs_NewVehicle stringForColumn:@"FinanceOffer_BalanceTrade_LoanForeClosure"];
                [[NSUserDefaults standardUserDefaults] setValue:NFinanceOffer_BalanceTrade_LoanForeClosure forKey:@"NFinanceOffer_BalanceTrade_LoanForeClosure"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *NFinanceOffer_scheme1 = [rs_NewVehicle stringForColumn:@"FinanceOffer_scheme1"];
                [[NSUserDefaults standardUserDefaults] setValue:NFinanceOffer_scheme1 forKey:@"NFinanceOffer_scheme1"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *NFinanceOffer_scheme2 = [rs_NewVehicle stringForColumn:@"FinanceOffer_scheme2"];
                [[NSUserDefaults standardUserDefaults] setValue:NFinanceOffer_scheme2 forKey:@"NFinanceOffer_scheme2"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *NFinanceOffer_scheme3 = [rs_NewVehicle stringForColumn:@"FinanceOffer_scheme3"];
                [[NSUserDefaults standardUserDefaults] setValue:NFinanceOffer_scheme3 forKey:@"NFinanceOffer_scheme3"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSString *NFinanceOffer_scheme4 = [rs_NewVehicle stringForColumn:@"FinanceOffer_scheme4"];
                [[NSUserDefaults standardUserDefaults] setValue:NFinanceOffer_scheme4 forKey:@"NFinanceOffer_scheme4"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                
                NSString *NSync_Status = [rs_NewVehicle stringForColumn:@"Sync_Status"];
                [[NSUserDefaults standardUserDefaults] setValue:NSync_Status forKey:@"NSync_Status"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                
                
                [self GetNewVehicleSynccDetailsdata];
                
            }

            
            
            
            
            
            
            
            
            
            
            
            
        }   //if condition ends...of netwrk checking....

        
    }
    
    
    
    
//    NSString *str=@"18 Jul 2014 11 59 PM";
//    NSDateFormatter *dateFormatter  =   [[NSDateFormatter alloc]init];
//    [dateFormatter setDateFormat:@"dd MMM yyyy hh mm a"];
//    NSDate *yourDate=[dateFormatter dateFromString:str];
//    NSLog(@"%@",@([yourDate timeIntervalSince1970]));
    
    
        
    return YES;
}







/*
- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken
{
    NSLog(@"My token is: %@", deviceToken);
    
    NSString *deviceTokenstr=[NSString stringWithFormat:@"%@",deviceToken];
    deviceTokenstr=[deviceTokenstr stringByReplacingOccurrencesOfString:@"<" withString:@""];
    deviceTokenstr=[deviceTokenstr stringByReplacingOccurrencesOfString:@">" withString:@""];
    deviceTokenstr=[deviceTokenstr stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSLog(@"My token is: %@", deviceTokenstr);
    _device_token = deviceTokenstr;
    NSLog(@"My token is: %@", _device_token);
    
    
}


- (void)application:(UIApplication*)application didFailToRegisterForRemoteNotificationsWithError:(NSError*)error
{
    NSLog(@"Failed to get token, error: %@", error);
}
*/



/////////////21 dec..

- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken
{
    NSLog(@"My token is: %@", deviceToken);
    NSString *deviceTokenstr=[NSString stringWithFormat:@"%@",deviceToken];
    deviceTokenstr=[deviceTokenstr stringByReplacingOccurrencesOfString:@"<" withString:@""];
    deviceTokenstr=[deviceTokenstr stringByReplacingOccurrencesOfString:@">" withString:@""];
    deviceTokenstr=[deviceTokenstr stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSLog(@"My token is: %@", deviceTokenstr);
    
    if(self.checkinternet)
    {
        
        //maximizer.mdei.info/jlrmaximizer_p2/api/api/mobile_register?data={"uid":"DLR124","imei_no":"5454","pin_no":"U567","mobile_type":"iphone"}
        
        //    NSString *str=[NSString stringWithFormat:@"%@api/insertgcmno.php?data={\"mobile_type\":\"iphone\",\"gcmno\":\"%@\",\"subject\":\"AA\"}",BASEURl,deviceTokenstr];
        
        
        
        NSString *unaMe=[[NSUserDefaults standardUserDefaults]valueForKey:@"usernameE"];
        NSLog(@"username:%@",unaMe);
        
        /*
         NSString *urlString =[NSString stringWithFormat:@"http://maximizer.mdei.info/jlrmaximizer_p2/api/api/mobile_register?data={\"uid\":\"%@\",\"imei_no\":\"%@\",\"pin_no\":\"%@\",\"mobile_type\":\"%@\"}",unaMe,@"I9819",@"P9819",@"iPhone"];
         
         */
        
        //      NSString *str=[NSString stringWithFormat:@"http://maximizer.mdei.info/jlrmaximizer_p2/api/api/mobile_register?data={\"mobile_type\":\"iphone\",\"gcmno\":\"%@\",\"subject\":\"AA\"}",BASEURl,deviceTokenstr];
        
        
        NSString *str=[NSString stringWithFormat:@"http://maximizer.mdei.info/jlrmaximizer_p2/api/api/mobile_register?data={\"uid\":\"%@\",\"imei_no\":\"%@\",\"pin_no\":\"%@\",\"mobile_type\":\"%@\"}",unaMe,@"I9819",deviceTokenstr,@"iPhone"];
        
        
        NSLog(@" str %@",str);
        NSString *urlString = [NSString stringWithFormat:@"%@", str];
        
        NSURL *URL = [[NSURL alloc]initWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        NSLog(@" URL %@",URL);
        NSData *myData = [[NSData alloc]initWithContentsOfURL:URL];
        
        id myJSON = [NSJSONSerialization JSONObjectWithData:myData options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"myJSON new: %@", myJSON);
    }
    
    
    
}

- (void)application:(UIApplication*)application didFailToRegisterForRemoteNotificationsWithError:(NSError*)error
{
    NSLog(@"Failed to get token, error: %@", error);
}


//..







//   1)for Used Vehicle sync use ds method...

-(void)GetUsedVehicleDetails_Data
{
    
    // [database executeUpdate:@"SELECT * FROM  tbl_Jlrform WHERE Sync_Status='Pending'"];
    
    NSLog(@"Syncing..");
    
    NSMutableDictionary *mydict=[[NSMutableDictionary alloc]init];
    
    NSString *gid=[[NSUserDefaults standardUserDefaults]valueForKey:@"sId"];
    NSString *greporitd=[[NSUserDefaults standardUserDefaults]valueForKey:@"sReport_id"];
    NSString *gsalutation=[[NSUserDefaults standardUserDefaults]valueForKey:@"sSalutation"];
    NSString *gName=[[NSUserDefaults standardUserDefaults]valueForKey:@"sName"];
    NSString *gLname=[[NSUserDefaults standardUserDefaults]valueForKey:@"sLastName"];
    NSString *gContactno=[[NSUserDefaults standardUserDefaults]valueForKey:@"sContactNo"];
    NSString *gMail=[[NSUserDefaults standardUserDefaults]valueForKey:@"sMail"];
    NSString *gCCmail=[[NSUserDefaults standardUserDefaults]valueForKey:@"sCCMail"];
    NSString *gdate=[[NSUserDefaults standardUserDefaults]valueForKey:@"sDate"];
    NSString *gBudget=[[NSUserDefaults standardUserDefaults]valueForKey:@"sBudget"];
    NSString *gsEvaluate_Manufacturer=[[NSUserDefaults standardUserDefaults]valueForKey:@"sEvaluate_Manufacturer"];
    NSString *gsEvaluate_ModelType=[[NSUserDefaults standardUserDefaults]valueForKey:@"sEvaluate_ModelType"];
    NSString *gsEvaluate_VehicleModelType=[[NSUserDefaults standardUserDefaults]valueForKey:@"sEvaluate_VehicleModelType"];
    NSString *gsEvaluate_Date=[[NSUserDefaults standardUserDefaults]valueForKey:@"sEvaluate_Date"];
    
    NSString *gsEvaluate_Month=[[NSUserDefaults standardUserDefaults]valueForKey:@"sEvaluate_Month"];
    NSString *gsEvaluate_OnRoadValue=[[NSUserDefaults standardUserDefaults]valueForKey:@"sEvaluate_OnRoadValue"];
    NSString *gsEvaluate_Owner=[[NSUserDefaults standardUserDefaults]valueForKey:@"sEvaluate_Owner"];
    NSString *gsEvaluate_Color=[[NSUserDefaults standardUserDefaults]valueForKey:@"sEvaluate_Color"];
    NSString *gsEvaluate_RemainingInsurance=[[NSUserDefaults standardUserDefaults]valueForKey:@"sEvaluate_RemainingInsurance"];
    NSString *gsEvaluate_MarketDemand=[[NSUserDefaults standardUserDefaults]valueForKey:@"sEvaluate_MarketDemand"];
    NSString *gsEvaluate_KMS=[[NSUserDefaults standardUserDefaults]valueForKey:@"sEvaluate_KMS"];
    NSString *gsEvaluate_CBUCKD=[[NSUserDefaults standardUserDefaults]valueForKey:@"sEvaluate_CBUCKD"];
    NSString *gsEvaluate_Accidental=[[NSUserDefaults standardUserDefaults]valueForKey:@"sEvaluate_Accidental"];
    NSString *gsEvaluate_Fuel=[[NSUserDefaults standardUserDefaults]valueForKey:@"sEvaluate_Fuel"];
    NSString *gsEvaluate_Refurbishment=[[NSUserDefaults standardUserDefaults]valueForKey:@"sEvaluate_Refurbishment"];
    NSString *gsEvaluate_EstimationBy=[[NSUserDefaults standardUserDefaults]valueForKey:@"sEvaluate_EstimationBy"];
    NSString *gsEvaluate_OfferPriceByMax=[[NSUserDefaults standardUserDefaults]valueForKey:@"sEvaluate_OfferPriceByMax"];
    NSString *gsLoanAmountEstimator_LoanAmountTaken=[[NSUserDefaults standardUserDefaults]valueForKey:@"sLoanAmountEstimator_LoanAmountTaken"];
    NSString *gsLoanAmountEstimator_RateOfInterest=[[NSUserDefaults standardUserDefaults]valueForKey:@"sLoanAmountEstimator_RateOfInterest"];
    NSString *gsLoanAmountEstimator_loanTenure=[[NSUserDefaults standardUserDefaults]valueForKey:@"sLoanAmountEstimator_loanTenure"];
    NSString *gsLoanAmountEstimator_MonthlyPayment=[[NSUserDefaults standardUserDefaults]valueForKey:@"sLoanAmountEstimator_MonthlyPayment"];
    NSString *gsLoanAmountEstimator_EMI=[[NSUserDefaults standardUserDefaults]valueForKey:@"sLoanAmountEstimator_EMI"];
    NSString *gsLoanAmountEstimator_Percent=[[NSUserDefaults standardUserDefaults]valueForKey:@"sLoanAmountEstimator_Percent"];
    NSString *gsLoanAmountEstimator_FinalPrice=[[NSUserDefaults standardUserDefaults]valueForKey:@"sLoanAmountEstimator_FinalPrice"];
    NSString *gsLoanAmountEstimator_OutstandingLoan=[[NSUserDefaults standardUserDefaults]valueForKey:@"sLoanAmountEstimator_OutstandingLoan"];
    NSString *gsLoanAmountEstimator_BalanceTradeforclose=[[NSUserDefaults standardUserDefaults]valueForKey:@"sLoanAmountEstimator_BalanceTradeforclose"];
    NSString *gsLoanAmountEstimator_EstimationBy=[[NSUserDefaults standardUserDefaults]valueForKey:@"sLoanAmountEstimator_EstimationBy"];
    NSString *gsSync_Status=[[NSUserDefaults standardUserDefaults]valueForKey:@"sSync_Status"];
    
    
    /////
    NSString *unaMe=[[NSUserDefaults standardUserDefaults]valueForKey:@"usernameE"];
    NSLog(@"username:%@",unaMe);
    
    //for customer id :-- 1 dec...
    NSString *cust_id_strb=[[NSUserDefaults standardUserDefaults]valueForKey:@"Customer_Id"];
    NSLog(@"cust_id_strb:%@",cust_id_strb);
    
    NSString *net_transaction_amount_str=@"1300760";
    /////
    
    /*
     NSString *urlString=[NSString stringWithFormat:@"http://maximizer.mdei.info/jlrmaximizer_p2/api/api/insert_usedcar_vehicle?data={\"uid\":\"%@\",\"custid\":\"%@\",\"salutation\":\"%@\",\"fname\":\"%@\",\"lname\":\"%@\",\"email\":\"%@\",\"phone\":\"%@\",\"cc_email\":\"%@\",\"report_id\":\"%@\",\"used_car_purchase_offer\":\"%@\",\"outstanding_loan_amount\":\"%@\",\"net_transaction_amount\":\"%@\",\"used_car_estimate_by\":\"%@\",\"outstanding_estimate_by\":\"%@\",\"expected_time\":\"%@\",\"expected_budget\":\"%@\",\"car_make\":\"%@\",\"car_model\":\"%@\",\"car_model_type\":\"%@\",\"purchase_year\":\"%@\",\"purchase_month\":\"%@\",\"onroad_value\":\"%@\",\"owner\":\"%@\",\"colour\":\"%@\",\"remain_insurance\":\"%@\",\"car_speed_type\":\"%@\",\"car_kms\":\"%@\",\"cbuckd\":\"%@\",\"accidental\":\"%@\",\"car_fuel_type\":\"%@\",\"old_refurb\":\"%@\",\"estimation_by\":\"%@\",\"loan_amount\":\"%@\",\"interest_rate_percent\":\"%@\",\"loan_tenure\":\"%@\",\"actual_emi\":\"%@\",\"estimated_foreclose_percent\":\"%@\",\"final_offer_price\":\"%@\",\"outstanding_loan\":\"%@\",\"balance_trade_foreclose\":\"%@\"}",unaMe,cust_id_strb,gsalutation,gName,gLname,gMail,gContactno,gCCmail,greporitd,gsEvaluate_OfferPriceByMax,gsLoanAmountEstimator_OutstandingLoan,net_transaction_amount_str,gsEvaluate_EstimationBy,gsLoanAmountEstimator_EstimationBy,gdate,gBudget,gsEvaluate_Manufacturer,gsEvaluate_ModelType,gsEvaluate_VehicleModelType,gsEvaluate_Date,gsEvaluate_Month,gsEvaluate_OnRoadValue,gsEvaluate_Owner,gsEvaluate_Color,gsEvaluate_RemainingInsurance,gsEvaluate_MarketDemand,gsEvaluate_KMS,gsEvaluate_CBUCKD,gsEvaluate_Accidental,gsEvaluate_Fuel,gsEvaluate_Refurbishment,gsEvaluate_EstimationBy,gsLoanAmountEstimator_LoanAmountTaken,gsLoanAmountEstimator_RateOfInterest,gsLoanAmountEstimator_loanTenure,gsLoanAmountEstimator_EMI,gsLoanAmountEstimator_Percent,gsLoanAmountEstimator_FinalPrice,gsLoanAmountEstimator_OutstandingLoan,gsLoanAmountEstimator_BalanceTradeforclose];
     */
    
    [mydict setObject:unaMe forKey:@"uid"];
    [mydict setObject:cust_id_strb forKey:@"custid"];
    
    [mydict setObject:gsalutation forKey:@"salutation"];
    [mydict setObject:gName forKey:@"fname"];
    [mydict setObject:gLname forKey:@"lname"];
    [mydict setObject:gMail forKey:@"email"];
    [mydict setObject:gContactno forKey:@"phone"];
    [mydict setObject:gCCmail forKey:@"cc_email"];
    [mydict setObject:greporitd forKey:@"report_id"];
    // [mydict setObject:gsEvaluate_OfferPriceByMax forKey:@"registration_charges"];
    [mydict setObject:gsEvaluate_OfferPriceByMax forKey:@"used_car_purchase_offer"];
    [mydict setObject:gsLoanAmountEstimator_OutstandingLoan forKey:@"outstanding_loan_amount"];
    
    [mydict setObject:net_transaction_amount_str forKey:@"net_transaction_amount"];
    [mydict setObject:gsEvaluate_EstimationBy forKey:@"used_car_estimate_by"];
    [mydict setObject:gsLoanAmountEstimator_EstimationBy forKey:@"outstanding_estimate_by"];
    [mydict setObject:gdate forKey:@"expected_time"];
    [mydict setObject:gBudget forKey:@"expected_budget"];
    [mydict setObject:gsEvaluate_Manufacturer forKey:@"car_make"];
    [mydict setObject:gsEvaluate_ModelType forKey:@"car_model"];
    [mydict setObject:gsEvaluate_VehicleModelType forKey:@"car_model_type"];
    [mydict setObject:gsEvaluate_Date forKey:@"purchase_year"];
    [mydict setObject:gsEvaluate_Month forKey:@"purchase_month"];
    [mydict setObject:gsEvaluate_OnRoadValue forKey:@"onroad_value"];
    [mydict setObject:gsEvaluate_Owner forKey:@"owner"];
    [mydict setObject:gsEvaluate_Color forKey:@"colour"];
    [mydict setObject:gsEvaluate_RemainingInsurance forKey:@"remain_insurance"];
    [mydict setObject:gsEvaluate_MarketDemand forKey:@"car_speed_type"];
    //[mydict setObject:gsEvaluate_Refurbishment forKey:@"old_refurb"];
    [mydict setObject:gsEvaluate_KMS forKey:@"car_kms"];
    [mydict setObject:gsEvaluate_CBUCKD forKey:@"cbuckd"];
    [mydict setObject:gsEvaluate_Accidental forKey:@"accidental"];
    [mydict setObject:gsEvaluate_Fuel forKey:@"car_fuel_type"];
    [mydict setObject:gsEvaluate_Refurbishment forKey:@"old_refurb"];
    [mydict setObject:gsEvaluate_EstimationBy forKey:@"estimation_by"];
    [mydict setObject:gsLoanAmountEstimator_LoanAmountTaken forKey:@"loan_amount"];
    [mydict setObject:gsLoanAmountEstimator_RateOfInterest forKey:@"interest_rate_percent"];
    [mydict setObject:gsLoanAmountEstimator_loanTenure forKey:@"loan_tenure"];
    [mydict setObject:gsLoanAmountEstimator_EMI forKey:@"actual_emi"];
    [mydict setObject:gsLoanAmountEstimator_Percent forKey:@"estimated_foreclose_percent"];
    [mydict setObject:gsLoanAmountEstimator_FinalPrice forKey:@"final_offer_price"];
    [mydict setObject:gsLoanAmountEstimator_OutstandingLoan forKey:@"outstanding_loan"];
    [mydict setObject:gsLoanAmountEstimator_BalanceTradeforclose forKey:@"balance_trade_foreclose"];
    
    
    
    
    
    
    NSString *str=@"http://maximizer.mdei.info/jlrmaximizer_p2/api/api/sync_usedcar_vehicle?";
    
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
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"data\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    // NSLog(@"body:%@",body);
    NSData *paramsJSONDictionaryData = [NSJSONSerialization dataWithJSONObject:mydict options:NSJSONWritingPrettyPrinted error:&error];
    // NSLog(@"paramsJSONDictionaryData:%@",paramsJSONDictionaryData);
    NSString *jsonParamsString = [[NSString alloc] initWithData:paramsJSONDictionaryData encoding:NSUTF8StringEncoding];
    
    NSLog(@"jsonParamsString :%@",jsonParamsString );
    
    [body appendData:[[NSString stringWithFormat:@"%@\r\n",jsonParamsString] dataUsingEncoding:NSUTF8StringEncoding]];
    [request setHTTPBody:body];
    NSHTTPURLResponse *response = [[NSHTTPURLResponse alloc] init];
    // NSLog(@"response:%@",response);
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    //NSLog(@"respopsedata:%@",responseData);
    NSDictionary *jsonResponseDictionary = [NSJSONSerialization JSONObjectWithData:responseData
                                                                           options:kNilOptions error:&error];
    NSLog(@"resp:%@",jsonResponseDictionary);
    
    NSString  *responsestr =[jsonResponseDictionary valueForKey:@"response"];
    
    if([responsestr isEqualToString:@"success"])
    {
        
        
        NSString * SyncStatusUpdated;
        SyncStatusUpdated = @"Done";
        // [database executeUpdate:@"UPDATE tbl_Jlrform SET Sync_Status = ? ", SyncStatusUpdated];
        
        // [database executeUpdate:@"UPDATE tbl_Jlrform SET Sync_Status='Done' WHERE id = (SELECT max(id) FROM tbl_Jlrform)"];
        
        [database executeUpdate:@"UPDATE tbl_usedcar_details SET Sync_Status='Done' WHERE id = ?", gid];
        
    }
    
    else if([responsestr isEqualToString:@"error"])
        
    {
        NSLog(@"Error");
        
    }
    
}





//   2)for Trade-in Vehicle sync use ds method...

-(void)GetTradeinVehicleSynccDetailsdata
{
    
    // [database executeUpdate:@"SELECT * FROM  tbl_Jlrform WHERE Sync_Status='Pending'"];
    
    NSLog(@"Syncing TradeinVehicle floww..");
    
    NSMutableDictionary *mydict=[[NSMutableDictionary alloc]init];
    
    /*nsuserdefaults terms trade-in:-
     trId
     trReport_id
     trSalutation
     trName
     trLastName
     trContactNo
     trMail
     trCCMail
     trDate
     trBudget
     trEvaluate_Manufacturer
     trEvaluate_ModelType
     trEvaluate_VehicleModelType
     trEvaluate_Date
     trEvaluate_Month
     trEvaluate_OnRoadValue
     trEvaluate_Owner
     trEvaluate_Color
     trEvaluate_RemainingInsurance
     trEvaluate_MarketDemand
     trEvaluate_KMS
     trEvaluate_CBUCKD
     trEvaluate_Accidental
     trEvaluate_Fuel
     trEvaluate_Refurbishment
     trEvaluate_EstimationBy
     trEvaluate_OfferPriceByMax
     trLoanAmountEstimator_LoanAmountTaken
     trLoanAmountEstimator_RateOfInterest
     trLoanAmountEstimator_loanTenure
     trLoanAmountEstimator_MonthlyPayment
     trLoanAmountEstimator_EMI
     trLoanAmountEstimator_Percent
     trLoanAmountEstimator_FinalPrice
     trLoanAmountEstimator_OutstandingLoan
     trLoanAmountEstimator_BalanceTradeforclose
     trLoanAmountEstimator_EstimationBy
     trNewVehicle_Make
     trNewVehicle_Model
     trNewVehicle_Type
     trNewVehicle_Octroi
     trNewVehicle_ExShowroomPrice
     trNewVehicle_Insurance
     trNewVehicle_LogisticsCharges
     trNewVehicle_RegistrationServiceCharges
     trNewVehicle_ServicePlan
     trNewVehicle_ServicePlan_text
     trNewVehicle_ExtendedWarranty
     trNewVehicle_ExtendedWarranty_text
     trNewVehicle_Accessories
     trNewVehicle_BenefitstoCustomer
     trNewVehicle_TotalOnRoadValue
     trNewVehicle_BalanceTradeInValueforeclose
     trNewVehicle_DownPayment
     trNewVehicle_SuggestedLoanAmnt
     trFinanceOffer_LoanAmount
     trFinanceOffer_TotalOnRoadValue
     trFinanceOffer_BalanceTrade_LoanForeClosure
     trFinanceOffer_scheme1
     trFinanceOffer_scheme2
     trFinanceOffer_scheme3
     trFinanceOffer_scheme4
     trSync_Status
     */
    
    
    //tradein frtecvhed data..
    
    NSString *dwnpaymen=[[NSUserDefaults standardUserDefaults] objectForKey:@"dwnpayment"];
    
    
    //for username(uid)...
    NSString *unaMe=[[NSUserDefaults standardUserDefaults]valueForKey:@"usernameE"];
    NSLog(@"username:%@",unaMe);
    
    
    NSString *totoutflow_str=@"13709";
    NSString *loantenure3yrs_str=@"3 Years";
    NSString *loantenure4yrs_str=@"4 Years";
    NSString *loantenure5yrs_str=@"5 Years";
    NSString *loantenure7yrs_str=@"7 Years";
    
    //emi's:-;;;;
    NSString *Emi3yrs_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EMIRESULT3yrs"];
    NSString *Emi4yrs_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EMIRESULT4yrs"];
    NSString *Emi5yrs_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EMIRESULT5yrs"];
    NSString *Emi7yrs_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EMIRESULT7yrs"];
    
    
    
    
    //................
    
    NSString *gg_trId=[[NSUserDefaults standardUserDefaults]valueForKey:@"trId"];
    NSString *gg_trReport_id=[[NSUserDefaults standardUserDefaults]valueForKey:@"trReport_id"];
    NSString *gg_trSalutation=[[NSUserDefaults standardUserDefaults]valueForKey:@"trSalutation"];
    NSString *gg_trName=[[NSUserDefaults standardUserDefaults]valueForKey:@"trName"];
    NSString *gg_trLastName=[[NSUserDefaults standardUserDefaults]valueForKey:@"trLastName"];
    NSString *gg_trContactNo=[[NSUserDefaults standardUserDefaults]valueForKey:@"trContactNo"];
    NSString *gg_trMail=[[NSUserDefaults standardUserDefaults]valueForKey:@"trMail"];
    NSString *gg_trCCMail=[[NSUserDefaults standardUserDefaults]valueForKey:@"trCCMail"];
    NSString *gg_trDate=[[NSUserDefaults standardUserDefaults]valueForKey:@"trDate"];
    NSString *gg_trBudget=[[NSUserDefaults standardUserDefaults]valueForKey:@"trBudget"];
    NSString *gg_trEvaluate_Manufacturer=[[NSUserDefaults standardUserDefaults]valueForKey:@"trEvaluate_Manufacturer"];
    NSString *gg_trEvaluate_ModelType=[[NSUserDefaults standardUserDefaults]valueForKey:@"trEvaluate_ModelType"];
    NSString *gg_trEvaluate_VehicleModelType=[[NSUserDefaults standardUserDefaults]valueForKey:@"trEvaluate_VehicleModelType"];
    NSString *gg_trEvaluate_Date=[[NSUserDefaults standardUserDefaults]valueForKey:@"trEvaluate_Date"];
    
    NSString *gg_trEvaluate_Month=[[NSUserDefaults standardUserDefaults]valueForKey:@"trEvaluate_Month"];
    NSString *gg_trEvaluate_OnRoadValue=[[NSUserDefaults standardUserDefaults]valueForKey:@"trEvaluate_OnRoadValue"];
    NSString *gg_trEvaluate_Owner=[[NSUserDefaults standardUserDefaults]valueForKey:@"trEvaluate_Owner"];
    NSString *gg_trEvaluate_Color=[[NSUserDefaults standardUserDefaults]valueForKey:@"trEvaluate_Color"];
    NSString *gg_trEvaluate_RemainingInsurance=[[NSUserDefaults standardUserDefaults]valueForKey:@"trEvaluate_RemainingInsurance"];
    NSString *gg_trEvaluate_MarketDemand=[[NSUserDefaults standardUserDefaults]valueForKey:@"trEvaluate_MarketDemand"];
    NSString *gg_trEvaluate_KMS=[[NSUserDefaults standardUserDefaults]valueForKey:@"trEvaluate_KMS"];
    NSString *gg_trEvaluate_CBUCKD=[[NSUserDefaults standardUserDefaults]valueForKey:@"trEvaluate_CBUCKD"];
    NSString *gg_trEvaluate_Accidental=[[NSUserDefaults standardUserDefaults]valueForKey:@"trEvaluate_Accidental"];
    NSString *gg_trEvaluate_Fuel=[[NSUserDefaults standardUserDefaults]valueForKey:@"trEvaluate_Fuel"];
    NSString *gg_trEvaluate_Refurbishment=[[NSUserDefaults standardUserDefaults]valueForKey:@"trEvaluate_Refurbishment"];
    NSString *gg_trEvaluate_EstimationBy=[[NSUserDefaults standardUserDefaults]valueForKey:@"trEvaluate_EstimationBy"];
    NSString *gg_trEvaluate_OfferPriceByMax=[[NSUserDefaults standardUserDefaults]valueForKey:@"trEvaluate_OfferPriceByMax"];
    
    NSString *gg_trLoanAmountEstimator_LoanAmountTaken=[[NSUserDefaults standardUserDefaults]valueForKey:@"trLoanAmountEstimator_LoanAmountTaken"];
    NSString *gg_trLoanAmountEstimator_RateOfInterest=[[NSUserDefaults standardUserDefaults]valueForKey:@"trLoanAmountEstimator_RateOfInterest"];
    NSString *gg_trLoanAmountEstimator_loanTenure=[[NSUserDefaults standardUserDefaults]valueForKey:@"trLoanAmountEstimator_loanTenure"];
    NSString *gg_trLoanAmountEstimator_MonthlyPayment=[[NSUserDefaults standardUserDefaults]valueForKey:@"trLoanAmountEstimator_MonthlyPayment"];
    NSString *gg_trLoanAmountEstimator_EMI=[[NSUserDefaults standardUserDefaults]valueForKey:@"trLoanAmountEstimator_EMI"];
    NSString *gg_trLoanAmountEstimator_Percent=[[NSUserDefaults standardUserDefaults]valueForKey:@"trLoanAmountEstimator_Percent"];
    NSString *gg_trLoanAmountEstimator_FinalPrice=[[NSUserDefaults standardUserDefaults]valueForKey:@"trLoanAmountEstimator_FinalPrice"];
    NSString *gg_trLoanAmountEstimator_OutstandingLoan=[[NSUserDefaults standardUserDefaults]valueForKey:@"trLoanAmountEstimator_OutstandingLoan"];
    NSString *gg_trLoanAmountEstimator_BalanceTradeforclose=[[NSUserDefaults standardUserDefaults]valueForKey:@"trLoanAmountEstimator_BalanceTradeforclose"];
    NSString *gg_trLoanAmountEstimator_EstimationBy=[[NSUserDefaults standardUserDefaults]valueForKey:@"trLoanAmountEstimator_EstimationBy"];
    
    NSString *gg_trNewVehicle_Make=[[NSUserDefaults standardUserDefaults]valueForKey:@"trNewVehicle_Make"];
    NSString *gg_trNewVehicle_Model=[[NSUserDefaults standardUserDefaults]valueForKey:@"trNewVehicle_Model"];
    NSString *gg_trNewVehicle_Type=[[NSUserDefaults standardUserDefaults]valueForKey:@"trNewVehicle_Type"];
    NSString *gg_trNewVehicle_Octroi=[[NSUserDefaults standardUserDefaults]valueForKey:@"trNewVehicle_Octroi"];
    NSString *gg_trNewVehicle_ExShowroomPrice=[[NSUserDefaults standardUserDefaults]valueForKey:@"trNewVehicle_ExShowroomPrice"];
    NSString *gg_trNewVehicle_Insurance=[[NSUserDefaults standardUserDefaults]valueForKey:@"trNewVehicle_Insurance"];
    NSString *gg_trNewVehicle_LogisticsCharges=[[NSUserDefaults standardUserDefaults]valueForKey:@"trNewVehicle_LogisticsCharges"];
    NSString *gg_trNewVehicle_RegistrationServiceCharges=[[NSUserDefaults standardUserDefaults]valueForKey:@"trNewVehicle_RegistrationServiceCharges"];
    NSString *gg_trNewVehicle_ServicePlan=[[NSUserDefaults standardUserDefaults]valueForKey:@"trNewVehicle_ServicePlan"];
    NSString *gg_trNewVehicle_ServicePlan_text=[[NSUserDefaults standardUserDefaults]valueForKey:@"trNewVehicle_ServicePlan_text"];
    NSString *gg_trNewVehicle_ExtendedWarranty=[[NSUserDefaults standardUserDefaults]valueForKey:@"trNewVehicle_ExtendedWarranty"];
    NSString *gg_trNewVehicle_ExtendedWarranty_text=[[NSUserDefaults standardUserDefaults]valueForKey:@"trNewVehicle_ExtendedWarranty_text"];
    NSString *gg_trNewVehicle_Accessories=[[NSUserDefaults standardUserDefaults]valueForKey:@"trNewVehicle_Accessories"];
    NSString *gg_trNewVehicle_BenefitstoCustomer=[[NSUserDefaults standardUserDefaults]valueForKey:@"trNewVehicle_BenefitstoCustomer"];
    NSString *gg_trNewVehicle_TotalOnRoadValue=[[NSUserDefaults standardUserDefaults]valueForKey:@"trNewVehicle_TotalOnRoadValue"];
    NSString *gg_trNewVehicle_BalanceTradeInValueforeclose=[[NSUserDefaults standardUserDefaults]valueForKey:@"trNewVehicle_BalanceTradeInValueforeclose"];
    NSString *gg_trNewVehicle_DownPayment=[[NSUserDefaults standardUserDefaults]valueForKey:@"trNewVehicle_DownPayment"];
    NSString *gg_trNewVehicle_SuggestedLoanAmnt=[[NSUserDefaults standardUserDefaults]valueForKey:@"trNewVehicle_SuggestedLoanAmnt"];
    
    NSString *gg_trFinanceOffer_LoanAmount=[[NSUserDefaults standardUserDefaults]valueForKey:@"trFinanceOffer_LoanAmount"];
    NSString *gg_trFinanceOffer_TotalOnRoadValue=[[NSUserDefaults standardUserDefaults]valueForKey:@"trFinanceOffer_TotalOnRoadValue"];
    NSString *gg_trFinanceOffer_BalanceTrade_LoanForeClosure=[[NSUserDefaults standardUserDefaults]valueForKey:@"trFinanceOffer_BalanceTrade_LoanForeClosure"];
    
    NSString *gg_trFinanceOffer_scheme1=[[NSUserDefaults standardUserDefaults]valueForKey:@"trFinanceOffer_scheme1"];
    NSString *gg_trFinanceOffer_scheme2=[[NSUserDefaults standardUserDefaults]valueForKey:@"trFinanceOffer_scheme2"];
    NSString *gg_trFinanceOffer_scheme3=[[NSUserDefaults standardUserDefaults]valueForKey:@"trFinanceOffer_scheme3"];
    NSString *gg_trFinanceOffer_scheme4=[[NSUserDefaults standardUserDefaults]valueForKey:@"trFinanceOffer_scheme4"];
    
    NSString *gg_trSync_Status=[[NSUserDefaults standardUserDefaults]valueForKey:@"trSync_Status"];
    
    
    /////
    //   NSString *unaMe=[[NSUserDefaults standardUserDefaults]valueForKey:@"usernameE"];
    NSLog(@"username:%@",unaMe);
    
    //for customer id :-- 1 dec...
    NSString *cust_id_strb=[[NSUserDefaults standardUserDefaults]valueForKey:@"Customer_Id"];
    NSLog(@"cust_id_strb:%@",cust_id_strb);
    
    // NSString *net_transaction_amount_str=@"1300760";
    /////
    
    
    //options...
    NSString * tot=[NSString stringWithFormat:@"%@",@"total_outflow"];
    NSString * interest_rate_STR=[NSString stringWithFormat:@"%@",@"interest_rate"];
    NSString * down_payment=[NSString stringWithFormat:@"%@",@"down_payment"];
    NSString * emi_valuestr=[NSString stringWithFormat:@"%@",@"emi_value"];
    NSString * loan_tenure_yearsstr=[NSString stringWithFormat:@"%@",@"loan_tenure_years"];
    
    NSString *combinedstrings = [@[tot,interest_rate_STR,down_payment,emi_valuestr,loan_tenure_yearsstr] componentsJoinedByString:@","];
    
    NSLog(@"combinedstrings:%@",combinedstrings);
    
    //  NSString *scheme1_combinedstrings = [@[totoutflow_str,rateIntrst3yrs,dwnpaymen,Emi3yrs_str,loantenure3yrs_str] componentsJoinedByString:@","];
    //  NSString *scheme2_combinedstrings = [@[totoutflow_str,rateIntrst4yrs,dwnpaymen,Emi4yrs_str,loantenure4yrs_str] componentsJoinedByString:@","];
    //   NSString *scheme3_combinedstrings = [@[totoutflow_str,rateIntrst5yrs,dwnpaymen,Emi5yrs_str,loantenure5yrs_str] componentsJoinedByString:@","];
    //  NSString *scheme4_combinedstrings = [@[totoutflow_str,rateIntrst7yrs,dwnpaymen,Emi7yrs_str,loantenure7yrs_str] componentsJoinedByString:@","];
    
    //  NSLog(@"scheme1_combinedstrings:%@",scheme1_combinedstrings);
    //   NSLog(@"scheme2_combinedstrings:%@",scheme2_combinedstrings);
    //   NSLog(@"scheme3_combinedstrings:%@",scheme3_combinedstrings);
    //   NSLog(@"scheme4_combinedstrings:%@",scheme4_combinedstrings);
    
    NSString *net_transaction_amount_Tradeinstr=@"1300769";
    
    
    /*tradein sync
     
     http://maximizer.mdei.info/jlrmaximizer_p2/api/api/sync_tradein_vehicle?data={"uid":"DLR139","custid":"39",
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
    
    [mydict setObject:unaMe forKey:@"uid"];
    [mydict setObject:cust_id_strb forKey:@"custid"];
    
    [mydict setObject:gg_trSalutation forKey:@"salutation"];
    [mydict setObject:gg_trName forKey:@"fname"];
    [mydict setObject:gg_trLastName forKey:@"lname"];
    [mydict setObject:gg_trMail forKey:@"email"];
    [mydict setObject:gg_trContactNo forKey:@"phone"];
    [mydict setObject:gg_trCCMail forKey:@"cc_email"];
    [mydict setObject:gg_trReport_id forKey:@"report_id"];
    [mydict setObject:gg_trNewVehicle_Make forKey:@"newcar_make"];
    [mydict setObject:gg_trNewVehicle_Model forKey:@"newcar_model"];
    [mydict setObject:gg_trNewVehicle_Type forKey:@"newcar_model_type"];
    [mydict setObject:gg_trNewVehicle_ExShowroomPrice forKey:@"ex_showroom_price"];
    [mydict setObject:gg_trNewVehicle_Insurance forKey:@"insurance"];
    [mydict setObject:gg_trNewVehicle_LogisticsCharges forKey:@"logistics_charges"];
    [mydict setObject:gg_trNewVehicle_RegistrationServiceCharges forKey:@"registration_charges"];
    [mydict setObject:gg_trNewVehicle_Accessories forKey:@"accessories"];
    [mydict setObject:gg_trNewVehicle_ServicePlan forKey:@"service_plan"];
    [mydict setObject:gg_trNewVehicle_ServicePlan_text forKey:@"service_plan_amount"];
    [mydict setObject:gg_trNewVehicle_ExtendedWarranty forKey:@"ext_warranty"];
    [mydict setObject:gg_trNewVehicle_ExtendedWarranty_text forKey:@"ext_warranty_amount"];
    [mydict setObject:gg_trNewVehicle_TotalOnRoadValue forKey:@"total_onroad_amount"];
    [mydict setObject:gg_trEvaluate_OfferPriceByMax forKey:@"used_car_purchase_offer"];
    
    [mydict setObject:gg_trLoanAmountEstimator_OutstandingLoan forKey:@"outstanding_loan_amount"];
    [mydict setObject:net_transaction_amount_Tradeinstr forKey:@"net_transaction_amount"];
    [mydict setObject:gg_trEvaluate_EstimationBy forKey:@"used_car_estimate_by"];
    [mydict setObject:gg_trLoanAmountEstimator_EstimationBy forKey:@"outstanding_estimate_by"];
    [mydict setObject:gg_trDate forKey:@"expected_time"];
    [mydict setObject:gg_trBudget forKey:@"expected_budget"];
    [mydict setObject:gg_trEvaluate_Manufacturer forKey:@"car_make"];
    [mydict setObject:gg_trEvaluate_ModelType forKey:@"car_model"];
    [mydict setObject:gg_trEvaluate_VehicleModelType forKey:@"car_model_type"];
    [mydict setObject:gg_trEvaluate_Date forKey:@"purchase_year"];
    [mydict setObject:gg_trEvaluate_Month forKey:@"purchase_month"];
    [mydict setObject:gg_trEvaluate_OnRoadValue forKey:@"onroad_value"];
    [mydict setObject:gg_trEvaluate_Owner forKey:@"owner"];
    [mydict setObject:gg_trEvaluate_Color forKey:@"colour"];
    [mydict setObject:gg_trEvaluate_RemainingInsurance forKey:@"remain_insurance"];
    [mydict setObject:gg_trEvaluate_MarketDemand forKey:@"car_speed_type"];
    [mydict setObject:gg_trEvaluate_KMS forKey:@"car_kms"];
    [mydict setObject:gg_trEvaluate_CBUCKD forKey:@"cbuckd"];
    [mydict setObject:gg_trEvaluate_Accidental forKey:@"accidental"];
    [mydict setObject:gg_trEvaluate_Fuel forKey:@"car_fuel_type"];
    [mydict setObject:gg_trEvaluate_Refurbishment forKey:@"old_refurb"];
    [mydict setObject:gg_trNewVehicle_Octroi forKey:@"octroi"];
    [mydict setObject:gg_trNewVehicle_BenefitstoCustomer forKey:@"customer_discount"];
    [mydict setObject:gg_trNewVehicle_DownPayment forKey:@"downpayment"];
    [mydict setObject:gg_trNewVehicle_SuggestedLoanAmnt forKey:@"sugg_loan_amount"];
    [mydict setObject:gg_trLoanAmountEstimator_LoanAmountTaken forKey:@"loan_amount"];
    [mydict setObject:gg_trLoanAmountEstimator_RateOfInterest forKey:@"interest_rate_percent"];
    [mydict setObject:gg_trLoanAmountEstimator_loanTenure forKey:@"loan_tenure"];
    [mydict setObject:gg_trLoanAmountEstimator_EMI forKey:@"actual_emi"];
    [mydict setObject:gg_trLoanAmountEstimator_Percent forKey:@"estimated_foreclose_percent"];
    [mydict setObject:gg_trLoanAmountEstimator_FinalPrice forKey:@"final_offer_price"];
    [mydict setObject:gg_trLoanAmountEstimator_OutstandingLoan forKey:@"outstanding_loan"];
    [mydict setObject:gg_trLoanAmountEstimator_BalanceTradeforclose forKey:@"balance_trade_foreclose"];
    
    //options...scheme1234...
    [mydict setObject:combinedstrings forKey:@"options"];
    [mydict setObject:gg_trFinanceOffer_scheme1 forKey:@"scheme1"];
    [mydict setObject:gg_trFinanceOffer_scheme2 forKey:@"scheme2"];
    [mydict setObject:gg_trFinanceOffer_scheme3 forKey:@"scheme3"];
    [mydict setObject:gg_trFinanceOffer_scheme4 forKey:@"scheme4"];
    
    
    
    NSString *str=@"http://maximizer.mdei.info/jlrmaximizer_p2/api/api/sync_tradein_vehicle?";
    
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
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"data\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    // NSLog(@"body:%@",body);
    NSData *paramsJSONDictionaryData = [NSJSONSerialization dataWithJSONObject:mydict options:NSJSONWritingPrettyPrinted error:&error];
    // NSLog(@"paramsJSONDictionaryData:%@",paramsJSONDictionaryData);
    NSString *jsonParamsString = [[NSString alloc] initWithData:paramsJSONDictionaryData encoding:NSUTF8StringEncoding];
    
    NSLog(@"jsonParamsString :%@",jsonParamsString );
    
    [body appendData:[[NSString stringWithFormat:@"%@\r\n",jsonParamsString] dataUsingEncoding:NSUTF8StringEncoding]];
    [request setHTTPBody:body];
    NSHTTPURLResponse *response = [[NSHTTPURLResponse alloc] init];
    // NSLog(@"response:%@",response);
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    //NSLog(@"respopsedata:%@",responseData);
    NSDictionary *jsonResponseDictionary = [NSJSONSerialization JSONObjectWithData:responseData
                                                                           options:kNilOptions error:&error];
    NSLog(@"resp:%@",jsonResponseDictionary);
    
    NSString  *responsestr =[jsonResponseDictionary valueForKey:@"response"];
    
    if([responsestr isEqualToString:@"success"])
    {
        
        NSString * SyncStatusUpdated;
        SyncStatusUpdated = @"Done";
        // [database executeUpdate:@"UPDATE tbl_Jlrform SET Sync_Status = ? ", SyncStatusUpdated];
        
        // [database executeUpdate:@"UPDATE tbl_Jlrform SET Sync_Status='Done' WHERE id = (SELECT max(id) FROM tbl_Jlrform)"];
        
        [database executeUpdate:@"UPDATE tbl_TradeInVehicle SET Sync_Status='Done' WHERE id = ?",gg_trId];
        
    }
    
    else if([responsestr isEqualToString:@"error"])
        
    {
        NSLog(@"Error");
        
    }
    
}




//3) NewVehicle sync use ds method......

-(void)GetNewVehicleSynccDetailsdata
{
    
    NSLog(@"Syncing NewVehicle floww..");
    
    NSMutableDictionary *mydict=[[NSMutableDictionary alloc]init];
    
    
    
    /*
     [database executeUpdate:@"create table tbl_NEWVehicle_flow(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,Report_id varchar,Salutation varchar,Name varchar,LastName varchar,ContactNo varchar,Mail varchar,CCMail varchar,Date varchar,Budget varchar,NewVehicle_Make varchar, NewVehicle_Model varchar,NewVehicle_Type varchar,NewVehicle_Octroi varchar,NewVehicle_ExShowroomPrice varchar, NewVehicle_Insurance varchar, NewVehicle_LogisticsCharges varchar, NewVehicle_RegistrationServiceCharges varchar, NewVehicle_ServicePlan varchar,NewVehicle_ServicePlan_text varchar, NewVehicle_ExtendedWarranty varchar,NewVehicle_ExtendedWarranty_text varchar, NewVehicle_Accessories varchar, NewVehicle_BenefitstoCustomer varchar, NewVehicle_TotalOnRoadValue varchar, NewVehicle_BalanceTradeInValueforeclose varchar,NewVehicle_DownPayment varchar,NewVehicle_SuggestedLoanAmnt varchar,FinanceOffer_LoanAmount varchar,FinanceOffer_TotalOnRoadValue varchar,FinanceOffer_BalanceTrade_LoanForeClosure varchar,FinanceOffer_scheme1 varchar,FinanceOffer_scheme2 varchar,FinanceOffer_scheme3 varchar,FinanceOffer_scheme4 varchar ,Sync_Status varchar)"];
     */
    
    
    /*nsuserdefaults terms New-vehicle:-
     
     NId
     NReport_id
     NSalutation
     NName
     NLastName
     NContactNo
     NMail
     NCCMail
     NDate
     NBudget
     
     NNewVehicle_Make
     NNewVehicle_Model
     NNewVehicle_Type
     NNewVehicle_Octroi
     NNewVehicle_ExShowroomPrice
     NNewVehicle_Insurance
     NNewVehicle_LogisticsCharges
     NNewVehicle_RegistrationServiceCharges
     NNewVehicle_ServicePlan
     NNewVehicle_ServicePlan_text
     NNewVehicle_ExtendedWarranty
     NNewVehicle_ExtendedWarranty_text
     NNewVehicle_Accessories
     NNewVehicle_BenefitstoCustomer
     NNewVehicle_TotalOnRoadValue
     NNewVehicle_BalanceTradeInValueforeclose
     NNewVehicle_DownPayment
     NNewVehicle_SuggestedLoanAmnt
     
     NFinanceOffer_LoanAmount
     NFinanceOffer_TotalOnRoadValue
     NFinanceOffer_BalanceTrade_LoanForeClosure
     
     NFinanceOffer_scheme1
     NFinanceOffer_scheme2
     NFinanceOffer_scheme3
     NFinanceOffer_scheme4
     
     NSync_Status
     */
    
    
    
    //New-vehicle fetched data..
    
    NSString *dwnpaymen=[[NSUserDefaults standardUserDefaults] objectForKey:@"dwnpayment"];
    
    
    //for username(uid)...
    NSString *unaMe=[[NSUserDefaults standardUserDefaults]valueForKey:@"usernameE"];
    NSLog(@"username:%@",unaMe);
    
    
    NSString *totoutflow_str=@"13709";
    NSString *loantenure3yrs_str=@"3 Years";
    NSString *loantenure4yrs_str=@"4 Years";
    NSString *loantenure5yrs_str=@"5 Years";
    NSString *loantenure7yrs_str=@"7 Years";
    
    //emi's:-;;;;
    NSString *Emi3yrs_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EMIRESULT3yrs"];
    NSString *Emi4yrs_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EMIRESULT4yrs"];
    NSString *Emi5yrs_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EMIRESULT5yrs"];
    NSString *Emi7yrs_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EMIRESULT7yrs"];
    
    
    
    
    //..............................
    
    NSString *ggN_trId=[[NSUserDefaults standardUserDefaults]valueForKey:@"NId"];
    NSString *ggN_trReport_id=[[NSUserDefaults standardUserDefaults]valueForKey:@"NReport_id"];
    NSString *ggN_trSalutation=[[NSUserDefaults standardUserDefaults]valueForKey:@"NSalutation"];
    NSString *ggN_trName=[[NSUserDefaults standardUserDefaults]valueForKey:@"NName"];
    NSString *ggN_trLastName=[[NSUserDefaults standardUserDefaults]valueForKey:@"NLastName"];
    NSString *ggN_trContactNo=[[NSUserDefaults standardUserDefaults]valueForKey:@"NContactNo"];
    NSString *ggN_trMail=[[NSUserDefaults standardUserDefaults]valueForKey:@"NMail"];
    NSString *ggN_trCCMail=[[NSUserDefaults standardUserDefaults]valueForKey:@"NCCMail"];
    NSString *ggN_trDate=[[NSUserDefaults standardUserDefaults]valueForKey:@"NDate"];
    NSString *ggN_trBudget=[[NSUserDefaults standardUserDefaults]valueForKey:@"NBudget"];
    
    NSString *ggN_trNewVehicle_Make=[[NSUserDefaults standardUserDefaults]valueForKey:@"NNewVehicle_Make"];
    NSString *ggN_trNewVehicle_Model=[[NSUserDefaults standardUserDefaults]valueForKey:@"NNewVehicle_Model"];
    NSString *ggN_trNewVehicle_Type=[[NSUserDefaults standardUserDefaults]valueForKey:@"NNewVehicle_Type"];
    NSString *ggN_trNewVehicle_Octroi=[[NSUserDefaults standardUserDefaults]valueForKey:@"NNewVehicle_Octroi"];
    NSString *ggN_trNewVehicle_ExShowroomPrice=[[NSUserDefaults standardUserDefaults]valueForKey:@"NNewVehicle_ExShowroomPrice"];
    NSString *ggN_trNewVehicle_Insurance=[[NSUserDefaults standardUserDefaults]valueForKey:@"NNewVehicle_Insurance"];
    NSString *ggN_trNewVehicle_LogisticsCharges=[[NSUserDefaults standardUserDefaults]valueForKey:@"NNewVehicle_LogisticsCharges"];
    NSString *ggN_trNewVehicle_RegistrationServiceCharges=[[NSUserDefaults standardUserDefaults]valueForKey:@"NNewVehicle_RegistrationServiceCharges"];
    NSString *ggN_trNewVehicle_ServicePlan=[[NSUserDefaults standardUserDefaults]valueForKey:@"NNewVehicle_ServicePlan"];
    NSString *ggN_trNewVehicle_ServicePlan_text=[[NSUserDefaults standardUserDefaults]valueForKey:@"NNewVehicle_ServicePlan_text"];
    NSString *ggN_trNewVehicle_ExtendedWarranty=[[NSUserDefaults standardUserDefaults]valueForKey:@"NNewVehicle_ExtendedWarranty"];
    NSString *ggN_trNewVehicle_ExtendedWarranty_text=[[NSUserDefaults standardUserDefaults]valueForKey:@"NNewVehicle_ExtendedWarranty_text"];
    NSString *ggN_trNewVehicle_Accessories=[[NSUserDefaults standardUserDefaults]valueForKey:@"NNewVehicle_Accessories"];
    NSString *ggN_trNewVehicle_BenefitstoCustomer=[[NSUserDefaults standardUserDefaults]valueForKey:@"NNewVehicle_BenefitstoCustomer"];
    NSString *ggN_trNewVehicle_TotalOnRoadValue=[[NSUserDefaults standardUserDefaults]valueForKey:@"NNewVehicle_TotalOnRoadValue"];
    NSString *ggN_trNewVehicle_BalanceTradeInValueforeclose=[[NSUserDefaults standardUserDefaults]valueForKey:@"NNewVehicle_BalanceTradeInValueforeclose"];
    NSString *ggN_trNewVehicle_DownPayment=[[NSUserDefaults standardUserDefaults]valueForKey:@"NNewVehicle_DownPayment"];
    NSString *ggN_trNewVehicle_SuggestedLoanAmnt=[[NSUserDefaults standardUserDefaults]valueForKey:@"NNewVehicle_SuggestedLoanAmnt"];
    
    NSString *ggN_trFinanceOffer_LoanAmount=[[NSUserDefaults standardUserDefaults]valueForKey:@"NFinanceOffer_LoanAmount"];
    NSString *ggN_trFinanceOffer_TotalOnRoadValue=[[NSUserDefaults standardUserDefaults]valueForKey:@"NFinanceOffer_TotalOnRoadValue"];
    NSString *ggN_trFinanceOffer_BalanceTrade_LoanForeClosure=[[NSUserDefaults standardUserDefaults]valueForKey:@"NFinanceOffer_BalanceTrade_LoanForeClosure"];
    
    NSString *ggN_trFinanceOffer_scheme1=[[NSUserDefaults standardUserDefaults]valueForKey:@"NFinanceOffer_scheme1"];
    NSString *ggN_trFinanceOffer_scheme2=[[NSUserDefaults standardUserDefaults]valueForKey:@"NFinanceOffer_scheme2"];
    NSString *ggN_trFinanceOffer_scheme3=[[NSUserDefaults standardUserDefaults]valueForKey:@"NFinanceOffer_scheme3"];
    NSString *ggN_trFinanceOffer_scheme4=[[NSUserDefaults standardUserDefaults]valueForKey:@"NFinanceOffer_scheme4"];
    
    NSString *ggN_trSync_Status=[[NSUserDefaults standardUserDefaults]valueForKey:@"NSync_Status"];
    
    
    /////
    //   NSString *unaMe=[[NSUserDefaults standardUserDefaults]valueForKey:@"usernameE"];
    NSLog(@"username:%@",unaMe);
    
    //for customer id :-- 1 dec...
    NSString *cust_id_strb=[[NSUserDefaults standardUserDefaults]valueForKey:@"Customer_Id"];
    NSLog(@"cust_id_strb:%@",cust_id_strb);
    
    // NSString *net_transaction_amount_str=@"1300760";
    /////
    
    
    //options...
    NSString * tot=[NSString stringWithFormat:@"%@",@"total_outflow"];
    NSString * interest_rate_STR=[NSString stringWithFormat:@"%@",@"interest_rate"];
    NSString * down_payment=[NSString stringWithFormat:@"%@",@"down_payment"];
    NSString * emi_valuestr=[NSString stringWithFormat:@"%@",@"emi_value"];
    NSString * loan_tenure_yearsstr=[NSString stringWithFormat:@"%@",@"loan_tenure_years"];
    
    NSString *combinedstrings = [@[tot,interest_rate_STR,down_payment,emi_valuestr,loan_tenure_yearsstr] componentsJoinedByString:@","];
    
    NSLog(@"combinedstrings:%@",combinedstrings);
    
    //  NSString *scheme1_combinedstrings = [@[totoutflow_str,rateIntrst3yrs,dwnpaymen,Emi3yrs_str,loantenure3yrs_str] componentsJoinedByString:@","];
    //  NSString *scheme2_combinedstrings = [@[totoutflow_str,rateIntrst4yrs,dwnpaymen,Emi4yrs_str,loantenure4yrs_str] componentsJoinedByString:@","];
    //   NSString *scheme3_combinedstrings = [@[totoutflow_str,rateIntrst5yrs,dwnpaymen,Emi5yrs_str,loantenure5yrs_str] componentsJoinedByString:@","];
    //  NSString *scheme4_combinedstrings = [@[totoutflow_str,rateIntrst7yrs,dwnpaymen,Emi7yrs_str,loantenure7yrs_str] componentsJoinedByString:@","];
    
    //  NSLog(@"scheme1_combinedstrings:%@",scheme1_combinedstrings);
    //   NSLog(@"scheme2_combinedstrings:%@",scheme2_combinedstrings);
    //   NSLog(@"scheme3_combinedstrings:%@",scheme3_combinedstrings);
    //   NSLog(@"scheme4_combinedstrings:%@",scheme4_combinedstrings);
    
    NSString *net_transaction_amount_Tradeinstr=@"1300769";
    
    
    /*tradein sync
     
     http://maximizer.mdei.info/jlrmaximizer_p2/api/api/sync_tradein_vehicle?data={"uid":"DLR139","custid":"39",
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
    
    
    /*newvehcile sync api....
     http://maximizer.mdei.info/jlrmaximizer_p2/api/api/sync_newcar_vehicle?data={"uid":"DLR139","custid":"32",
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
    //  ggN_trId
    
    [mydict setObject:unaMe forKey:@"uid"];
    [mydict setObject:cust_id_strb forKey:@"custid"];
    
    [mydict setObject:ggN_trSalutation forKey:@"salutation"];
    [mydict setObject:ggN_trName forKey:@"fname"];
    [mydict setObject:ggN_trLastName forKey:@"lname"];
    [mydict setObject:ggN_trMail forKey:@"email"];
    [mydict setObject:ggN_trContactNo forKey:@"phone"];
    [mydict setObject:ggN_trCCMail forKey:@"cc_email"];
    [mydict setObject:ggN_trReport_id forKey:@"report_id"];
    [mydict setObject:ggN_trNewVehicle_Make forKey:@"newcar_make"];
    [mydict setObject:ggN_trNewVehicle_Model forKey:@"newcar_model"];
    [mydict setObject:ggN_trNewVehicle_Type forKey:@"newcar_model_type"];
    [mydict setObject:ggN_trNewVehicle_ExShowroomPrice forKey:@"ex_showroom_price"];
    [mydict setObject:ggN_trNewVehicle_Insurance forKey:@"insurance"];
    [mydict setObject:ggN_trNewVehicle_LogisticsCharges forKey:@"logistics_charges"];
    [mydict setObject:ggN_trNewVehicle_RegistrationServiceCharges forKey:@"registration_charges"];
    [mydict setObject:ggN_trNewVehicle_Accessories forKey:@"accessories"];
    [mydict setObject:ggN_trNewVehicle_ServicePlan forKey:@"service_plan"];
    [mydict setObject:ggN_trNewVehicle_ServicePlan_text forKey:@"service_plan_amount"];
    [mydict setObject:ggN_trNewVehicle_ExtendedWarranty forKey:@"ext_warranty"];
    [mydict setObject:ggN_trNewVehicle_ExtendedWarranty_text forKey:@"ext_warranty_amount"];
    [mydict setObject:ggN_trNewVehicle_TotalOnRoadValue forKey:@"total_onroad_amount"];
    [mydict setObject:net_transaction_amount_Tradeinstr forKey:@"net_transaction_amount"];
    [mydict setObject:ggN_trDate forKey:@"expected_time"];
    [mydict setObject:ggN_trBudget forKey:@"expected_budget"];
    [mydict setObject:ggN_trNewVehicle_Octroi forKey:@"octroi"];
    [mydict setObject:ggN_trNewVehicle_BenefitstoCustomer forKey:@"customer_discount"];
    [mydict setObject:ggN_trNewVehicle_DownPayment forKey:@"downpayment"];
    [mydict setObject:ggN_trNewVehicle_SuggestedLoanAmnt forKey:@"sugg_loan_amount"];
    [mydict setObject:combinedstrings forKey:@"options"];
    //options...scheme1234...
    [mydict setObject:ggN_trFinanceOffer_scheme1 forKey:@"scheme1"];
    [mydict setObject:ggN_trFinanceOffer_scheme2 forKey:@"scheme2"];
    [mydict setObject:ggN_trFinanceOffer_scheme3 forKey:@"scheme3"];
    [mydict setObject:ggN_trFinanceOffer_scheme4 forKey:@"scheme4"];
    
    /*
     [mydict setObject:gg_trEvaluate_OfferPriceByMax forKey:@"used_car_purchase_offer"];
     [mydict setObject:gg_trLoanAmountEstimator_OutstandingLoan forKey:@"outstanding_loan_amount"];
     [mydict setObject:gg_trEvaluate_EstimationBy forKey:@"used_car_estimate_by"];
     [mydict setObject:gg_trLoanAmountEstimator_EstimationBy forKey:@"outstanding_estimate_by"];
     [mydict setObject:gg_trEvaluate_Manufacturer forKey:@"car_make"];
     [mydict setObject:gg_trEvaluate_ModelType forKey:@"car_model"];
     [mydict setObject:gg_trEvaluate_VehicleModelType forKey:@"car_model_type"];
     [mydict setObject:gg_trEvaluate_Date forKey:@"purchase_year"];
     [mydict setObject:gg_trEvaluate_Month forKey:@"purchase_month"];
     [mydict setObject:gg_trEvaluate_OnRoadValue forKey:@"onroad_value"];
     [mydict setObject:gg_trEvaluate_Owner forKey:@"owner"];
     [mydict setObject:gg_trEvaluate_Color forKey:@"colour"];
     [mydict setObject:gg_trEvaluate_RemainingInsurance forKey:@"remain_insurance"];
     [mydict setObject:gg_trEvaluate_MarketDemand forKey:@"car_speed_type"];
     [mydict setObject:gg_trEvaluate_KMS forKey:@"car_kms"];
     [mydict setObject:gg_trEvaluate_CBUCKD forKey:@"cbuckd"];
     [mydict setObject:gg_trEvaluate_Accidental forKey:@"accidental"];
     [mydict setObject:gg_trEvaluate_Fuel forKey:@"car_fuel_type"];
     [mydict setObject:gg_trEvaluate_Refurbishment forKey:@"old_refurb"];
     [mydict setObject:gg_trLoanAmountEstimator_LoanAmountTaken forKey:@"loan_amount"];
     [mydict setObject:gg_trLoanAmountEstimator_RateOfInterest forKey:@"interest_rate_percent"];
     [mydict setObject:gg_trLoanAmountEstimator_loanTenure forKey:@"loan_tenure"];
     [mydict setObject:gg_trLoanAmountEstimator_EMI forKey:@"actual_emi"];
     [mydict setObject:gg_trLoanAmountEstimator_Percent forKey:@"estimated_foreclose_percent"];
     [mydict setObject:gg_trLoanAmountEstimator_FinalPrice forKey:@"final_offer_price"];
     [mydict setObject:gg_trLoanAmountEstimator_OutstandingLoan forKey:@"outstanding_loan"];
     [mydict setObject:gg_trLoanAmountEstimator_BalanceTradeforclose forKey:@"balance_trade_foreclose"];*/
    
    
    NSString *str=@"http://maximizer.mdei.info/jlrmaximizer_p2/api/api/sync_newcar_vehicle?";
    
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
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"data\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    // NSLog(@"body:%@",body);
    NSData *paramsJSONDictionaryData = [NSJSONSerialization dataWithJSONObject:mydict options:NSJSONWritingPrettyPrinted error:&error];
    // NSLog(@"paramsJSONDictionaryData:%@",paramsJSONDictionaryData);
    NSString *jsonParamsString = [[NSString alloc] initWithData:paramsJSONDictionaryData encoding:NSUTF8StringEncoding];
    
    NSLog(@"jsonParamsString :%@",jsonParamsString );
    
    [body appendData:[[NSString stringWithFormat:@"%@\r\n",jsonParamsString] dataUsingEncoding:NSUTF8StringEncoding]];
    [request setHTTPBody:body];
    NSHTTPURLResponse *response = [[NSHTTPURLResponse alloc] init];
    // NSLog(@"response:%@",response);
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    //NSLog(@"respopsedata:%@",responseData);
    NSDictionary *jsonResponseDictionary = [NSJSONSerialization JSONObjectWithData:responseData
                                                                           options:kNilOptions error:&error];
    NSLog(@"resp:%@",jsonResponseDictionary);
    
    NSString  *responsestr =[jsonResponseDictionary valueForKey:@"response"];
    
    if([responsestr isEqualToString:@"success"])
    {
        
        
        NSString * SyncStatusUpdated;
        SyncStatusUpdated = @"Done";
        // [database executeUpdate:@"UPDATE tbl_Jlrform SET Sync_Status = ? ", SyncStatusUpdated];
        
        // [database executeUpdate:@"UPDATE tbl_Jlrform SET Sync_Status='Done' WHERE id = (SELECT max(id) FROM tbl_Jlrform)"];
        
        [database executeUpdate:@"UPDATE tbl_NEWVehicle_flow SET Sync_Status='Done' WHERE id = ?",ggN_trId];
        
    }
    
    else if([responsestr isEqualToString:@"error"])
        
    {
        NSLog(@"Error");
        
    }
    
}
















//.....
-(void)GetUSEDcarrrrrr
{
    /*
     // for fname ,lname ,customerEmailiD,customerContactNo, DisplayDate,ExpectedBudget ...
     NSString *CustFnamestr=[[NSUserDefaults standardUserDefaults] objectForKey:@"customername"];
     
     NSString *CustLastnamestr=[[NSUserDefaults standardUserDefaults] objectForKey:@"customerlastname"];
     NSString *customerEmailiDstr=[[NSUserDefaults standardUserDefaults] objectForKey:@"customerEmailiD"];
     
     NSString *customerContactNo_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"customerContactNo"];
     
     NSString *DisplayDate_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"DisplayDate"];
     
     NSString *ExpectedBudget_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"ExpectedBudget"];
     
     
     //for salutation...
     NSString *salutation_strr=[[NSUserDefaults standardUserDefaults] objectForKey:@"titles_salutation"];
     
     
     
     
     //for username(uid)...
     NSString *unaMe=[[NSUserDefaults standardUserDefaults]valueForKey:@"usernameE"];
     NSLog(@"username:%@",unaMe);
     
     //for customer id :-- 1 dec...
     NSString *cust_id_strb=[[NSUserDefaults standardUserDefaults]valueForKey:@"Customer_Id"];
     NSLog(@"cust_id_strb:%@",cust_id_strb);
     
     //for report id:-- 1 dec...
     //   NSString *repp_id_strb=[[NSUserDefaults standardUserDefaults]valueForKey:@"Report_IDD"];
     //  NSLog(@"repp_id_strb:%@",repp_id_strb);
     
     //for report id:-- 1 dec...(modified)
     NSString *repp_id_strb=[[NSUserDefaults standardUserDefaults]valueForKey:@"Reporrt_Id"];
     NSLog(@"repp_id_strb:%@",repp_id_strb);
     
     
     
     
     //3 dummy strings & 4th dummy..net trans amnt.& reportid..totoutflow
     NSString *usedcarpurchasestr=@"0";
     NSString *outstanding_loan_amountstr=@"0";
     //   NSString *sugg_loan_amountstr=[NSString stringWithFormat:@"%@",@"0"];
     
     NSString *net_transaction_amount_str=@"1300760";
     
     NSString *reportid_str=@"R982033";
     NSString *custid_str=@"C822899";
     
     
     //DUMMMY 16NOV...
     NSString *octroi_str=@"Y";
     NSString *balTradeForeClosure_str=@"1300300";
     NSString *CBUCKD_str=@"Y";
     NSString *accidental_str=@"N";
     NSString *fuel_str=@"PETROL";
     NSString *oldrefurb_str=@"131313";
     
     NSString *customer_discount_str=@"0";
     NSString *ccmail_str=@"genie@mail.com";
     //
     
     
     NSString *totoutflow_str=@"13709";
     NSString *loantenure3yrs_str=@"3 Years";
     NSString *loantenure4yrs_str=@"4 Years";
     NSString *loantenure5yrs_str=@"5 Years";
     NSString *loantenure7yrs_str=@"7 Years";
     
     //emi's:-;;;;
     NSString *Emi3yrs_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EMIRESULT3yrs"];
     NSString *Emi4yrs_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EMIRESULT4yrs"];
     NSString *Emi5yrs_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EMIRESULT5yrs"];
     NSString *Emi7yrs_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EMIRESULT7yrs"];
     
     
     //evaluate fetching values...
     NSString *EvalExisvehicle_manufacturer_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_manufacturer"];
     NSString *EvalExisvehicle_model_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_model"];
     NSString *EvalExisvehicle_type_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_type"];
     NSString *year_val_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"year_val"];
     NSString *EvalExisvehicle_monthh_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_monthh"];
     NSString *road_val_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"road_val"];
     NSString *EvalExisvehicle_owner_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_owner"];
     NSString *EvalExisvehicle_color_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_color"];
     NSString *EvalExisvehicle_estimate_by_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_estimate_by"];
     NSString *EvalExisvehicle_insurance_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_insurance"];
     NSString *EvalExisvehicle_market_demnad_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_market_demnad"];
     NSString *EvalExisvehicle_kmss_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EvalExisvehicle_kmss"];
     NSString *pricebymax_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"Final_price_value"];   //usedcarpurchaseofffer....
     
     
     
     
     //loanamount fetching values...
     NSString *loanamount_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"loanamount"];
     NSString *rateintrest_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"selectedRateInterest"];
     NSString *loan_tenure_yrs_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"loan_tenure_yrs"];
     NSString *EMi_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"EMII"];
     NSString *loan_foreclose_str=[[NSUserDefaults standardUserDefaults] objectForKey:@"loan_foreclose"];
     
     NSString *FinalPRicee=[[NSUserDefaults standardUserDefaults] objectForKey:@"Final_price_value"];
     NSString *outstanding_loan_amount_strqq=[[NSUserDefaults standardUserDefaults] objectForKey:@"outstanding_loan_amount"];
     NSString *loanamnt_estimate_by_strqq=[[NSUserDefaults standardUserDefaults] objectForKey:@"loanamnt_estimate_by"];
     
     
     
     
     NSString *usedrep_stdsdsdsdr=[[NSUserDefaults standardUserDefaults]valueForKey:@"Report_IDD_usedd"];
     
     NSLog(@"usedrep_stdsdsdsdr:%@",usedrep_stdsdsdsdr);*/
    
    
    
    /*
     //for username(uid)...
     NSString *unaMe=[[NSUserDefaults standardUserDefaults]valueForKey:@"usernameE"];
     NSLog(@"username:%@",unaMe);
     
     //for customer id :-- 1 dec...
     NSString *cust_id_strb=[[NSUserDefaults standardUserDefaults]valueForKey:@"Customer_Id"];
     NSLog(@"cust_id_strb:%@",cust_id_strb);
     
     
     NSString *net_transaction_amount_str=@"1300760";
     
     
     
     
     
     NSString *gid=[[NSUserDefaults standardUserDefaults]valueForKey:@"sId"];
     NSString *greporitd=[[NSUserDefaults standardUserDefaults]valueForKey:@"sReport_id"];
     NSString *gsalutation=[[NSUserDefaults standardUserDefaults]valueForKey:@"sSalutation"];
     NSString *gName=[[NSUserDefaults standardUserDefaults]valueForKey:@"sName"];
     NSString *gLname=[[NSUserDefaults standardUserDefaults]valueForKey:@"sLastName"];
     NSString *gContactno=[[NSUserDefaults standardUserDefaults]valueForKey:@"sContactNo"];
     NSString *gMail=[[NSUserDefaults standardUserDefaults]valueForKey:@"sMail"];
     NSString *gCCmail=[[NSUserDefaults standardUserDefaults]valueForKey:@"sCCMail"];
     NSString *gdate=[[NSUserDefaults standardUserDefaults]valueForKey:@"sDate"];
     NSString *gBudget=[[NSUserDefaults standardUserDefaults]valueForKey:@"sBudget"];
     NSString *gsEvaluate_Manufacturer=[[NSUserDefaults standardUserDefaults]valueForKey:@"sEvaluate_Manufacturer"];
     NSString *gsEvaluate_ModelType=[[NSUserDefaults standardUserDefaults]valueForKey:@"sEvaluate_ModelType"];
     NSString *gsEvaluate_VehicleModelType=[[NSUserDefaults standardUserDefaults]valueForKey:@"sEvaluate_VehicleModelType"];
     NSString *gsEvaluate_Date=[[NSUserDefaults standardUserDefaults]valueForKey:@"sEvaluate_Date"];
     
     NSString *gsEvaluate_Month=[[NSUserDefaults standardUserDefaults]valueForKey:@"sEvaluate_Month"];
     NSString *gsEvaluate_OnRoadValue=[[NSUserDefaults standardUserDefaults]valueForKey:@"sEvaluate_OnRoadValue"];
     NSString *gsEvaluate_Owner=[[NSUserDefaults standardUserDefaults]valueForKey:@"sEvaluate_Owner"];
     NSString *gsEvaluate_Color=[[NSUserDefaults standardUserDefaults]valueForKey:@"sEvaluate_Color"];
     NSString *gsEvaluate_RemainingInsurance=[[NSUserDefaults standardUserDefaults]valueForKey:@"sEvaluate_RemainingInsurance"];
     NSString *gsEvaluate_MarketDemand=[[NSUserDefaults standardUserDefaults]valueForKey:@"sEvaluate_MarketDemand"];
     NSString *gsEvaluate_KMS=[[NSUserDefaults standardUserDefaults]valueForKey:@"sEvaluate_KMS"];
     NSString *gsEvaluate_CBUCKD=[[NSUserDefaults standardUserDefaults]valueForKey:@"sEvaluate_CBUCKD"];
     NSString *gsEvaluate_Accidental=[[NSUserDefaults standardUserDefaults]valueForKey:@"sEvaluate_Accidental"];
     NSString *gsEvaluate_Fuel=[[NSUserDefaults standardUserDefaults]valueForKey:@"sEvaluate_Fuel"];
     NSString *gsEvaluate_Refurbishment=[[NSUserDefaults standardUserDefaults]valueForKey:@"sEvaluate_Refurbishment"];
     NSString *gsEvaluate_EstimationBy=[[NSUserDefaults standardUserDefaults]valueForKey:@"sEvaluate_EstimationBy"];
     NSString *gsEvaluate_OfferPriceByMax=[[NSUserDefaults standardUserDefaults]valueForKey:@"sEvaluate_OfferPriceByMax"];
     NSString *gsLoanAmountEstimator_LoanAmountTaken=[[NSUserDefaults standardUserDefaults]valueForKey:@"sLoanAmountEstimator_LoanAmountTaken"];
     NSString *gsLoanAmountEstimator_RateOfInterest=[[NSUserDefaults standardUserDefaults]valueForKey:@"sLoanAmountEstimator_RateOfInterest"];
     NSString *gsLoanAmountEstimator_loanTenure=[[NSUserDefaults standardUserDefaults]valueForKey:@"sLoanAmountEstimator_loanTenure"];
     NSString *gsLoanAmountEstimator_MonthlyPayment=[[NSUserDefaults standardUserDefaults]valueForKey:@"sLoanAmountEstimator_MonthlyPayment"];
     NSString *gsLoanAmountEstimator_EMI=[[NSUserDefaults standardUserDefaults]valueForKey:@"sLoanAmountEstimator_EMI"];
     
     NSString *gsLoanAmountEstimator_Percent=[[NSUserDefaults standardUserDefaults]valueForKey:@"sLoanAmountEstimator_Percent"];
     
     
     NSString *gsLoanAmountEstimator_FinalPrice=[[NSUserDefaults standardUserDefaults]valueForKey:@"sLoanAmountEstimator_FinalPrice"];
     NSString *gsLoanAmountEstimator_OutstandingLoan=[[NSUserDefaults standardUserDefaults]valueForKey:@"sLoanAmountEstimator_OutstandingLoan"];
     NSString *gsLoanAmountEstimator_BalanceTradeforclose=[[NSUserDefaults standardUserDefaults]valueForKey:@"sLoanAmountEstimator_BalanceTradeforclose"];
     NSString *gsLoanAmountEstimator_EstimationBy=[[NSUserDefaults standardUserDefaults]valueForKey:@"sLoanAmountEstimator_EstimationBy"];
     NSString *gsSync_Status=[[NSUserDefaults standardUserDefaults]valueForKey:@"sSync_Status"];
     */
    
    
    
    
    /////latesttttttttt...15Dec..
    
    NSString *gid=[[NSUserDefaults standardUserDefaults]valueForKey:@"sId"];
    NSString *greporitd=[[NSUserDefaults standardUserDefaults]valueForKey:@"sReport_id"];
    NSString *gsalutation=[[NSUserDefaults standardUserDefaults]valueForKey:@"sSalutation"];
    NSString *gName=[[NSUserDefaults standardUserDefaults]valueForKey:@"sName"];
    NSString *gLname=[[NSUserDefaults standardUserDefaults]valueForKey:@"sLastName"];
    NSString *gContactno=[[NSUserDefaults standardUserDefaults]valueForKey:@"sContactNo"];
    NSString *gMail=[[NSUserDefaults standardUserDefaults]valueForKey:@"sMail"];
    NSString *gCCmail=[[NSUserDefaults standardUserDefaults]valueForKey:@"sCCMail"];
    NSString *gdate=[[NSUserDefaults standardUserDefaults]valueForKey:@"sDate"];
    NSString *gBudget=[[NSUserDefaults standardUserDefaults]valueForKey:@"sBudget"];
    NSString *gsEvaluate_Manufacturer=[[NSUserDefaults standardUserDefaults]valueForKey:@"sEvaluate_Manufacturer"];
    NSString *gsEvaluate_ModelType=[[NSUserDefaults standardUserDefaults]valueForKey:@"sEvaluate_ModelType"];
    NSString *gsEvaluate_VehicleModelType=[[NSUserDefaults standardUserDefaults]valueForKey:@"sEvaluate_VehicleModelType"];
    NSString *gsEvaluate_Date=[[NSUserDefaults standardUserDefaults]valueForKey:@"sEvaluate_Date"];
    
    NSString *gsEvaluate_Month=[[NSUserDefaults standardUserDefaults]valueForKey:@"sEvaluate_Month"];
    NSString *gsEvaluate_OnRoadValue=[[NSUserDefaults standardUserDefaults]valueForKey:@"sEvaluate_OnRoadValue"];
    NSString *gsEvaluate_Owner=[[NSUserDefaults standardUserDefaults]valueForKey:@"sEvaluate_Owner"];
    NSString *gsEvaluate_Color=[[NSUserDefaults standardUserDefaults]valueForKey:@"sEvaluate_Color"];
    NSString *gsEvaluate_RemainingInsurance=[[NSUserDefaults standardUserDefaults]valueForKey:@"sEvaluate_RemainingInsurance"];
    NSString *gsEvaluate_MarketDemand=[[NSUserDefaults standardUserDefaults]valueForKey:@"sEvaluate_MarketDemand"];
    NSString *gsEvaluate_KMS=[[NSUserDefaults standardUserDefaults]valueForKey:@"sEvaluate_KMS"];
    NSString *gsEvaluate_CBUCKD=[[NSUserDefaults standardUserDefaults]valueForKey:@"sEvaluate_CBUCKD"];
    NSString *gsEvaluate_Accidental=[[NSUserDefaults standardUserDefaults]valueForKey:@"sEvaluate_Accidental"];
    NSString *gsEvaluate_Fuel=[[NSUserDefaults standardUserDefaults]valueForKey:@"sEvaluate_Fuel"];
    NSString *gsEvaluate_Refurbishment=[[NSUserDefaults standardUserDefaults]valueForKey:@"sEvaluate_Refurbishment"];
    NSString *gsEvaluate_EstimationBy=[[NSUserDefaults standardUserDefaults]valueForKey:@"sEvaluate_EstimationBy"];
    NSString *gsEvaluate_OfferPriceByMax=[[NSUserDefaults standardUserDefaults]valueForKey:@"sEvaluate_OfferPriceByMax"];
    NSString *gsLoanAmountEstimator_LoanAmountTaken=[[NSUserDefaults standardUserDefaults]valueForKey:@"sLoanAmountEstimator_LoanAmountTaken"];
    NSString *gsLoanAmountEstimator_RateOfInterest=[[NSUserDefaults standardUserDefaults]valueForKey:@"sLoanAmountEstimator_RateOfInterest"];
    NSString *gsLoanAmountEstimator_loanTenure=[[NSUserDefaults standardUserDefaults]valueForKey:@"sLoanAmountEstimator_loanTenure"];
    NSString *gsLoanAmountEstimator_MonthlyPayment=[[NSUserDefaults standardUserDefaults]valueForKey:@"sLoanAmountEstimator_MonthlyPayment"];
    NSString *gsLoanAmountEstimator_EMI=[[NSUserDefaults standardUserDefaults]valueForKey:@"sLoanAmountEstimator_EMI"];
    NSString *gsLoanAmountEstimator_Percent=[[NSUserDefaults standardUserDefaults]valueForKey:@"sLoanAmountEstimator_Percent"];
    NSString *gsLoanAmountEstimator_FinalPrice=[[NSUserDefaults standardUserDefaults]valueForKey:@"sLoanAmountEstimator_FinalPrice"];
    NSString *gsLoanAmountEstimator_OutstandingLoan=[[NSUserDefaults standardUserDefaults]valueForKey:@"sLoanAmountEstimator_OutstandingLoan"];
    NSString *gsLoanAmountEstimator_BalanceTradeforclose=[[NSUserDefaults standardUserDefaults]valueForKey:@"sLoanAmountEstimator_BalanceTradeforclose"];
    NSString *gsLoanAmountEstimator_EstimationBy=[[NSUserDefaults standardUserDefaults]valueForKey:@"sLoanAmountEstimator_EstimationBy"];
    NSString *gsSync_Status=[[NSUserDefaults standardUserDefaults]valueForKey:@"sSync_Status"];
    
    
    
    /////
    NSString *unaMe=[[NSUserDefaults standardUserDefaults]valueForKey:@"usernameE"];
    NSLog(@"username:%@",unaMe);
    
    //for customer id :-- 1 dec...
    NSString *cust_id_strb=[[NSUserDefaults standardUserDefaults]valueForKey:@"Customer_Id"];
    NSLog(@"cust_id_strb:%@",cust_id_strb);
    
    NSString *net_transaction_amount_str=@"1300760";
    /////
    
    /*
     NSString *urlString=[NSString stringWithFormat:@"http://maximizer.mdei.info/jlrmaximizer_p2/api/api/insert_usedcar_vehicle?data={\"uid\":\"%@\",\"custid\":\"%@\",\"salutation\":\"%@\",\"fname\":\"%@\",\"lname\":\"%@\",\"email\":\"%@\",\"phone\":\"%@\",\"cc_email\":\"%@\",\"report_id\":\"%@\",\"used_car_purchase_offer\":\"%@\",\"outstanding_loan_amount\":\"%@\",\"net_transaction_amount\":\"%@\",\"used_car_estimate_by\":\"%@\",\"outstanding_estimate_by\":\"%@\",\"expected_time\":\"%@\",\"expected_budget\":\"%@\",\"car_make\":\"%@\",\"car_model\":\"%@\",\"car_model_type\":\"%@\",\"purchase_year\":\"%@\",\"purchase_month\":\"%@\",\"onroad_value\":\"%@\",\"owner\":\"%@\",\"colour\":\"%@\",\"remain_insurance\":\"%@\",\"car_speed_type\":\"%@\",\"car_kms\":\"%@\",\"cbuckd\":\"%@\",\"accidental\":\"%@\",\"car_fuel_type\":\"%@\",\"old_refurb\":\"%@\",\"estimation_by\":\"%@\",\"loan_amount\":\"%@\",\"interest_rate_percent\":\"%@\",\"loan_tenure\":\"%@\",\"actual_emi\":\"%@\",\"estimated_foreclose_percent\":\"%@\",\"final_offer_price\":\"%@\",\"outstanding_loan\":\"%@\",\"balance_trade_foreclose\":\"%@\"}",unaMe,cust_id_strb,gsalutation,gName,gLname,gMail,gContactno,gCCmail,greporitd,gsEvaluate_OfferPriceByMax,gsLoanAmountEstimator_OutstandingLoan,net_transaction_amount_str,gsEvaluate_EstimationBy,gsLoanAmountEstimator_EstimationBy,gdate,gBudget,gsEvaluate_Manufacturer,gsEvaluate_ModelType,gsEvaluate_VehicleModelType,gsEvaluate_Date,gsEvaluate_Month,gsEvaluate_OnRoadValue,gsEvaluate_Owner,gsEvaluate_Color,gsEvaluate_RemainingInsurance,gsEvaluate_MarketDemand,gsEvaluate_KMS,gsEvaluate_CBUCKD,gsEvaluate_Accidental,gsEvaluate_Fuel,gsEvaluate_Refurbishment,gsEvaluate_EstimationBy,gsLoanAmountEstimator_LoanAmountTaken,gsLoanAmountEstimator_RateOfInterest,gsLoanAmountEstimator_loanTenure,gsLoanAmountEstimator_EMI,gsLoanAmountEstimator_Percent,gsLoanAmountEstimator_FinalPrice,gsLoanAmountEstimator_OutstandingLoan,gsLoanAmountEstimator_BalanceTradeforclose];
     */
    
    
    //new..
    
    NSString *urlString=[NSString stringWithFormat:@"http://maximizer.mdei.info/jlrmaximizer_p2/api/api/insert_usedcar_vehicle?data={\"uid\":\"%@\",\"custid\":\"%@\",\"salutation\":\"%@\",\"fname\":\"%@\",\"lname\":\"%@\",\"email\":\"%@\",\"phone\":\"%@\",\"cc_email\":\"%@\",\"report_id\":\"%@\",\"used_car_purchase_offer\":\"%@\",\"outstanding_loan_amount\":\"%@\",\"net_transaction_amount\":\"%@\",\"used_car_estimate_by\":\"%@\",\"outstanding_estimate_by\":\"%@\",\"expected_time\":\"%@\",\"expected_budget\":\"%@\",\"car_make\":\"%@\",\"car_model\":\"%@\",\"car_model_type\":\"%@\",\"purchase_year\":\"%@\",\"purchase_month\":\"%@\",\"onroad_value\":\"%@\",\"owner\":\"%@\",\"colour\":\"%@\",\"remain_insurance\":\"%@\",\"car_speed_type\":\"%@\",\"car_kms\":\"%@\",\"cbuckd\":\"%@\",\"accidental\":\"%@\",\"car_fuel_type\":\"%@\",\"old_refurb\":\"%@\",\"estimation_by\":\"%@\",\"loan_amount\":\"%@\",\"interest_rate_percent\":\"%@\",\"loan_tenure\":\"%@\",\"actual_emi\":\"%@\",\"estimated_foreclose_percent\":\"%@\",\"final_offer_price\":\"%@\",\"outstanding_loan\":\"%@\",\"balance_trade_foreclose\":\"%@\"}",unaMe,cust_id_strb,gsalutation,gName,gLname,gMail,gContactno,gCCmail,greporitd,gsEvaluate_OfferPriceByMax,gsLoanAmountEstimator_OutstandingLoan,net_transaction_amount_str,gsEvaluate_EstimationBy,gsLoanAmountEstimator_EstimationBy,gdate,gBudget,gsEvaluate_Manufacturer,gsEvaluate_ModelType,gsEvaluate_VehicleModelType,gsEvaluate_Date,gsEvaluate_Month,gsEvaluate_OnRoadValue,gsEvaluate_Owner,gsEvaluate_Color,gsEvaluate_RemainingInsurance,gsEvaluate_MarketDemand,gsEvaluate_KMS,gsEvaluate_CBUCKD,gsEvaluate_Accidental,gsEvaluate_Fuel,gsEvaluate_Refurbishment,gsEvaluate_EstimationBy,gsLoanAmountEstimator_LoanAmountTaken,gsLoanAmountEstimator_RateOfInterest,gsLoanAmountEstimator_loanTenure,gsLoanAmountEstimator_EMI,gsLoanAmountEstimator_Percent,gsLoanAmountEstimator_FinalPrice,gsLoanAmountEstimator_OutstandingLoan,gsLoanAmountEstimator_BalanceTradeforclose];
    
    //
    
    /*
     NSString *urlString=[NSString stringWithFormat:@"http://maximizer.mdei.info/jlrmaximizer_p2/api/api/insert_usedcar_vehicle?data={\"uid\":\"%@\",\"custid\":\"%@\",\"salutation\":\"%@\",\"fname\":\"%@\",\"lname\":\"%@\",\"email\":\"%@\",\"phone\":\"%@\",\"cc_email\":\"%@\",\"report_id\":\"%@\",\"used_car_purchase_offer\":\"%@\",\"outstanding_loan_amount\":\"%@\",\"net_transaction_amount\":\"%@\",\"used_car_estimate_by\":\"%@\",\"outstanding_estimate_by\":\"%@\",\"expected_time\":\"%@\",\"expected_budget\":\"%@\",\"car_make\":\"%@\",\"car_model\":\"%@\",\"car_model_type\":\"%@\",\"purchase_year\":\"%@\",\"purchase_month\":\"%@\",\"onroad_value\":\"%@\",\"owner\":\"%@\",\"colour\":\"%@\",\"remain_insurance\":\"%@\",\"car_speed_type\":\"%@\",\"car_kms\":\"%@\",\"cbuckd\":\"%@\",\"accidental\":\"%@\",\"car_fuel_type\":\"%@\",\"old_refurb\":\"%@\",\"estimation_by\":\"%@\",\"loan_amount\":\"%@\",\"interest_rate_percent\":\"%@\",\"loan_tenure\":\"%@\",\"actual_emi\":\"%@\",\"estimated_foreclose_percent\":\"%@\",\"final_offer_price\":\"%@\",\"outstanding_loan\":\"%@\",\"balance_trade_foreclose\":\"%@\"}",unaMe,cust_id_strb,gsalutation,gName,gLname,gMail,gContactno,gCCmail,greporitd,gsEvaluate_OfferPriceByMax,gsLoanAmountEstimator_OutstandingLoan,net_transaction_amount_str,gsEvaluate_EstimationBy,gsLoanAmountEstimator_EstimationBy,gdate,gBudget,gsEvaluate_Manufacturer,gsEvaluate_ModelType,gsEvaluate_VehicleModelType,gsEvaluate_Date,gsEvaluate_Month,gsEvaluate_OnRoadValue,gsEvaluate_Owner,gsEvaluate_Color,gsEvaluate_RemainingInsurance,gsEvaluate_MarketDemand,gsEvaluate_KMS,gsEvaluate_CBUCKD,gsEvaluate_Accidental,gsEvaluate_Fuel,gsEvaluate_Refurbishment,gsEvaluate_EstimationBy,gsLoanAmountEstimator_LoanAmountTaken,gsLoanAmountEstimator_RateOfInterest,gsLoanAmountEstimator_loanTenure,gsLoanAmountEstimator_EMI,gsLoanAmountEstimator_Percent,gsLoanAmountEstimator_FinalPrice,gsLoanAmountEstimator_OutstandingLoan,gsLoanAmountEstimator_BalanceTradeforclose];*/
    
    
    //repp_id_strb to rep1300_Usedvehicleflow
    
    
    //preiviosly entered static values of custid and reportid:-...
    //custid_str
    //reportid_str
    
    
    
    NSLog(@" urlString %@",urlString);
    
    NSURL *addurl = [[NSURL alloc]initWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSData *jsonData = [NSData dataWithContentsOfURL:addurl];
    if (jsonData)
    {
        NSError *error = nil;
        NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
        
        if (!error) //success...
        {
            NSLog(@"dataDictionary %@",dataDictionary);
            
            NSString * SyncStatusUpdated;
            SyncStatusUpdated = @"Done";
            // [database executeUpdate:@"UPDATE tbl_Jlrform SET Sync_Status = ? ", SyncStatusUpdated];
            
            // [database executeUpdate:@"UPDATE tbl_Jlrform SET Sync_Status='Done' WHERE id = (SELECT max(id) FROM tbl_Jlrform)"];
            
            [database executeUpdate:@"UPDATE tbl_usedcar_details SET Sync_Status='Done' WHERE id = ?", gid];
            
            
            
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
    
    
}





-(void)GetLoginnn_29march
{

    
       NSString *urlString =@"http://maximizer.mdei.info/jlrmaximizer_p2/api/api/getuserlogin_details";
    
    NSLog(@"urlString:%@",urlString);
        
        NSURL *URL = [[NSURL alloc]initWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        
        NSData * jsondata= [NSData dataWithContentsOfURL:URL];
        
        
        id jsonObjects = [NSJSONSerialization JSONObjectWithData:
                          jsondata options:NSJSONReadingMutableContainers error:nil];
        
        NSLog(@"Output :%@",jsonObjects);
        
        NSMutableDictionary * respdic = [[NSMutableDictionary alloc]init];
        
        respdic = [jsonObjects valueForKey:@"userdata"];
        
    
    
        // for only name or for only id:-
        
        array2 = [respdic valueForKey:@"uid"];
    NSLog(@"array2 :%@",array2);

        array1 = [respdic valueForKey:@"password"];
    NSLog(@"array1 :%@",array1);
    
}











-(BOOL)isNetworkAvailable
{
    char *hostname;
    struct hostent *hostinfo;
    hostname = "google.com";
    hostinfo = gethostbyname(hostname);
    if (hostinfo == NULL){
        //NSLog(@"-> no connection!\n");
        return NO;
    }
    else{
        //NSLog(@"-> connection established!\n");
        return YES;
    }
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



- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end

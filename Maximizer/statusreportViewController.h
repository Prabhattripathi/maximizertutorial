//
//  statusreportViewController.h
//  Maximizer
//
//  Created by Genie Technology on 10/08/15.
//  Copyright (c) 2015 Genie Soft Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface statusreportViewController : UIViewController

- (IBAction)btn_TradingExchange:(id)sender;
- (IBAction)btn_PreownedVehicle:(id)sender;
- (IBAction)btn_NewVehicle:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *menubtn;
@property (strong, nonatomic) IBOutlet UIButton *sharebtn;
- (IBAction)sharecliked:(id)sender;
- (IBAction)menucliked:(id)sender;

@property (strong, nonatomic) IBOutlet UIWebView *web_view;


- (IBAction)btn_backkk:(id)sender;

@end

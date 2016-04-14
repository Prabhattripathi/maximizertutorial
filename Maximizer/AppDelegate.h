//
//  AppDelegate.h
//  Maximizer
//
//  Created by Genie Technology on 07/08/15.
//  Copyright (c) 2015 Genie Soft Systems. All rights reserved.
//   30nov..work here..!!

#import <UIKit/UIKit.h>


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (assign, nonatomic) NSInteger selectindex;
@property (assign, nonatomic) NSInteger selectindex_finance;

@property (strong, nonatomic) NSString *device_token;



@property (strong, nonatomic)  UITextField *useridtxt12;
@property (strong, nonatomic)  UITextField *passtxt12;

@property (strong, nonatomic)  NSString *drop_index;



//15sept...
@property (strong, nonatomic) UIButton *make_btn;

//@property (strong, nonatomic)  UITextField *useridtxt12;


//
//@property (strong, nonatomic) IBOutlet UIButton *make_btn;


-(BOOL)checkinternet;


//26dec
@property(assign,nonatomic)NSInteger index;



@end



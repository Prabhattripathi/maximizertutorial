//
//  detialstatusViewController.h
//  Maximizer
//
//  Created by Genie Technology on 18/08/15.
//  Copyright (c) 2015 Genie Soft Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface detialstatusViewController : UIViewController

@property (strong, nonatomic) IBOutlet UICollectionView *collectview;
@property (strong, nonatomic) IBOutlet UIButton *menubtn;
@property (strong, nonatomic) IBOutlet UIButton *sharebtn;
- (IBAction)sharecliked:(id)sender;
- (IBAction)menucliked:(id)sender;


//1
- (IBAction)btn_dateclick:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *lbl_displaydate;


//2
- (IBAction)btn_dateclick2:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *lbl_displaydate2;




//1
@property (strong, nonatomic) IBOutlet UIView *VIEWPICKER;
@property (strong, nonatomic) IBOutlet UIDatePicker *date_picker;
- (IBAction)btn_set:(id)sender;

//2

@property (strong, nonatomic) IBOutlet UIView *VIEWPICKER2;
@property (strong, nonatomic) IBOutlet UIDatePicker *date_picker2;
@property (strong, nonatomic) IBOutlet UIButton *btn_set2;
- (IBAction)btn_set2:(id)sender;



@end

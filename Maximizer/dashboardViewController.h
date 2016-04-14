//
//  dashboardViewController.h
//  Maximizer
//
//  Created by Genie Technology on 07/08/15.
//  Copyright (c) 2015 Genie Soft Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface dashboardViewController : UIViewController<UIDocumentInteractionControllerDelegate,MBProgressHUDDelegate>

@property (strong, nonatomic) IBOutlet UICollectionView *dashcollection;
- (IBAction)logoutcliked:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *menubtn;
- (IBAction)menucliked:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *sharebtn;

@end

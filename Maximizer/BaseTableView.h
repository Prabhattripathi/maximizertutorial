//
//  BaseTableView.h
//  Faida
//
//  Created by Santosh  on 10/02/14.
//  Copyright (c) 2014 geniemac5. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@class SA_OAuthTwitterEngine;

@protocol SelectedCatDelegate
@optional

- (void)selectedCatIndex:(int)index;

@end

@interface BaseTableView : UIView <UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *catnamearray,*imgarr;
    
    AppDelegate *app;

}
@property(nonatomic,strong)UITableView    *menuTableView;



@end

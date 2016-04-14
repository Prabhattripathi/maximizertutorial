//
//  BaseTableView.m
//  Faida
//
//  Created by Santosh  on 10/02/14.
//  Copyright (c) 2014 geniemac5. All rights reserved.
//

#import "BaseTableView.h"
#import "AppDelegate.h"
#import "dashboardViewController.h"
#import "firstquotationViewController.h"
#import "EvaluateexistingvehcleViewController.h"
#import "NewvehcleViewController.h"
#import "financeofferViewController.h"
#import "statusreportViewController.h"
#import "FeedbackcViewController.h"
#import "editprofileViewController.h"
#import "ViewController.h"
#import "RemarkViewController.h"
#import "AppDelegate.h"
#import "LoanestimatorViewController.h"



@implementation BaseTableView
{
    UIView * paintView,*paintView2;
   
    
}
@synthesize menuTableView;

/*,bystore,bydate,bylocation,addbtn,locationButton;*/

#define isiPhone5  ([[UIScreen mainScreen] bounds].size.height == 568)?TRUE:FALSE


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        if(isiPhone5)
        {
            menuTableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0,self.frame.size.width,self.frame.size.height) style:UITableViewStyleGrouped];

        }
        else
        {
            menuTableView = [[UITableView alloc]initWithFrame:CGRectMake(0,-10,self.frame.size.width,self.frame.size.height) style:UITableViewStyleGrouped];

        }
        
        menuTableView.backgroundColor = [UIColor clearColor];
        menuTableView.dataSource      = self;
        menuTableView.delegate        = self;
        //[menuTableView setBackgroundView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back"]]];
        menuTableView.showsVerticalScrollIndicator=NO;
        menuTableView.bounces=NO;
        menuTableView.backgroundColor=[UIColor whiteColor];
        menuTableView.scrollEnabled =YES;
       
        [self gettabledata];
        [self addSubview:menuTableView];
        
       
    }
    return self;
}
-(void)gettabledata
{
    app=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    catnamearray=[[NSMutableArray alloc]init];
    
    [catnamearray addObject:@"Home"];
    [catnamearray addObject:@"Trade in Vehicle"];
    [catnamearray addObject:@"New Vehicle"];
    [catnamearray addObject:@"Used Vehicle"];
    [catnamearray addObject:@"Status Report"];
    [catnamearray addObject:@"Feedback"];
    [catnamearray addObject:@"Edit Profile"];
    [catnamearray addObject:@"Remark"];
    [catnamearray addObject:@"Logout"];

    
    
    
    imgarr=[[NSMutableArray alloc]init];
    
    [imgarr addObject:[UIImage imageNamed:@"app_icon.png"]];
    [imgarr addObject:[UIImage imageNamed:@"car_icon.png"]];
    [imgarr addObject:[UIImage imageNamed:@"car_icon.png"]];
    [imgarr addObject:[UIImage imageNamed:@"car_icon.png"]];
    [imgarr addObject:[UIImage imageNamed:@"st_icon.png"]];
    [imgarr addObject:[UIImage imageNamed:@"ml-icon.png"]];
    [imgarr addObject:[UIImage imageNamed:@"edit_icon.png"]];
    [imgarr addObject:[UIImage imageNamed:@"remark.png"]];
    [imgarr addObject:[UIImage imageNamed:@"ic_logout_main.png"]];
    
    
    [menuTableView reloadData];
    
}



#pragma mark -- UITableView Data source & Delegate methods
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //NSLog(@"ount:%lu",(unsigned long)[catnamearray count]);
    return catnamearray.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell  *cell  = [tableView dequeueReusableCellWithIdentifier:nil];
    if(!cell)
        cell  = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];

    self.menuTableView.contentInset = UIEdgeInsetsMake(-35, 0, -35, 0);
    [menuTableView setSeparatorColor:[UIColor clearColor]];

   // cell.accessoryType = UITableViewCellAccessoryNone;
    
    cell.selectedBackgroundView = [UIView new];
    NSString *str=[NSString stringWithFormat:@"%ld",(long)indexPath.row];
    if([str isEqualToString:[[NSUserDefaults standardUserDefaults]valueForKey:@"whichview"]])
    {
        cell.backgroundColor = [UIColor colorWithRed:248/255.0 green:194/255.0 blue:3/255.0 alpha:1.0];
    }
    else
    {
        cell.backgroundColor = [UIColor whiteColor];
    }
    
    UILabel *textlabel = [[UILabel alloc]init];
    textlabel.frame = CGRectMake(40, 15, 200, 20);
    textlabel.font=[UIFont boldSystemFontOfSize:15];
    textlabel.textColor = [UIColor blackColor];
    textlabel.text = [catnamearray objectAtIndex:indexPath.row];
    [cell.contentView addSubview:textlabel];
 
    UIImageView *IMAGES=[[UIImageView alloc]initWithFrame:CGRectMake(6, 13, 22, 22)];
    
    IMAGES.image=[imgarr objectAtIndex:indexPath.row];
    [cell.contentView addSubview:IMAGES];
    
    UILabel *diveder = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 0.6)];
    diveder.backgroundColor=[UIColor colorWithRed:11/255. green:47/255. blue:63/255. alpha:1.0f];
    [cell.contentView addSubview:diveder];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    
    
    UIView *myBackView = [[UIView alloc] initWithFrame:cell.frame];
    //myBackView.backgroundColor=[UIColor colorWithRed:42/255.0 green:66/255.0 blue:125/255.0 alpha:1.0];
    myBackView.backgroundColor=[UIColor colorWithRed:119/255.0 green:136/255.0 blue:153/255.0 alpha:1.0];
    cell.selectedBackgroundView = myBackView;
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 50;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    app=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    
    if(indexPath.row==0)
    {
       
        UIStoryboard *storyboard ;
        storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        dashboardViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"dashboardViewController"];
        [(UINavigationController *)self.window.rootViewController pushViewController:vw animated:YES];
    }
    else if (indexPath.row==1)
    {
         app.selectindex=0;
        
        UIStoryboard *storyboard ;
        storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        firstquotationViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"firstquotationViewController"];
        [(UINavigationController *)self.window.rootViewController pushViewController:vw animated:YES];
    }
    else if (indexPath.row==2)
    {
         app.selectindex=1;
        
       UIStoryboard *storyboard ;
        storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        firstquotationViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"firstquotationViewController"];
        [(UINavigationController *)self.window.rootViewController pushViewController:vw animated:YES];
        
      /*  UIStoryboard *storyboard ;
        storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        LoanestimatorViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"LoanestimatorViewController"];
        [(UINavigationController *)self.window.rootViewController pushViewController:vw animated:YES];*/
        
    }
    else if (indexPath.row==3)
    {
         app.selectindex=2;
        
        UIStoryboard *storyboard ;
        storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        firstquotationViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"firstquotationViewController"];
        [(UINavigationController *)self.window.rootViewController pushViewController:vw animated:YES];
    }
    else if (indexPath.row==4)
    {
        //n
        app.selectindex=2;

        
        UIStoryboard *storyboard ;
        storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        statusreportViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"statusreportViewController"];
        [(UINavigationController *)self.window.rootViewController pushViewController:vw animated:YES];
    }
    else if (indexPath.row==5)
    {
        
        //n
        app.selectindex=2;

        
        UIStoryboard *storyboard ;
        storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        FeedbackcViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"FeedbackcViewController"];
        [(UINavigationController *)self.window.rootViewController pushViewController:vw animated:YES];
    }
    else if (indexPath.row==6)
    {
        
        //n
        app.selectindex=2;

        
        UIStoryboard *storyboard ;
        storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        editprofileViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"editprofileViewController"];
        [(UINavigationController *)self.window.rootViewController pushViewController:vw animated:YES];
    }
    else if (indexPath.row==7)
    {
        
        //n
        app.selectindex=2;

        
        UIStoryboard *storyboard ;
        storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        RemarkViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"RemarkViewController"];
        [(UINavigationController *)self.window.rootViewController pushViewController:vw animated:YES];
    }
    else
    {
        
        //n
        app.selectindex=2;

        
        UIStoryboard *storyboard ;
        storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        ViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
        [(UINavigationController *)self.window.rootViewController pushViewController:vw animated:YES];
    }
}

- (void)drawRect:(CGRect)rect
{
    
}

@end

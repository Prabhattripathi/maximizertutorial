//
//  detialstatusViewController.m
//  Maximizer
//
//  Created by Genie Technology on 18/08/15.
//  Copyright (c) 2015 Genie Soft Systems. All rights reserved.
//

#import "detialstatusViewController.h"
#import "DashboardCell.h"
#import "BaseTableView.h"
#import "editprofileViewController.h"
#import "AppDelegate.h"
#import "FinalStatusViewController.h"
#import "ViewController.h"



@interface detialstatusViewController ()
{
    DashboardCell *Cell;
    NSMutableArray *imgarr;
    UIImageView *backimgview;
    BaseTableView *basetab;
    AppDelegate *app;
}

@end

@implementation detialstatusViewController

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
    
    imgarr=[[NSMutableArray alloc]init];
    [imgarr addObject:[UIImage imageNamed:@"tot_icons.png"]];
    [imgarr addObject:[UIImage imageNamed:@"totalquos.png"]];
    [imgarr addObject:[UIImage imageNamed:@"approved_icons.png"]];
    [imgarr addObject:[UIImage imageNamed:@"denieds.png"]];//
    [imgarr addObject:[UIImage imageNamed:@"draft_icons.png"]];
    //[imgarr addObject:[UIImage imageNamed:@"ic_logout.png"]];
    [imgarr addObject:[UIImage imageNamed:@"remark_icon.png"]];

    
    [self.collectview registerNib:[UINib nibWithNibName:@"DashboardCell" bundle:nil] forCellWithReuseIdentifier:@"DashboardCell"];
    
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
    
    //date view...
    self.VIEWPICKER.hidden=YES;
    self.VIEWPICKER2.hidden=YES;

    
    /*
    self.fromdatebtn.layer.borderWidth=0.5;
    self.fromdatebtn.layer.borderColor=[UIColor blackColor].CGColor;
    
    
    self.todatebtn.layer.borderWidth=0.5;
    self.todatebtn.layer.borderColor=[UIColor blackColor].CGColor;
     */
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

#pragma mark -
#pragma mark -Gesture method

-(void)viewWillAppear:(BOOL)animated
{
    basetab.hidden=YES;
    backimgview.hidden=true;
    self.menubtn.userInteractionEnabled=YES;
    self.sharebtn.userInteractionEnabled=YES;
    
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
    self.menubtn.userInteractionEnabled=YES;
    self.sharebtn.userInteractionEnabled=YES;
    
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
    backimgview.hidden=NO;
    basetab.hidden=NO;
    self.menubtn.userInteractionEnabled=NO;
    self.sharebtn.userInteractionEnabled=NO;
    
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
    self.menubtn.userInteractionEnabled=YES;
    self.sharebtn.userInteractionEnabled=YES;
    
    backimgview.hidden=YES;
    [self.view endEditing:YES];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.50];
    [UIView setAnimationBeginsFromCurrentState:YES];
    basetab.frame = CGRectMake(-320, 68, 280, self.view.frame.size.height-50);
    [UIView commitAnimations];
}





#pragma mark -
#pragma mark - Collection view delegate


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return imgarr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    Cell = (DashboardCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"DashboardCell" forIndexPath:indexPath];
    Cell.imagview.image=[imgarr objectAtIndex:indexPath.row];
    return Cell;
    
    
}

-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
   
    {
        self.view.userInteractionEnabled=NO;
        
        // app.gadgetid=[idarr objectAtIndex:indexPath.row];
        //NSLog(@"app.gadgetid:%@",app.gadgetid);
        
        app.selectindex=indexPath.row;
        
        Cell = (DashboardCell*)[collectionView cellForItemAtIndexPath:indexPath];
        
        [UIView transitionWithView:Cell
                          duration:1
                           options:UIViewAnimationOptionTransitionFlipFromLeft
                        animations:^{
                            
                        }
                        completion:NULL];
        
        double delayInSeconds = 1.0;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void)
                       {
                           
                           
//                           if(indexPath.row==0)
//                               [self performSegueWithIdentifier:@"firstpage" sender:nil];
//                           if(indexPath.row==1)
//                               [self performSegueWithIdentifier:@"firstpage" sender:nil];
//                           if(indexPath.row==2)
//                               [self performSegueWithIdentifier:@"firstpage" sender:nil];
//                           else if (indexPath.row==4)
//                               [self performSegueWithIdentifier:@"feedback" sender:nil];
                           
                           
                            if (indexPath.row==0)
                           {
                               UIStoryboard *storyboard ;
                               storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
                               FinalStatusViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"FinalStatusViewController"];
                               [self.navigationController pushViewController:vw animated:YES];
                           }
                           else if (indexPath.row==1)
                           {
                               UIStoryboard *storyboard ;
                               storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
                               FinalStatusViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"FinalStatusViewController"];
                               [self.navigationController pushViewController:vw animated:YES];
                           }
                           else if (indexPath.row==2)
                           {
                               UIStoryboard *storyboard ;
                               storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
                               FinalStatusViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"FinalStatusViewController"];
                               [self.navigationController pushViewController:vw animated:YES];
                           }
                           else if (indexPath.row==3)
                           {
                               UIStoryboard *storyboard ;
                               storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
                               FinalStatusViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"FinalStatusViewController"];
                               [self.navigationController pushViewController:vw animated:YES];
                           }

                           else if (indexPath.row==4)
                           {
                               UIStoryboard *storyboard ;
                               storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
                               FinalStatusViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"FinalStatusViewController"];
                               [self.navigationController pushViewController:vw animated:YES];
                           }
                           else if (indexPath.row==5)
                           {
                               UIStoryboard *storyboard ;
                               storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
                               FinalStatusViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"FinalStatusViewController"];
                               [self.navigationController pushViewController:vw animated:YES];
                           }

                           
                           self.view.userInteractionEnabled=YES;
                           
                       });
        
    }
    
}



- (IBAction)sharecliked:(id)sender
{
    
}

- (IBAction)menucliked:(id)sender
{
    backimgview.hidden=NO;
    basetab.hidden=NO;
    self.menubtn.userInteractionEnabled=NO;
    self.sharebtn.userInteractionEnabled=NO;
    
    [self.view endEditing:YES];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.50];
    [UIView setAnimationBeginsFromCurrentState:YES];
    basetab.frame = CGRectMake(0, 68, 280, self.view.frame.size.height-50);
    [UIView commitAnimations];
}





///for dates....

//1....
- (IBAction)btn_dateclick:(id)sender
{
    self.VIEWPICKER.hidden=NO;
    //    self.date_picker =[[UIDatePicker alloc]initWithFrame:CGRectMake(0, 0,10, 50)];
    //  self.date_picker.datePickerMode=UIDatePickerModeDate;
    self.date_picker.hidden=NO;
    self.date_picker.date=[NSDate date];
    [self.date_picker addTarget:self action:@selector(LabelTitle:) forControlEvents:UIControlEventValueChanged];
    self.date_picker.backgroundColor=[UIColor lightGrayColor];
    [self.VIEWPICKER addSubview:self.date_picker];
    
    self.VIEWPICKER2.hidden=YES;

    
}

-(void)LabelTitle:(id)sender
{
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
    dateFormat.dateStyle=NSDateFormatterMediumStyle;
    [dateFormat setDateFormat:@"MM/dd/yyyy"];
    NSString *str=[NSString stringWithFormat:@"%@",[dateFormat  stringFromDate:self.date_picker.date]];
    self.lbl_displaydate.text=str;
}

- (IBAction)btn_set:(id)sender
{
    self.VIEWPICKER.hidden=YES;
}


//2....
- (IBAction)btn_dateclick2:(id)sender
{
    self.VIEWPICKER2.hidden=NO;
    //    self.date_picker =[[UIDatePicker alloc]initWithFrame:CGRectMake(0, 0,10, 50)];
    //  self.date_picker.datePickerMode=UIDatePickerModeDate;
    self.date_picker2.hidden=NO;
    self.date_picker2.date=[NSDate date];
    [self.date_picker2 addTarget:self action:@selector(LabelTitle2:) forControlEvents:UIControlEventValueChanged];
    self.date_picker2.backgroundColor=[UIColor lightGrayColor];
    [self.VIEWPICKER2 addSubview:self.date_picker2];
    
    self.VIEWPICKER.hidden=YES;


}


-(void)LabelTitle2:(id)sender
{
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
    dateFormat.dateStyle=NSDateFormatterMediumStyle;
    [dateFormat setDateFormat:@"MM/dd/yyyy"];
    NSString *str=[NSString stringWithFormat:@"%@",[dateFormat  stringFromDate:self.date_picker2.date]];
    self.lbl_displaydate2.text=str;
}

- (IBAction)btn_set2:(id)sender
{
    self.VIEWPICKER2.hidden=YES;

}



@end

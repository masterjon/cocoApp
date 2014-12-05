//
//  VirtualTourViewController.m
//  CocoBongoApp
//
//  Created by Alberto Enriquez on 29/11/14.
//  Copyright (c) 2014 Alberto Enriquez. All rights reserved.
//

#import "VirtualTourViewController.h"
#import "WebViewController.h"
#import "ToolbarMenuController.h"
@interface VirtualTourViewController ()

@end

@implementation VirtualTourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"grandient_blue"]];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    [self createToolbar];

    // Do any additional setup after loading the view.
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([segue.identifier isEqualToString:@"virtualTourCancun"]) {
        [segue.destinationViewController setTitle:NSLocalizedString(@"Cancun",nil)];
        [segue.destinationViewController setUrl: @"https://maps.google.com/maps?ll=21.132973,-86.747414&spn=0.326638,0.603561&cbll=21.132973,-86.747414&layer=c&panoid=wwDGw0yhxu0AAAQXDl2gvQ&cbp=12,92.86,,0,-9.45&t=m&z=12"];
    }
    else if ([segue.identifier isEqualToString:@"virtualTourPlaya"]){
        [segue.destinationViewController setTitle:NSLocalizedString(@"Playa",nil)];
        [segue.destinationViewController setUrl: @"https://maps.google.com/maps?ll=20.628074,-87.072235&spn=0.200819,0.315857&cbll=20.628074,-87.072235&layer=c&panoid=mT2XFCvd8joAAAQfCNDqgw&cbp=12,319.74,,0,-52.18&t=m&z=12"];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)goToMainMenu:(UIButton *)sender {
    [ ToolbarMenuController goMainMenu:self];
}
- (IBAction)openNavMenu:(UIButton *)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:NSLocalizedString(@"Select",nil)
                                  delegate:self
                                  cancelButtonTitle:NSLocalizedString(@"Cancel",nil)
                                  destructiveButtonTitle:nil
                                  otherButtonTitles:nil
                                  ];
    NSArray *menuItems = [[NSArray alloc] init];
    menuItems = [ToolbarMenuController getMenuItems];
    for (NSString *title in menuItems) {
        [actionSheet addButtonWithTitle:title];
    }
    [actionSheet showInView:self.view];
}
-(void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    [ToolbarMenuController action:buttonIndex atView:self];
    NSLog(@"%i",buttonIndex);
}
-(void) createToolbar{
    UIImage *homeImg = [UIImage imageNamed:@"home-icon"];
    UIImage *moreImg = [UIImage imageNamed:@"more-icon"];
    UIBarButtonItem *goHome = [[UIBarButtonItem alloc] initWithImage:homeImg landscapeImagePhone:homeImg style:UIBarButtonItemStyleDone target:self action:@selector(goToMainMenu:)];
    
    UIBarButtonItem *seeMore = [[UIBarButtonItem alloc] initWithImage:moreImg landscapeImagePhone:moreImg style:UIBarButtonItemStylePlain target:self action:@selector(openNavMenu:)];
    
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    NSArray *buttonItems = [NSArray arrayWithObjects: goHome, spacer,spacer,spacer, seeMore, nil];
    [_toolbar setItems:buttonItems];
    
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

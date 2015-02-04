//
//  MapViewController.m
//  CocoBongoApp
//
//  Created by Alberto Enriquez on 13/11/14.
//  Copyright (c) 2014 Alberto Enriquez. All rights reserved.
//

#import "MapViewController.h"
#import "ToolbarMenuController.h"
@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    self.coco_cancun = [[MKPointAnnotation alloc] init];
    self.coco_cancun.coordinate = CLLocationCoordinate2DMake(21.132893,-86.747208);
    self.coco_cancun.title = NSLocalizedString(@"Coco Bongo Cancun",nil);
    self.coco_cancun.subtitle =NSLocalizedString(@"Kukulcan Boulevard Km 9.5 Forum Shopping Mall, Hotel Zone Cancun Q.Roo, Mexico",nil);
    [self.mapView addAnnotation:self.coco_cancun];
    
    self.coco_playa = [[MKPointAnnotation alloc] init];
    self.coco_playa.coordinate = CLLocationCoordinate2DMake(20.62811903364482,-87.07241714000702);
    self.coco_playa.title = NSLocalizedString(@"Coco Bongo Playa del Carmen",nil);
    self.coco_playa.subtitle = NSLocalizedString(@"Avenue 10 and street 12, Playa del Carmen Q.Roo, México",nil);
    [self.mapView addAnnotation:self.coco_playa];
    
    self.coco_puntacana = [[MKPointAnnotation alloc] init];
    self.coco_puntacana.coordinate = CLLocationCoordinate2DMake(18.638309468634958,-68.3990654157008);
    self.coco_puntacana.title = NSLocalizedString(@"Coco Bongo Punta Cana",nil);
    self.coco_puntacana.subtitle =NSLocalizedString(@"Downtown Punta Cana Shopping Mall, Barcelo Road, corner el Boulevard, Crossing Coco Loco Bávaro, Punta Cana Dominican Republic",nil);
    [self.mapView addAnnotation:self.coco_puntacana];
    [self createToolbar];
    
    // Do any additional setup after loading the view.
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
    actionSheet.tag = 1100;
    NSArray *menuItems = [[NSArray alloc] init];
    menuItems = [ToolbarMenuController getMenuItems];
    for (NSString *title in menuItems) {
        [actionSheet addButtonWithTitle:title];
    }
    [actionSheet showInView:self.view];
}

-(IBAction)selectLocations:(UIButton *)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:NSLocalizedString(@"Select a Coco Bongo location",nil)
                                                             delegate:self
                                                    cancelButtonTitle:NSLocalizedString(@"Cancel",nil)
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:NSLocalizedString(@"Coco Bongo Cancun",nil), NSLocalizedString(@"Coco Bongo Playa del Carmen",nil), NSLocalizedString(@"Coco Bongo Punta Cana",nil), nil];
    
    actionSheet.tag = 1200;
    [actionSheet showInView:self.view];
    
}
-(void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(actionSheet.tag == 1100){
        [ToolbarMenuController action:buttonIndex atView:self];

    }
    else if (actionSheet.tag == 1200){
        switch (buttonIndex) {
            case 0:{
                MKCoordinateRegion reg = MKCoordinateRegionMakeWithDistance(self.coco_cancun.coordinate, 3000, 3000);
                [self.mapView setRegion:[self.mapView regionThatFits:reg] animated:YES];
                break;
            }
            case 1:{
                MKCoordinateRegion reg = MKCoordinateRegionMakeWithDistance(self.coco_playa.coordinate, 3000, 3000);
                [self.mapView setRegion:[self.mapView regionThatFits:reg] animated:YES];
                break;
            }
            case 2:{
                MKCoordinateRegion reg = MKCoordinateRegionMakeWithDistance(self.coco_puntacana.coordinate, 3000, 3000);
                [self.mapView setRegion:[self.mapView regionThatFits:reg] animated:YES];
                break;
            }
            default:
                break;
        }
    
    }

  //  NSLog(@"%i",buttonIndex);
}

-(void) createToolbar{
    UIImage *homeImg = [UIImage imageNamed:@"home-icon"];
    UIImage *markerImg = [UIImage imageNamed:@"map-ubication"];
    UIImage *moreImg = [UIImage imageNamed:@"more-icon"];
 
    UIBarButtonItem *goHome = [[UIBarButtonItem alloc] initWithImage:homeImg landscapeImagePhone:homeImg style:UIBarButtonItemStylePlain target:self action:@selector(goToMainMenu:)];
    UIBarButtonItem *mapItem = [[UIBarButtonItem alloc] initWithImage:markerImg landscapeImagePhone:markerImg style:UIBarButtonItemStylePlain target:self action:@selector(selectLocations:)];
    UIBarButtonItem *seeMore = [[UIBarButtonItem alloc] initWithImage:moreImg landscapeImagePhone:moreImg style:UIBarButtonItemStylePlain target:self action:@selector(openNavMenu:)];
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    NSArray *buttonItems = [NSArray arrayWithObjects: goHome, spacer,mapItem,spacer, seeMore, nil];
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

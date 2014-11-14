//
//  MapViewController.m
//  CocoBongoApp
//
//  Created by Alberto Enriquez on 13/11/14.
//  Copyright (c) 2014 Alberto Enriquez. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.coco_cancun = [[MKPointAnnotation alloc] init];
    self.coco_cancun.coordinate = CLLocationCoordinate2DMake(21.132893,-86.747208);
    self.coco_cancun.title = @"Coco Bongo Cancun";
    self.coco_cancun.subtitle =@"Kukulcan Boulevard Km 9.5 Forum Shopping Mall, Hotel Zone Cancun Q.Roo, Mexico";
    [self.mapView addAnnotation:self.coco_cancun];
    
    self.coco_playa = [[MKPointAnnotation alloc] init];
    self.coco_playa.coordinate = CLLocationCoordinate2DMake(20.62811903364482,-87.07241714000702);
    self.coco_playa.title = @"Coco Bongo Playa del Carmen";
    self.coco_playa.subtitle =@"Avenue 10 and street 12, Playa del Carmen Q.Roo, México";
    [self.mapView addAnnotation:self.coco_playa];
    
    self.coco_puntacana = [[MKPointAnnotation alloc] init];
    self.coco_puntacana.coordinate = CLLocationCoordinate2DMake(18.638309468634958,-68.3990654157008);
    self.coco_puntacana.title = @"Coco Bongo Punta Cana";
    self.coco_puntacana.subtitle =@"Downtown Punta Cana Shopping Mall, Barcelo Road, corner el Boulevard, Crossing Coco Loco Bávaro, Punta Cana Dominican Republic";
    [self.mapView addAnnotation:self.coco_puntacana];
    [self createToolbar];
    
    MKCoordinateRegion initialRegion = MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(20,-78), 2500000, 2500000);
    [self.mapView setRegion:[self.mapView regionThatFits:initialRegion] animated:YES];
    
    // Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)goToMainMenu:(UIButton *)sender {
    MapViewController *View = [self.storyboard instantiateViewControllerWithIdentifier:@"mainMenuViewController"];
    [self.navigationController pushViewController:View animated:YES];
}
-(IBAction)selectLocations:(UIButton *)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Select a Coco Bongo location"
                                                             delegate:self
                                                    cancelButtonTitle:@"Cancel"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"Coco Bongo Cancun", @"Coco Bongo Playa del Carmen", @"Coco Bongo Punta Cana", nil];
    
    [actionSheet showInView:self.view];
}
-(void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
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
    NSLog(@"%i",buttonIndex);
}

-(void) createToolbar{
    UIImage *homeImg = [UIImage imageNamed:@"home-icon"];
    UIImage *markerImg = [UIImage imageNamed:@"map-ubication"];
    UIImage *moreImg = [UIImage imageNamed:@"more-icon"];
 
    UIBarButtonItem *goHome = [[UIBarButtonItem alloc] initWithImage:homeImg landscapeImagePhone:homeImg style:UIBarButtonItemStylePlain target:self action:@selector(goToMainMenu:)];
    UIBarButtonItem *mapItem = [[UIBarButtonItem alloc] initWithImage:markerImg landscapeImagePhone:markerImg style:UIBarButtonItemStylePlain target:self action:@selector(selectLocations:)];
    UIBarButtonItem *seeMore = [[UIBarButtonItem alloc] initWithImage:moreImg landscapeImagePhone:moreImg style:UIBarButtonItemStylePlain target:self action:@selector(goToDifficultyExplanation:)];
    
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

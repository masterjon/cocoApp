//
//  MapViewController.h
//  CocoBongoApp
//
//  Created by Alberto Enriquez on 13/11/14.
//  Copyright (c) 2014 Alberto Enriquez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController<MKMapViewDelegate,UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
@property (strong, nonatomic) MKPointAnnotation *coco_cancun;
@property (strong,nonatomic) MKPointAnnotation *coco_playa;
@property (strong,nonatomic) MKPointAnnotation *coco_puntacana;

@end

//
//  SoundsViewController.h
//  CocoBongoApp
//
//  Created by Alberto Enriquez on 06/11/14.
//  Copyright (c) 2014 Alberto Enriquez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
@interface SoundsViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate, UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *soundsCollection;
@property (strong,nonatomic) NSMutableArray *soundsItems;
- (void)playSystemSound;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;

@end

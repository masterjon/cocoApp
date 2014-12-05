//
//  WallpapersViewController.h
//  CocoBongoApp
//
//  Created by Alberto Enriquez on 03/11/14.
//  Copyright (c) 2014 Alberto Enriquez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WallpapersViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate, UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *wallpapersCollection;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
@property (strong,nonatomic) NSMutableArray *wallpaperItems;
@end

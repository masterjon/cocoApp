//
//  ViewController.h
//  CocoBongoApp
//
//  Created by Alberto Enriquez on 17/10/14.
//  Copyright (c) 2014 Alberto Enriquez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate, UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *menuCollectionView;
@property (strong,nonatomic) NSMutableArray *menuItems;


@end


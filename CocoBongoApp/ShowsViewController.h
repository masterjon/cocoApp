//
//  ShowsViewController.h
//  CocoBongoApp
//
//  Created by Alberto Enriquez on 27/10/14.
//  Copyright (c) 2014 Alberto Enriquez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowsViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate , UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *showsCollection;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
@property (strong,nonatomic) NSMutableArray *showsItems;
@end

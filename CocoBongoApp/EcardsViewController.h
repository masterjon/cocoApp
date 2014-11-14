//
//  EcardsViewController.h
//  CocoBongoApp
//
//  Created by Alberto Enriquez on 07/11/14.
//  Copyright (c) 2014 Alberto Enriquez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EcardsViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *ecardsCollection;
@property (strong,nonatomic) NSMutableArray *ecardsItems;
@end

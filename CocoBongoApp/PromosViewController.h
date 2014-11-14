//
//  PromosViewController.h
//  CocoBongoApp
//
//  Created by Alberto Enriquez on 22/10/14.
//  Copyright (c) 2014 Alberto Enriquez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PromosViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *promosCollection;

@property (strong,nonatomic) NSMutableArray *promosItems;
@end

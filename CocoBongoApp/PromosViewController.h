//
//  PromosViewController.h
//  CocoBongoApp
//
//  Created by Alberto Enriquez on 22/10/14.
//  Copyright (c) 2014 Alberto Enriquez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PromosViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate, UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *promosCollection;

@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
@property (strong,nonatomic) NSMutableArray *promosItems;
@end

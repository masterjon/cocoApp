//
//  ShowViewController.h
//  CocoBongoApp
//
//  Created by Alberto Enriquez on 29/10/14.
//  Copyright (c) 2014 Alberto Enriquez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowViewController : UIViewController<UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;

@property (weak, nonatomic) IBOutlet UIImageView *showImg;
@property (nonatomic,strong) NSString* showImage;
@property (nonatomic,strong) NSString* showTitle;
@end

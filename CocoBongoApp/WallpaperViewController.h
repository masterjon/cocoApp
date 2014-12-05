//
//  WallpaperViewController.h
//  CocoBongoApp
//
//  Created by Alberto Enriquez on 07/11/14.
//  Copyright (c) 2014 Alberto Enriquez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WallpaperViewController : UIViewController<UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *wpImageView;

@property (nonatomic,strong) NSString* wpTitle;
@property (nonatomic,strong) NSString* wpImage;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;

@end

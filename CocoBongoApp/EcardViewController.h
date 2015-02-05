//
//  EcardViewController.h
//  CocoBongoApp
//
//  Created by Alberto Enriquez on 25/11/14.
//  Copyright (c) 2014 Alberto Enriquez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EcardViewController : UIViewController<UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *ecardImg;
@property (nonatomic,strong) NSString* ecardImage;
@property (nonatomic,strong) NSString* ecardTitle;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
@property (weak, nonatomic) IBOutlet UIImageView *userImg;
@property (weak, nonatomic) IBOutlet UIImage *userImage;
@property (weak, nonatomic) IBOutlet UIImage *mergedImage;
@property (nonatomic,strong) UIBarButtonItem* shareItem;
@end

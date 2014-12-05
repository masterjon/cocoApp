//
//  MediaViewController.h
//  CocoBongoApp
//
//  Created by Alberto Enriquez on 31/10/14.
//  Copyright (c) 2014 Alberto Enriquez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MediaViewController : UIViewController<UIActionSheetDelegate>
- (IBAction)wallpaperButton:(id)sender;
- (IBAction)soundButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;


@end

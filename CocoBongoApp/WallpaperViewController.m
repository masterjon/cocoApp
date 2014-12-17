//
//  WallpaperViewController.m
//  CocoBongoApp
//
//  Created by Alberto Enriquez on 07/11/14.
//  Copyright (c) 2014 Alberto Enriquez. All rights reserved.
//

#import "WallpaperViewController.h"
#import "ToolbarMenuController.h"
@interface WallpaperViewController ()

@end

@implementation WallpaperViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"grandient_blue"]];
    UILabel *viewTitle = [[UILabel alloc] init];
    viewTitle.textColor = [UIColor whiteColor];
    viewTitle.text=self.wpTitle;
    self.navigationItem.titleView=viewTitle;
    [viewTitle sizeToFit];
    [self createToolbar];
    NSString *imgURL= self.wpImage;
    UIImage *img = [UIImage imageNamed:imgURL];
    

    [_wpImageView setImage:img];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)goToMainMenu:(UIButton *)sender {
    [ ToolbarMenuController goMainMenu:self];
}
-(IBAction)downoadToGallery:(UIButton *)sender {
    NSString *imgURL= self.wpImage;
    UIImage *img = [UIImage imageNamed:imgURL];
    
    UIImageWriteToSavedPhotosAlbum(img,self,@selector(thisImage:hasBeenSavedInPhotoAlbumWithError:usingContextInfo:),NULL);
}

-(IBAction)shareAction:(UIButton *)sender {
    NSString *shareText= NSLocalizedString(@"Add some #CocoBongoStyle to your smartphone with these wallpapers! Download the app http://bit.ly/CocoBongoApp",nil);
    NSString *imgURL= self.wpImage;
    UIImage *img = [UIImage imageNamed:imgURL];
    NSArray *items2Share= @[shareText,img];
    UIActivityViewController *activityViewC = [[UIActivityViewController alloc] initWithActivityItems:items2Share applicationActivities:nil];
    activityViewC.excludedActivityTypes = @[];
    [self presentViewController:activityViewC animated:YES completion:nil];
}
- (IBAction)openNavMenu:(UIButton *)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:NSLocalizedString(@"Select",nil)
                                  delegate:self
                                  cancelButtonTitle:NSLocalizedString(@"Cancel",nil)
                                  destructiveButtonTitle:nil
                                  otherButtonTitles:nil
                                  ];
    NSArray *menuItems = [[NSArray alloc] init];
    menuItems = [ToolbarMenuController getMenuItems];
    for (NSString *title in menuItems) {
        [actionSheet addButtonWithTitle:title];
    }
    [actionSheet showInView:self.view];
    
}
-(void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    [ToolbarMenuController action:buttonIndex atView:self];
   // NSLog(@"%i",buttonIndex);
}
- (void)thisImage:(UIImage *)image hasBeenSavedInPhotoAlbumWithError:(NSError *)error usingContextInfo:(void*)ctxInfo {
    NSString *alertTitle = @"";
    NSString *alertMessage = @"";
    if (error) {
        alertTitle = NSLocalizedString(@"Error",nil);
        alertMessage = NSLocalizedString(@"There was an error saving the image",nil);
    } else {
        alertTitle = NSLocalizedString(@"Success",nil);
        alertMessage = NSLocalizedString(@"Image Saved to Gallery",nil);
    }
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:alertTitle message:alertMessage delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [message show];
}
-(void) createToolbar{
    UIImage *homeImg = [UIImage imageNamed:@"home-icon"];
    UIImage *downloadImg = [UIImage imageNamed:@"download-icon"];
    UIImage *moreImg = [UIImage imageNamed:@"more-icon"];
    UIBarButtonItem *goHome = [[UIBarButtonItem alloc] initWithImage:homeImg landscapeImagePhone:downloadImg style:UIBarButtonItemStylePlain target:self action:@selector(goToMainMenu:)];
    UIBarButtonItem *downloadItem = [[UIBarButtonItem alloc] initWithImage:downloadImg landscapeImagePhone:downloadImg style:UIBarButtonItemStylePlain target:self action:@selector(downoadToGallery:)];
    UIBarButtonItem *shareItem = [[UIBarButtonItem alloc]
                                  initWithBarButtonSystemItem:UIBarButtonSystemItemAction
                                  target:self
                                  action:@selector(shareAction:)];
    UIBarButtonItem *seeMore = [[UIBarButtonItem alloc] initWithImage:moreImg landscapeImagePhone:downloadImg style:UIBarButtonItemStylePlain target:self action:@selector(openNavMenu:)];

    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    NSArray *buttonItems = [NSArray arrayWithObjects: goHome, spacer, downloadItem, spacer,shareItem,spacer, seeMore, nil];
    [_toolbar setItems:buttonItems];
}














/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

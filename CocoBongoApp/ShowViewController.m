//
//  ShowViewController.m
//  CocoBongoApp
//
//  Created by Alberto Enriquez on 29/10/14.
//  Copyright (c) 2014 Alberto Enriquez. All rights reserved.
//

#import "ShowViewController.h"
#import "ToolbarMenuController.h"
@interface ShowViewController ()

@end

@implementation ShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"grandient_blue"]];
    UILabel *viewTitle = [[UILabel alloc] init];
    viewTitle.textColor = [UIColor whiteColor];
    viewTitle.text=self.showTitle;
    self.navigationItem.titleView=viewTitle;
    [viewTitle sizeToFit];
    [self createToolbar];
    

    NSString *imgURL = self.showImage;
    UIImage *Img = [UIImage imageNamed:imgURL];
    [_showImg setImage:Img];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(IBAction)downoadToGallery:(UIButton *)sender {
    NSString *imgURL= self.showImage;
    UIImage *img = [UIImage imageNamed:imgURL];
    
    UIImageWriteToSavedPhotosAlbum(img,self,@selector(thisImage:hasBeenSavedInPhotoAlbumWithError:usingContextInfo:),NULL);
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
-(IBAction)shareAction:(UIButton *)sender {
    NSString *shareText= NSLocalizedString(@"Download the Coco Bongo app and discover the different shows! http://bit.ly/CocoBongoiOS",nil);
    NSString *imgURL= self.showImage;
    UIImage *img = [UIImage imageNamed:imgURL];
    NSArray *items2Share= @[shareText,img];
    UIActivityViewController *activityViewC = [[UIActivityViewController alloc] initWithActivityItems:items2Share applicationActivities:nil];
    activityViewC.excludedActivityTypes = @[];
    [self presentViewController:activityViewC animated:YES completion:nil];
}
- (IBAction)goToMainMenu:(UIButton *)sender {
    [ ToolbarMenuController goMainMenu:self];
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
}
-(void) createToolbar{
    UIImage *homeImg = [UIImage imageNamed:@"home-icon"];
    UIImage *downloadImg = [UIImage imageNamed:@"download-icon"];
    UIImage *moreImg = [UIImage imageNamed:@"more-icon"];
    UIBarButtonItem *goHome = [[UIBarButtonItem alloc] initWithImage:homeImg landscapeImagePhone:homeImg style:UIBarButtonItemStylePlain target:self action:@selector(goToMainMenu:)];
    UIBarButtonItem *downloadItem = [[UIBarButtonItem alloc] initWithImage:downloadImg landscapeImagePhone:downloadImg style:UIBarButtonItemStylePlain target:self action:@selector(downoadToGallery:)];
    UIBarButtonItem *shareItem = [[UIBarButtonItem alloc]
                                  initWithBarButtonSystemItem:UIBarButtonSystemItemAction
                                  target:self
                                  action:@selector(shareAction:)];

    UIBarButtonItem *seeMore = [[UIBarButtonItem alloc] initWithImage:moreImg landscapeImagePhone:moreImg style:UIBarButtonItemStylePlain target:self action:@selector(openNavMenu:)];
    
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    NSArray *buttonItems = [NSArray arrayWithObjects: goHome, spacer, downloadItem, spacer,shareItem,spacer, seeMore, nil];
    [_toolbar setItems:buttonItems];
}

@end

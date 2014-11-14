//
//  WallpaperViewController.m
//  CocoBongoApp
//
//  Created by Alberto Enriquez on 07/11/14.
//  Copyright (c) 2014 Alberto Enriquez. All rights reserved.
//

#import "WallpaperViewController.h"

@interface WallpaperViewController ()

@end

@implementation WallpaperViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"grandient_blue"]];
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
     WallpaperViewController *View = [self.storyboard instantiateViewControllerWithIdentifier:@"mainMenuViewController"];
    [self.navigationController pushViewController:View animated:YES];
}
-(IBAction)downoadToGallery:(UIButton *)sender {
    NSString *imgURL= self.wpImage;
    UIImage *img = [UIImage imageNamed:imgURL];
    
    UIImageWriteToSavedPhotosAlbum(img,self,@selector(thisImage:hasBeenSavedInPhotoAlbumWithError:usingContextInfo:),NULL);
}

-(IBAction)shareAction:(UIButton *)sender {
    NSString *shareText= @"Add some #CocoBongoStyle to your smartphone with these wallpapers! Download the app http://bit.ly/CocoBongoApp";
    NSString *imgURL= self.wpImage;
    UIImage *img = [UIImage imageNamed:imgURL];
    NSArray *items2Share= @[shareText,img];
    UIActivityViewController *activityViewC = [[UIActivityViewController alloc] initWithActivityItems:items2Share applicationActivities:nil];
    activityViewC.excludedActivityTypes = @[];
    [self presentViewController:activityViewC animated:YES completion:nil];
}

- (void)thisImage:(UIImage *)image hasBeenSavedInPhotoAlbumWithError:(NSError *)error usingContextInfo:(void*)ctxInfo {
    NSString *alertTitle = @"";
    NSString *alertMessage = @"";
    if (error) {
        alertTitle = @"Error";
        alertMessage = @"There was an error saving the image";
    } else {
        alertTitle = @"Success";
        alertMessage = @"Image Saved to Gallery";
    }
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:alertTitle message:alertMessage delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [message show];
}
-(void) createToolbar{
    UIImage *homeImg = [UIImage imageNamed:@"home-icon"];
    UIImage *downloadImg = [UIImage imageNamed:@"download-icon"];
    UIImage *shareImg = [UIImage imageNamed:@"share-icon"];
    UIImage *moreImg = [UIImage imageNamed:@"more-icon"];
    UIBarButtonItem *goHome = [[UIBarButtonItem alloc] initWithImage:homeImg landscapeImagePhone:downloadImg style:UIBarButtonItemStylePlain target:self action:@selector(goToMainMenu:)];
    UIBarButtonItem *downloadItem = [[UIBarButtonItem alloc] initWithImage:downloadImg landscapeImagePhone:downloadImg style:UIBarButtonItemStylePlain target:self action:@selector(downoadToGallery:)];
    UIBarButtonItem *shareItem = [[UIBarButtonItem alloc]
                                  initWithBarButtonSystemItem:UIBarButtonSystemItemAction
                                  target:self
                                  action:@selector(shareAction:)];
    UIBarButtonItem *seeMore = [[UIBarButtonItem alloc] initWithImage:moreImg landscapeImagePhone:downloadImg style:UIBarButtonItemStylePlain target:self action:@selector(goToDifficultyExplanation:)];

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

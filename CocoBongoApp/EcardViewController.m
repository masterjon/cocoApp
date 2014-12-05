//
//  EcardViewController.m
//  CocoBongoApp
//
//  Created by Alberto Enriquez on 25/11/14.
//  Copyright (c) 2014 Alberto Enriquez. All rights reserved.
//

#import "EcardViewController.h"
#import "ToolbarMenuController.h"
@interface EcardViewController ()

@end

@implementation EcardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"grandient_blue"]];
    
    UILabel *viewTitle = [[UILabel alloc] init];
    viewTitle.textColor = [UIColor whiteColor];
    viewTitle.text=self.ecardTitle;
    self.navigationItem.titleView=viewTitle;
    [viewTitle sizeToFit];
    
    [self createToolbar];
    NSString *imgURL = self.ecardImage;
    UIImage *img = [UIImage imageNamed:imgURL];
    [_ecardImg setImage:img];
    [self chooseImageInput];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) chooseImageInput{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:NSLocalizedString(@"Select image from:",nil)
                                  delegate:self
                                  cancelButtonTitle:NSLocalizedString(@"Cancel",nil)
                                  destructiveButtonTitle:nil
                                  otherButtonTitles:NSLocalizedString(@"Camera",nil),NSLocalizedString(@"Gallery",nil),nil
                                  ];
    actionSheet.tag = 1100;
    [actionSheet showInView:self.view];
}

-(void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(actionSheet.tag == 1100){
        switch (buttonIndex) {
            case 0:{
                [self takePhoto];
                NSLog(@"%@%d",@"button:index:",buttonIndex);
                break;
            }
            case 1:{
                [self selectPhoto];
                NSLog(@"%@%d",@"button:index:",buttonIndex);

                break;
            }
            default:
                break;
        }
    }
    else if (actionSheet.tag ==  1200){
        [ToolbarMenuController action:buttonIndex atView:self];
    }
}

- (void)takePhoto{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    //picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:picker animated:YES completion:NULL];

}
- (void)selectPhoto{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    //picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:NULL];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    self.userImage = info[UIImagePickerControllerOriginalImage];
    [_userImg setImage:self.userImage];
    [picker dismissViewControllerAnimated:YES completion:NULL];
}
- (UIImage *)mergeImages{
  
    int width = 299;
    int height = 404;
    NSString *imgURL= self.ecardImage;
    UIImage *bottomImage = self.userImage; //background image
    UIImage *image  = [UIImage imageNamed:imgURL]; //foreground image
    
    CGSize newSize = CGSizeMake(width, height);
    UIGraphicsBeginImageContext( newSize );
    
    // Use existing opacity as is
    [bottomImage drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    
    // Apply supplied opacity if applicable
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height) blendMode:kCGBlendModeNormal alpha:1];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
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



- (IBAction)goToMainMenu:(UIButton *)sender {
    [ ToolbarMenuController goMainMenu:self];
}
-(IBAction)downoadToGallery:(UIButton *)sender {
    UIImage *mergedImage = [self mergeImages];
    UIImageWriteToSavedPhotosAlbum(mergedImage,self,@selector(thisImage:hasBeenSavedInPhotoAlbumWithError:usingContextInfo:),NULL);

}

-(IBAction)shareAction:(UIButton *)sender {
    NSString *shareText= NSLocalizedString(@"Download the Coco Bongo app and make your e-card #CocoBongoStyle! http://bit.ly/CocoBongoApp",nil);
    UIImage *mergedImage = [self mergeImages];
    NSArray *items2Share= @[shareText,mergedImage];
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
    actionSheet.tag = 1200;
    [actionSheet showInView:self.view];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

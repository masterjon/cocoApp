//
//  EcardsViewController.m
//  CocoBongoApp
//
//  Created by Alberto Enriquez on 07/11/14.
//  Copyright (c) 2014 Alberto Enriquez. All rights reserved.
//

#import "EcardsViewController.h"
#import "ToolbarMenuController.h"
#import "EcardViewController.h"
@interface EcardsViewController ()

@end

@implementation EcardsViewController
//-(BOOL)prefersStatusBarHidden{
//    return YES;
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"grandient_blue"]];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};

    [self createToolbar];
    
    self.ecardsItems = [[NSMutableArray alloc] init];
    NSArray *ecardsMenu  = @[
                   @{@"title":  @"Gaga & Michael",
                     @"image":@"ecard_thumb_1",
                     @"imageDetail":@"marco_ecard_1"
                     },
                   @{@"title":@"Gaga",
                     @"image":@"ecard_thumb_2",
                     @"imageDetail":@"marco_ecard_2"
                     },
                   @{@"title":@"Elvis",
                     @"image":@"ecard_thumb_3",
                     @"imageDetail":@"marco_ecard_3"
                     },
                   @{@"title":@"Michael",
                     @"image":@"ecard_thumb_4",
                     @"imageDetail":@"marco_ecard_4"
                     },
                   @{@"title":@"Beetlejuice & The Mask",
                     @"image":@"ecard_thumb_5",
                     @"imageDetail":@"marco_ecard_5"
                     },
                   @{@"title":@"Beyoncé",
                     @"image":@"ecard_thumb_6",
                     @"imageDetail":@"marco_ecard_6"
                     },
                   @{@"title":@"Madonna",
                     @"image":@"ecard_thumb_7",
                     @"imageDetail":@"marco_ecard_7"
                     },
                   @{@"title":@"Beetlejuice",
                     @"image":@"ecard_thumb_8",
                     @"imageDetail":@"marco_ecard_8"
                     },
                   @{@"title":@"The Mask",
                     @"image":@"ecard_thumb_9",
                     @"imageDetail":@"marco_ecard_9"
                     },
                   ];
    for (NSDictionary *dataDict  in ecardsMenu){
        [self.ecardsItems addObject:dataDict];
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}
-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.ecardsItems count];
}
-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ecardCell" forIndexPath:indexPath];
    UIImageView *ecardImage = (UIImageView *) [cell viewWithTag:10];
    UILabel *ecardLabel = (UILabel *) [cell viewWithTag:11];
    
    if ([self.ecardsItems count] > 0) {
        NSDictionary *cellDictionary = [ self.ecardsItems objectAtIndex:indexPath.row];
        NSString *label = [cellDictionary objectForKey:@"title"];
        NSString *image = [cellDictionary objectForKey:@"image"];
        ecardImage.image = [UIImage imageNamed:image];
        ecardLabel.text = label;
        
    }
    
    return cell;
    
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
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    EcardViewController *View = [[EcardViewController alloc] init];
    View = [ segue destinationViewController];
    NSArray *arrayOfIndexPaths = [self.ecardsCollection indexPathsForSelectedItems ];
    NSIndexPath *path = [arrayOfIndexPaths firstObject];
    NSDictionary *ecardItemDictionary = [self.ecardsItems objectAtIndex:path.row];
    View.ecardTitle = ecardItemDictionary[@"title"];
    View.ecardImage = ecardItemDictionary[@"imageDetail"];
    
}
-(void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    [ToolbarMenuController action:buttonIndex atView:self];
  //  NSLog(@"%i",buttonIndex);
}

-(void) createToolbar{
    UIImage *homeImg = [UIImage imageNamed:@"home-icon"];
    UIImage *moreImg = [UIImage imageNamed:@"more-icon"];
    UIBarButtonItem *goHome = [[UIBarButtonItem alloc] initWithImage:homeImg landscapeImagePhone:homeImg style:UIBarButtonItemStylePlain target:self action:@selector(goToMainMenu:)];
    
    UIBarButtonItem *seeMore = [[UIBarButtonItem alloc] initWithImage:moreImg landscapeImagePhone:moreImg style:UIBarButtonItemStylePlain target:self action:@selector(openNavMenu:)];
    
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    NSArray *buttonItems = [NSArray arrayWithObjects: goHome, spacer,spacer,spacer, seeMore, nil];
    [_toolbar setItems:buttonItems];
}
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    // Adjust cell size for orientation
    int screenSize = (int) screenBounds.size.width;
    //Size of cells for ipad
    if(screenSize == 768 || screenSize == 1024){
        return CGSizeMake(212.f, 300.f);
    }
    
    //Size of cells for iphones
    return CGSizeMake(135.f,184.f);
    
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

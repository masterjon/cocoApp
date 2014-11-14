//
//  WallpapersViewController.m
//  CocoBongoApp
//
//  Created by Alberto Enriquez on 03/11/14.
//  Copyright (c) 2014 Alberto Enriquez. All rights reserved.
//

#import "WallpapersViewController.h"
#import "WallpaperViewController.h"

@interface WallpapersViewController ()

@end

@implementation WallpapersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"grandient_blue"]];
    self.wallpaperItems = [[NSMutableArray alloc] init ];
    NSArray *wallpapersMenu =  @[
                                 @{
                                     @"title":@"Wallpaper 1",
                                     @"image":@"wp_thumb_1",
                                     @"imageDetail":@"wallpaper_540x480_1"
                                     
                                     },
                                 @{
                                     @"title":@"Wallpaper 2",
                                     @"image":@"wp_thumb_2",
                                     @"imageDetail":@"wallpaper_540x480_2"
                                     
                                     },
                                 @{
                                     @"title":@"Wallpaper 3",
                                     @"image":@"wp_thumb_3",
                                     @"imageDetail":@"wallpaper_540x480_3"
                                     
                                     },
                                 @{
                                     @"title":@"Wallpaper 4",
                                     @"image":@"wp_thumb_4",
                                     @"imageDetail":@"wallpaper_540x480_4"
                                     
                                     },
                                 @{
                                     @"title":@"Wallpaper 5",
                                     @"image":@"wp_thumb_5",
                                     @"imageDetail":@"wallpaper_540x480_5"
                                     
                                     },
                                 @{
                                     @"title":@"Wallpaper 6",
                                     @"image":@"wp_thumb_6",
                                     @"imageDetail":@"wallpaper_540x480_6"
                                     
                                     },
                                 @{
                                     @"title":@"Wallpaper 7",
                                     @"image":@"wp_thumb_7",
                                     @"imageDetail":@"wallpaper_540x480_7"
                                     
                                     },
                                 @{
                                     @"title":@"Wallpaper 8",
                                     @"image":@"wp_thumb_8",
                                     @"imageDetail":@"wallpaper_540x480_8"
                                     
                                     },
                                 @{
                                     @"title":@"Wallpaper 9",
                                     @"image":@"wp_thumb_9",
                                     @"imageDetail":@"wallpaper_540x480_9"
                                     
                                     },
                                 ];
    for(NSArray *dataDictionary in wallpapersMenu){
        [self.wallpaperItems addObject:dataDictionary];
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [ collectionView dequeueReusableCellWithReuseIdentifier:@"wallpaperCell" forIndexPath:indexPath];
    UIImageView *wpImage = (UIImageView *) [cell viewWithTag:10];
    UILabel *wpLabel = (UILabel *) [cell viewWithTag:11];
    
    if ([self.wallpaperItems count] > 0){
        NSDictionary *cellDictionary = [self.wallpaperItems objectAtIndex:indexPath.row];
        NSString *label = [cellDictionary objectForKey:@"title"];
        NSString *image = [cellDictionary objectForKey:@"image"];
        wpLabel.text = [NSString stringWithFormat:@"%@",label];
        wpImage.image = [UIImage imageNamed:image];
    }
    return cell;
    
}

-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
       return [self.wallpaperItems count];
}

-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
   NSDictionary *cellDictionary = [self.wallpaperItems objectAtIndex:indexPath.row];
    WallpaperViewController *View = [self.storyboard instantiateViewControllerWithIdentifier:@"wallpaperViewController"];
    View.wpTitle = cellDictionary[@"title"];
    View.wpImage = cellDictionary[@"imageDetail"];
    //View.showTitle = showItemDictionary[@"title"];
    //View.showImage = showItemDictionary[@"imageDetail"];
    
    [self.navigationController pushViewController:View animated:YES];

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

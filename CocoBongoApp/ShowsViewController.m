//
//  ShowsViewController.m
//  CocoBongoApp
//
//  Created by Alberto Enriquez on 27/10/14.
//  Copyright (c) 2014 Alberto Enriquez. All rights reserved.
//

#import "ShowsViewController.h"
#import "ShowViewController.h"

@interface ShowsViewController ()

@end

@implementation ShowsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"grandient_blue"]];

    self.showsItems = [[NSMutableArray alloc] init];
    NSArray *menu = @[
                      @{
                          @"title":@"Queen",
                          @"image":@"show_thumb_1",
                          @"imageDetail":@"show_detail_1"

                        },
                      @{
                          @"title":@"LMFAO",
                          @"image":@"show_thumb_2",
                          @"imageDetail":@"show_detail_2"
                        },
                      @{
                          @"title":@"Moulin Rouge",
                          @"image":@"show_thumb_3",
                          @"imageDetail":@"show_detail_3"
                        },
                      @{
                          @"title":@"Follow the leader",
                          @"image":@"show_thumb_4",
                          @"imageDetail":@"show_detail_4"
                          },
                      @{
                          @"title":@"Captain America",
                          @"image":@"show_thumb_5",
                          @"imageDetail":@"show_detail_5"
                          },
                      @{
                          @"title":@"Beyoncé",
                          @"image":@"show_thumb_6",
                          @"imageDetail":@"show_detail_6"
                        },
                      @{
                          @"title":@"Samba",
                          @"image":@"show_thumb_7",
                          @"imageDetail":@"show_detail_7"
                        },
                      @{
                          @"title":@"Michael Jackson",
                          @"image":@"show_thumb_8",
                          @"imageDetail":@"show_detail_8"
                          },
                      @{
                          @"title":@"Elvis",
                          @"image":@"show_thumb_9",
                          @"imageDetail":@"show_detail_9"
                          },
                      ];

    for (NSArray *dataDictionary in menu) {
        [self.showsItems addObject: dataDictionary ];
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UICollectionViewCell *) collectionView: (UICollectionView *) collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"showCell" forIndexPath:indexPath];
    UIImageView *showImage = (UIImageView *) [cell viewWithTag:10];
    UILabel *showLabel = (UILabel *) [cell viewWithTag:11];
    
    if ([self.showsItems count] > 0){
        NSDictionary *cellDictionary = [self.showsItems objectAtIndex:indexPath.row];
        NSString *label = [cellDictionary objectForKey:@"title"];
        NSString *image = [cellDictionary objectForKey:@"image"];
        showLabel.text = [NSString stringWithFormat:@"%@",label];
        showImage.image = [UIImage imageNamed:image];
    }
    return cell;
}
-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.showsItems count];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *showItemDictionary = [self.showsItems objectAtIndex:indexPath.row];
   
    ShowViewController *View = [self.storyboard instantiateViewControllerWithIdentifier:@"showViewController"];
    View.showTitle = showItemDictionary[@"title"];
    View.showImage = showItemDictionary[@"imageDetail"];
   // WebView.url = menuItemDictionary[@"url"] ;
    [self.navigationController pushViewController:View animated:YES];

    NSLog(@"clicked on %@",indexPath);

}
@end

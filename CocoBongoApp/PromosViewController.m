//
//  PromosViewController.m
//  CocoBongoApp
//
//  Created by Alberto Enriquez on 22/10/14.
//  Copyright (c) 2014 Alberto Enriquez. All rights reserved.
//

#import "PromosViewController.h"

@interface PromosViewController ()

@end

@implementation PromosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"grandient_blue"]];
    self.promosItems = [[NSMutableArray alloc] init];
    NSArray *menu = @[
                      @{
                          @"title":@"Promo 1",
                          @"image":@"promo1"
                          },
                      @{
                          @"title":@"Promo 2",
                          @"image":@"promo2"
                          }
                      ];
    for (NSArray *dataDictionary in menu){
        [self.promosItems addObject:dataDictionary];
        //NSLog(@"%@",dataDictionary[@"image"]);
    }
    [self.promosCollection reloadData];
   
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    UICollectionViewCell *cell= [collectionView dequeueReusableCellWithReuseIdentifier:@"promoCell"  forIndexPath:indexPath];
    UIImageView *menImage = (UIImageView *) [cell viewWithTag:10];
    UILabel *label = (UILabel *) [cell viewWithTag:11];
    if([self.promosItems count] > 0){
        NSDictionary *cellDictionary = [self.promosItems objectAtIndex:indexPath.row];
        NSString *labelItem= [cellDictionary objectForKey:@"title"];
        NSString *imageItem= [cellDictionary objectForKey:@"image"];
        menImage.image = [UIImage imageNamed:imageItem];
        label.text = [NSString stringWithFormat:@"%@",labelItem];
        //NSLog(@"%@:%li",labelItem,indexPath.row);
    }
    return cell;

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.promosItems count];
}
@end

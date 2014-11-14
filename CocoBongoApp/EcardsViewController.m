//
//  EcardsViewController.m
//  CocoBongoApp
//
//  Created by Alberto Enriquez on 07/11/14.
//  Copyright (c) 2014 Alberto Enriquez. All rights reserved.
//

#import "EcardsViewController.h"

@interface EcardsViewController ()

@end

@implementation EcardsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"grandient_blue"]];
    self.ecardsItems = [[NSMutableArray alloc] init];
    NSArray *ecardsMenu  = @[
                   @{@"title":@"Gaga & Michael",
                     @"image":@"ecard_thumb_1",
                     },
                   @{@"title":@"Gaga",
                     @"image":@"ecard_thumb_2",
                     },
                   @{@"title":@"Elvis",
                     @"image":@"ecard_thumb_3",
                     },
                   @{@"title":@"Michael",
                     @"image":@"ecard_thumb_4",
                     },
                   @{@"title":@"Beetlejuice & The Mask",
                     @"image":@"ecard_thumb_5",
                     },
                   @{@"title":@"Beyoncé",
                     @"image":@"ecard_thumb_6",
                     },
                   @{@"title":@"Madonna",
                     @"image":@"ecard_thumb_7",
                     },
                   @{@"title":@"Beetlejuice",
                     @"image":@"ecard_thumb_8",
                     },
                   @{@"title":@"The Mask",
                     @"image":@"ecard_thumb_9",
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

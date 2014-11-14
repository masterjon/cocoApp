//
//  ViewController.m
//  CocoBongoApp
//
//  Created by Alberto Enriquez on 17/10/14.
//  Copyright (c) 2014 Alberto Enriquez. All rights reserved.
//

#import "ViewController.h"
#import "WebViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"grandient_blue"]];
    self.menuItems = [[NSMutableArray alloc] init];
    
    NSArray *menu = @[
                      @{
                          @"title":@"Tickets",
                          @"image":@"tickets_button",
                          @"target":@"ticketsViewController"
                       },
                      @{
                          @"title":@"Promos",
                          @"image":@"promo_button",
                          @"target":@"promosViewController",
                       },
                      @{
                          @"title":@"Boutique",
                          @"image":@"shop_button",
                          @"target":@"webViewController",
                          @"url":@"http://www.cocobongoboutique.com/store/"
                       },
                      @{
                          @"title":@"Shows",
                          @"image":@"shows_button",
                          @"target":@"showsViewController"
                       },
                      @{
                          @"title":@"Season's set",
                          @"image":@"set_button",
                          @"target":@"webViewController",
                          @"url":@"http://m.mixcloud.com/CocoBongoShow/summer-mix-2014-cocobongostyle/"
                       },
                      @{
                          @"title":@"Media",
                          @"image":@"media_button",
                          @"target":@"mediaViewController"
                       },
                      @{
                          @"title":@"Gallery",
                          @"image":@"galeria_button",
                          @"target":@"webViewController",
                          @"url":@"http://www.cocobongo.com.mx"
                       },
                      @{
                          @"title":@"E-cards",
                          @"image":@"ecards_button",
                          @"target":@"ecardsViewController"
                       },
                      @{
                          @"title":@"Loction",
                          @"image":@"location_button",
                          @"target":@"mapViewController"
                       },
                      @{
                          @"title":@"Lang",
                          @"image":@"idioma_button",
                          @"target":@"langViewController"
                       }
                    ];
    for (NSArray *dataDictionary in menu){
        [self.menuItems addObject:dataDictionary];
        //NSLog(@"%@",dataDictionary[@"image"]);
    }
    [self.menuCollectionView reloadData];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.menuItems count];

}
-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell= [collectionView dequeueReusableCellWithReuseIdentifier:@"menuCell"  forIndexPath:indexPath];
    UIImageView *menuImage = (UIImageView *) [cell viewWithTag:10];
    UILabel *label = (UILabel *) [cell viewWithTag:11];
    
    if([self.menuItems count] > 0){
        NSDictionary *cellDictionary = [self.menuItems objectAtIndex:indexPath.row];
        NSString *labelItem= [cellDictionary objectForKey:@"title"];
        NSString *imageItem= [cellDictionary objectForKey:@"image"];
        menuImage.image = [UIImage imageNamed:imageItem];
        label.text = [NSString stringWithFormat:@"%@",labelItem];
        //NSLog(@"%@:%li",labelItem,indexPath.row);
    }
    return cell;
}
-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *menuItemDictionary = [self.menuItems objectAtIndex:indexPath.row];
    
#warning cambiar x switch
   
    if ([menuItemDictionary[@"target"]  isEqual: @"webViewController"]) {
        WebViewController *WebView = [self.storyboard instantiateViewControllerWithIdentifier:menuItemDictionary[@"target"]];
        
        WebView.url = menuItemDictionary[@"url"] ;
        [self.navigationController pushViewController:WebView animated:YES];
    }
    else{
        ViewController *viewC = [self.storyboard instantiateViewControllerWithIdentifier:menuItemDictionary[@"target"]];
        [self.navigationController pushViewController:viewC animated:YES];
    
    }
   
    

}


@end

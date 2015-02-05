//
//  ViewController.m
//  CocoBongoApp
//
//  Created by Alberto Enriquez on 17/10/14.
//  Copyright (c) 2014 Alberto Enriquez. All rights reserved.
//

#import "ViewController.h"
#import "WebViewController.h"
#import "ToolbarMenuController.h"
@interface ViewController ()

@end

@implementation ViewController
//-(BOOL)prefersStatusBarHidden{
//    return YES;
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"grandient_blue"]];
    self.navigationItem.title = @"Coco Bongo";
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    self.menuItems = [[NSMutableArray alloc] init];
    [[UINavigationBar appearance] setBarTintColor:[UIColor yellowColor]];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"textura_roja_big"]forBarMetrics:UIBarMetricsDefault];
    
    NSArray *menu = @[
                      @{
                          @"title":NSLocalizedString(@"Tickets",nil),
                          @"image":@"tickets-button",
                          @"target":@"ticketsViewController"
                       },
                      @{
                          @"title":NSLocalizedString(@"Promos",nil),
                          @"image":@"promo-button",
                          @"target":@"promosViewController",
                       },
                      @{
                          @"title":NSLocalizedString(@"Boutique",nil),
                          @"image":@"shop-button",
                          @"target":@"webViewController",
                          @"url":@"http://www.cocobongoboutique.com/store/"
                       },
                      @{
                          @"title":NSLocalizedString(@"Shows",nil),
                          @"image":@"shows-button",
                          @"target":@"showsViewController"
                       },
                      @{
                          @"title":NSLocalizedString(@"Season's set",nil),
                          @"image":@"set-button",
                          @"target":@"webViewController",
                          @"url":@"http://m.mixcloud.com/CocoBongoShow/summer-mix-2014-cocobongostyle/"
                       },
                      @{
                          @"title":NSLocalizedString(@"Media",nil),
                          @"image":@"media-button",
                          @"target":@"mediaViewController"
                       },
                      @{
                          @"title":NSLocalizedString(@"Virtual Tour",nil),
                          @"image":@"tour-virtual",
                          @"target":@"virtualTourViewController",
                        },
                      //  @{
                      //    @"title":@"Gallery",
                      //    @"image":@"galeria_button",
                      //    @"target":@"webViewController",
                      //    @"url":@"http://www.cocobongo.com.mx"
                      //  },
                      @{
                          @"title":NSLocalizedString(@"E-cards",nil),
                          @"image":@"ecards-button",
                          @"target":@"ecardsViewController"
                       },
                      @{
                          @"title":NSLocalizedString(@"Location",nil),
                          @"image":@"location-button",
                          @"target":@"mapViewController"
                       },
                      @{
                          @"title":NSLocalizedString(@"Lang",nil),
                          @"image":@"idioma-button",
                          @"target":@"langViewController"
                       }
                    ];
    for (NSArray *dataDictionary in menu){
        [self.menuItems addObject:dataDictionary];
        //NSLog(@"%@",dataDictionary[@"image"]);
    }
    [self.menuCollectionView reloadData];
    //[self createToolbar];
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
    
   
    if ([menuItemDictionary[@"target"]  isEqual: @"webViewController"]) {
        WebViewController *WebView = [self.storyboard instantiateViewControllerWithIdentifier:menuItemDictionary[@"target"]];
        
        WebView.url = menuItemDictionary[@"url"] ;
        WebView.viewTitle = menuItemDictionary[@"title"];
        [self.navigationController pushViewController:WebView animated:YES];
    }
    else{
        ViewController *viewC = [self.storyboard instantiateViewControllerWithIdentifier:menuItemDictionary[@"target"]];
        [self.navigationController pushViewController:viewC animated:YES];
    
    }
   
    

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
   
    
    if ([segue.identifier isEqualToString:@"ticketsSegue"]) {
        [segue.destinationViewController setUrl: @"http://www.cocobongo.com.mx/tienda/index.php"];
    }
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
        return CGSizeMake(343.f, 241.f);
    }
    
    //Size of cells for iphones
    return CGSizeMake(150.f,183.f);
    
}



@end

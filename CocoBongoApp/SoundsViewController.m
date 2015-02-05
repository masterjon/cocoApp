//
//  SoundsViewController.m
//  CocoBongoApp
//
//  Created by Alberto Enriquez on 06/11/14.
//  Copyright (c) 2014 Alberto Enriquez. All rights reserved.
//

#import "SoundsViewController.h"
#import "ToolbarMenuController.h"
@import AVFoundation;

@interface SoundsViewController ()
@property (assign) SystemSoundID pewPewSound;
@property (strong, nonatomic) AVAudioPlayer *backgroundMusicPlayer;
@end

@implementation SoundsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"grandient_blue"]];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    [self createToolbar];
    self.soundsItems = [[NSMutableArray alloc] init];
    NSArray *soundsMenu = @[
                      @{
                          @"title":@"Heig Ho",
                          @"audio":@"heigh_ho",
                          },
                      @{
                          @"title":@"Just Called",
                          @"audio":@"just_called",
                          },
                      @{
                          @"title":@"Lion",
                          @"audio":@"leon",
                          
                          },
                      @{
                          @"title":@"Hammer",
                          @"audio":@"martillazo",
                          },
                      @{
                          @"title":@"Oh Yeah",
                          @"audio":@"oh_yeah",
                          },
                      @{
                          @"title":@"Birds",
                          @"audio":@"pajaritos",
                          },
                      @{
                          @"title":@"Party",
                          @"audio":@"party_people",
                          },
                      @{
                          @"title":@"Horn",
                          @"audio":@"sirena",
                          },
                      @{
                          @"title":@"Piano 1",
                          @"audio":@"piano_estadio_1",
                          },
                      @{
                          @"title":@"Piano 2",
                          @"audio":@"piano_estadio_2",
                          },
                      @{
                          @"title":@"Piano 3",
                          @"audio":@"piano_estadio_3",
                          },
                      @{
                          @"title":@"Piano 4",
                          @"audio":@"piano_estadio_4",
                          }
                      ];
    // Do any additional setup after loading the view.
    for (NSArray *dataDict in soundsMenu){
        [self.soundsItems addObject:dataDict];
    }
 
}
- (void)playSystemSound {
    AudioServicesPlaySystemSound(self.pewPewSound);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"soundCell" forIndexPath:indexPath];
    UILabel *soundLabel = (UILabel *) [cell viewWithTag:11];
    if ([self.soundsItems count] > 0){
        NSDictionary *cellDictionary = [self.soundsItems objectAtIndex:indexPath.row];
        NSString *label = [cellDictionary objectForKey:@"title"];
        soundLabel.text = label;
    }
    return cell;
    
}
-(NSInteger ) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.soundsItems count];
}
-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *cellDictionary = [self.soundsItems objectAtIndex:indexPath.row];
    
    NSString *pewPewPath = [[NSBundle mainBundle] pathForResource:cellDictionary[@"audio"] ofType:@"mp3"];
    NSURL *pewPewURL = [NSURL fileURLWithPath:pewPewPath];
    //AudioServicesCreateSystemSoundID((__bridge CFURLRef)pewPewURL, &_pewPewSound);
    
    NSError *error;
    self.backgroundMusicPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:pewPewURL error:&error];
    [self.backgroundMusicPlayer prepareToPlay];
    [self.backgroundMusicPlayer play];
    NSLog(@"Path = %@ --",pewPewURL);
    //[self playSystemSound];
    

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
   // NSLog(@"%i",buttonIndex);
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
        return CGSizeMake(212.f, 208.f);
    }
    
    //Size of cells for iphones
    return CGSizeMake(89.f,181.f);
    
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

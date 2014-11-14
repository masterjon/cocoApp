//
//  SoundsViewController.m
//  CocoBongoApp
//
//  Created by Alberto Enriquez on 06/11/14.
//  Copyright (c) 2014 Alberto Enriquez. All rights reserved.
//

#import "SoundsViewController.h"
@import AVFoundation;

@interface SoundsViewController ()
@property (assign) SystemSoundID pewPewSound;
@property (strong, nonatomic) AVAudioPlayer *backgroundMusicPlayer;
@end

@implementation SoundsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"grandient_blue"]];
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
    NSLog(@"%i",[self.soundsItems count]);
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

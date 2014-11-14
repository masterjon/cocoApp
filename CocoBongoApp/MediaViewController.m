//
//  MediaViewController.m
//  CocoBongoApp
//
//  Created by Alberto Enriquez on 31/10/14.
//  Copyright (c) 2014 Alberto Enriquez. All rights reserved.
//

#import "MediaViewController.h"

@interface MediaViewController ()

@end

@implementation MediaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"grandient_blue"]];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



- (IBAction)wallpaperButton:(id)sender {
    MediaViewController *mediaView = [self.storyboard instantiateViewControllerWithIdentifier:@"wallpapersViewController"];
    [self.navigationController pushViewController:mediaView animated:YES];
}

- (IBAction)soundButton:(id)sender {
    MediaViewController *mediaView = [self.storyboard instantiateViewControllerWithIdentifier:@"soundsViewController"];
    [self.navigationController pushViewController:mediaView animated:YES];
}
@end

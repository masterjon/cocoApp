//
//  TicketsViewController.m
//  CocoBongoApp
//
//  Created by Alberto Enriquez on 22/10/14.
//  Copyright (c) 2014 Alberto Enriquez. All rights reserved.
//

#import "TicketsViewController.h"
#import "WebViewController.h"

@interface TicketsViewController ()

@end

@implementation TicketsViewController

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

- (IBAction)ticketButton:(id)sender {
    WebViewController *webView = [self.storyboard instantiateViewControllerWithIdentifier:@"webViewController"];
        webView.url = @"http://www.cocobongo.com.mx/tienda/index.php" ;
    [self.navigationController pushViewController:webView animated:YES];


}

- (IBAction)callButton:(id)sender {
    UIApplication *myApp = [UIApplication sharedApplication];
    NSString *theCall = @"tel:123415555551212";
    NSLog(@"making call with %@",theCall);
    [myApp openURL:[NSURL URLWithString:theCall]];
}
@end

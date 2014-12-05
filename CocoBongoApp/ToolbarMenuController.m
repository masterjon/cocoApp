//
//  ToolbarMenuController.m
//  CocoBongoApp
//
//  Created by Alberto Enriquez on 18/11/14.
//  Copyright (c) 2014 Alberto Enriquez. All rights reserved.
//

#import "ToolbarMenuController.h"
#import "WebViewController.h"
@implementation ToolbarMenuController

+(NSArray *) getMenuItems{
    NSArray *menuItems=@[NSLocalizedString(@"Tickets",nil),
                         NSLocalizedString(@"Promos",nil),
                         NSLocalizedString(@"Boutique",nil),
                         NSLocalizedString(@"Shows",nil),
                         NSLocalizedString(@"Season's Set",nil),
                         NSLocalizedString(@"Media",nil),
                         NSLocalizedString(@"Virtual Tour",nil),
                         NSLocalizedString(@"E-cards",nil),
                         NSLocalizedString(@"Location",nil),
                         NSLocalizedString(@"Lang",nil)];
    return menuItems;
}
+(void) action:(NSInteger)buttonIndex atView:(UIViewController *)currentView{
    //NSLog(@"%d",actionSheet.tag);
   

    switch (buttonIndex) {
        case 1:{
            ToolbarMenuController *View = [currentView.storyboard instantiateViewControllerWithIdentifier:@"ticketsViewController"];
            [currentView.navigationController pushViewController:View animated:YES];
            break;
        }
        case 2:{
            ToolbarMenuController *View = [currentView.storyboard instantiateViewControllerWithIdentifier:@"promosViewController"];
            [currentView.navigationController pushViewController:View animated:YES];
            break;
        }
        case 3:{
            WebViewController *View = [currentView.storyboard instantiateViewControllerWithIdentifier:@"webViewController"];
                View.url = @"http://www.cocobongoboutique.com/store/";
            [currentView.navigationController pushViewController:View animated:YES];
            break;
        }
        case 4:{
            ToolbarMenuController *View = [currentView.storyboard instantiateViewControllerWithIdentifier:@"showsViewController"];
            [currentView.navigationController pushViewController:View animated:YES];
            break;
        }
        case 5:{
            WebViewController *View = [currentView.storyboard instantiateViewControllerWithIdentifier:@"webViewController"];
            View.url = @"http://m.mixcloud.com/CocoBongoShow/summer-mix-2014-cocobongostyle/";
            [currentView.navigationController pushViewController:View animated:YES];
            break;
        }
        case 6:{
            ToolbarMenuController *View = [currentView.storyboard instantiateViewControllerWithIdentifier:@"mediaViewController"];
            [currentView.navigationController pushViewController:View animated:YES];
            break;
        }
        case 7:{
            ToolbarMenuController *View = [currentView.storyboard instantiateViewControllerWithIdentifier:@"virtualTourViewController"];
            [currentView.navigationController pushViewController:View animated:YES];
            break;
        }
        case 8:{
            ToolbarMenuController *View = [currentView.storyboard instantiateViewControllerWithIdentifier:@"ecardsViewController"];
            [currentView.navigationController pushViewController:View animated:YES];
            break;
        }
        case 9:{
            ToolbarMenuController *View = [currentView.storyboard instantiateViewControllerWithIdentifier:@"mapViewController"];
            [currentView.navigationController pushViewController:View animated:YES];
            break;
        }
        case 10:{
            ToolbarMenuController *View = [currentView.storyboard instantiateViewControllerWithIdentifier:@"langViewController"];
            [currentView.navigationController pushViewController:View animated:YES];
            break;
        }
        default:
            break;
    }
   // NSLog(@"%i",buttonIndex);
}
+ (void)goMainMenu:(UIViewController *)sender{
    ToolbarMenuController *View = [sender.storyboard instantiateViewControllerWithIdentifier:@"mainMenuViewController"];
    [sender.navigationController pushViewController:View animated:YES];
}


@end

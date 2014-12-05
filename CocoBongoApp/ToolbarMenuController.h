//
//  ToolbarMenuController.h
//  CocoBongoApp
//
//  Created by Alberto Enriquez on 18/11/14.
//  Copyright (c) 2014 Alberto Enriquez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToolbarMenuController : UIViewController<UIActionSheetDelegate>
+(NSArray *) getMenuItems;
+(void)goMainMenu:(UIViewController *) sender;
+(void) action:(NSInteger)buttonIndex atView:(UIViewController *)currentView;
@end

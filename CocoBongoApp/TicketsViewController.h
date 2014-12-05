//
//  TicketsViewController.h
//  CocoBongoApp
//
//  Created by Alberto Enriquez on 22/10/14.
//  Copyright (c) 2014 Alberto Enriquez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TicketsViewController : UIViewController<UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
- (IBAction)ticketButton:(id)sender;
- (IBAction)callButton:(id)sender;

@end

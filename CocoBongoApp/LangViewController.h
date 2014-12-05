//
//  LangViewController.h
//  CocoBongoApp
//
//  Created by Alberto Enriquez on 07/11/14.
//  Copyright (c) 2014 Alberto Enriquez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LangViewController : UIViewController<UIActionSheetDelegate>
- (IBAction)spanishButton:(id)sender;
- (IBAction)englishButton:(id)sender;
- (IBAction)portugueseButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;


@end

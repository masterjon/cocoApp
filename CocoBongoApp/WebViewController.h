//
//  WebViewController.h
//  CocoBongoApp
//
//  Created by Alberto Enriquez on 20/10/14.
//  Copyright (c) 2014 Alberto Enriquez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic,strong) NSString* url;
@end

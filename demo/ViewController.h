//
//  ViewController.h
//  demo
//
//  Created by yangxutao on 17/3/1.
//  Copyright © 2017年 yangxutao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ViewControllerDelegate <NSObject>

- (void)bbb;

@end

@interface ViewController : UIViewController

- (void)AAA;
void printFunction(char *str);
@end


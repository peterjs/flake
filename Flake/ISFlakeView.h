//
//  ISFlakeView.h
//  Flake
//
//  Created by Peter Somlo on 9/12/13.
//  Copyright (c) 2013 Peter Somlo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ISFlakeView : UIView <UIGestureRecognizerDelegate>

@property (nonatomic, weak) id sceneObjects;

- (void)addGestureRecognizer:(Class)gestureRecognizer withTarget:(id)target action:(SEL)action forObject:(id)object;
@end
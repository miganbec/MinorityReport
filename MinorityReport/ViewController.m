//
//  ViewController.m
//  MinorityReport
//
//  Created by miganbec on 06/11/14.
//  Copyright (c) 2014 miganbec. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *theFuture;
@property (weak, nonatomic) IBOutlet UILabel *thePreCogs;
@property CGPoint originalCenter;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.originalCenter = self.theFuture.center;
}

- (IBAction)onDrag:(UIPanGestureRecognizer *)panGesture {
    CGPoint point = [panGesture locationInView:self.view];
    //self.theFuture.center = CGPointMake(self.theFuture.center.x + point.x, self.theFuture.center.y + point.y);
    self.theFuture.center = point;
    if (panGesture .state == UIGestureRecognizerStateEnded) {
        [UIView animateWithDuration:1.0 animations:^{
            self.theFuture.center = self.originalCenter;
        }];
    } else {
        if (CGRectContainsPoint(self.thePreCogs.frame, point)) {
            self.theFuture.backgroundColor = [UIColor greenColor];
            self.theFuture.text = @"A ficticious and incriminating future";
            [self.theFuture sizeToFit];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

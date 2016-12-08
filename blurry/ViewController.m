//
//  ViewController.m
//  blurry
//
//  Created by 毛毛 on 2016/12/6.
//  Copyright © 2016年 锐拓. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)mohuBtn:(UIButton *)sender {
    [self hd_Image:self.imageView isBlurry:YES];
}
- (IBAction)qingchuBtn:(UIButton *)sender {
    [self hd_Image:self.imageView isBlurry:NO];
}

- (void)hd_Image:(UIImageView *)imageView isBlurry:(BOOL)isBlurry
{
    NSArray *subViews = imageView.subviews;
    UIVisualEffectView *effectView = nil;
    for (int i=0; i<subViews.count; i++) {
        if ([subViews[i] isKindOfClass:[UIVisualEffectView class]]) {
            effectView = subViews[i];
        }
    }
    if (isBlurry) {
        //要模糊
        if (!effectView) {
            UIBlurEffect *beffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
            UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:beffect];
            effectView.frame = imageView.bounds;
            effectView.alpha = 1.0;
            [imageView addSubview:effectView];
        }
    }else{
        //不模糊
        if (effectView) {
            [effectView removeFromSuperview];
        }
    }
}


@end

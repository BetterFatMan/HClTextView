//
//  OneViewController.m
//  HClTextView
//
//  Created by hcl on 15/10/9.
//  Copyright (c) 2015年 hcl. All rights reserved.
//

#import "OneViewController.h"
#import "HClTextView.h"
#import "Masonry.h"

@interface OneViewController ()
@property (weak, nonatomic) HClTextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (copy, nonatomic) NSString *myInPutText;
@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"基本功能";
    _myInPutText = @"";
    
    HClTextView *textView = [[NSBundle mainBundle] loadNibNamed:@"HClTextView" owner:self options:nil].lastObject;
    [self.view addSubview:textView];
    self.textView = textView;
    
    textView.delegate = self;
    
    [textView setPlaceholder:nil contentText:_myInPutText maxTextCount:100];
    __weak typeof(self) weakSelf = self;
    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right);
        make.height.equalTo(@(150));
        make.top.equalTo(weakSelf.view.mas_top).with.offset(64);
    }];
}

- (void)textViewDidChange:(UITextView *)textView
{
    _myLabel.text = textView.text;
}

@end

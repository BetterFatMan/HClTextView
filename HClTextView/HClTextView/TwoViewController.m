//
//  TwoViewController.m
//  HClTextView
//
//  Created by hcl on 15/10/9.
//  Copyright (c) 2015年 hcl. All rights reserved.
//

#import "TwoViewController.h"
#import "HClTextView.h"
#import "Masonry.h"

@interface TwoViewController ()
@property (weak, nonatomic) HClTextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (copy, nonatomic) NSString *myInPutText;
@end

@implementation TwoViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"高级功能";
    _myInPutText = @"";
    
    HClTextView *textView = [[NSBundle mainBundle] loadNibNamed:@"HClTextView" owner:self options:nil].lastObject;
    [self.view addSubview:textView];
    self.textView = textView;
    
    textView.delegate = self;
    textView.clearButtonType = ClearButtonAppearWhenEditing;
    [textView setLeftTitleText:@"高级内容"];
    
    //Placeholder为空,则会显示:请输入您的"LeftTitleText的内容", "maxTextCount"字以内,Placeholder有值,则显示设置内容
    [textView setPlaceholder:nil contentText:_myInPutText maxTextCount:200];
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

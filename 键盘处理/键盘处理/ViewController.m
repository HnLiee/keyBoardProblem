//
//  ViewController.m
//  键盘处理
//
//  Created by HnLiee on 16/6/17.
//  Copyright © 2016年 HnLiee. All rights reserved.
//

#import "ViewController.h"

#import "keyBoardTool.h"

@interface ViewController () <UITextFieldDelegate, keyBoardToolDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *xingbieTextField;
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;

/** 所有的文本框数组 */
@property (nonatomic, strong) NSArray *fields;

/** 工具条 */
@property (nonatomic, weak) keyBoardTool *toolBar;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.fields = @[self.nameTextField, self.xingbieTextField, self.ageTextField];
    
    // 加载工具条控件
    keyBoardTool *toolBar = [keyBoardTool tool];
    toolBar.delegateTool = self;
    self.toolBar = toolBar;
    
    // 设置工具条
    self.nameTextField.inputAccessoryView = toolBar;
    self.xingbieTextField.inputAccessoryView = toolBar;
    self.ageTextField.inputAccessoryView = toolBar;
}

- (void)testInputViewAndInputAccessoryView
{
    // 更换键盘
    UIView *keyBoard = [[UIView alloc] init];
    keyBoard.frame = CGRectMake(0, 0, 0, 100);
    keyBoard.backgroundColor = [UIColor redColor];
    self.xingbieTextField.inputView = keyBoard;
    
    // 设置键盘顶部的工具条
    UIView *toolbar = [[UIView alloc] init];
    toolbar.frame = CGRectMake(0, 0, 0, 44);
    toolbar.backgroundColor = [UIColor blueColor];
    self.ageTextField.inputAccessoryView = toolbar;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

#pragma mark - keyBoardToolDelegate

- (void)keyBoardTool:(keyBoardTool *)tool didClickItem:(keyBoardToolItem)item
{
    NSInteger currentIndex = 0;
    
    if (item == keyBoardToolPrevious) {
        
        for (UIView *view in self.view.subviews) {
            if ([view isFirstResponder]) {
                currentIndex = [self.fields indexOfObject:view];
            }
        }
        
        currentIndex--;
        
        [self.fields[currentIndex] becomeFirstResponder];
    
        self.toolBar.previous.enabled = (currentIndex != 0);
        self.toolBar.fieldNext.enabled = YES;
        
    } else if (item == keyBoardToolNext) {
        
        for (UIView *view in self.view.subviews) {
            if ([view isFirstResponder]) {
                currentIndex = [self.fields indexOfObject:view];
            }
        }
        currentIndex++;
        [self.fields[currentIndex] becomeFirstResponder];
        
        self.toolBar.previous.enabled = YES;
        self.toolBar.fieldNext.enabled = (currentIndex != self.fields.count - 1);
        
    } else if (item == keyBoardToolDone) {
        [self.view endEditing:YES];
    }
}

//- (void)keyBoardToolDidClickPreviousItem:(keyBoardTool *)tool
//{
//    NSInteger currentIndex = 0;
//    for (UIView *view in self.view.subviews) {
//        if ([view isFirstResponder]) {
//            currentIndex = [self.fields indexOfObject:view];
//        }
//    }
//    currentIndex--;
//    [self.fields[currentIndex] becomeFirstResponder];
//    
//    self.toolBar.previous.enabled = (currentIndex != 0);
//    self.toolBar.fieldNext.enabled = YES;
//}
//
//- (void)keyBoardToolDidClickNextItem:(keyBoardTool *)tool
//{
//    NSInteger currentIndex = 0;
//    for (UIView *view in self.view.subviews) {
//        if ([view isFirstResponder]) {
//            currentIndex = [self.fields indexOfObject:view];
//        }
//    }
//    currentIndex++;
//    [self.fields[currentIndex] becomeFirstResponder];
//    
//    self.toolBar.previous.enabled = YES;
//    self.toolBar.fieldNext.enabled = (currentIndex != self.fields.count - 1);
//    
//}
//
//- (void)keyBoardToolDidClickDoneItem:(keyBoardTool *)tool
//{
//    [self.view endEditing:YES];
//}

#pragma mark - UITextFieldDelegate

// 当点击键盘右下角的ruturn key时，就会调用这个方法
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.nameTextField) {
        // 让性别textField成为第一响应者
        [self.xingbieTextField becomeFirstResponder];
    } else if (textField == self.xingbieTextField) {
        // 让年龄textField成为第一响应者
        [self.ageTextField becomeFirstResponder];
    } else if (textField == self.ageTextField) {
        [self.view endEditing:YES];
//        [textField resignFirstResponder];
    }
    
    return YES;
}

// 键盘弹出就会调用这个方法
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSInteger currentIndex = [self.fields indexOfObject:textField];
    
    self.toolBar.previous.enabled = (currentIndex != 0);
    self.toolBar.fieldNext.enabled = (currentIndex != self.fields.count - 1);
}

@end

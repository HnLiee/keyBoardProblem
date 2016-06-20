//
//  keyBoardTool.m
//  键盘处理
//
//  Created by HnLiee on 16/6/20.
//  Copyright © 2016年 HnLiee. All rights reserved.
//

#import "keyBoardTool.h"

@implementation keyBoardTool

+ (instancetype)tool
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}

- (IBAction)previous:(id)sender {
//    if ([self.delegate respondsToSelector:@selector(keyBoardToolDidClickPreviousItem:)]) {
//        [self.delegate keyBoardToolDidClickPreviousItem:self];
//    }
    
    if ([self.delegateTool respondsToSelector:@selector(keyBoardTool:didClickItem:)]) {
        [self.delegateTool keyBoardTool:self didClickItem:keyBoardToolPrevious];
    }
}
- (IBAction)next:(id)sender {
//    if ([self.delegate respondsToSelector:@selector(keyBoardToolDidClickNextItem:)]) {
//        [self.delegate keyBoardToolDidClickNextItem:self];
//    }
    
    if ([self.delegateTool respondsToSelector:@selector(keyBoardTool:didClickItem:)]) {
        [self.delegateTool keyBoardTool:self didClickItem:keyBoardToolNext];
    }
}
- (IBAction)done:(id)sender {
//    if ([self.delegate respondsToSelector:@selector(keyBoardToolDidClickDoneItem:)]) {
//        [self.delegate keyBoardToolDidClickDoneItem:self];
//    }
    
    if ([self.delegateTool respondsToSelector:@selector(keyBoardTool:didClickItem:)]) {
        [self.delegateTool keyBoardTool:self didClickItem:keyBoardToolDone];
    }
}

@end

//
//  keyBoardTool.h
//  键盘处理
//
//  Created by HnLiee on 16/6/20.
//  Copyright © 2016年 HnLiee. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    keyBoardToolPrevious,
    keyBoardToolNext,
    keyBoardToolDone
}keyBoardToolItem;

@class keyBoardTool;

@protocol keyBoardToolDelegate <NSObject>

@optional
//- (void)keyBoardToolDidClickPreviousItem:(keyBoardTool *)tool;
//- (void)keyBoardToolDidClickNextItem:(keyBoardTool *)tool;
//- (void)keyBoardToolDidClickDoneItem:(keyBoardTool *)tool;

- (void)keyBoardTool:(keyBoardTool *)tool didClickItem:(keyBoardToolItem)item;
@end

@interface keyBoardTool : UIToolbar

@property (weak, nonatomic, readonly) IBOutlet UIBarButtonItem *previous;

@property (weak, nonatomic, readonly) IBOutlet UIBarButtonItem *fieldNext;

/** 代理 */
@property (nonatomic, weak) id <keyBoardToolDelegate> delegateTool;

+ (instancetype)tool;

@end

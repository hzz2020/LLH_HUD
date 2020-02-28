//
//  UIVCMain.m
//  LLH_HUD
//
//  Created by 李龙辉 on 2017/8/5.
//  Copyright © 2017年 李龙辉. All rights reserved.
//

#import "UIVCMain.h"
#define RowCellHeight 50


@interface LLHExample : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) SEL selector;

@end


@implementation LLHExample

+ (instancetype)exampleWithTitle:(NSString *)title selector:(SEL)selector {
    LLHExample *example = [[self class] new];
    example.title = title;
    example.selector = selector;
    return example;
}

@end

@interface UIVCMain ()
<UITableViewDataSource, UITableViewDelegate>

///tableView
@property (nonatomic, strong) UITableView *tableView;
///tableView数据源
@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation UIVCMain

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray *methods = @[[LLHExample exampleWithTitle:@"showMessageInView" selector:@selector(showInViewDefaultExample)]
                        ,[LLHExample exampleWithTitle:@"showMessageInView DelayTime" selector:@selector(showInViewDelayExample)]
                        ,[LLHExample exampleWithTitle:@"showMessageInWindow" selector:@selector(showInWindowDefaultExample)]
                        ,[LLHExample exampleWithTitle:@"showMessageInWindow DelayTime" selector:@selector(showInWindowDelayExample)]
                        ,[LLHExample exampleWithTitle:@"showWarmMessage" selector:@selector(showWarn)]
                        ,[LLHExample exampleWithTitle:@"showErrorMessage" selector:@selector(showError)]
                        ,[LLHExample exampleWithTitle:@"showSuccessMessage" selector:@selector(showSuccess)]
                        ,[LLHExample exampleWithTitle:@"showHUD" selector:@selector(hudRun)]
//                         [LLHExample exampleWithTitle:@"hideHUD" selector:@selector(hudStop)]
                         ];
    
//    NSInteger count = arc4random()%20+1;
//    for (NSInteger i=0; i<count; i++) {
//        [self.dataSource addObject:@(i)];
//    }
    
    self.dataSource = [methods copy];
    
    [self.view addSubview:self.tableView];
}

#pragma mark - 懒加载
- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc] init];
    }
    return _dataSource;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
                                                  style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

#pragma mark ************** UITableViewDataSource **************
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    LLHExample *example = self.dataSource[indexPath.row];
    cell.textLabel.text = example.title;
    cell.textLabel.textColor = self.view.tintColor;
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.selectedBackgroundView = [UIView new];
    cell.selectedBackgroundView.backgroundColor = [cell.textLabel.textColor colorWithAlphaComponent:0.1f];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return RowCellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LLHExample *example = self.dataSource[indexPath.row];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    [self performSelector:example.selector];
#pragma clang diagnostic pop
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    });
}

- (void)showInViewDefaultExample {
    showTipMessageInView(@"showInViewDefaultExample");
}

- (void)showInViewDelayExample {
    showTipMessageInViewWithTime(@"showInViewDelayExample", 3.f);
}

- (void)showInWindowDefaultExample {
    showTipMessageInWindow(@"showInWindowDefaultExample");
}

- (void)showInWindowDelayExample {
    showTipMessageInWindowWithTime(@"showInWindowDelayExample", 4.f);
}

- (void)showSuccess {
    showInfomMessage(@"showSuccess");
}

- (void)showWarn {
    showWarmMessage(@"showWarn");
}

- (void)showError {
    showErrorMessage(@"showError");
}

- (void)hudRun {
    showLLHHUD;
}

- (void)hudStop {
    hiddenLLHHUD;
}

@end

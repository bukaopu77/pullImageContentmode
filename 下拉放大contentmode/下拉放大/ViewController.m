//
//  ViewController.m
//  下拉放大
//
//  Created by 周剑 on 16/1/22.
//  Copyright © 2016年 bukaopu. All rights reserved.
//

#import "ViewController.h"

static CGFloat ImageHeight = 450;
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

@property (nonatomic, strong) UIImageView *topImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mainTableView.dataSource = self;
    self.mainTableView.delegate = self;
    
    self.topImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"J.jpg"]];
    self.topImageView.frame = CGRectMake(0, -ImageHeight, [UIScreen mainScreen].bounds.size.width, ImageHeight);
    self.mainTableView.contentInset = UIEdgeInsetsMake(ImageHeight * 0.5, 0, 0, 0);
    self.topImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.mainTableView insertSubview:self.topImageView atIndex:0];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cell_id = @"flag";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_id];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cell_id];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"测试数据---%ld", indexPath.row];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat down = -(ImageHeight * 0.5) - scrollView.contentOffset.y;
    if (down < 0) {
        return;
    }
    CGRect imageFrame = self.topImageView.frame;
    imageFrame.size.height = ImageHeight + down * 3;
    self.topImageView.frame = imageFrame;
}

@end

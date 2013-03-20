//
//  MoreMainVC.m
//  Weibo_WJC
//
//  Created by TRALIN on 13-3-7.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import "MoreMainVC.h"

@interface MoreMainVC ()

@end

@implementation MoreMainVC

- (id)init
{
    self = [super init];
    if (self)
    {
        self.cellDataArray = [[[NSMutableArray alloc]initWithObjects:@"1",@"2", nil]autorelease];
        
        NSArray * nameArr1 = [NSArray arrayWithObjects:@"草稿箱", nil];
        NSArray * nameArr2 = [NSArray arrayWithObjects:@"账号管理", nil];
        NSArray * nameArr3 = [NSArray arrayWithObjects:@"阅读模式",@"主题", nil];
        NSArray * nameArr4 = [NSArray arrayWithObjects:@"隐私设置",@"账号安全", nil];
        NSArray * nameArr5 = [NSArray arrayWithObjects:@"官方微博",@"意见反馈",@"给我评分",@"新版本检测",@"关于", nil];
        NSArray * nameArr6 = [NSArray arrayWithObjects:@"更多精彩应用", nil];
        NSArray * nameArr7 = [NSArray arrayWithObjects:@"退出当前账号", nil];
        
        self.cellNameArray = [[[NSMutableArray alloc]initWithObjects:nameArr1,nameArr2,nameArr3,nameArr4,nameArr5,nameArr6,nameArr7, nil]autorelease];
        
        
    }
    return self;
}

-(void)dealloc
{
    self.tableViewC = nil;
    self.cellDataArray = nil;
    
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"更多";
    self.view.backgroundColor = [UIColor yellowColor];
    self.tableViewC = [[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 460-40-44)
                                                  style:UITableViewStyleGrouped]autorelease];
    self.tableViewC.backgroundView.alpha = 0.0f;
    self.tableViewC.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = [UIColor whiteColor];

    self.tableViewC.delegate = self;
    self.tableViewC.dataSource = self;
    
    [self.view addSubview:self.tableViewC];
    
    T_Sys_Btn * writeBtn = [T_Sys_Btn buttonWithType:UIButtonTypeCustom];
    writeBtn.frame = CGRectMake(0, 0, 60, 30);
    [writeBtn setTitle:@"设置" forState:UIControlStateNormal];
    [writeBtn addTarget:self action:@selector(actionRightButton:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * wrtItem = [[[UIBarButtonItem alloc]initWithCustomView:writeBtn] autorelease];
    self.navigationItem.rightBarButtonItem = wrtItem;
    
    
}

#pragma mark -----ActionButton-----
-(void)actionRightButton:(UIBarButtonItem *)sender
{
    L_SettingViewController * settingVC = [[L_SettingViewController alloc]init];
    
    [self.navigationController pushViewController:settingVC animated:YES];
    [settingVC release];
    
}


#pragma mark -----UITableViewDataSource-----
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.cellNameArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ((NSArray *)[self.cellNameArray objectAtIndex:section]).count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //不重用Cell:
    NSString *cellIdentifier = [NSString stringWithFormat:@"cell%d-%d",indexPath.section,indexPath.row];
    L_MoreVCCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell)
    {
        cell = [[[L_MoreVCCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier]autorelease];
    }
    
    // TODO: 计算出是哪组上哪行的Cell公式?
    cell.textLabel.text = [((NSArray *)[self.cellNameArray objectAtIndex:indexPath.section])objectAtIndex:indexPath.row];

    
    return cell;
    
}

#pragma mark - Table view delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s",__func__);
    if (0 == indexPath.section)
    {
        // 草稿箱：
        L_DraftCartonViewController * draftCartonVC = [[L_DraftCartonViewController alloc]init];
        
        [self.navigationController pushViewController:draftCartonVC animated:YES];
        [draftCartonVC release];
    }
    if (1 == indexPath.section)
    {
        // 推出 账号管理：
        L_AccountManagementViewController * accManageVC = [[[L_AccountManagementViewController alloc]init]autorelease];
        
        [self presentViewController:accManageVC animated:YES completion:^{

        }];
        
        
    }
    if (2 == indexPath.section)
    {
        if (0 == indexPath.row)
        {
            // 阅读模式：
            L_ReadingModelViewController * readModelVC = [[L_ReadingModelViewController alloc]init];
            NSArray * tempCellArr1 = [NSArray arrayWithObjects:@"预览图模式",@"经典模式",@"文字模式", nil];
            NSArray * tempCellArr2 = [NSArray arrayWithObjects:@"显示备注",@"显示昵称", nil];
            NSArray * tempCellArr3 = [NSArray arrayWithObjects:@"显示缩略微博", nil];
            
            readModelVC.cellDataArray = [[[NSMutableArray alloc]initWithObjects:tempCellArr1,tempCellArr2,tempCellArr3, nil]autorelease];
            
            [self.navigationController pushViewController:readModelVC animated:YES];
            [readModelVC release];
            
        }
        else
        {
            // 主题：
            //原版主题：
            /*
            L_ReadingModelViewController * readModelVC = [[L_ReadingModelViewController alloc]init];
            NSArray * tempCellArr = [NSArray arrayWithObjects:@"默认",@"气泡",@"夜间模式",@"俏皮喵星人",@"超级玛丽",@"蜜桃粉", nil];
            
            readModelVC.cellDataArray = [[[NSMutableArray alloc]initWithObjects:tempCellArr, nil]autorelease];
            [self.navigationController pushViewController:readModelVC animated:YES];
            [readModelVC release];
             */
        L_ThemeViewController * themeVC = [[L_ThemeViewController alloc]init];
        
        [self.navigationController pushViewController:themeVC animated:YES];
        [themeVC release];
        
        }
    
    }
    if (3 == indexPath.section)
    {
        if (0 == indexPath.row)
        {
            // 隐私设置：
            
            
        }
        else
        {
            // 账号安全：
            
            
        }
        
    }
    if (4 == indexPath.section)
    {
        switch (indexPath.row)
        {
            case 0:
            {
                //官方微博:
                
                
                break;
            }
            case 1:
            {
                // 意见反馈：
                
                break;
            }
            case 2:
            {
                //给我评分：
                
                break;
            }
            case 3:
            {
                // 新版本检测：
                
                break;
            }
            case 4:
            {
                // 关于：
                T_About_VC * aboutVC = [[T_About_VC new]autorelease];
                [self.navigationController pushViewController:aboutVC animated:YES];
                break;
            }
                
            default:
                break;
        }
        
    }
    if (5 == indexPath.section)
    {
        // 更多精彩应用：
        
    }
    if (6 == indexPath.section)
    {
        // 退出当前账号：
        
    }
    
}




@end

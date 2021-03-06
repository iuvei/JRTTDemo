//
//  WeiTouTiaoViewController.m
//  JRTTDemo
//
//  Created by 赵 on 2018/2/26.
//  Copyright © 2018年 袁书辉. All rights reserved.
//

#import "HomeMenuView.h"
#import "WeiTouTiaoViewController.h"

@interface WeiTouTiaoViewController ()
@property (nonatomic,strong) NSMutableArray * titleArray;

@property (nonatomic,strong) HomeMenuView * menuView;
@end

@implementation WeiTouTiaoViewController
-(NSMutableArray *)titleArray
{
    if (!_titleArray) {
        _titleArray = [NSMutableArray new];
    }
    return _titleArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    HomeMenuView * view = [HomeMenuView getViewWithNibSelectedBlock:^(NSIndexPath *idxPath, NSMutableArray *dataArray) {
        
    } cellIdentifer:@"HomeMenuCollectionViewCell"];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    
    __weak typeof(self) weakSelf = self;
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view);
        make.top.equalTo(weakSelf.view).offset(20);
        make.right.equalTo(weakSelf.view);
        make.height.equalTo(@44);
    }];
    
    self.menuView =view;
    
    [PPNetworkHelper GET:@"http://is.snssdk.com/article/category/get_subscribed/v2/?iid=25504462036&device_id=43911586446&ac=wifi&channel=iphone6&aid=13&app_name=news_article&version_code=659&version_name=6.5.9&device_platform=ios&ab_version=275263%2C276222%2C271178%2C208278%2C252767%2C249828%2C246859%2C275644%2C268839%2C276183%2C249686%2C249675%2C264842%2C268794%2C249667%2C274584%2C206075%2C249674%2C272432%2C229304%2C276049%2C270947%2C271842%2C275587%2C275947%2C266386%2C271717%2C260441%2C240865%2C274670%2C270388%2C276002%2C251713%2C271059%2C274344%2C275066%2C229399%2C276128%2C270333%2C275347%2C274131%2C267093%2C274411%2C270107%2C258356%2C247848%2C264452%2C276173%2C249045%2C271663%2C244746%2C273961%2C274292%2C264616%2C275350%2C276211%2C268788%2C260656%2C261944%2C241181%2C268341%2C232362%2C265709%2C271194%2C273233%2C239096%2C272011%2C170988%2C269425%2C273499%2C268663%2C275295%2C243585%2C276203%2C272515%2C272486%2C257280%2C261294%2C265122%2C258603&ab_client=a1%2Cc4%2Ce1%2Cf2%2Cg2%2Cf7&ab_feature=94563%2C102749&abflag=3&ssmix=a&device_type=BAC-AL00&device_brand=HUAWEI&language=zh&os_api=24&os_version=7.0&uuid=866432038206049&openudid=50468f33e8fc72cf&manifest_version_code=659&resolution=720*1208&dpi=320&update_version_code=65902&_rticket=1517897403139&plugin=10575&fp=42TqLlm1Pr5_FlHtLrU1FlFSF2Qq&pos=5r_-9Onkv6e_dBoQeCcbeCUfv7G_8fLz-vTp6Pn4v6esrauzqKuur6-rsb_x_On06ej5-L-nr6SzqK6pqa-v4A%3D%3D&rom_version=emotionui_5.1_bac-al00c00b180&ts=1517897403&as=a28564971bcb0a96294897&mas=00d821575ea3fde5405dd395344d4d8767ad8250edd6552d73" parameters:@{} success:^(id responseObject) {
        
        TitleModel * model = [TitleModel yy_modelWithDictionary:responseObject];
        T1Data * obj = [T1Data new];
        obj.category = @"";
        obj.name = @"推荐";
        obj.web_url = @"";
        obj.flags = 0;
        obj.tip_new = 0;
        obj.default_add = 1;
        obj.concern_id = @"";
        obj.type = 4;
        obj.icon_url = @"";
        NSMutableArray * tempArr = [model.data.data mutableCopy];
        [tempArr insertObject:obj atIndex:0];
        [self.titleArray setArray:tempArr];
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            // 通知主线程刷新 神马的
            [self updateVC];
        });
        
        
        
        
        
    } failure:^(NSError *error) {
        
    }];
   
    
    
}
-(void)updateVC
{
    [self.menuView.viewModel updateData:self.titleArray];
   
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

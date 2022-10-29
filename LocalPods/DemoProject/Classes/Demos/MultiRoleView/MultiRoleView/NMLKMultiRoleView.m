//
//  NMLKMultiRoleView.m
//
//  Created by Leon0206 on 2020/2/19.
//  Copyright © 2020 Tao. All rights reserved.
//

#import "NMLKMultiRoleView.h"
#import "NMLKMultiRoleItemView.h"

@interface NMLKMultiRoleCell : UICollectionViewCell
@property (nonatomic, strong) NMLKMultiRoleItemView *itemView;

@end

@implementation NMLKMultiRoleCell

- (void)setItemView:(NMLKMultiRoleItemView *)itemView
{
    _itemView = itemView;
    if (_itemView) {
        [self.contentView addSubview:_itemView];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.itemView.frame = self.contentView.frame;
}
@end

@interface NMLKMultiRoleView ()<UICollectionViewDataSource, UICollectionViewDelegate, NMLKMultiRoleItemViewDelegate>
@property (nonatomic, strong) NMLKMultiRoleViewConfig *config;
@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) NSMutableDictionary *sizeForItemDic;
@end

@implementation NMLKMultiRoleView


- (instancetype)initWithMultiRoleConfig:(NMLKMultiRoleViewConfigBlock)configBlock
{
    self = [super init];
    if (self) {
        _sizeForItemDic = [NSMutableDictionary new];
        _config = [NMLKMultiRoleViewConfig defaultConfig];
        if (configBlock) {
            configBlock(_config);
        }
        [self initCollectionViewWith:_config];
        if (_config.backgroundColor) {
            self.backgroundColor = _config.backgroundColor;
        }
    }
    return self;
}

- (void)reloadItemsData:(NSArray *)array
{
    self.items = array;
    [self.collectionView reloadData];
    [self relayoutSubViews];
}

- (void)relayoutSubViews
{
    self.collectionView.size = [self obtainColloectionViewSize];
    CGFloat width = self.collectionView.size.width + self.config.insets.left + self.config.insets.right;
    CGFloat height = self.collectionView.height + self.config.insets.top + self.config.insets.bottom;
    if (!_config.isFixedSize) {
        self.size = CGSizeMake(width, height);
        self.collectionView.top = self.config.insets.top;
        self.collectionView.left = self.config.insets.left;
    } else {
        self.size = _config.size;
        self.collectionView.centerX = self.width / 2.0;
        self.collectionView.centerY = self.height / 2.0;
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self relayoutSubViews];
}

#pragma mark -- NMLKMultiRoleItemViewDelegate

- (void)imageLoadCompletedWith:(NSInteger)index imageSize:(CGSize)imageSize
{
    CGSize size = CGSizeZero;
    NMLKMultiRoleItemViewConfig *itemConfig = [self obtainConfigWithIndex:index];
    size = [self obtainFixedSizeFromSize:imageSize with:itemConfig];
    NSString *indexKey = [NSString stringWithFormat:@"%@",@(index)];
    [_sizeForItemDic setValue:NSStringFromCGSize(size) forKey:indexKey];
    
    [self.collectionView reloadData];
    [self relayoutSubViews];
}

#pragma mark -- UICollectionViewDataSource And UICollectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.items.count * 2 - 1;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row % 2 == 0) {
        CGSize itemSize = [self obtainItemFixedSizeWithIndex:(indexPath.row + 1) / 2];
        return itemSize;
    } else {
        NMLKMultiRoleItemViewConfig *itemConfig = [self obtainConfigWithIndex:(indexPath.row + 1) / 2];
        CGSize size = CGSizeZero;
        if (NMLKMultiRoleHorizontal == self.config.direction) {
            if (itemConfig.itemSpace > 0) {
                size = CGSizeMake(itemConfig.itemSpace, self.collectionView.size.height);
            } else {
                size = CGSizeMake(_config.space, self.collectionView.size.height);
            }
        } else {
            if (itemConfig.itemSpace > 0) {
                size = CGSizeMake(self.collectionView.size.width, itemConfig.itemSpace);
            } else {
                size = CGSizeMake(self.collectionView.size.width, _config.space);
            }
        }
        return size;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row % 2 == 0) {
        NMLKMultiRoleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"NMLKMultiRoleCell" forIndexPath:indexPath];
        NMLKMultiRoleItemViewConfig *itemConfig = [self obtainConfigWithIndex:(indexPath.row + 1) / 2];
        
        NMLKMultiRoleItemView *itemView = [[NMLKMultiRoleItemView alloc]initWithMultiRoleItemViewConfig:itemConfig];
        itemView.delegate = self;
        itemView.index = (indexPath.row + 1) / 2;
        itemView.key = [self obtainKeyWithIndex:(indexPath.row + 1) / 2];
        NSArray *values = [self obtainValueWithItemIndex:(indexPath.row + 1) / 2];
        [itemView reloadValues:values];
        cell.itemView = itemView;
        cell.backgroundColor = [UIColor redColor];
        return cell;
        
    } else {
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor clearColor];
        return cell;
    }
}

- (void)initCollectionViewWith:(NMLKMultiRoleViewConfig *)config
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    if (NMLKMultiRoleHorizontal == config.direction) {
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    } else {
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    }
    //设置CollectionView的属性
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 1, 30) collectionViewLayout:flowLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.scrollEnabled = NO;
    //注册Cell
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    [self.collectionView registerClass:[NMLKMultiRoleCell class] forCellWithReuseIdentifier:@"NMLKMultiRoleCell"];
    [self addSubview:self.collectionView];
}


#pragma mark --  Obtain Common Data

- (NSString *)obtainKeyWithIndex:(NSInteger)index
{
    if (index > self.items.count) return nil;
    id obj = [self.items objectAtIndex:index];
    return [self obtainKeyWithItem:obj];
}

- (NMLKMultiRoleItemViewConfig *)obtainConfigWithIndex:(NSInteger)index
{
    if (index > self.items.count) return nil;
    id obj = [self.items objectAtIndex:index];
    NSString *itemKey = [self obtainKeyWithItem:obj];
    NMLKMultiRoleItemViewConfig *itemConfig = [_config.itemsConfig valueForKey:itemKey];
    return itemConfig;
}

- (NSString *)obtainKeyWithItem:(id)obj
{
    NSString *itemKey = nil;
    if ([obj isKindOfClass:[NSArray class]]) {
        NSArray *dataArr = (NSArray *)obj;
        if (dataArr.count == 2 || dataArr.count == 3) {
            id obj = dataArr.firstObject;
            if ([obj isKindOfClass:[NSString class]]) {
                NSString *key = (NSString *)obj;
                if (key.length > 0) {
                    itemKey = key;
                }
            }
        }
    }
    return itemKey;
}

- (NSArray *)obtainValueWithItemIndex:(NSInteger)index
{
    id obj = [self.items objectAtIndex:index];
    NSMutableArray *valueArr = [NSMutableArray new];
    if ([obj isKindOfClass:[NSArray class]]) {
        NSArray *dataArr = (NSArray *)obj;
        if (dataArr.count == 2) {
            id obj = dataArr[1];
            if ([obj isKindOfClass:[NSString class]]) {
                [valueArr addObject:obj];
            }
            if ([obj isKindOfClass:[UIImage class]]) {
                [valueArr addObject:obj];
            }
        }
        if (dataArr.count == 3) {
            id obj_1 = dataArr[1];
            if ([obj_1 isKindOfClass:[NSString class]]) {
                [valueArr addObject:obj_1];
            }
            id obj_2 = dataArr[2];
            if ([obj_2 isKindOfClass:[UIImage class]]) {
                [valueArr addObject:obj_2];
            }
        }
    }
    return valueArr;
}

- (CGSize)obtainColloectionViewSize
{
    CGFloat width = 0.0;
    CGFloat height = 0.0;
    if (NMLKMultiRoleHorizontal == self.config.direction) {
        for (int i = 0; i < self.items.count; i++) {
            NMLKMultiRoleItemViewConfig *itemConfig = [self obtainConfigWithIndex:i];
            if (![self checkIsZeroSize:itemConfig.itemSize]) {
                if (height < itemConfig.itemSize.height) {
                    height = itemConfig.itemSize.height;
                }
                width += itemConfig.itemSize.width;
                if (i > 0) {
                    if (itemConfig.itemSpace > 0) {
                        width += itemConfig.itemSpace;
                    } else {
                        width += self.config.space;
                    }
                }
            } else {
                CGSize size = [self obtainItemFixedSizeWithIndex:i];
                if (height < size.height) {
                    height = size.height;
                }
                width += size.width;
                if (i > 0) {
                    if (itemConfig.itemSpace > 0) {
                        width += itemConfig.itemSpace;
                    } else {
                        width += self.config.space;
                    }
                }
            }
            
        }
        return CGSizeMake(width, height);
        
    } else {
        for (int i = 0; i < self.items.count; i++) {
            NMLKMultiRoleItemViewConfig *itemConfig = [self obtainConfigWithIndex:i];
            if (width < itemConfig.itemSize.width) {
                width = itemConfig.itemSize.width;
            }
            
            height += itemConfig.itemSize.height;
            if (i > 0) {
                if (itemConfig.itemSpace > 0) {
                    height += itemConfig.itemSpace;
                } else {
                    height += self.config.space;
                }
            }
        }
        return CGSizeMake(width, height);
    }
}

- (CGSize)obtainItemFixedSizeWithIndex:(NSInteger)index
{
    NSString *indexKey = [NSString stringWithFormat:@"%@",@(index)];
    CGSize size = CGSizeZero;
    
    NSString *sizeString = [_sizeForItemDic objectForKey:indexKey];
    size = CGSizeFromString(sizeString);
    
    if ([self checkIsZeroSize:size]) {
        NSArray *value = [self obtainValueWithItemIndex:index];
        NMLKMultiRoleItemViewConfig *itemConfig = [self obtainConfigWithIndex:index];
        if (value.count == 1) {
            id obj = value.firstObject;
            if (NMLKMultiRoleItemLabelType == itemConfig.itemType && [obj isKindOfClass:[NSString class]]) {
                NSString *title = (NSString *)obj;
                CGSize textSize = [self sizeWithText:title withFont:itemConfig.titleLabelConfig.font maxSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
                size = [self obtainFixedSizeFromSize:textSize with:itemConfig];
            }
            if (NMLKMultiRoleItemImageType == itemConfig.itemType) {
                if ([obj isKindOfClass:[UIImage class]]) {
                    UIImage *image = (UIImage *)obj;
                    if (image) {
                        UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
                        [imageView sizeToFit];
                        size = [self obtainFixedSizeFromSize:imageView.size with:itemConfig];
                    }
                } else {
                    size = [self obtainFixedSizeFromSize:CGSizeZero with:itemConfig];
                }
            }
        }
        if (value.count == 2 && NMLKMultiRoleItemMixType == itemConfig.itemType) {
            size = itemConfig.itemSize;
        }
        [_sizeForItemDic setValue:NSStringFromCGSize(size) forKey:indexKey];
    }
    return size;
}

- (CGSize)obtainFixedSizeFromSize:(CGSize)size with:(NMLKMultiRoleItemViewConfig *)itemConfig
{
    CGSize newSize = size;
    if (NMLKMultiRoleItemLabelType == itemConfig.itemType) {
        if (itemConfig.titleLabelConfig.isFixedSize) {
            newSize = itemConfig.titleLabelConfig.fixedSize;
        }
        CGFloat maxWidth = itemConfig.titleLabelConfig.maxWidth;
        if (maxWidth > 0 && newSize.width > maxWidth) {
            newSize = CGSizeMake(maxWidth, newSize.height);
        }
        if (itemConfig.titleLabelConfig.fixedHeight > 0) {
            newSize = CGSizeMake(newSize.width, itemConfig.titleLabelConfig.fixedHeight);
        }
        if (itemConfig.titleLabelConfig.fixedWidth > 0) {
            newSize = CGSizeMake(itemConfig.titleLabelConfig.fixedWidth, newSize.height);
        }
    }
    if (NMLKMultiRoleItemImageType == itemConfig.itemType) {
        if (itemConfig.imageViewConfig.isFixedSize) {
            newSize = itemConfig.imageViewConfig.fixedSize;
        }
        CGFloat maxWidth = itemConfig.imageViewConfig.maxWidth;
        if (maxWidth > 0 && newSize.width > maxWidth) {
            newSize = CGSizeMake(maxWidth, newSize.height);
        }
        if (itemConfig.imageViewConfig.fixedHeight > 0) {
            newSize = CGSizeMake(newSize.width, itemConfig.imageViewConfig.fixedHeight);
        }
        if (itemConfig.imageViewConfig.fixedWidth > 0) {
            newSize = CGSizeMake(itemConfig.imageViewConfig.fixedWidth, newSize.height);
        }
        if ([self checkIsZeroSize:newSize]) {
            CGFloat width = newSize.width>0?newSize.width:1.0;
            CGFloat height = newSize.height>0?newSize.height:1.0;
            newSize = CGSizeMake(width, height);
            
        }
    } else {
        
    }
    return newSize;
}

- (CGSize)sizeWithText:(NSString *)text withFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

- (BOOL)checkIsZeroSize:(CGSize)size
{
    if (size.width <= 0 || size.height <= 0) {
        return YES;
    }
    return NO;
}

@end


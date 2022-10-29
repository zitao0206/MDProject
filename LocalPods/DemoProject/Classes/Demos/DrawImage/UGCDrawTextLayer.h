//
//  UGCDrawTextLayer.h
//  DrawLayerTest
//
//  Created by Johnny on 3/19/17.
//  Copyright © 2017 Johnny. All rights reserved.
//

#import "UGCDrawLayer.h"

@interface UGCDrawTextLayer : UGCDrawLayer

- (instancetype)initWithText:(NSAttributedString *)text;

@property (nonatomic, strong) NSAttributedString *text;

@property (nonatomic, assign) NSUInteger numberOfLines;

@end

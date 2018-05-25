//
//  OpenGLESEnvironmentViewController.m
//  OpenGLES
//
//  Created by 李一平 on 2018/5/25.
//  Copyright © 2018年 slwy. All rights reserved.
//

#import "OpenGLESEnvironment.h"

@interface OpenGLESEnvironment ()

@end

@implementation OpenGLESEnvironment

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Update Delegate
//update和- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect是在GLKViewController中被循环调用的方法，也被称为Game Loop，一般在update中更新变量，- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect中进行绘制。
- (void)update {
    // 距离上一次调用update过了多长时间，比如一个游戏物体速度是3m/s,那么每一次调用update，
    // 他就会行走3m/s * deltaTime，这样做就可以让游戏物体的行走实际速度与update调用频次无关
    // NSTimeInterval deltaTime = self.timeSinceLastUpdate;
    
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect {
    // 清空之前的绘制
    glClearColor(1, 0.2, 0.2, 1);
    glClear(GL_COLOR_BUFFER_BIT);
    
    // 使用fragment.glsl 和 vertex.glsl中的shader
    glUseProgram(self.shaderProgram);
    
}

@end

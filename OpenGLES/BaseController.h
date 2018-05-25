//
//  BaseController.h
//  OpenGLES
//
//  Created by 李一平 on 2018/5/25.
//  Copyright © 2018年 slwy. All rights reserved.
//

#import <GLKit/GLKit.h>

//GLKViewController会帮助我们对OpenGLES进行一些基本的配置，比如生成默认的FrameBufferObject，这些会在后面文章介绍。
@interface BaseController : GLKViewController
/**
 GLKit用来处理OpenGL ES相关配置的变量，可以初始化出兼容不同OpenGL ES版本的上下文环境。
 */
@property (nonatomic, strong) EAGLContext *context;
/**
 shaderProgram
 */
@property (nonatomic, assign) GLuint shaderProgram;

@end

//
//  DrawTriangle.m
//  OpenGLES
//
//  Created by 李一平 on 2018/5/25.
//  Copyright © 2018年 slwy. All rights reserved.
//

#import "DrawTriangle.h"

@interface DrawTriangle ()

@end

@implementation DrawTriangle

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
    
    [self drawTriangle];
}

/**
 画一个三角形
 */
- (void)drawTriangle {
    
    static GLfloat triangleData[18] = {
        0, 0.5f, 0, 1, 0, 0,// x, y, z, r, g, b,每一行存储一个点的信息，位置和颜色
        -0.5f, -0.5f, 0, 0, 1, 0,
        0.5f, -0.5f, 0, 0, 0, 1,
    };
    
    // 启用Shader中的两个属性
    // attribute vec4 position;
    // attribute vec4 color;
    GLuint positionAttribLocation = glGetAttribLocation(self.shaderProgram,"position");
    glEnableVertexAttribArray(positionAttribLocation);
    
    GLuint colorAttribLocation = glGetAttribLocation(self.shaderProgram, "color");
    glEnableVertexAttribArray(colorAttribLocation);
    
    // 为shader中的position和color赋值
    // glVertexAttribPointer (GLuint indx, GLint size, GLenum type, GLboolean normalized, GLsizei stride, const GLvoid* ptr)
    // indx: 上面Get到的Location
    // size: 有几个类型为type的数据，比如位置有x,y,z三个GLfloat元素，值就为3
    // type: 一般就是数组里元素数据的类型
    // normalized: 暂时用不上
    // stride: 每一个点包含几个byte，本例中就是6个GLfloat，x,y,z,r,g,b
    // ptr: 数据开始的指针，位置就是从头开始，颜色则跳过3个GLFloat的大小
    glVertexAttribPointer(positionAttribLocation, 3, GL_FLOAT, GL_FALSE, 6 * sizeof(GLfloat), (char *)triangleData);
    glVertexAttribPointer(colorAttribLocation, 3, GL_FLOAT, GL_FALSE, 6 * sizeof(GLfloat), (char *)triangleData + 3 * sizeof(GLfloat));
    
    glDrawArrays(GL_TRIANGLES, 0, 3);
}



@end

//
//  DrawMoreSahpe.m
//  OpenGLES
//
//  Created by 李一平 on 2018/5/28.
//  Copyright © 2018年 slwy. All rights reserved.
//

#import "DrawMoreSahpe.h"

@interface DrawMoreSahpe ()

/**
 elapsedTime
 */
@property (nonatomic, assign) GLfloat elapsedTime;
@end

@implementation DrawMoreSahpe

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Update Delegate

/**
 每次更新处理时间，做旋转动画用到，此方法可选实现，不调用这个方法，没有动画
 */
- (void)update {
    
    NSTimeInterval deltaTime = self.timeSinceLastUpdate;
    self.elapsedTime += deltaTime;
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect {
    // 清空之前的绘制
    glClearColor(1, 0.2, 0.2, 1);
    glClear(GL_COLOR_BUFFER_BIT);
    
    glUseProgram(self.shaderProgram);// 使用fragment.glsl 和 vertex.glsl中的shader
    
    GLuint elapsedTimeUniformLocation = glGetUniformLocation(self.shaderProgram, "elapsedTime");// 设置shader中的 uniform elapsedTime 的值
    
    glUniform1f(elapsedTimeUniformLocation, (GLfloat)self.elapsedTime);
    
    [self drawTriangle];
//    [self drawTriangleStrip];
//    [self drawTriangleFan];
//    [self drawLines];
//    [self drawLinesStrip];
//    [self drawLinesLoop];
//    [self drawPoints];
    
}

#pragma mark - bindAttribs
- (void)bindAttribs:(GLfloat *)triangleData {
    // 启用Shader中的两个属性
    // attribute vec4 position;
    GLuint positionAttributionLocation = glGetAttribLocation(self.shaderProgram, "position");
    glEnableVertexAttribArray(positionAttributionLocation);
    
    // attribute vec4 color;
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
    glVertexAttribPointer(positionAttributionLocation, 3, GL_FLOAT, GL_FALSE, 6 * sizeof(GLfloat), (char *)triangleData);
    
    glVertexAttribPointer(colorAttribLocation, 3, GL_FLOAT, GL_FALSE, 6 * sizeof(GLfloat), (char *)triangleData + 3 * sizeof(GLfloat));
    
}

#pragma mark - Draw Many Things

- (void)drawTriangle {
    static GLfloat triangleData[36] = {
        0,      0.5f,  0,  1,  0,  0, // x, y, z, r, g, b,每一行存储一个点的信息，位置和颜色
        -0.5f,  0.0f,  0,  0,  1,  0,
        0.5f,   0.0f,  0,  0,  0,  1,
        0,      -0.5f,  0,  1,  0,  0,
        -0.5f,  0.0f,  0,  0,  1,  0,
        0.5f,   0.0f,  0,  0,  0,  1,
        
        
    };
    [self bindAttribs:triangleData];
    glDrawArrays(GL_TRIANGLES, 0, 6);
}
- (void)drawTriangleStrip {
    static GLfloat triangleData[] = {
        0,      0.5f,  0,  1,  0,  0, // x, y, z, r, g, b,每一行存储一个点的信息，位置和颜色
        -0.5f,  0.0f,  0,  0,  1,  0,
        0.5f,   0.0f,  0,  0,  0,  1,
        0,      -0.5f,  0,  1,  0,  0,
    };
    [self bindAttribs:triangleData];
    glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
}

- (void)drawTriangleFan {
    static GLfloat triangleData[] = {
        -0.5f,  0.0f,  0,  0,  1,  0,
        0,      0.5f,  0,  1,  0,  0,
        0.5f,   0.0f,  0,  0,  0,  1,
        0,      -0.5f,  0,  1,  0,  0,
    };
    [self bindAttribs:triangleData];
    glDrawArrays(GL_TRIANGLE_FAN, 0, 4);
}

- (void)drawLines {
    static GLfloat lineData[] = {
        0.0f,  0.0f,  0,  0,  1,  0,
        0.5,   0.5f,  0,  1,  0,  0,
        0.0f,  0.0f,  0,  0,  0,  1,
        0.5,   -0.5f, 0,  1,  0,  0,
    };
    [self bindAttribs:lineData];
    glLineWidth(5);
    glDrawArrays(GL_LINES, 0, 4);
}

- (void)drawLinesStrip {
    static GLfloat lineData[] = {
        0.0f,  0.0f,  0,  0,  1,  0,
        0.5,   0.5f,  0,  1,  0,  0,
        0.5,   -0.5f, 0,  1,  0,  0,
    };
    [self bindAttribs:lineData];
    glLineWidth(5);
    glDrawArrays(GL_LINE_STRIP, 0, 3);
}

- (void)drawLinesLoop {
    static GLfloat lineData[] = {
        0.0f,  0.0f,  0,  0,  1,  0,
        0.5,   0.5f,  0,  1,  0,  0,
        0.5,   -0.5f, 0,  1,  0,  0,
    };
    [self bindAttribs:lineData];
    glLineWidth(5);
    glDrawArrays(GL_LINE_LOOP, 0, 3);
}

- (void)drawPoints {
    static GLfloat lineData[] = {
        0.0f,  0.0f,  0,  0,  1,  0,
        0.5,   0.5f,  0,  1,  0,  0,
        0.5,   -0.5f, 0,  1,  0,  0,
    };
    [self bindAttribs:lineData];
    glDrawArrays(GL_POINTS, 0, 3);
}
@end

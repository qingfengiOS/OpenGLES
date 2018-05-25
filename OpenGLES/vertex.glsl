/**
 Shader的变量声明格式为：变量类型 变量数据类型 变量名;
 
 变量类型有三种：
 attribute：就是顶点数据(Vertex Data)包含的属性，位置，颜色或是其他，顶点数据包含多少属性，这里就可以写多少，通过glEnableVertexAttribArray和glVertexAttribPointer激活和传值。
 varying: 传递给Fragment Shader的变量，Fragment Shader是无法直接接受顶点数据的，因为它处理的是像素级别的数据。传递给Fragment Shader的值是根据像素位置插值计算之后的值。
 uniform: 可以理解为全局变量，所有顶点处理程序共享这个变量。
 
 
 
 变量数据类型有：
 vecX: vec开头的有vec2,vec3,vec4,分别代表二维，三维，四维向量。初始化方式分别为，vec2(x,y),vec3(x,y,z),vec4(x,y,z,w)
 float: 浮点数，记住，shader中int是不会自动转换为float的，所有需要使用float的地方必须写成浮点数格式，比如1要写成1.0，0要写成0.0。
 int: 整型
 matX: vec开头的有mat2,mat3,mat4,分别代表二维，三维，四维矩阵。主要用来传递变换矩阵，后面使用到时会介绍。
 */

attribute vec4 position;
attribute vec4 color;

uniform float elapsedTime;

varying vec4 fragColor;

void main(void) {
    fragColor = color;
    float angle = elapsedTime * 1.0;
    float xPos = position.x * cos(angle) - position.y * sin(angle);
    float yPos = position.x * sin(angle) + position.y * cos(angle);
    gl_Position = vec4(xPos, yPos, position.z, 1.0);
}




//attribute vec4 position;
//attribute vec4 color;
//
//varying vec4 fragColor;
//
//void main(void) {
//    fragColor = color;
//    gl_Position = position;
//}


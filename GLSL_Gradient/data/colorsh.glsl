#define PROCESSING_COLOR_SHADER

uniform vec2 resolution;
uniform float time;

void main(void) {
  vec2 uv = gl_FragCoord.xy / resolution.xy;

  float PI = 3.14159;

  
  float r = sin(uv.y*10. + time+PI*.33)*.5+.5;
  float g = sin(uv.y*10. + time+PI*.66)*.5+.5;
  float b = sin(uv.y*10. + time+PI*1.0)*.5+.5;

  gl_FragColor=vec4(r, g, b,1.0);
}

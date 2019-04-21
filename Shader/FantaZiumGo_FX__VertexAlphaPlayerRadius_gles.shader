//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "FantaZiumGo/FX//VertexAlphaPlayerRadius" {
Properties {
_Intensity ("Intensity", Range(0, 1)) = 0.2
_ColorMain ("MainColor", Color) = (1,1,1,1)
_ColorAnim ("AnimColor", Color) = (1,1,1,1)
}
SubShader {
 Tags { "RenderType" = "Transparent" }
 Pass {
  Tags { "RenderType" = "Transparent" }
  GpuProgramID 45374
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying lowp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform lowp float _Intensity;
uniform lowp vec4 _ColorMain;
uniform lowp vec4 _ColorAnim;
varying lowp vec4 xlv_COLOR;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1.xyz = (_ColorAnim * _ColorMain).xyz;
  tmpvar_1.w = (xlv_COLOR.w * _Intensity);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying lowp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform lowp float _Intensity;
uniform lowp vec4 _ColorMain;
uniform lowp vec4 _ColorAnim;
varying lowp vec4 xlv_COLOR;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1.xyz = (_ColorAnim * _ColorMain).xyz;
  tmpvar_1.w = (xlv_COLOR.w * _Intensity);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying lowp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_COLOR = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform lowp float _Intensity;
uniform lowp vec4 _ColorMain;
uniform lowp vec4 _ColorAnim;
varying lowp vec4 xlv_COLOR;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1.xyz = (_ColorAnim * _ColorMain).xyz;
  tmpvar_1.w = (xlv_COLOR.w * _Intensity);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
""
}
SubProgram "gles hw_tier01 " {
""
}
SubProgram "gles hw_tier02 " {
""
}
}
}
}
Fallback "VertexLit"
}
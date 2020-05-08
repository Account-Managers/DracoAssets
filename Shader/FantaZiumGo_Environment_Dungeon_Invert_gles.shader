//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "FantaZiumGo/Environment/Dungeon_Invert" {
Properties {
_OutlineCol ("Outline Color", Color) = (1,1,1,1)
}
SubShader {
 Pass {
  Name "OUTLINE"
  Tags { "RenderType" = "Opaque" }
  ZWrite Off
  Cull Front
  GpuProgramID 13103
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
uniform lowp vec4 _OutlineCol;
varying lowp vec4 xlv_COLOR;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1.xyz = (xlv_COLOR.xyz * _OutlineCol.xyz);
  tmpvar_1.w = xlv_COLOR.w;
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
uniform lowp vec4 _OutlineCol;
varying lowp vec4 xlv_COLOR;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1.xyz = (xlv_COLOR.xyz * _OutlineCol.xyz);
  tmpvar_1.w = xlv_COLOR.w;
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
uniform lowp vec4 _OutlineCol;
varying lowp vec4 xlv_COLOR;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1.xyz = (xlv_COLOR.xyz * _OutlineCol.xyz);
  tmpvar_1.w = xlv_COLOR.w;
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
 GrabPass {
  "_BackgroundTexture"
}
 Pass {
  Name "INVERT"
  Tags { "RenderType" = "Opaque" }
  GpuProgramID 113099
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying lowp vec4 xlv_TEXCOORD;
varying lowp vec4 xlv_COLOR;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_2 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  highp vec4 o_4;
  highp vec4 tmpvar_5;
  tmpvar_5 = (tmpvar_2 * 0.5);
  o_4.xy = (tmpvar_5.xy + tmpvar_5.w);
  o_4.zw = tmpvar_2.zw;
  tmpvar_1 = o_4;
  xlv_TEXCOORD = tmpvar_1;
  gl_Position = tmpvar_2;
  xlv_COLOR = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _BackgroundTexture;
varying lowp vec4 xlv_TEXCOORD;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture2DProj (_BackgroundTexture, xlv_TEXCOORD);
  lowp vec4 tmpvar_2;
  tmpvar_2.x = ((1.0 - tmpvar_1.x) + 0.4);
  tmpvar_2.y = (1.0 - tmpvar_1.y);
  tmpvar_2.z = ((1.0 - tmpvar_1.z) - 0.2);
  tmpvar_2.w = tmpvar_1.w;
  gl_FragData[0] = tmpvar_2;
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
varying lowp vec4 xlv_TEXCOORD;
varying lowp vec4 xlv_COLOR;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_2 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  highp vec4 o_4;
  highp vec4 tmpvar_5;
  tmpvar_5 = (tmpvar_2 * 0.5);
  o_4.xy = (tmpvar_5.xy + tmpvar_5.w);
  o_4.zw = tmpvar_2.zw;
  tmpvar_1 = o_4;
  xlv_TEXCOORD = tmpvar_1;
  gl_Position = tmpvar_2;
  xlv_COLOR = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _BackgroundTexture;
varying lowp vec4 xlv_TEXCOORD;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture2DProj (_BackgroundTexture, xlv_TEXCOORD);
  lowp vec4 tmpvar_2;
  tmpvar_2.x = ((1.0 - tmpvar_1.x) + 0.4);
  tmpvar_2.y = (1.0 - tmpvar_1.y);
  tmpvar_2.z = ((1.0 - tmpvar_1.z) - 0.2);
  tmpvar_2.w = tmpvar_1.w;
  gl_FragData[0] = tmpvar_2;
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
varying lowp vec4 xlv_TEXCOORD;
varying lowp vec4 xlv_COLOR;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_2 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  highp vec4 o_4;
  highp vec4 tmpvar_5;
  tmpvar_5 = (tmpvar_2 * 0.5);
  o_4.xy = (tmpvar_5.xy + tmpvar_5.w);
  o_4.zw = tmpvar_2.zw;
  tmpvar_1 = o_4;
  xlv_TEXCOORD = tmpvar_1;
  gl_Position = tmpvar_2;
  xlv_COLOR = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _BackgroundTexture;
varying lowp vec4 xlv_TEXCOORD;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture2DProj (_BackgroundTexture, xlv_TEXCOORD);
  lowp vec4 tmpvar_2;
  tmpvar_2.x = ((1.0 - tmpvar_1.x) + 0.4);
  tmpvar_2.y = (1.0 - tmpvar_1.y);
  tmpvar_2.z = ((1.0 - tmpvar_1.z) - 0.2);
  tmpvar_2.w = tmpvar_1.w;
  gl_FragData[0] = tmpvar_2;
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
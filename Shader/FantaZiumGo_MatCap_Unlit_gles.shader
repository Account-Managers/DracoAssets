//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "FantaZiumGo/MatCap/Unlit" {
Properties {
_Color ("Main Color", Color) = (1,1,1,1)
_MainTex ("Texture", 2D) = "white" { }
_MatCap ("MatCap (RGB)", 2D) = "grey" { }
_MatCapIn ("Matcap Intensity", Range(1, 10)) = 1.5
}
SubShader {
 LOD 100
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Geometry-1" "RenderType" = "Opaque" }
 Pass {
  LOD 100
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Geometry-1" "RenderType" = "Opaque" }
  Cull Off
  GpuProgramID 14259
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _MainTex_ST;
varying lowp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  lowp vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = tmpvar_1.xyz;
  tmpvar_2 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = _glesNormal;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = normalize((unity_MatrixV * (unity_ObjectToWorld * tmpvar_4)).xyz);
  xlv_TEXCOORD2 = normalize(((unity_MatrixV * unity_ObjectToWorld) * tmpvar_5)).xyz;
}


#endif
#ifdef FRAGMENT
uniform lowp float _MatCapIn;
uniform sampler2D _MainTex;
uniform sampler2D _MatCap;
uniform lowp vec4 _Color;
varying lowp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  highp float m_1;
  mediump vec3 r_2;
  highp vec3 tmpvar_3;
  tmpvar_3 = (xlv_TEXCOORD1 - (2.0 * (
    dot (xlv_TEXCOORD2, xlv_TEXCOORD1)
   * xlv_TEXCOORD2)));
  r_2 = tmpvar_3;
  mediump float tmpvar_4;
  mediump float tmpvar_5;
  tmpvar_5 = (r_2.z + 1.0);
  tmpvar_4 = (2.0 * sqrt((
    ((r_2.x * r_2.x) + (r_2.y * r_2.y))
   + 
    (tmpvar_5 * tmpvar_5)
  )));
  m_1 = tmpvar_4;
  highp vec2 tmpvar_6;
  tmpvar_6 = ((r_2.xy / m_1) + 0.5);
  lowp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = texture2D (_MatCap, tmpvar_6).xyz;
  lowp vec4 tmpvar_8;
  tmpvar_8 = ((texture2D (_MainTex, xlv_TEXCOORD0) * tmpvar_7) * (_MatCapIn * _Color));
  gl_FragData[0] = tmpvar_8;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _MainTex_ST;
varying lowp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  lowp vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = tmpvar_1.xyz;
  tmpvar_2 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = _glesNormal;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = normalize((unity_MatrixV * (unity_ObjectToWorld * tmpvar_4)).xyz);
  xlv_TEXCOORD2 = normalize(((unity_MatrixV * unity_ObjectToWorld) * tmpvar_5)).xyz;
}


#endif
#ifdef FRAGMENT
uniform lowp float _MatCapIn;
uniform sampler2D _MainTex;
uniform sampler2D _MatCap;
uniform lowp vec4 _Color;
varying lowp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  highp float m_1;
  mediump vec3 r_2;
  highp vec3 tmpvar_3;
  tmpvar_3 = (xlv_TEXCOORD1 - (2.0 * (
    dot (xlv_TEXCOORD2, xlv_TEXCOORD1)
   * xlv_TEXCOORD2)));
  r_2 = tmpvar_3;
  mediump float tmpvar_4;
  mediump float tmpvar_5;
  tmpvar_5 = (r_2.z + 1.0);
  tmpvar_4 = (2.0 * sqrt((
    ((r_2.x * r_2.x) + (r_2.y * r_2.y))
   + 
    (tmpvar_5 * tmpvar_5)
  )));
  m_1 = tmpvar_4;
  highp vec2 tmpvar_6;
  tmpvar_6 = ((r_2.xy / m_1) + 0.5);
  lowp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = texture2D (_MatCap, tmpvar_6).xyz;
  lowp vec4 tmpvar_8;
  tmpvar_8 = ((texture2D (_MainTex, xlv_TEXCOORD0) * tmpvar_7) * (_MatCapIn * _Color));
  gl_FragData[0] = tmpvar_8;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _MainTex_ST;
varying lowp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  lowp vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = tmpvar_1.xyz;
  tmpvar_2 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = _glesNormal;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = normalize((unity_MatrixV * (unity_ObjectToWorld * tmpvar_4)).xyz);
  xlv_TEXCOORD2 = normalize(((unity_MatrixV * unity_ObjectToWorld) * tmpvar_5)).xyz;
}


#endif
#ifdef FRAGMENT
uniform lowp float _MatCapIn;
uniform sampler2D _MainTex;
uniform sampler2D _MatCap;
uniform lowp vec4 _Color;
varying lowp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  highp float m_1;
  mediump vec3 r_2;
  highp vec3 tmpvar_3;
  tmpvar_3 = (xlv_TEXCOORD1 - (2.0 * (
    dot (xlv_TEXCOORD2, xlv_TEXCOORD1)
   * xlv_TEXCOORD2)));
  r_2 = tmpvar_3;
  mediump float tmpvar_4;
  mediump float tmpvar_5;
  tmpvar_5 = (r_2.z + 1.0);
  tmpvar_4 = (2.0 * sqrt((
    ((r_2.x * r_2.x) + (r_2.y * r_2.y))
   + 
    (tmpvar_5 * tmpvar_5)
  )));
  m_1 = tmpvar_4;
  highp vec2 tmpvar_6;
  tmpvar_6 = ((r_2.xy / m_1) + 0.5);
  lowp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = texture2D (_MatCap, tmpvar_6).xyz;
  lowp vec4 tmpvar_8;
  tmpvar_8 = ((texture2D (_MainTex, xlv_TEXCOORD0) * tmpvar_7) * (_MatCapIn * _Color));
  gl_FragData[0] = tmpvar_8;
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
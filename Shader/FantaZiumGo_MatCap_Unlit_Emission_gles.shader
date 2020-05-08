//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "FantaZiumGo/MatCap/Unlit_Emission" {
Properties {
_TimeColor ("Main Color", Color) = (1,1,1,1)
_MainTex ("Texture", 2D) = "white" { }
_MatCap ("MatCap (RGB)", 2D) = "white" { }
_EmisIn ("Matcap Intensity", Range(1, 10)) = 1.5
_EmisCol ("Emission Color", Color) = (0,0,0,0)
_EmisMask ("Emission Mask", 2D) = "white" { }
}
SubShader {
 LOD 100
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Geometry-1" "RenderType" = "Opaque" }
 Pass {
  LOD 100
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Geometry-1" "RenderType" = "Opaque" }
  GpuProgramID 5732
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
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform sampler2D _MatCap;
uniform lowp vec4 _EmisCol;
uniform sampler2D _EmisMask;
uniform lowp float _EmisIn;
uniform lowp vec4 _TimeColor;
varying lowp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp float clampedsin_1;
  highp float m_2;
  mediump vec3 r_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = (xlv_TEXCOORD1 - (2.0 * (
    dot (xlv_TEXCOORD2, xlv_TEXCOORD1)
   * xlv_TEXCOORD2)));
  r_3 = tmpvar_4;
  mediump float tmpvar_5;
  mediump float tmpvar_6;
  tmpvar_6 = (r_3.z + 1.0);
  tmpvar_5 = (2.0 * sqrt((
    ((r_3.x * r_3.x) + (r_3.y * r_3.y))
   + 
    (tmpvar_6 * tmpvar_6)
  )));
  m_2 = tmpvar_5;
  highp vec2 tmpvar_7;
  tmpvar_7 = ((r_3.xy / m_2) + 0.5);
  highp float tmpvar_8;
  tmpvar_8 = clamp (sin((_Time * 40.0)), vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0)).x;
  clampedsin_1 = tmpvar_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = (texture2D (_MainTex, xlv_TEXCOORD0) * _TimeColor);
  lowp vec4 tmpvar_10;
  tmpvar_10 = ((tmpvar_9 * (texture2D (_MatCap, tmpvar_7) * _EmisIn)) + ((texture2D (_EmisMask, xlv_TEXCOORD0) * _EmisCol) * (clampedsin_1 * tmpvar_9)));
  gl_FragData[0] = tmpvar_10;
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
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform sampler2D _MatCap;
uniform lowp vec4 _EmisCol;
uniform sampler2D _EmisMask;
uniform lowp float _EmisIn;
uniform lowp vec4 _TimeColor;
varying lowp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp float clampedsin_1;
  highp float m_2;
  mediump vec3 r_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = (xlv_TEXCOORD1 - (2.0 * (
    dot (xlv_TEXCOORD2, xlv_TEXCOORD1)
   * xlv_TEXCOORD2)));
  r_3 = tmpvar_4;
  mediump float tmpvar_5;
  mediump float tmpvar_6;
  tmpvar_6 = (r_3.z + 1.0);
  tmpvar_5 = (2.0 * sqrt((
    ((r_3.x * r_3.x) + (r_3.y * r_3.y))
   + 
    (tmpvar_6 * tmpvar_6)
  )));
  m_2 = tmpvar_5;
  highp vec2 tmpvar_7;
  tmpvar_7 = ((r_3.xy / m_2) + 0.5);
  highp float tmpvar_8;
  tmpvar_8 = clamp (sin((_Time * 40.0)), vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0)).x;
  clampedsin_1 = tmpvar_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = (texture2D (_MainTex, xlv_TEXCOORD0) * _TimeColor);
  lowp vec4 tmpvar_10;
  tmpvar_10 = ((tmpvar_9 * (texture2D (_MatCap, tmpvar_7) * _EmisIn)) + ((texture2D (_EmisMask, xlv_TEXCOORD0) * _EmisCol) * (clampedsin_1 * tmpvar_9)));
  gl_FragData[0] = tmpvar_10;
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
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform sampler2D _MatCap;
uniform lowp vec4 _EmisCol;
uniform sampler2D _EmisMask;
uniform lowp float _EmisIn;
uniform lowp vec4 _TimeColor;
varying lowp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp float clampedsin_1;
  highp float m_2;
  mediump vec3 r_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = (xlv_TEXCOORD1 - (2.0 * (
    dot (xlv_TEXCOORD2, xlv_TEXCOORD1)
   * xlv_TEXCOORD2)));
  r_3 = tmpvar_4;
  mediump float tmpvar_5;
  mediump float tmpvar_6;
  tmpvar_6 = (r_3.z + 1.0);
  tmpvar_5 = (2.0 * sqrt((
    ((r_3.x * r_3.x) + (r_3.y * r_3.y))
   + 
    (tmpvar_6 * tmpvar_6)
  )));
  m_2 = tmpvar_5;
  highp vec2 tmpvar_7;
  tmpvar_7 = ((r_3.xy / m_2) + 0.5);
  highp float tmpvar_8;
  tmpvar_8 = clamp (sin((_Time * 40.0)), vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0)).x;
  clampedsin_1 = tmpvar_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = (texture2D (_MainTex, xlv_TEXCOORD0) * _TimeColor);
  lowp vec4 tmpvar_10;
  tmpvar_10 = ((tmpvar_9 * (texture2D (_MatCap, tmpvar_7) * _EmisIn)) + ((texture2D (_EmisMask, xlv_TEXCOORD0) * _EmisCol) * (clampedsin_1 * tmpvar_9)));
  gl_FragData[0] = tmpvar_10;
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
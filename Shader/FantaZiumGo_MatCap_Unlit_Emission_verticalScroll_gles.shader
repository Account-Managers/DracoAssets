//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "FantaZiumGo/MatCap/Unlit_Emission_verticalScroll" {
Properties {
_TimeColor ("Main Color", Color) = (1,1,1,1)
_MainTex ("Texture", 2D) = "white" { }
[Space(10)] [Header(Matcap)] _MatCap ("MatCap (RGB)", 2D) = "white" { }
_EmisIn ("Matcap Intensity", Range(1, 10)) = 1.5
_EmisCol ("Emission Color", Color) = (0,0,0,0)
_EmisMask ("Emission Mask", 2D) = "white" { }
[Space(10)] [Header(Gradient)] _GradientMap ("GradientMap (RGB)", 2D) = "white" { }
_TexScaleX ("Texture Scale: X", Float) = 1
_TexScaleY ("Texture Scale: Y", Float) = 1
_GradientColor ("Gradient Color", Color) = (1,1,1,1)
_GradientIn ("Gradient Intensity", Range(0, 1)) = 1
_ScrollSpeed ("Scroll Speed", Range(-10, 10)) = 1
}
SubShader {
 LOD 100
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Geometry-1" "RenderType" = "Opaque" }
 Pass {
  LOD 100
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Geometry-1" "RenderType" = "Opaque" }
  GpuProgramID 65085
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
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  lowp vec2 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = normalize(_glesVertex.xyz);
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * tmpvar_5).xyz;
  tmpvar_3 = tmpvar_6;
  tmpvar_2 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = tmpvar_1.xyz;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 0.0;
  tmpvar_8.xyz = _glesNormal;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = normalize((unity_MatrixV * (unity_ObjectToWorld * tmpvar_7)).xyz);
  xlv_TEXCOORD2 = normalize(((unity_MatrixV * unity_ObjectToWorld) * tmpvar_8)).xyz;
  xlv_TEXCOORD3 = tmpvar_3;
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
uniform sampler2D _GradientMap;
uniform highp float _TexScaleX;
uniform highp float _TexScaleY;
uniform lowp vec4 _GradientColor;
uniform highp float _GradientIn;
uniform highp float _ScrollSpeed;
varying lowp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 tmpvar_1;
  lowp float clampedsin_2;
  highp float m_3;
  mediump vec3 r_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = (xlv_TEXCOORD1 - (2.0 * (
    dot (xlv_TEXCOORD2, xlv_TEXCOORD1)
   * xlv_TEXCOORD2)));
  r_4 = tmpvar_5;
  mediump float tmpvar_6;
  mediump float tmpvar_7;
  tmpvar_7 = (r_4.z + 1.0);
  tmpvar_6 = (2.0 * sqrt((
    ((r_4.x * r_4.x) + (r_4.y * r_4.y))
   + 
    (tmpvar_7 * tmpvar_7)
  )));
  m_3 = tmpvar_6;
  highp vec2 tmpvar_8;
  tmpvar_8 = ((r_4.xy / m_3) + 0.5);
  highp float tmpvar_9;
  tmpvar_9 = clamp (sin((_Time * 40.0)), vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0)).x;
  clampedsin_2 = tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = (texture2D (_MainTex, xlv_TEXCOORD0) * _TimeColor);
  highp vec2 tmpvar_11;
  tmpvar_11.x = (xlv_TEXCOORD3.x * _TexScaleX);
  tmpvar_11.y = ((xlv_TEXCOORD3.y * _TexScaleY) + (float(mod ((_Time.y * _ScrollSpeed), 2.0))));
  lowp vec4 tmpvar_12;
  tmpvar_12 = (texture2D (_GradientMap, tmpvar_11) * _GradientColor);
  lowp vec4 tmpvar_13;
  tmpvar_13 = ((tmpvar_10 * (texture2D (_MatCap, tmpvar_8) * _EmisIn)) + ((texture2D (_EmisMask, xlv_TEXCOORD0) * _EmisCol) * (clampedsin_2 * tmpvar_10)));
  highp vec4 tmpvar_14;
  tmpvar_14.xyz = (tmpvar_13.xyz + (tmpvar_12.xyz * _GradientIn));
  tmpvar_14.w = tmpvar_13.w;
  tmpvar_1 = tmpvar_14;
  gl_FragData[0] = tmpvar_1;
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
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  lowp vec2 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = normalize(_glesVertex.xyz);
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * tmpvar_5).xyz;
  tmpvar_3 = tmpvar_6;
  tmpvar_2 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = tmpvar_1.xyz;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 0.0;
  tmpvar_8.xyz = _glesNormal;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = normalize((unity_MatrixV * (unity_ObjectToWorld * tmpvar_7)).xyz);
  xlv_TEXCOORD2 = normalize(((unity_MatrixV * unity_ObjectToWorld) * tmpvar_8)).xyz;
  xlv_TEXCOORD3 = tmpvar_3;
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
uniform sampler2D _GradientMap;
uniform highp float _TexScaleX;
uniform highp float _TexScaleY;
uniform lowp vec4 _GradientColor;
uniform highp float _GradientIn;
uniform highp float _ScrollSpeed;
varying lowp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 tmpvar_1;
  lowp float clampedsin_2;
  highp float m_3;
  mediump vec3 r_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = (xlv_TEXCOORD1 - (2.0 * (
    dot (xlv_TEXCOORD2, xlv_TEXCOORD1)
   * xlv_TEXCOORD2)));
  r_4 = tmpvar_5;
  mediump float tmpvar_6;
  mediump float tmpvar_7;
  tmpvar_7 = (r_4.z + 1.0);
  tmpvar_6 = (2.0 * sqrt((
    ((r_4.x * r_4.x) + (r_4.y * r_4.y))
   + 
    (tmpvar_7 * tmpvar_7)
  )));
  m_3 = tmpvar_6;
  highp vec2 tmpvar_8;
  tmpvar_8 = ((r_4.xy / m_3) + 0.5);
  highp float tmpvar_9;
  tmpvar_9 = clamp (sin((_Time * 40.0)), vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0)).x;
  clampedsin_2 = tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = (texture2D (_MainTex, xlv_TEXCOORD0) * _TimeColor);
  highp vec2 tmpvar_11;
  tmpvar_11.x = (xlv_TEXCOORD3.x * _TexScaleX);
  tmpvar_11.y = ((xlv_TEXCOORD3.y * _TexScaleY) + (float(mod ((_Time.y * _ScrollSpeed), 2.0))));
  lowp vec4 tmpvar_12;
  tmpvar_12 = (texture2D (_GradientMap, tmpvar_11) * _GradientColor);
  lowp vec4 tmpvar_13;
  tmpvar_13 = ((tmpvar_10 * (texture2D (_MatCap, tmpvar_8) * _EmisIn)) + ((texture2D (_EmisMask, xlv_TEXCOORD0) * _EmisCol) * (clampedsin_2 * tmpvar_10)));
  highp vec4 tmpvar_14;
  tmpvar_14.xyz = (tmpvar_13.xyz + (tmpvar_12.xyz * _GradientIn));
  tmpvar_14.w = tmpvar_13.w;
  tmpvar_1 = tmpvar_14;
  gl_FragData[0] = tmpvar_1;
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
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  lowp vec2 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = normalize(_glesVertex.xyz);
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * tmpvar_5).xyz;
  tmpvar_3 = tmpvar_6;
  tmpvar_2 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = tmpvar_1.xyz;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 0.0;
  tmpvar_8.xyz = _glesNormal;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = normalize((unity_MatrixV * (unity_ObjectToWorld * tmpvar_7)).xyz);
  xlv_TEXCOORD2 = normalize(((unity_MatrixV * unity_ObjectToWorld) * tmpvar_8)).xyz;
  xlv_TEXCOORD3 = tmpvar_3;
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
uniform sampler2D _GradientMap;
uniform highp float _TexScaleX;
uniform highp float _TexScaleY;
uniform lowp vec4 _GradientColor;
uniform highp float _GradientIn;
uniform highp float _ScrollSpeed;
varying lowp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 tmpvar_1;
  lowp float clampedsin_2;
  highp float m_3;
  mediump vec3 r_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = (xlv_TEXCOORD1 - (2.0 * (
    dot (xlv_TEXCOORD2, xlv_TEXCOORD1)
   * xlv_TEXCOORD2)));
  r_4 = tmpvar_5;
  mediump float tmpvar_6;
  mediump float tmpvar_7;
  tmpvar_7 = (r_4.z + 1.0);
  tmpvar_6 = (2.0 * sqrt((
    ((r_4.x * r_4.x) + (r_4.y * r_4.y))
   + 
    (tmpvar_7 * tmpvar_7)
  )));
  m_3 = tmpvar_6;
  highp vec2 tmpvar_8;
  tmpvar_8 = ((r_4.xy / m_3) + 0.5);
  highp float tmpvar_9;
  tmpvar_9 = clamp (sin((_Time * 40.0)), vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0)).x;
  clampedsin_2 = tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = (texture2D (_MainTex, xlv_TEXCOORD0) * _TimeColor);
  highp vec2 tmpvar_11;
  tmpvar_11.x = (xlv_TEXCOORD3.x * _TexScaleX);
  tmpvar_11.y = ((xlv_TEXCOORD3.y * _TexScaleY) + (float(mod ((_Time.y * _ScrollSpeed), 2.0))));
  lowp vec4 tmpvar_12;
  tmpvar_12 = (texture2D (_GradientMap, tmpvar_11) * _GradientColor);
  lowp vec4 tmpvar_13;
  tmpvar_13 = ((tmpvar_10 * (texture2D (_MatCap, tmpvar_8) * _EmisIn)) + ((texture2D (_EmisMask, xlv_TEXCOORD0) * _EmisCol) * (clampedsin_2 * tmpvar_10)));
  highp vec4 tmpvar_14;
  tmpvar_14.xyz = (tmpvar_13.xyz + (tmpvar_12.xyz * _GradientIn));
  tmpvar_14.w = tmpvar_13.w;
  tmpvar_1 = tmpvar_14;
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
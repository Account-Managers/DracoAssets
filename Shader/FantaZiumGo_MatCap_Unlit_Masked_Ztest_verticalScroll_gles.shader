//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "FantaZiumGo/MatCap/Unlit_Masked_Ztest_verticalScroll" {
Properties {
_Color ("Main Color", Color) = (1,1,1,1)
_MainTex ("Texture", 2D) = "white" { }
[Space(10)] [Header(Matcap)] _MatCap ("MatCap (RGB)", 2D) = "grey" { }
_MatCapMask ("Texture", 2D) = "white" { }
_MatCapIn ("Matcap Intensity", Range(1, 10)) = 1.5
[Space(10)] [Header(Gradient)] _GradientMap ("GradientMap (RGB)", 2D) = "white" { }
_TexScaleX ("Texture Scale: X", Float) = 1
_TexScaleY ("Texture Scale: Y", Float) = 0.1
_GradientColor ("Gradient Color", Color) = (1,1,1,1)
_GradientIn ("Gradient Intensity", Range(0, 1)) = 1
_ScrollSpeed ("Scroll Speed", Range(-10, 10)) = 1
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "RenderType" = "Geometry" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "RenderType" = "Geometry" }
  ZTest Less
  Offset 0, -1005000
  GpuProgramID 41279
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _MainTex_ST;
varying lowp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 worldNorm_1;
  highp vec2 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (glstate_matrix_projection * _glesVertex).xyz;
  tmpvar_3 = tmpvar_5;
  highp vec4 v_6;
  v_6.x = unity_WorldToObject[0].x;
  v_6.y = unity_WorldToObject[1].x;
  v_6.z = unity_WorldToObject[2].x;
  v_6.w = unity_WorldToObject[3].x;
  highp vec4 v_7;
  v_7.x = unity_WorldToObject[0].y;
  v_7.y = unity_WorldToObject[1].y;
  v_7.z = unity_WorldToObject[2].y;
  v_7.w = unity_WorldToObject[3].y;
  highp vec4 v_8;
  v_8.x = unity_WorldToObject[0].z;
  v_8.y = unity_WorldToObject[1].z;
  v_8.z = unity_WorldToObject[2].z;
  v_8.w = unity_WorldToObject[3].z;
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_MatrixV[0].xyz;
  tmpvar_9[1] = unity_MatrixV[1].xyz;
  tmpvar_9[2] = unity_MatrixV[2].xyz;
  worldNorm_1 = (tmpvar_9 * normalize((
    ((v_6.xyz * _glesNormal.x) + (v_7.xyz * _glesNormal.y))
   + 
    (v_8.xyz * _glesNormal.z)
  )));
  tmpvar_2 = ((worldNorm_1.xy * 0.4) + 0.5);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD3 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform lowp float _MatCapIn;
uniform sampler2D _MainTex;
uniform sampler2D _MatCap;
uniform sampler2D _MatCapMask;
uniform lowp vec4 _Color;
uniform sampler2D _GradientMap;
uniform highp float _TexScaleX;
uniform highp float _TexScaleY;
uniform lowp vec4 _GradientColor;
uniform highp float _GradientIn;
uniform highp float _ScrollSpeed;
varying lowp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec2 tmpvar_2;
  highp float tmpvar_3;
  tmpvar_3 = (xlv_TEXCOORD3.x * _TexScaleX);
  tmpvar_2.x = tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = (_Time.y * _ScrollSpeed);
  highp float tmpvar_5;
  tmpvar_5 = (xlv_TEXCOORD3.y * _TexScaleY);
  tmpvar_2.y = (tmpvar_5 + (float(mod (tmpvar_4, 2.0))));
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_GradientMap, tmpvar_2);
  lowp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = texture2D (_MatCap, xlv_TEXCOORD1).xyz;
  lowp vec4 tmpvar_8;
  tmpvar_8 = ((texture2D (_MainTex, xlv_TEXCOORD0) * tmpvar_7) * ((texture2D (_MatCapMask, xlv_TEXCOORD0) * _MatCapIn) * _Color));
  highp vec2 tmpvar_9;
  tmpvar_9.x = tmpvar_3;
  tmpvar_9.y = (tmpvar_5 + (float(mod (tmpvar_4, 2.0))));
  lowp vec4 tmpvar_10;
  tmpvar_10 = (texture2D (_GradientMap, tmpvar_9) * _GradientColor);
  highp vec4 tmpvar_11;
  tmpvar_11.xyz = ((tmpvar_8.xyz * (1.0 - 
    (tmpvar_6 * _GradientIn)
  ).xyz) + ((tmpvar_10.xyz * _GradientIn) * 2.0));
  tmpvar_11.w = tmpvar_8.w;
  tmpvar_1 = tmpvar_11;
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
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _MainTex_ST;
varying lowp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 worldNorm_1;
  highp vec2 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (glstate_matrix_projection * _glesVertex).xyz;
  tmpvar_3 = tmpvar_5;
  highp vec4 v_6;
  v_6.x = unity_WorldToObject[0].x;
  v_6.y = unity_WorldToObject[1].x;
  v_6.z = unity_WorldToObject[2].x;
  v_6.w = unity_WorldToObject[3].x;
  highp vec4 v_7;
  v_7.x = unity_WorldToObject[0].y;
  v_7.y = unity_WorldToObject[1].y;
  v_7.z = unity_WorldToObject[2].y;
  v_7.w = unity_WorldToObject[3].y;
  highp vec4 v_8;
  v_8.x = unity_WorldToObject[0].z;
  v_8.y = unity_WorldToObject[1].z;
  v_8.z = unity_WorldToObject[2].z;
  v_8.w = unity_WorldToObject[3].z;
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_MatrixV[0].xyz;
  tmpvar_9[1] = unity_MatrixV[1].xyz;
  tmpvar_9[2] = unity_MatrixV[2].xyz;
  worldNorm_1 = (tmpvar_9 * normalize((
    ((v_6.xyz * _glesNormal.x) + (v_7.xyz * _glesNormal.y))
   + 
    (v_8.xyz * _glesNormal.z)
  )));
  tmpvar_2 = ((worldNorm_1.xy * 0.4) + 0.5);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD3 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform lowp float _MatCapIn;
uniform sampler2D _MainTex;
uniform sampler2D _MatCap;
uniform sampler2D _MatCapMask;
uniform lowp vec4 _Color;
uniform sampler2D _GradientMap;
uniform highp float _TexScaleX;
uniform highp float _TexScaleY;
uniform lowp vec4 _GradientColor;
uniform highp float _GradientIn;
uniform highp float _ScrollSpeed;
varying lowp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec2 tmpvar_2;
  highp float tmpvar_3;
  tmpvar_3 = (xlv_TEXCOORD3.x * _TexScaleX);
  tmpvar_2.x = tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = (_Time.y * _ScrollSpeed);
  highp float tmpvar_5;
  tmpvar_5 = (xlv_TEXCOORD3.y * _TexScaleY);
  tmpvar_2.y = (tmpvar_5 + (float(mod (tmpvar_4, 2.0))));
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_GradientMap, tmpvar_2);
  lowp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = texture2D (_MatCap, xlv_TEXCOORD1).xyz;
  lowp vec4 tmpvar_8;
  tmpvar_8 = ((texture2D (_MainTex, xlv_TEXCOORD0) * tmpvar_7) * ((texture2D (_MatCapMask, xlv_TEXCOORD0) * _MatCapIn) * _Color));
  highp vec2 tmpvar_9;
  tmpvar_9.x = tmpvar_3;
  tmpvar_9.y = (tmpvar_5 + (float(mod (tmpvar_4, 2.0))));
  lowp vec4 tmpvar_10;
  tmpvar_10 = (texture2D (_GradientMap, tmpvar_9) * _GradientColor);
  highp vec4 tmpvar_11;
  tmpvar_11.xyz = ((tmpvar_8.xyz * (1.0 - 
    (tmpvar_6 * _GradientIn)
  ).xyz) + ((tmpvar_10.xyz * _GradientIn) * 2.0));
  tmpvar_11.w = tmpvar_8.w;
  tmpvar_1 = tmpvar_11;
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
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _MainTex_ST;
varying lowp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 worldNorm_1;
  highp vec2 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (glstate_matrix_projection * _glesVertex).xyz;
  tmpvar_3 = tmpvar_5;
  highp vec4 v_6;
  v_6.x = unity_WorldToObject[0].x;
  v_6.y = unity_WorldToObject[1].x;
  v_6.z = unity_WorldToObject[2].x;
  v_6.w = unity_WorldToObject[3].x;
  highp vec4 v_7;
  v_7.x = unity_WorldToObject[0].y;
  v_7.y = unity_WorldToObject[1].y;
  v_7.z = unity_WorldToObject[2].y;
  v_7.w = unity_WorldToObject[3].y;
  highp vec4 v_8;
  v_8.x = unity_WorldToObject[0].z;
  v_8.y = unity_WorldToObject[1].z;
  v_8.z = unity_WorldToObject[2].z;
  v_8.w = unity_WorldToObject[3].z;
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_MatrixV[0].xyz;
  tmpvar_9[1] = unity_MatrixV[1].xyz;
  tmpvar_9[2] = unity_MatrixV[2].xyz;
  worldNorm_1 = (tmpvar_9 * normalize((
    ((v_6.xyz * _glesNormal.x) + (v_7.xyz * _glesNormal.y))
   + 
    (v_8.xyz * _glesNormal.z)
  )));
  tmpvar_2 = ((worldNorm_1.xy * 0.4) + 0.5);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD3 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform lowp float _MatCapIn;
uniform sampler2D _MainTex;
uniform sampler2D _MatCap;
uniform sampler2D _MatCapMask;
uniform lowp vec4 _Color;
uniform sampler2D _GradientMap;
uniform highp float _TexScaleX;
uniform highp float _TexScaleY;
uniform lowp vec4 _GradientColor;
uniform highp float _GradientIn;
uniform highp float _ScrollSpeed;
varying lowp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec2 tmpvar_2;
  highp float tmpvar_3;
  tmpvar_3 = (xlv_TEXCOORD3.x * _TexScaleX);
  tmpvar_2.x = tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = (_Time.y * _ScrollSpeed);
  highp float tmpvar_5;
  tmpvar_5 = (xlv_TEXCOORD3.y * _TexScaleY);
  tmpvar_2.y = (tmpvar_5 + (float(mod (tmpvar_4, 2.0))));
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_GradientMap, tmpvar_2);
  lowp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = texture2D (_MatCap, xlv_TEXCOORD1).xyz;
  lowp vec4 tmpvar_8;
  tmpvar_8 = ((texture2D (_MainTex, xlv_TEXCOORD0) * tmpvar_7) * ((texture2D (_MatCapMask, xlv_TEXCOORD0) * _MatCapIn) * _Color));
  highp vec2 tmpvar_9;
  tmpvar_9.x = tmpvar_3;
  tmpvar_9.y = (tmpvar_5 + (float(mod (tmpvar_4, 2.0))));
  lowp vec4 tmpvar_10;
  tmpvar_10 = (texture2D (_GradientMap, tmpvar_9) * _GradientColor);
  highp vec4 tmpvar_11;
  tmpvar_11.xyz = ((tmpvar_8.xyz * (1.0 - 
    (tmpvar_6 * _GradientIn)
  ).xyz) + ((tmpvar_10.xyz * _GradientIn) * 2.0));
  tmpvar_11.w = tmpvar_8.w;
  tmpvar_1 = tmpvar_11;
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
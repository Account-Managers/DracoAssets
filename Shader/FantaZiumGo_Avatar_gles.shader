//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "FantaZiumGo/Avatar" {
Properties {
_MainTex ("Main_texture (lightmap)", 2D) = "white" { }
_MatCap ("MatCap (RGB)", 2D) = "grey" { }
_MatCapIn ("Matcap Intensity", Range(1, 2)) = 2
[Header(BODY)] _BodyMask ("Body Mask", 2D) = "black" { }
_SkinColor ("Skin Color", Color) = (0.5,0.5,0.5,1)
_HairColor ("Hair Color", Color) = (0.5,0.5,0.5,1)
_EyesColor ("Eyes Color", Color) = (0.5,0.5,0.5,1)
[Header(CLOTHES)] _ClothesMask ("Clothes Mask", 2D) = "black" { }
_JacketStyle ("Top texture", 2D) = "white" { }
_TrousersStyle ("Pants texture", 2D) = "white" { }
_ShoesStyle ("Shoes texture", 2D) = "white" { }
_BackpackStyle ("Backpack texture", 2D) = "white" { }
}
SubShader {
 LOD 100
 Tags { "RenderType" = "Opaque" }
 Pass {
  LOD 100
  Tags { "RenderType" = "Opaque" }
  GpuProgramID 21533
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = tmpvar_1.xyz;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = tmpvar_1.xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = _glesNormal;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = _glesMultiTexCoord1.xy;
  xlv_TEXCOORD3 = normalize((unity_MatrixV * (unity_ObjectToWorld * tmpvar_3)).xyz);
  xlv_TEXCOORD2 = normalize(((unity_MatrixV * unity_ObjectToWorld) * tmpvar_4)).xyz;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _MatCap;
uniform lowp float _MatCapIn;
uniform sampler2D _ClothesMask;
uniform sampler2D _BodyMask;
uniform lowp vec4 _SkinColor;
uniform lowp vec4 _EyesColor;
uniform lowp vec4 _HairColor;
uniform sampler2D _JacketStyle;
uniform sampler2D _TrousersStyle;
uniform sampler2D _ShoesStyle;
uniform sampler2D _BackpackStyle;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  highp float m_1;
  mediump vec3 r_2;
  highp vec3 tmpvar_3;
  tmpvar_3 = (xlv_TEXCOORD3 - (2.0 * (
    dot (xlv_TEXCOORD2, xlv_TEXCOORD3)
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
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD1);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_ClothesMask, xlv_TEXCOORD1);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_BodyMask, xlv_TEXCOORD1);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_BodyMask, xlv_TEXCOORD0);
  lowp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _EyesColor.xyz;
  lowp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = texture2D (_MatCap, tmpvar_6).xyz;
  lowp vec4 tmpvar_13;
  tmpvar_13 = mix (((
    ((((
      (tmpvar_8.x * texture2D (_JacketStyle, xlv_TEXCOORD0))
     + 
      (tmpvar_8.y * texture2D (_TrousersStyle, xlv_TEXCOORD0))
    ) + (tmpvar_8.z * texture2D (_ShoesStyle, xlv_TEXCOORD0))) + (tmpvar_8.w * texture2D (_BackpackStyle, xlv_TEXCOORD0))) + (tmpvar_9.y * _HairColor))
   * 
    (tmpvar_7 * (tmpvar_12 * _MatCapIn))
  ) + (
    (tmpvar_9.x * _SkinColor)
   * tmpvar_7)), mix (tmpvar_7, (
    ((tmpvar_9.z + tmpvar_10.w) * texture2D (_MatCap, xlv_TEXCOORD0).w)
   * tmpvar_11), tmpvar_10.wwww), tmpvar_9.zzzz);
  gl_FragData[0] = tmpvar_13;
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
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = tmpvar_1.xyz;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = tmpvar_1.xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = _glesNormal;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = _glesMultiTexCoord1.xy;
  xlv_TEXCOORD3 = normalize((unity_MatrixV * (unity_ObjectToWorld * tmpvar_3)).xyz);
  xlv_TEXCOORD2 = normalize(((unity_MatrixV * unity_ObjectToWorld) * tmpvar_4)).xyz;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _MatCap;
uniform lowp float _MatCapIn;
uniform sampler2D _ClothesMask;
uniform sampler2D _BodyMask;
uniform lowp vec4 _SkinColor;
uniform lowp vec4 _EyesColor;
uniform lowp vec4 _HairColor;
uniform sampler2D _JacketStyle;
uniform sampler2D _TrousersStyle;
uniform sampler2D _ShoesStyle;
uniform sampler2D _BackpackStyle;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  highp float m_1;
  mediump vec3 r_2;
  highp vec3 tmpvar_3;
  tmpvar_3 = (xlv_TEXCOORD3 - (2.0 * (
    dot (xlv_TEXCOORD2, xlv_TEXCOORD3)
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
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD1);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_ClothesMask, xlv_TEXCOORD1);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_BodyMask, xlv_TEXCOORD1);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_BodyMask, xlv_TEXCOORD0);
  lowp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _EyesColor.xyz;
  lowp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = texture2D (_MatCap, tmpvar_6).xyz;
  lowp vec4 tmpvar_13;
  tmpvar_13 = mix (((
    ((((
      (tmpvar_8.x * texture2D (_JacketStyle, xlv_TEXCOORD0))
     + 
      (tmpvar_8.y * texture2D (_TrousersStyle, xlv_TEXCOORD0))
    ) + (tmpvar_8.z * texture2D (_ShoesStyle, xlv_TEXCOORD0))) + (tmpvar_8.w * texture2D (_BackpackStyle, xlv_TEXCOORD0))) + (tmpvar_9.y * _HairColor))
   * 
    (tmpvar_7 * (tmpvar_12 * _MatCapIn))
  ) + (
    (tmpvar_9.x * _SkinColor)
   * tmpvar_7)), mix (tmpvar_7, (
    ((tmpvar_9.z + tmpvar_10.w) * texture2D (_MatCap, xlv_TEXCOORD0).w)
   * tmpvar_11), tmpvar_10.wwww), tmpvar_9.zzzz);
  gl_FragData[0] = tmpvar_13;
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
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = tmpvar_1.xyz;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = tmpvar_1.xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = _glesNormal;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = _glesMultiTexCoord1.xy;
  xlv_TEXCOORD3 = normalize((unity_MatrixV * (unity_ObjectToWorld * tmpvar_3)).xyz);
  xlv_TEXCOORD2 = normalize(((unity_MatrixV * unity_ObjectToWorld) * tmpvar_4)).xyz;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _MatCap;
uniform lowp float _MatCapIn;
uniform sampler2D _ClothesMask;
uniform sampler2D _BodyMask;
uniform lowp vec4 _SkinColor;
uniform lowp vec4 _EyesColor;
uniform lowp vec4 _HairColor;
uniform sampler2D _JacketStyle;
uniform sampler2D _TrousersStyle;
uniform sampler2D _ShoesStyle;
uniform sampler2D _BackpackStyle;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  highp float m_1;
  mediump vec3 r_2;
  highp vec3 tmpvar_3;
  tmpvar_3 = (xlv_TEXCOORD3 - (2.0 * (
    dot (xlv_TEXCOORD2, xlv_TEXCOORD3)
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
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD1);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_ClothesMask, xlv_TEXCOORD1);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_BodyMask, xlv_TEXCOORD1);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_BodyMask, xlv_TEXCOORD0);
  lowp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _EyesColor.xyz;
  lowp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = texture2D (_MatCap, tmpvar_6).xyz;
  lowp vec4 tmpvar_13;
  tmpvar_13 = mix (((
    ((((
      (tmpvar_8.x * texture2D (_JacketStyle, xlv_TEXCOORD0))
     + 
      (tmpvar_8.y * texture2D (_TrousersStyle, xlv_TEXCOORD0))
    ) + (tmpvar_8.z * texture2D (_ShoesStyle, xlv_TEXCOORD0))) + (tmpvar_8.w * texture2D (_BackpackStyle, xlv_TEXCOORD0))) + (tmpvar_9.y * _HairColor))
   * 
    (tmpvar_7 * (tmpvar_12 * _MatCapIn))
  ) + (
    (tmpvar_9.x * _SkinColor)
   * tmpvar_7)), mix (tmpvar_7, (
    ((tmpvar_9.z + tmpvar_10.w) * texture2D (_MatCap, xlv_TEXCOORD0).w)
   * tmpvar_11), tmpvar_10.wwww), tmpvar_9.zzzz);
  gl_FragData[0] = tmpvar_13;
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
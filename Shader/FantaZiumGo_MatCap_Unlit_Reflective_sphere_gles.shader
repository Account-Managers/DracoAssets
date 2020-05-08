//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "FantaZiumGo/MatCap/Unlit_Reflective_sphere" {
Properties {
_Color ("Main Color", Color) = (1,1,1,1)
_BallTex ("Ball (RGB)", 2D) = "white" { }
}
SubShader {
 LOD 250
 Tags { "RenderType" = "Opaque" }
 Pass {
  Name "BASE"
  LOD 250
  Tags { "LIGHTMODE" = "ALWAYS" "RenderType" = "Opaque" }
  GpuProgramID 2908
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
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
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
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((unity_MatrixV * (unity_ObjectToWorld * tmpvar_3)).xyz);
  xlv_TEXCOORD2 = normalize(((unity_MatrixV * unity_ObjectToWorld) * tmpvar_4)).xyz;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _BallTex;
uniform lowp vec4 _Color;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 refl_2;
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
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_BallTex, tmpvar_8);
  refl_2 = tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10 = pow (refl_2, vec4(5.0, 5.0, 5.0, 5.0));
  tmpvar_1 = (tmpvar_10 + _Color);
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
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
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
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((unity_MatrixV * (unity_ObjectToWorld * tmpvar_3)).xyz);
  xlv_TEXCOORD2 = normalize(((unity_MatrixV * unity_ObjectToWorld) * tmpvar_4)).xyz;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _BallTex;
uniform lowp vec4 _Color;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 refl_2;
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
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_BallTex, tmpvar_8);
  refl_2 = tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10 = pow (refl_2, vec4(5.0, 5.0, 5.0, 5.0));
  tmpvar_1 = (tmpvar_10 + _Color);
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
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
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
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((unity_MatrixV * (unity_ObjectToWorld * tmpvar_3)).xyz);
  xlv_TEXCOORD2 = normalize(((unity_MatrixV * unity_ObjectToWorld) * tmpvar_4)).xyz;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _BallTex;
uniform lowp vec4 _Color;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 refl_2;
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
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_BallTex, tmpvar_8);
  refl_2 = tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10 = pow (refl_2, vec4(5.0, 5.0, 5.0, 5.0));
  tmpvar_1 = (tmpvar_10 + _Color);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD6;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = tmpvar_1.xyz;
  tmpvar_2 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = _glesNormal;
  gl_Position = tmpvar_2;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((unity_MatrixV * (unity_ObjectToWorld * tmpvar_4)).xyz);
  xlv_TEXCOORD2 = normalize(((unity_MatrixV * unity_ObjectToWorld) * tmpvar_5)).xyz;
  xlv_TEXCOORD6 = ((tmpvar_2.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _BallTex;
uniform lowp vec4 _Color;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 refl_2;
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
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_BallTex, tmpvar_8);
  refl_2 = tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10 = pow (refl_2, vec4(5.0, 5.0, 5.0, 5.0));
  tmpvar_1 = (tmpvar_10 + _Color);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD6;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = tmpvar_1.xyz;
  tmpvar_2 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = _glesNormal;
  gl_Position = tmpvar_2;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((unity_MatrixV * (unity_ObjectToWorld * tmpvar_4)).xyz);
  xlv_TEXCOORD2 = normalize(((unity_MatrixV * unity_ObjectToWorld) * tmpvar_5)).xyz;
  xlv_TEXCOORD6 = ((tmpvar_2.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _BallTex;
uniform lowp vec4 _Color;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 refl_2;
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
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_BallTex, tmpvar_8);
  refl_2 = tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10 = pow (refl_2, vec4(5.0, 5.0, 5.0, 5.0));
  tmpvar_1 = (tmpvar_10 + _Color);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp float xlv_TEXCOORD6;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = tmpvar_1.xyz;
  tmpvar_2 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = _glesNormal;
  gl_Position = tmpvar_2;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize((unity_MatrixV * (unity_ObjectToWorld * tmpvar_4)).xyz);
  xlv_TEXCOORD2 = normalize(((unity_MatrixV * unity_ObjectToWorld) * tmpvar_5)).xyz;
  xlv_TEXCOORD6 = ((tmpvar_2.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _BallTex;
uniform lowp vec4 _Color;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 refl_2;
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
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_BallTex, tmpvar_8);
  refl_2 = tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10 = pow (refl_2, vec4(5.0, 5.0, 5.0, 5.0));
  tmpvar_1 = (tmpvar_10 + _Color);
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
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" }
""
}
}
}
}
}
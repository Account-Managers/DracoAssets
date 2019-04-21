//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "FantaZiumGo/Fresnel/Fresnel_worldSpace_Water" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
_WigTex ("Wiggle", 2D) = "white" { }
_TexScale ("texture scale", Float) = 1
_MainCol ("Main Color", Color) = (0,0,0,0)
_WaveCol ("Wave Color", Color) = (1,1,1,1)
_FresCol ("Fresnel Color", Color) = (0,0,0,0)
_Fade ("FadeFactor", Range(0, 0.2)) = 0.2
_WaveDecay ("Wave Decay", Range(0, 1)) = 1
_FresnelPower ("Fresnel power", Range(-10, 10)) = 1
_Freq ("Frequency", Range(-10, 10)) = 1
_Amp ("Amplitude", Range(-1000, 1000)) = 1
}
SubShader {
 LOD 100
 Tags { "IGNOREPROJECTOR" = "False" "RenderType" = "Opaque" }
 Pass {
  LOD 100
  Tags { "IGNOREPROJECTOR" = "False" "RenderType" = "Opaque" }
  GpuProgramID 19498
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_3 = tmpvar_4.xyz;
  tmpvar_1 = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD4 = tmpvar_1;
  xlv_TEXCOORD2 = (_WorldSpaceCameraPos - tmpvar_4.xyz);
  xlv_TEXCOORD3 = _glesNormal;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform sampler2D _WigTex;
uniform highp float _TexScale;
uniform lowp vec4 _MainCol;
uniform lowp vec4 _WaveCol;
uniform lowp vec4 _FresCol;
uniform highp float _Fade;
uniform highp float _WaveDecay;
uniform highp float _Freq;
uniform highp float _Amp;
uniform highp float _FresnelPower;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  highp vec2 P_3;
  P_3 = (xlv_TEXCOORD0 / _TexScale);
  tmpvar_2 = texture2D (_WigTex, P_3);
  highp vec2 tmpvar_4;
  tmpvar_4.x = -(xlv_TEXCOORD0.y);
  tmpvar_4.y = -(xlv_TEXCOORD0.x);
  highp vec2 P_5;
  P_5 = (((xlv_TEXCOORD0 + 
    (tmpvar_2 * _Amp)
  .xy) + (
    sin((_Time * _Freq))
   * 200.0).xy) / _TexScale);
  lowp vec4 tmpvar_6;
  tmpvar_6 = (texture2D (_MainTex, P_5) * _WaveCol);
  highp vec2 P_7;
  P_7 = (((tmpvar_4 + 
    (tmpvar_2 * _Amp)
  .xy) - (
    sin(((_Time + 25.0) * _Freq))
   * 200.0).xy) / _TexScale);
  lowp vec4 tmpvar_8;
  tmpvar_8 = (texture2D (_MainTex, P_7) * _WaveCol);
  highp vec4 tmpvar_9;
  tmpvar_9 = mix (_MainCol, _FresCol, vec4(pow (clamp (
    (1.0 - max (dot (normalize(xlv_TEXCOORD2), normalize(xlv_TEXCOORD3)), 0.0))
  , 0.0, 1.0), _FresnelPower)));
  highp vec4 tmpvar_10;
  tmpvar_10 = (((
    (((_MainCol + (tmpvar_6 * _WaveDecay)) + (tmpvar_8 * _WaveDecay)) * 5.0)
   * _Fade) * (vec4(
    (1.0 - tmpvar_9.z)
  ) * _Fade)) + tmpvar_9);
  tmpvar_1 = tmpvar_10;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_3 = tmpvar_4.xyz;
  tmpvar_1 = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD4 = tmpvar_1;
  xlv_TEXCOORD2 = (_WorldSpaceCameraPos - tmpvar_4.xyz);
  xlv_TEXCOORD3 = _glesNormal;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform sampler2D _WigTex;
uniform highp float _TexScale;
uniform lowp vec4 _MainCol;
uniform lowp vec4 _WaveCol;
uniform lowp vec4 _FresCol;
uniform highp float _Fade;
uniform highp float _WaveDecay;
uniform highp float _Freq;
uniform highp float _Amp;
uniform highp float _FresnelPower;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  highp vec2 P_3;
  P_3 = (xlv_TEXCOORD0 / _TexScale);
  tmpvar_2 = texture2D (_WigTex, P_3);
  highp vec2 tmpvar_4;
  tmpvar_4.x = -(xlv_TEXCOORD0.y);
  tmpvar_4.y = -(xlv_TEXCOORD0.x);
  highp vec2 P_5;
  P_5 = (((xlv_TEXCOORD0 + 
    (tmpvar_2 * _Amp)
  .xy) + (
    sin((_Time * _Freq))
   * 200.0).xy) / _TexScale);
  lowp vec4 tmpvar_6;
  tmpvar_6 = (texture2D (_MainTex, P_5) * _WaveCol);
  highp vec2 P_7;
  P_7 = (((tmpvar_4 + 
    (tmpvar_2 * _Amp)
  .xy) - (
    sin(((_Time + 25.0) * _Freq))
   * 200.0).xy) / _TexScale);
  lowp vec4 tmpvar_8;
  tmpvar_8 = (texture2D (_MainTex, P_7) * _WaveCol);
  highp vec4 tmpvar_9;
  tmpvar_9 = mix (_MainCol, _FresCol, vec4(pow (clamp (
    (1.0 - max (dot (normalize(xlv_TEXCOORD2), normalize(xlv_TEXCOORD3)), 0.0))
  , 0.0, 1.0), _FresnelPower)));
  highp vec4 tmpvar_10;
  tmpvar_10 = (((
    (((_MainCol + (tmpvar_6 * _WaveDecay)) + (tmpvar_8 * _WaveDecay)) * 5.0)
   * _Fade) * (vec4(
    (1.0 - tmpvar_9.z)
  ) * _Fade)) + tmpvar_9);
  tmpvar_1 = tmpvar_10;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_3 = tmpvar_4.xyz;
  tmpvar_1 = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD4 = tmpvar_1;
  xlv_TEXCOORD2 = (_WorldSpaceCameraPos - tmpvar_4.xyz);
  xlv_TEXCOORD3 = _glesNormal;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform sampler2D _WigTex;
uniform highp float _TexScale;
uniform lowp vec4 _MainCol;
uniform lowp vec4 _WaveCol;
uniform lowp vec4 _FresCol;
uniform highp float _Fade;
uniform highp float _WaveDecay;
uniform highp float _Freq;
uniform highp float _Amp;
uniform highp float _FresnelPower;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  highp vec2 P_3;
  P_3 = (xlv_TEXCOORD0 / _TexScale);
  tmpvar_2 = texture2D (_WigTex, P_3);
  highp vec2 tmpvar_4;
  tmpvar_4.x = -(xlv_TEXCOORD0.y);
  tmpvar_4.y = -(xlv_TEXCOORD0.x);
  highp vec2 P_5;
  P_5 = (((xlv_TEXCOORD0 + 
    (tmpvar_2 * _Amp)
  .xy) + (
    sin((_Time * _Freq))
   * 200.0).xy) / _TexScale);
  lowp vec4 tmpvar_6;
  tmpvar_6 = (texture2D (_MainTex, P_5) * _WaveCol);
  highp vec2 P_7;
  P_7 = (((tmpvar_4 + 
    (tmpvar_2 * _Amp)
  .xy) - (
    sin(((_Time + 25.0) * _Freq))
   * 200.0).xy) / _TexScale);
  lowp vec4 tmpvar_8;
  tmpvar_8 = (texture2D (_MainTex, P_7) * _WaveCol);
  highp vec4 tmpvar_9;
  tmpvar_9 = mix (_MainCol, _FresCol, vec4(pow (clamp (
    (1.0 - max (dot (normalize(xlv_TEXCOORD2), normalize(xlv_TEXCOORD3)), 0.0))
  , 0.0, 1.0), _FresnelPower)));
  highp vec4 tmpvar_10;
  tmpvar_10 = (((
    (((_MainCol + (tmpvar_6 * _WaveDecay)) + (tmpvar_8 * _WaveDecay)) * 5.0)
   * _Fade) * (vec4(
    (1.0 - tmpvar_9.z)
  ) * _Fade)) + tmpvar_9);
  tmpvar_1 = tmpvar_10;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform lowp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD1;
void main ()
{
  lowp vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_2 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  highp vec3 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_4 = tmpvar_5.xyz;
  tmpvar_1 = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD4 = tmpvar_1;
  xlv_TEXCOORD2 = (_WorldSpaceCameraPos - tmpvar_5.xyz);
  xlv_TEXCOORD3 = _glesNormal;
  xlv_TEXCOORD1 = ((tmpvar_2.z * unity_FogParams.z) + unity_FogParams.w);
  gl_Position = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform sampler2D _WigTex;
uniform highp float _TexScale;
uniform lowp vec4 _MainCol;
uniform lowp vec4 _WaveCol;
uniform lowp vec4 _FresCol;
uniform highp float _Fade;
uniform highp float _WaveDecay;
uniform highp float _Freq;
uniform highp float _Amp;
uniform highp float _FresnelPower;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 result_2;
  lowp vec4 tmpvar_3;
  highp vec2 P_4;
  P_4 = (xlv_TEXCOORD0 / _TexScale);
  tmpvar_3 = texture2D (_WigTex, P_4);
  highp vec2 tmpvar_5;
  tmpvar_5.x = -(xlv_TEXCOORD0.y);
  tmpvar_5.y = -(xlv_TEXCOORD0.x);
  highp vec2 P_6;
  P_6 = (((xlv_TEXCOORD0 + 
    (tmpvar_3 * _Amp)
  .xy) + (
    sin((_Time * _Freq))
   * 200.0).xy) / _TexScale);
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, P_6) * _WaveCol);
  highp vec2 P_8;
  P_8 = (((tmpvar_5 + 
    (tmpvar_3 * _Amp)
  .xy) - (
    sin(((_Time + 25.0) * _Freq))
   * 200.0).xy) / _TexScale);
  lowp vec4 tmpvar_9;
  tmpvar_9 = (texture2D (_MainTex, P_8) * _WaveCol);
  highp vec4 tmpvar_10;
  tmpvar_10 = mix (_MainCol, _FresCol, vec4(pow (clamp (
    (1.0 - max (dot (normalize(xlv_TEXCOORD2), normalize(xlv_TEXCOORD3)), 0.0))
  , 0.0, 1.0), _FresnelPower)));
  highp vec4 tmpvar_11;
  tmpvar_11 = (((
    (((_MainCol + (tmpvar_7 * _WaveDecay)) + (tmpvar_9 * _WaveDecay)) * 5.0)
   * _Fade) * (vec4(
    (1.0 - tmpvar_10.z)
  ) * _Fade)) + tmpvar_10);
  result_2.w = tmpvar_11.w;
  result_2.xyz = mix (unity_FogColor.xyz, tmpvar_11.xyz, vec3(clamp (xlv_TEXCOORD1, 0.0, 1.0)));
  tmpvar_1 = result_2;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform lowp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD1;
void main ()
{
  lowp vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_2 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  highp vec3 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_4 = tmpvar_5.xyz;
  tmpvar_1 = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD4 = tmpvar_1;
  xlv_TEXCOORD2 = (_WorldSpaceCameraPos - tmpvar_5.xyz);
  xlv_TEXCOORD3 = _glesNormal;
  xlv_TEXCOORD1 = ((tmpvar_2.z * unity_FogParams.z) + unity_FogParams.w);
  gl_Position = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform sampler2D _WigTex;
uniform highp float _TexScale;
uniform lowp vec4 _MainCol;
uniform lowp vec4 _WaveCol;
uniform lowp vec4 _FresCol;
uniform highp float _Fade;
uniform highp float _WaveDecay;
uniform highp float _Freq;
uniform highp float _Amp;
uniform highp float _FresnelPower;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 result_2;
  lowp vec4 tmpvar_3;
  highp vec2 P_4;
  P_4 = (xlv_TEXCOORD0 / _TexScale);
  tmpvar_3 = texture2D (_WigTex, P_4);
  highp vec2 tmpvar_5;
  tmpvar_5.x = -(xlv_TEXCOORD0.y);
  tmpvar_5.y = -(xlv_TEXCOORD0.x);
  highp vec2 P_6;
  P_6 = (((xlv_TEXCOORD0 + 
    (tmpvar_3 * _Amp)
  .xy) + (
    sin((_Time * _Freq))
   * 200.0).xy) / _TexScale);
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, P_6) * _WaveCol);
  highp vec2 P_8;
  P_8 = (((tmpvar_5 + 
    (tmpvar_3 * _Amp)
  .xy) - (
    sin(((_Time + 25.0) * _Freq))
   * 200.0).xy) / _TexScale);
  lowp vec4 tmpvar_9;
  tmpvar_9 = (texture2D (_MainTex, P_8) * _WaveCol);
  highp vec4 tmpvar_10;
  tmpvar_10 = mix (_MainCol, _FresCol, vec4(pow (clamp (
    (1.0 - max (dot (normalize(xlv_TEXCOORD2), normalize(xlv_TEXCOORD3)), 0.0))
  , 0.0, 1.0), _FresnelPower)));
  highp vec4 tmpvar_11;
  tmpvar_11 = (((
    (((_MainCol + (tmpvar_7 * _WaveDecay)) + (tmpvar_9 * _WaveDecay)) * 5.0)
   * _Fade) * (vec4(
    (1.0 - tmpvar_10.z)
  ) * _Fade)) + tmpvar_10);
  result_2.w = tmpvar_11.w;
  result_2.xyz = mix (unity_FogColor.xyz, tmpvar_11.xyz, vec3(clamp (xlv_TEXCOORD1, 0.0, 1.0)));
  tmpvar_1 = result_2;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform lowp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD1;
void main ()
{
  lowp vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  tmpvar_2 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  highp vec3 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex);
  tmpvar_4 = tmpvar_5.xyz;
  tmpvar_1 = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD4 = tmpvar_1;
  xlv_TEXCOORD2 = (_WorldSpaceCameraPos - tmpvar_5.xyz);
  xlv_TEXCOORD3 = _glesNormal;
  xlv_TEXCOORD1 = ((tmpvar_2.z * unity_FogParams.z) + unity_FogParams.w);
  gl_Position = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform sampler2D _WigTex;
uniform highp float _TexScale;
uniform lowp vec4 _MainCol;
uniform lowp vec4 _WaveCol;
uniform lowp vec4 _FresCol;
uniform highp float _Fade;
uniform highp float _WaveDecay;
uniform highp float _Freq;
uniform highp float _Amp;
uniform highp float _FresnelPower;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 result_2;
  lowp vec4 tmpvar_3;
  highp vec2 P_4;
  P_4 = (xlv_TEXCOORD0 / _TexScale);
  tmpvar_3 = texture2D (_WigTex, P_4);
  highp vec2 tmpvar_5;
  tmpvar_5.x = -(xlv_TEXCOORD0.y);
  tmpvar_5.y = -(xlv_TEXCOORD0.x);
  highp vec2 P_6;
  P_6 = (((xlv_TEXCOORD0 + 
    (tmpvar_3 * _Amp)
  .xy) + (
    sin((_Time * _Freq))
   * 200.0).xy) / _TexScale);
  lowp vec4 tmpvar_7;
  tmpvar_7 = (texture2D (_MainTex, P_6) * _WaveCol);
  highp vec2 P_8;
  P_8 = (((tmpvar_5 + 
    (tmpvar_3 * _Amp)
  .xy) - (
    sin(((_Time + 25.0) * _Freq))
   * 200.0).xy) / _TexScale);
  lowp vec4 tmpvar_9;
  tmpvar_9 = (texture2D (_MainTex, P_8) * _WaveCol);
  highp vec4 tmpvar_10;
  tmpvar_10 = mix (_MainCol, _FresCol, vec4(pow (clamp (
    (1.0 - max (dot (normalize(xlv_TEXCOORD2), normalize(xlv_TEXCOORD3)), 0.0))
  , 0.0, 1.0), _FresnelPower)));
  highp vec4 tmpvar_11;
  tmpvar_11 = (((
    (((_MainCol + (tmpvar_7 * _WaveDecay)) + (tmpvar_9 * _WaveDecay)) * 5.0)
   * _Fade) * (vec4(
    (1.0 - tmpvar_10.z)
  ) * _Fade)) + tmpvar_10);
  result_2.w = tmpvar_11.w;
  result_2.xyz = mix (unity_FogColor.xyz, tmpvar_11.xyz, vec3(clamp (xlv_TEXCOORD1, 0.0, 1.0)));
  tmpvar_1 = result_2;
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
//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "FantaZiumGo/Fresnel/Fresnel_worldSpace" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
_TexScale ("texture scale", Float) = 1
_MainCol ("Main Color", Color) = (0,0,0,0)
_FresCol ("Fresnel Color", Color) = (0,0,0,0)
_Fade ("TextureFadeFactor", Range(0, 0.2)) = 0.2
_FresnelPower ("Fresnel power", Range(-10, 10)) = 1
_GaloColor ("Galo Color", Color) = (0,0,0,0)
_GaloFade ("Galo Fade", Range(0, 100)) = 1
}
SubShader {
 LOD 100
 Tags { "IGNOREPROJECTOR" = "False" "RenderType" = "Opaque" }
 Pass {
  LOD 100
  Tags { "IGNOREPROJECTOR" = "False" "RenderType" = "Opaque" }
  GpuProgramID 59557
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
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec4 tmpvar_2;
  tmpvar_2 = (unity_ObjectToWorld * _glesVertex);
  xlv_TEXCOORD4 = tmpvar_2.xyz;
  xlv_TEXCOORD2 = (_WorldSpaceCameraPos - tmpvar_2.xyz);
  xlv_TEXCOORD3 = _glesNormal;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp int _TexScale;
uniform lowp vec4 _MainCol;
uniform lowp vec4 _FresCol;
uniform highp float _Fade;
uniform highp float _FresnelPower;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  highp vec2 P_3;
  P_3 = (xlv_TEXCOORD4.xz / float(_TexScale));
  tmpvar_2 = texture2D (_MainTex, P_3);
  highp vec4 tmpvar_4;
  tmpvar_4 = mix (_MainCol, _FresCol, vec4(pow (clamp (
    (1.0 - max (dot (normalize(xlv_TEXCOORD2), normalize(xlv_TEXCOORD3)), 0.0))
  , 0.0, 1.0), _FresnelPower)));
  highp vec4 tmpvar_5;
  tmpvar_5 = (((
    (tmpvar_2 * 1.8)
   * _Fade) * (vec4(
    (1.0 - tmpvar_4.z)
  ) * _Fade)) + tmpvar_4);
  tmpvar_1 = tmpvar_5;
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
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec4 tmpvar_2;
  tmpvar_2 = (unity_ObjectToWorld * _glesVertex);
  xlv_TEXCOORD4 = tmpvar_2.xyz;
  xlv_TEXCOORD2 = (_WorldSpaceCameraPos - tmpvar_2.xyz);
  xlv_TEXCOORD3 = _glesNormal;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp int _TexScale;
uniform lowp vec4 _MainCol;
uniform lowp vec4 _FresCol;
uniform highp float _Fade;
uniform highp float _FresnelPower;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  highp vec2 P_3;
  P_3 = (xlv_TEXCOORD4.xz / float(_TexScale));
  tmpvar_2 = texture2D (_MainTex, P_3);
  highp vec4 tmpvar_4;
  tmpvar_4 = mix (_MainCol, _FresCol, vec4(pow (clamp (
    (1.0 - max (dot (normalize(xlv_TEXCOORD2), normalize(xlv_TEXCOORD3)), 0.0))
  , 0.0, 1.0), _FresnelPower)));
  highp vec4 tmpvar_5;
  tmpvar_5 = (((
    (tmpvar_2 * 1.8)
   * _Fade) * (vec4(
    (1.0 - tmpvar_4.z)
  ) * _Fade)) + tmpvar_4);
  tmpvar_1 = tmpvar_5;
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
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec4 tmpvar_2;
  tmpvar_2 = (unity_ObjectToWorld * _glesVertex);
  xlv_TEXCOORD4 = tmpvar_2.xyz;
  xlv_TEXCOORD2 = (_WorldSpaceCameraPos - tmpvar_2.xyz);
  xlv_TEXCOORD3 = _glesNormal;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp int _TexScale;
uniform lowp vec4 _MainCol;
uniform lowp vec4 _FresCol;
uniform highp float _Fade;
uniform highp float _FresnelPower;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  highp vec2 P_3;
  P_3 = (xlv_TEXCOORD4.xz / float(_TexScale));
  tmpvar_2 = texture2D (_MainTex, P_3);
  highp vec4 tmpvar_4;
  tmpvar_4 = mix (_MainCol, _FresCol, vec4(pow (clamp (
    (1.0 - max (dot (normalize(xlv_TEXCOORD2), normalize(xlv_TEXCOORD3)), 0.0))
  , 0.0, 1.0), _FresnelPower)));
  highp vec4 tmpvar_5;
  tmpvar_5 = (((
    (tmpvar_2 * 1.8)
   * _Fade) * (vec4(
    (1.0 - tmpvar_4.z)
  ) * _Fade)) + tmpvar_4);
  tmpvar_1 = tmpvar_5;
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
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec4 tmpvar_3;
  tmpvar_3 = (unity_ObjectToWorld * _glesVertex);
  xlv_TEXCOORD4 = tmpvar_3.xyz;
  xlv_TEXCOORD2 = (_WorldSpaceCameraPos - tmpvar_3.xyz);
  xlv_TEXCOORD3 = _glesNormal;
  xlv_TEXCOORD1 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
  gl_Position = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform highp int _TexScale;
uniform lowp vec4 _MainCol;
uniform lowp vec4 _FresCol;
uniform highp float _Fade;
uniform highp float _FresnelPower;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 result_2;
  lowp vec4 tmpvar_3;
  highp vec2 P_4;
  P_4 = (xlv_TEXCOORD4.xz / float(_TexScale));
  tmpvar_3 = texture2D (_MainTex, P_4);
  highp vec4 tmpvar_5;
  tmpvar_5 = mix (_MainCol, _FresCol, vec4(pow (clamp (
    (1.0 - max (dot (normalize(xlv_TEXCOORD2), normalize(xlv_TEXCOORD3)), 0.0))
  , 0.0, 1.0), _FresnelPower)));
  highp vec4 tmpvar_6;
  tmpvar_6 = (((
    (tmpvar_3 * 1.8)
   * _Fade) * (vec4(
    (1.0 - tmpvar_5.z)
  ) * _Fade)) + tmpvar_5);
  result_2.w = tmpvar_6.w;
  result_2.xyz = mix (unity_FogColor.xyz, tmpvar_6.xyz, vec3(clamp (xlv_TEXCOORD1, 0.0, 1.0)));
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
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec4 tmpvar_3;
  tmpvar_3 = (unity_ObjectToWorld * _glesVertex);
  xlv_TEXCOORD4 = tmpvar_3.xyz;
  xlv_TEXCOORD2 = (_WorldSpaceCameraPos - tmpvar_3.xyz);
  xlv_TEXCOORD3 = _glesNormal;
  xlv_TEXCOORD1 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
  gl_Position = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform highp int _TexScale;
uniform lowp vec4 _MainCol;
uniform lowp vec4 _FresCol;
uniform highp float _Fade;
uniform highp float _FresnelPower;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 result_2;
  lowp vec4 tmpvar_3;
  highp vec2 P_4;
  P_4 = (xlv_TEXCOORD4.xz / float(_TexScale));
  tmpvar_3 = texture2D (_MainTex, P_4);
  highp vec4 tmpvar_5;
  tmpvar_5 = mix (_MainCol, _FresCol, vec4(pow (clamp (
    (1.0 - max (dot (normalize(xlv_TEXCOORD2), normalize(xlv_TEXCOORD3)), 0.0))
  , 0.0, 1.0), _FresnelPower)));
  highp vec4 tmpvar_6;
  tmpvar_6 = (((
    (tmpvar_3 * 1.8)
   * _Fade) * (vec4(
    (1.0 - tmpvar_5.z)
  ) * _Fade)) + tmpvar_5);
  result_2.w = tmpvar_6.w;
  result_2.xyz = mix (unity_FogColor.xyz, tmpvar_6.xyz, vec3(clamp (xlv_TEXCOORD1, 0.0, 1.0)));
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
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec4 tmpvar_3;
  tmpvar_3 = (unity_ObjectToWorld * _glesVertex);
  xlv_TEXCOORD4 = tmpvar_3.xyz;
  xlv_TEXCOORD2 = (_WorldSpaceCameraPos - tmpvar_3.xyz);
  xlv_TEXCOORD3 = _glesNormal;
  xlv_TEXCOORD1 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
  gl_Position = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform highp int _TexScale;
uniform lowp vec4 _MainCol;
uniform lowp vec4 _FresCol;
uniform highp float _Fade;
uniform highp float _FresnelPower;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 result_2;
  lowp vec4 tmpvar_3;
  highp vec2 P_4;
  P_4 = (xlv_TEXCOORD4.xz / float(_TexScale));
  tmpvar_3 = texture2D (_MainTex, P_4);
  highp vec4 tmpvar_5;
  tmpvar_5 = mix (_MainCol, _FresCol, vec4(pow (clamp (
    (1.0 - max (dot (normalize(xlv_TEXCOORD2), normalize(xlv_TEXCOORD3)), 0.0))
  , 0.0, 1.0), _FresnelPower)));
  highp vec4 tmpvar_6;
  tmpvar_6 = (((
    (tmpvar_3 * 1.8)
   * _Fade) * (vec4(
    (1.0 - tmpvar_5.z)
  ) * _Fade)) + tmpvar_5);
  result_2.w = tmpvar_6.w;
  result_2.xyz = mix (unity_FogColor.xyz, tmpvar_6.xyz, vec3(clamp (xlv_TEXCOORD1, 0.0, 1.0)));
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
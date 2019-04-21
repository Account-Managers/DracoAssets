//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "FantaZiumGo/Buildings/TeamCol" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
_TeamColMask ("TeamColorMask", 2D) = "black" { }
_TeamCol ("TeamColor", Color) = (0,0,0,0)
}
SubShader {
 LOD 100
 Tags { "RenderType" = "Opaque" }
 Pass {
  LOD 100
  Tags { "RenderType" = "Opaque" }
  GpuProgramID 39475
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _MainTex_ST;
varying lowp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_COLOR = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _TeamColMask;
uniform lowp vec4 _TeamCol;
varying lowp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 result_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_TeamColMask, xlv_TEXCOORD0);
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  result_1.xyz = ((tmpvar_3 * (1.0 - tmpvar_2)) + ((tmpvar_2 * _TeamCol) * tmpvar_3)).xyz;
  result_1.w = 1.0;
  gl_FragData[0] = result_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _MainTex_ST;
varying lowp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_COLOR = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _TeamColMask;
uniform lowp vec4 _TeamCol;
varying lowp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 result_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_TeamColMask, xlv_TEXCOORD0);
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  result_1.xyz = ((tmpvar_3 * (1.0 - tmpvar_2)) + ((tmpvar_2 * _TeamCol) * tmpvar_3)).xyz;
  result_1.w = 1.0;
  gl_FragData[0] = result_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _MainTex_ST;
varying lowp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_COLOR = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _TeamColMask;
uniform lowp vec4 _TeamCol;
varying lowp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 result_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_TeamColMask, xlv_TEXCOORD0);
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  result_1.xyz = ((tmpvar_3 * (1.0 - tmpvar_2)) + ((tmpvar_2 * _TeamCol) * tmpvar_3)).xyz;
  result_1.w = 1.0;
  gl_FragData[0] = result_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform lowp vec4 _MainTex_ST;
varying lowp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR;
varying highp float xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  gl_Position = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD1 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform sampler2D _TeamColMask;
uniform lowp vec4 _TeamCol;
varying lowp vec2 xlv_TEXCOORD0;
varying highp float xlv_TEXCOORD1;
void main ()
{
  lowp vec4 result_1;
  highp float tmpvar_2;
  tmpvar_2 = clamp (xlv_TEXCOORD1, 0.0, 1.0);
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_TeamColMask, xlv_TEXCOORD0);
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  result_1.xyz = mix (unity_FogColor.xyz, ((tmpvar_4 * 
    (1.0 - tmpvar_3)
  ) + (
    (tmpvar_3 * _TeamCol)
   * tmpvar_4)).xyz, vec3(tmpvar_2));
  result_1.w = 1.0;
  gl_FragData[0] = result_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform lowp vec4 _MainTex_ST;
varying lowp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR;
varying highp float xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  gl_Position = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD1 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform sampler2D _TeamColMask;
uniform lowp vec4 _TeamCol;
varying lowp vec2 xlv_TEXCOORD0;
varying highp float xlv_TEXCOORD1;
void main ()
{
  lowp vec4 result_1;
  highp float tmpvar_2;
  tmpvar_2 = clamp (xlv_TEXCOORD1, 0.0, 1.0);
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_TeamColMask, xlv_TEXCOORD0);
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  result_1.xyz = mix (unity_FogColor.xyz, ((tmpvar_4 * 
    (1.0 - tmpvar_3)
  ) + (
    (tmpvar_3 * _TeamCol)
   * tmpvar_4)).xyz, vec3(tmpvar_2));
  result_1.w = 1.0;
  gl_FragData[0] = result_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform lowp vec4 _MainTex_ST;
varying lowp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR;
varying highp float xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  gl_Position = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD1 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform sampler2D _TeamColMask;
uniform lowp vec4 _TeamCol;
varying lowp vec2 xlv_TEXCOORD0;
varying highp float xlv_TEXCOORD1;
void main ()
{
  lowp vec4 result_1;
  highp float tmpvar_2;
  tmpvar_2 = clamp (xlv_TEXCOORD1, 0.0, 1.0);
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_TeamColMask, xlv_TEXCOORD0);
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  result_1.xyz = mix (unity_FogColor.xyz, ((tmpvar_4 * 
    (1.0 - tmpvar_3)
  ) + (
    (tmpvar_3 * _TeamCol)
   * tmpvar_4)).xyz, vec3(tmpvar_2));
  result_1.w = 1.0;
  gl_FragData[0] = result_1;
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
//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "FantaZiumGo/FX/VertexAlpha_Twinkle" {
Properties {
_TeamCol ("TeamColor", Color) = (1,1,1,1)
_Intensity ("Intensity", Range(0, 1)) = 0.2
}
SubShader {
 Tags { "RenderType" = "Transparent" }
 Pass {
  Tags { "RenderType" = "Transparent" }
  ZWrite Off
  GpuProgramID 62854
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
uniform highp vec4 _Time;
uniform lowp vec4 _TeamCol;
uniform lowp float _Intensity;
varying lowp vec4 xlv_COLOR;
void main ()
{
  lowp float Ianim_1;
  highp float tmpvar_2;
  tmpvar_2 = (abs(sin(
    ((_Time * 10.0) + _Intensity)
  )) + 0.2).x;
  Ianim_1 = tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3.xyz = _TeamCol.xyz;
  tmpvar_3.w = ((xlv_COLOR.w * Ianim_1) * _TeamCol.w);
  gl_FragData[0] = tmpvar_3;
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
uniform highp vec4 _Time;
uniform lowp vec4 _TeamCol;
uniform lowp float _Intensity;
varying lowp vec4 xlv_COLOR;
void main ()
{
  lowp float Ianim_1;
  highp float tmpvar_2;
  tmpvar_2 = (abs(sin(
    ((_Time * 10.0) + _Intensity)
  )) + 0.2).x;
  Ianim_1 = tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3.xyz = _TeamCol.xyz;
  tmpvar_3.w = ((xlv_COLOR.w * Ianim_1) * _TeamCol.w);
  gl_FragData[0] = tmpvar_3;
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
uniform highp vec4 _Time;
uniform lowp vec4 _TeamCol;
uniform lowp float _Intensity;
varying lowp vec4 xlv_COLOR;
void main ()
{
  lowp float Ianim_1;
  highp float tmpvar_2;
  tmpvar_2 = (abs(sin(
    ((_Time * 10.0) + _Intensity)
  )) + 0.2).x;
  Ianim_1 = tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3.xyz = _TeamCol.xyz;
  tmpvar_3.w = ((xlv_COLOR.w * Ianim_1) * _TeamCol.w);
  gl_FragData[0] = tmpvar_3;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "SOFTPARTICLES_ON" }
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
uniform highp vec4 _Time;
uniform lowp vec4 _TeamCol;
uniform lowp float _Intensity;
varying lowp vec4 xlv_COLOR;
void main ()
{
  lowp float Ianim_1;
  highp float tmpvar_2;
  tmpvar_2 = (abs(sin(
    ((_Time * 10.0) + _Intensity)
  )) + 0.2).x;
  Ianim_1 = tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3.xyz = _TeamCol.xyz;
  tmpvar_3.w = ((xlv_COLOR.w * Ianim_1) * _TeamCol.w);
  gl_FragData[0] = tmpvar_3;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SOFTPARTICLES_ON" }
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
uniform highp vec4 _Time;
uniform lowp vec4 _TeamCol;
uniform lowp float _Intensity;
varying lowp vec4 xlv_COLOR;
void main ()
{
  lowp float Ianim_1;
  highp float tmpvar_2;
  tmpvar_2 = (abs(sin(
    ((_Time * 10.0) + _Intensity)
  )) + 0.2).x;
  Ianim_1 = tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3.xyz = _TeamCol.xyz;
  tmpvar_3.w = ((xlv_COLOR.w * Ianim_1) * _TeamCol.w);
  gl_FragData[0] = tmpvar_3;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SOFTPARTICLES_ON" }
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
uniform highp vec4 _Time;
uniform lowp vec4 _TeamCol;
uniform lowp float _Intensity;
varying lowp vec4 xlv_COLOR;
void main ()
{
  lowp float Ianim_1;
  highp float tmpvar_2;
  tmpvar_2 = (abs(sin(
    ((_Time * 10.0) + _Intensity)
  )) + 0.2).x;
  Ianim_1 = tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3.xyz = _TeamCol.xyz;
  tmpvar_3.w = ((xlv_COLOR.w * Ianim_1) * _TeamCol.w);
  gl_FragData[0] = tmpvar_3;
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
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
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
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD1 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _TeamCol;
uniform lowp float _Intensity;
varying lowp vec4 xlv_COLOR;
varying highp float xlv_TEXCOORD1;
void main ()
{
  lowp vec4 col_1;
  lowp float Ianim_2;
  highp float tmpvar_3;
  tmpvar_3 = (abs(sin(
    ((_Time * 10.0) + _Intensity)
  )) + 0.2).x;
  Ianim_2 = tmpvar_3;
  lowp vec4 tmpvar_4;
  tmpvar_4.xyz = _TeamCol.xyz;
  tmpvar_4.w = ((xlv_COLOR.w * Ianim_2) * _TeamCol.w);
  col_1.w = tmpvar_4.w;
  highp float tmpvar_5;
  tmpvar_5 = clamp (xlv_TEXCOORD1, 0.0, 1.0);
  col_1.xyz = mix (unity_FogColor.xyz, _TeamCol.xyz, vec3(tmpvar_5));
  gl_FragData[0] = col_1;
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
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
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
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD1 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _TeamCol;
uniform lowp float _Intensity;
varying lowp vec4 xlv_COLOR;
varying highp float xlv_TEXCOORD1;
void main ()
{
  lowp vec4 col_1;
  lowp float Ianim_2;
  highp float tmpvar_3;
  tmpvar_3 = (abs(sin(
    ((_Time * 10.0) + _Intensity)
  )) + 0.2).x;
  Ianim_2 = tmpvar_3;
  lowp vec4 tmpvar_4;
  tmpvar_4.xyz = _TeamCol.xyz;
  tmpvar_4.w = ((xlv_COLOR.w * Ianim_2) * _TeamCol.w);
  col_1.w = tmpvar_4.w;
  highp float tmpvar_5;
  tmpvar_5 = clamp (xlv_TEXCOORD1, 0.0, 1.0);
  col_1.xyz = mix (unity_FogColor.xyz, _TeamCol.xyz, vec3(tmpvar_5));
  gl_FragData[0] = col_1;
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
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
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
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD1 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _TeamCol;
uniform lowp float _Intensity;
varying lowp vec4 xlv_COLOR;
varying highp float xlv_TEXCOORD1;
void main ()
{
  lowp vec4 col_1;
  lowp float Ianim_2;
  highp float tmpvar_3;
  tmpvar_3 = (abs(sin(
    ((_Time * 10.0) + _Intensity)
  )) + 0.2).x;
  Ianim_2 = tmpvar_3;
  lowp vec4 tmpvar_4;
  tmpvar_4.xyz = _TeamCol.xyz;
  tmpvar_4.w = ((xlv_COLOR.w * Ianim_2) * _TeamCol.w);
  col_1.w = tmpvar_4.w;
  highp float tmpvar_5;
  tmpvar_5 = clamp (xlv_TEXCOORD1, 0.0, 1.0);
  col_1.xyz = mix (unity_FogColor.xyz, _TeamCol.xyz, vec3(tmpvar_5));
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "SOFTPARTICLES_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
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
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD1 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _TeamCol;
uniform lowp float _Intensity;
varying lowp vec4 xlv_COLOR;
varying highp float xlv_TEXCOORD1;
void main ()
{
  lowp vec4 col_1;
  lowp float Ianim_2;
  highp float tmpvar_3;
  tmpvar_3 = (abs(sin(
    ((_Time * 10.0) + _Intensity)
  )) + 0.2).x;
  Ianim_2 = tmpvar_3;
  lowp vec4 tmpvar_4;
  tmpvar_4.xyz = _TeamCol.xyz;
  tmpvar_4.w = ((xlv_COLOR.w * Ianim_2) * _TeamCol.w);
  col_1.w = tmpvar_4.w;
  highp float tmpvar_5;
  tmpvar_5 = clamp (xlv_TEXCOORD1, 0.0, 1.0);
  col_1.xyz = mix (unity_FogColor.xyz, _TeamCol.xyz, vec3(tmpvar_5));
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "SOFTPARTICLES_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
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
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD1 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _TeamCol;
uniform lowp float _Intensity;
varying lowp vec4 xlv_COLOR;
varying highp float xlv_TEXCOORD1;
void main ()
{
  lowp vec4 col_1;
  lowp float Ianim_2;
  highp float tmpvar_3;
  tmpvar_3 = (abs(sin(
    ((_Time * 10.0) + _Intensity)
  )) + 0.2).x;
  Ianim_2 = tmpvar_3;
  lowp vec4 tmpvar_4;
  tmpvar_4.xyz = _TeamCol.xyz;
  tmpvar_4.w = ((xlv_COLOR.w * Ianim_2) * _TeamCol.w);
  col_1.w = tmpvar_4.w;
  highp float tmpvar_5;
  tmpvar_5 = clamp (xlv_TEXCOORD1, 0.0, 1.0);
  col_1.xyz = mix (unity_FogColor.xyz, _TeamCol.xyz, vec3(tmpvar_5));
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "SOFTPARTICLES_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
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
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD1 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _TeamCol;
uniform lowp float _Intensity;
varying lowp vec4 xlv_COLOR;
varying highp float xlv_TEXCOORD1;
void main ()
{
  lowp vec4 col_1;
  lowp float Ianim_2;
  highp float tmpvar_3;
  tmpvar_3 = (abs(sin(
    ((_Time * 10.0) + _Intensity)
  )) + 0.2).x;
  Ianim_2 = tmpvar_3;
  lowp vec4 tmpvar_4;
  tmpvar_4.xyz = _TeamCol.xyz;
  tmpvar_4.w = ((xlv_COLOR.w * Ianim_2) * _TeamCol.w);
  col_1.w = tmpvar_4.w;
  highp float tmpvar_5;
  tmpvar_5 = clamp (xlv_TEXCOORD1, 0.0, 1.0);
  col_1.xyz = mix (unity_FogColor.xyz, _TeamCol.xyz, vec3(tmpvar_5));
  gl_FragData[0] = col_1;
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
Keywords { "SOFTPARTICLES_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SOFTPARTICLES_ON" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "SOFTPARTICLES_ON" }
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
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "SOFTPARTICLES_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "SOFTPARTICLES_ON" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "SOFTPARTICLES_ON" }
""
}
}
}
}
Fallback "VertexLit"
}
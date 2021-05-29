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
  GpuProgramID 40492
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[1].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[1].wwww + u_xlat0;
    u_xlat0 = u_xlat0 * in_NORMAL0.yyyy;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[0].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[0].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[0].wwww + u_xlat1;
    u_xlat0 = u_xlat1 * in_NORMAL0.xxxx + u_xlat0;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[2].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[2].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[2].wwww + u_xlat1;
    u_xlat0 = u_xlat1 * in_NORMAL0.zzzz + u_xlat0;
    u_xlat6 = dot(u_xlat0, u_xlat0);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump float _MatCapIn;
uniform 	mediump vec4 _SkinColor;
uniform 	mediump vec4 _EyesColor;
uniform 	mediump vec4 _HairColor;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _MatCap;
uniform lowp sampler2D _ClothesMask;
uniform lowp sampler2D _BodyMask;
uniform lowp sampler2D _JacketStyle;
uniform lowp sampler2D _TrousersStyle;
uniform lowp sampler2D _ShoesStyle;
uniform lowp sampler2D _BackpackStyle;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec3 u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
lowp vec4 u_xlat10_4;
lowp vec4 u_xlat10_5;
mediump float u_xlat16_6;
mediump float u_xlat16_8;
lowp float u_xlat10_11;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD2.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = vs_TEXCOORD2.xyz * (-u_xlat0.xxx) + vs_TEXCOORD3.xyz;
    u_xlat16_1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_8 = u_xlat0.z + 1.0;
    u_xlat16_1.x = u_xlat16_8 * u_xlat16_8 + u_xlat16_1.x;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat0.xy = u_xlat0.xy / u_xlat16_1.xx;
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat10_0.xyz = texture2D(_MatCap, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(_MatCapIn);
    u_xlat16_0.w = _MatCapIn;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD1.xy);
    u_xlat16_0 = u_xlat16_0 * u_xlat10_1;
    u_xlat10_2 = texture2D(_ShoesStyle, vs_TEXCOORD0.xy);
    u_xlat10_3 = texture2D(_JacketStyle, vs_TEXCOORD0.xy);
    u_xlat10_4 = texture2D(_TrousersStyle, vs_TEXCOORD0.xy);
    u_xlat10_5 = texture2D(_ClothesMask, vs_TEXCOORD1.xy);
    u_xlat4 = u_xlat10_4 * u_xlat10_5.yyyy;
    u_xlat16_3 = u_xlat10_5.xxxx * u_xlat10_3 + u_xlat4;
    u_xlat16_2 = u_xlat10_5.zzzz * u_xlat10_2 + u_xlat16_3;
    u_xlat10_3 = texture2D(_BackpackStyle, vs_TEXCOORD0.xy);
    u_xlat16_2 = u_xlat10_5.wwww * u_xlat10_3 + u_xlat16_2;
    u_xlat10_4.xyz = texture2D(_BodyMask, vs_TEXCOORD1.xy).xyz;
    u_xlat16_2 = u_xlat10_4.yyyy * _HairColor + u_xlat16_2;
    u_xlat16_3 = u_xlat10_4.xxxx * _SkinColor;
    u_xlat16_3 = u_xlat10_1 * u_xlat16_3;
    u_xlat16_0 = u_xlat16_2 * u_xlat16_0 + u_xlat16_3;
    u_xlat10_4.x = texture2D(_MatCap, vs_TEXCOORD0.xy).w;
    u_xlat10_11 = texture2D(_BodyMask, vs_TEXCOORD0.xy).w;
    u_xlat16_6 = u_xlat10_11 + u_xlat10_4.z;
    u_xlat16_2.w = u_xlat10_4.x * u_xlat16_6;
    u_xlat16_2.xyz = u_xlat16_2.www * _EyesColor.xyz;
    u_xlat16_2 = (-u_xlat10_1) + u_xlat16_2;
    u_xlat16_1 = vec4(u_xlat10_11) * u_xlat16_2 + u_xlat10_1;
    u_xlat16_1 = (-u_xlat16_0) + u_xlat16_1;
    SV_Target0 = u_xlat10_4.zzzz * u_xlat16_1 + u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[1].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[1].wwww + u_xlat0;
    u_xlat0 = u_xlat0 * in_NORMAL0.yyyy;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[0].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[0].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[0].wwww + u_xlat1;
    u_xlat0 = u_xlat1 * in_NORMAL0.xxxx + u_xlat0;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[2].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[2].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[2].wwww + u_xlat1;
    u_xlat0 = u_xlat1 * in_NORMAL0.zzzz + u_xlat0;
    u_xlat6 = dot(u_xlat0, u_xlat0);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump float _MatCapIn;
uniform 	mediump vec4 _SkinColor;
uniform 	mediump vec4 _EyesColor;
uniform 	mediump vec4 _HairColor;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _MatCap;
uniform lowp sampler2D _ClothesMask;
uniform lowp sampler2D _BodyMask;
uniform lowp sampler2D _JacketStyle;
uniform lowp sampler2D _TrousersStyle;
uniform lowp sampler2D _ShoesStyle;
uniform lowp sampler2D _BackpackStyle;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec3 u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
lowp vec4 u_xlat10_4;
lowp vec4 u_xlat10_5;
mediump float u_xlat16_6;
mediump float u_xlat16_8;
lowp float u_xlat10_11;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD2.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = vs_TEXCOORD2.xyz * (-u_xlat0.xxx) + vs_TEXCOORD3.xyz;
    u_xlat16_1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_8 = u_xlat0.z + 1.0;
    u_xlat16_1.x = u_xlat16_8 * u_xlat16_8 + u_xlat16_1.x;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat0.xy = u_xlat0.xy / u_xlat16_1.xx;
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat10_0.xyz = texture2D(_MatCap, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(_MatCapIn);
    u_xlat16_0.w = _MatCapIn;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD1.xy);
    u_xlat16_0 = u_xlat16_0 * u_xlat10_1;
    u_xlat10_2 = texture2D(_ShoesStyle, vs_TEXCOORD0.xy);
    u_xlat10_3 = texture2D(_JacketStyle, vs_TEXCOORD0.xy);
    u_xlat10_4 = texture2D(_TrousersStyle, vs_TEXCOORD0.xy);
    u_xlat10_5 = texture2D(_ClothesMask, vs_TEXCOORD1.xy);
    u_xlat4 = u_xlat10_4 * u_xlat10_5.yyyy;
    u_xlat16_3 = u_xlat10_5.xxxx * u_xlat10_3 + u_xlat4;
    u_xlat16_2 = u_xlat10_5.zzzz * u_xlat10_2 + u_xlat16_3;
    u_xlat10_3 = texture2D(_BackpackStyle, vs_TEXCOORD0.xy);
    u_xlat16_2 = u_xlat10_5.wwww * u_xlat10_3 + u_xlat16_2;
    u_xlat10_4.xyz = texture2D(_BodyMask, vs_TEXCOORD1.xy).xyz;
    u_xlat16_2 = u_xlat10_4.yyyy * _HairColor + u_xlat16_2;
    u_xlat16_3 = u_xlat10_4.xxxx * _SkinColor;
    u_xlat16_3 = u_xlat10_1 * u_xlat16_3;
    u_xlat16_0 = u_xlat16_2 * u_xlat16_0 + u_xlat16_3;
    u_xlat10_4.x = texture2D(_MatCap, vs_TEXCOORD0.xy).w;
    u_xlat10_11 = texture2D(_BodyMask, vs_TEXCOORD0.xy).w;
    u_xlat16_6 = u_xlat10_11 + u_xlat10_4.z;
    u_xlat16_2.w = u_xlat10_4.x * u_xlat16_6;
    u_xlat16_2.xyz = u_xlat16_2.www * _EyesColor.xyz;
    u_xlat16_2 = (-u_xlat10_1) + u_xlat16_2;
    u_xlat16_1 = vec4(u_xlat10_11) * u_xlat16_2 + u_xlat10_1;
    u_xlat16_1 = (-u_xlat16_0) + u_xlat16_1;
    SV_Target0 = u_xlat10_4.zzzz * u_xlat16_1 + u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[1].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[1].wwww + u_xlat0;
    u_xlat0 = u_xlat0 * in_NORMAL0.yyyy;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[0].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[0].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[0].wwww + u_xlat1;
    u_xlat0 = u_xlat1 * in_NORMAL0.xxxx + u_xlat0;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[2].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[2].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[2].wwww + u_xlat1;
    u_xlat0 = u_xlat1 * in_NORMAL0.zzzz + u_xlat0;
    u_xlat6 = dot(u_xlat0, u_xlat0);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump float _MatCapIn;
uniform 	mediump vec4 _SkinColor;
uniform 	mediump vec4 _EyesColor;
uniform 	mediump vec4 _HairColor;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _MatCap;
uniform lowp sampler2D _ClothesMask;
uniform lowp sampler2D _BodyMask;
uniform lowp sampler2D _JacketStyle;
uniform lowp sampler2D _TrousersStyle;
uniform lowp sampler2D _ShoesStyle;
uniform lowp sampler2D _BackpackStyle;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec3 u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
lowp vec4 u_xlat10_4;
lowp vec4 u_xlat10_5;
mediump float u_xlat16_6;
mediump float u_xlat16_8;
lowp float u_xlat10_11;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD2.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = vs_TEXCOORD2.xyz * (-u_xlat0.xxx) + vs_TEXCOORD3.xyz;
    u_xlat16_1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_8 = u_xlat0.z + 1.0;
    u_xlat16_1.x = u_xlat16_8 * u_xlat16_8 + u_xlat16_1.x;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat0.xy = u_xlat0.xy / u_xlat16_1.xx;
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat10_0.xyz = texture2D(_MatCap, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(_MatCapIn);
    u_xlat16_0.w = _MatCapIn;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD1.xy);
    u_xlat16_0 = u_xlat16_0 * u_xlat10_1;
    u_xlat10_2 = texture2D(_ShoesStyle, vs_TEXCOORD0.xy);
    u_xlat10_3 = texture2D(_JacketStyle, vs_TEXCOORD0.xy);
    u_xlat10_4 = texture2D(_TrousersStyle, vs_TEXCOORD0.xy);
    u_xlat10_5 = texture2D(_ClothesMask, vs_TEXCOORD1.xy);
    u_xlat4 = u_xlat10_4 * u_xlat10_5.yyyy;
    u_xlat16_3 = u_xlat10_5.xxxx * u_xlat10_3 + u_xlat4;
    u_xlat16_2 = u_xlat10_5.zzzz * u_xlat10_2 + u_xlat16_3;
    u_xlat10_3 = texture2D(_BackpackStyle, vs_TEXCOORD0.xy);
    u_xlat16_2 = u_xlat10_5.wwww * u_xlat10_3 + u_xlat16_2;
    u_xlat10_4.xyz = texture2D(_BodyMask, vs_TEXCOORD1.xy).xyz;
    u_xlat16_2 = u_xlat10_4.yyyy * _HairColor + u_xlat16_2;
    u_xlat16_3 = u_xlat10_4.xxxx * _SkinColor;
    u_xlat16_3 = u_xlat10_1 * u_xlat16_3;
    u_xlat16_0 = u_xlat16_2 * u_xlat16_0 + u_xlat16_3;
    u_xlat10_4.x = texture2D(_MatCap, vs_TEXCOORD0.xy).w;
    u_xlat10_11 = texture2D(_BodyMask, vs_TEXCOORD0.xy).w;
    u_xlat16_6 = u_xlat10_11 + u_xlat10_4.z;
    u_xlat16_2.w = u_xlat10_4.x * u_xlat16_6;
    u_xlat16_2.xyz = u_xlat16_2.www * _EyesColor.xyz;
    u_xlat16_2 = (-u_xlat10_1) + u_xlat16_2;
    u_xlat16_1 = vec4(u_xlat10_11) * u_xlat16_2 + u_xlat10_1;
    u_xlat16_1 = (-u_xlat16_0) + u_xlat16_1;
    SV_Target0 = u_xlat10_4.zzzz * u_xlat16_1 + u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[1].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[1].wwww + u_xlat0;
    u_xlat0 = u_xlat0 * in_NORMAL0.yyyy;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[0].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[0].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[0].wwww + u_xlat1;
    u_xlat0 = u_xlat1 * in_NORMAL0.xxxx + u_xlat0;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[2].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[2].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[2].wwww + u_xlat1;
    u_xlat0 = u_xlat1 * in_NORMAL0.zzzz + u_xlat0;
    u_xlat6 = dot(u_xlat0, u_xlat0);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump float _MatCapIn;
uniform 	mediump vec4 _SkinColor;
uniform 	mediump vec4 _EyesColor;
uniform 	mediump vec4 _HairColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MatCap;
UNITY_LOCATION(2) uniform mediump sampler2D _ClothesMask;
UNITY_LOCATION(3) uniform mediump sampler2D _BodyMask;
UNITY_LOCATION(4) uniform mediump sampler2D _JacketStyle;
UNITY_LOCATION(5) uniform mediump sampler2D _TrousersStyle;
UNITY_LOCATION(6) uniform mediump sampler2D _ShoesStyle;
UNITY_LOCATION(7) uniform mediump sampler2D _BackpackStyle;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump float u_xlat16_6;
mediump float u_xlat16_8;
mediump float u_xlat16_11;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD2.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = vs_TEXCOORD2.xyz * (-u_xlat0.xxx) + vs_TEXCOORD3.xyz;
    u_xlat16_1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_8 = u_xlat0.z + 1.0;
    u_xlat16_1.x = u_xlat16_8 * u_xlat16_8 + u_xlat16_1.x;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat0.xy = u_xlat0.xy / u_xlat16_1.xx;
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat16_0.xyz = texture(_MatCap, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_MatCapIn);
    u_xlat16_0.w = _MatCapIn;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
    u_xlat16_2 = texture(_ShoesStyle, vs_TEXCOORD0.xy);
    u_xlat16_3 = texture(_JacketStyle, vs_TEXCOORD0.xy);
    u_xlat16_4 = texture(_TrousersStyle, vs_TEXCOORD0.xy);
    u_xlat16_5 = texture(_ClothesMask, vs_TEXCOORD1.xy);
    u_xlat4 = u_xlat16_4 * u_xlat16_5.yyyy;
    u_xlat16_3 = u_xlat16_5.xxxx * u_xlat16_3 + u_xlat4;
    u_xlat16_2 = u_xlat16_5.zzzz * u_xlat16_2 + u_xlat16_3;
    u_xlat16_3 = texture(_BackpackStyle, vs_TEXCOORD0.xy);
    u_xlat16_2 = u_xlat16_5.wwww * u_xlat16_3 + u_xlat16_2;
    u_xlat16_4.xyz = texture(_BodyMask, vs_TEXCOORD1.xy).xyz;
    u_xlat16_2 = u_xlat16_4.yyyy * _HairColor + u_xlat16_2;
    u_xlat16_3 = u_xlat16_4.xxxx * _SkinColor;
    u_xlat16_3 = u_xlat16_1 * u_xlat16_3;
    u_xlat16_0 = u_xlat16_2 * u_xlat16_0 + u_xlat16_3;
    u_xlat16_4.x = texture(_MatCap, vs_TEXCOORD0.xy).w;
    u_xlat16_11 = texture(_BodyMask, vs_TEXCOORD0.xy).w;
    u_xlat16_6 = u_xlat16_11 + u_xlat16_4.z;
    u_xlat16_2.w = u_xlat16_4.x * u_xlat16_6;
    u_xlat16_2.xyz = u_xlat16_2.www * _EyesColor.xyz;
    u_xlat16_2 = (-u_xlat16_1) + u_xlat16_2;
    u_xlat16_1 = vec4(u_xlat16_11) * u_xlat16_2 + u_xlat16_1;
    u_xlat16_1 = (-u_xlat16_0) + u_xlat16_1;
    SV_Target0 = u_xlat16_4.zzzz * u_xlat16_1 + u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[1].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[1].wwww + u_xlat0;
    u_xlat0 = u_xlat0 * in_NORMAL0.yyyy;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[0].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[0].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[0].wwww + u_xlat1;
    u_xlat0 = u_xlat1 * in_NORMAL0.xxxx + u_xlat0;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[2].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[2].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[2].wwww + u_xlat1;
    u_xlat0 = u_xlat1 * in_NORMAL0.zzzz + u_xlat0;
    u_xlat6 = dot(u_xlat0, u_xlat0);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump float _MatCapIn;
uniform 	mediump vec4 _SkinColor;
uniform 	mediump vec4 _EyesColor;
uniform 	mediump vec4 _HairColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MatCap;
UNITY_LOCATION(2) uniform mediump sampler2D _ClothesMask;
UNITY_LOCATION(3) uniform mediump sampler2D _BodyMask;
UNITY_LOCATION(4) uniform mediump sampler2D _JacketStyle;
UNITY_LOCATION(5) uniform mediump sampler2D _TrousersStyle;
UNITY_LOCATION(6) uniform mediump sampler2D _ShoesStyle;
UNITY_LOCATION(7) uniform mediump sampler2D _BackpackStyle;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump float u_xlat16_6;
mediump float u_xlat16_8;
mediump float u_xlat16_11;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD2.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = vs_TEXCOORD2.xyz * (-u_xlat0.xxx) + vs_TEXCOORD3.xyz;
    u_xlat16_1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_8 = u_xlat0.z + 1.0;
    u_xlat16_1.x = u_xlat16_8 * u_xlat16_8 + u_xlat16_1.x;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat0.xy = u_xlat0.xy / u_xlat16_1.xx;
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat16_0.xyz = texture(_MatCap, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_MatCapIn);
    u_xlat16_0.w = _MatCapIn;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
    u_xlat16_2 = texture(_ShoesStyle, vs_TEXCOORD0.xy);
    u_xlat16_3 = texture(_JacketStyle, vs_TEXCOORD0.xy);
    u_xlat16_4 = texture(_TrousersStyle, vs_TEXCOORD0.xy);
    u_xlat16_5 = texture(_ClothesMask, vs_TEXCOORD1.xy);
    u_xlat4 = u_xlat16_4 * u_xlat16_5.yyyy;
    u_xlat16_3 = u_xlat16_5.xxxx * u_xlat16_3 + u_xlat4;
    u_xlat16_2 = u_xlat16_5.zzzz * u_xlat16_2 + u_xlat16_3;
    u_xlat16_3 = texture(_BackpackStyle, vs_TEXCOORD0.xy);
    u_xlat16_2 = u_xlat16_5.wwww * u_xlat16_3 + u_xlat16_2;
    u_xlat16_4.xyz = texture(_BodyMask, vs_TEXCOORD1.xy).xyz;
    u_xlat16_2 = u_xlat16_4.yyyy * _HairColor + u_xlat16_2;
    u_xlat16_3 = u_xlat16_4.xxxx * _SkinColor;
    u_xlat16_3 = u_xlat16_1 * u_xlat16_3;
    u_xlat16_0 = u_xlat16_2 * u_xlat16_0 + u_xlat16_3;
    u_xlat16_4.x = texture(_MatCap, vs_TEXCOORD0.xy).w;
    u_xlat16_11 = texture(_BodyMask, vs_TEXCOORD0.xy).w;
    u_xlat16_6 = u_xlat16_11 + u_xlat16_4.z;
    u_xlat16_2.w = u_xlat16_4.x * u_xlat16_6;
    u_xlat16_2.xyz = u_xlat16_2.www * _EyesColor.xyz;
    u_xlat16_2 = (-u_xlat16_1) + u_xlat16_2;
    u_xlat16_1 = vec4(u_xlat16_11) * u_xlat16_2 + u_xlat16_1;
    u_xlat16_1 = (-u_xlat16_0) + u_xlat16_1;
    SV_Target0 = u_xlat16_4.zzzz * u_xlat16_1 + u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[1].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[1].wwww + u_xlat0;
    u_xlat0 = u_xlat0 * in_NORMAL0.yyyy;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[0].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[0].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[0].wwww + u_xlat1;
    u_xlat0 = u_xlat1 * in_NORMAL0.xxxx + u_xlat0;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2].yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[0] * hlslcc_mtx4x4unity_ObjectToWorld[2].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * hlslcc_mtx4x4unity_ObjectToWorld[2].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[3] * hlslcc_mtx4x4unity_ObjectToWorld[2].wwww + u_xlat1;
    u_xlat0 = u_xlat1 * in_NORMAL0.zzzz + u_xlat0;
    u_xlat6 = dot(u_xlat0, u_xlat0);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump float _MatCapIn;
uniform 	mediump vec4 _SkinColor;
uniform 	mediump vec4 _EyesColor;
uniform 	mediump vec4 _HairColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MatCap;
UNITY_LOCATION(2) uniform mediump sampler2D _ClothesMask;
UNITY_LOCATION(3) uniform mediump sampler2D _BodyMask;
UNITY_LOCATION(4) uniform mediump sampler2D _JacketStyle;
UNITY_LOCATION(5) uniform mediump sampler2D _TrousersStyle;
UNITY_LOCATION(6) uniform mediump sampler2D _ShoesStyle;
UNITY_LOCATION(7) uniform mediump sampler2D _BackpackStyle;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump float u_xlat16_6;
mediump float u_xlat16_8;
mediump float u_xlat16_11;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD2.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = vs_TEXCOORD2.xyz * (-u_xlat0.xxx) + vs_TEXCOORD3.xyz;
    u_xlat16_1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_8 = u_xlat0.z + 1.0;
    u_xlat16_1.x = u_xlat16_8 * u_xlat16_8 + u_xlat16_1.x;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat0.xy = u_xlat0.xy / u_xlat16_1.xx;
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat16_0.xyz = texture(_MatCap, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_MatCapIn);
    u_xlat16_0.w = _MatCapIn;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
    u_xlat16_2 = texture(_ShoesStyle, vs_TEXCOORD0.xy);
    u_xlat16_3 = texture(_JacketStyle, vs_TEXCOORD0.xy);
    u_xlat16_4 = texture(_TrousersStyle, vs_TEXCOORD0.xy);
    u_xlat16_5 = texture(_ClothesMask, vs_TEXCOORD1.xy);
    u_xlat4 = u_xlat16_4 * u_xlat16_5.yyyy;
    u_xlat16_3 = u_xlat16_5.xxxx * u_xlat16_3 + u_xlat4;
    u_xlat16_2 = u_xlat16_5.zzzz * u_xlat16_2 + u_xlat16_3;
    u_xlat16_3 = texture(_BackpackStyle, vs_TEXCOORD0.xy);
    u_xlat16_2 = u_xlat16_5.wwww * u_xlat16_3 + u_xlat16_2;
    u_xlat16_4.xyz = texture(_BodyMask, vs_TEXCOORD1.xy).xyz;
    u_xlat16_2 = u_xlat16_4.yyyy * _HairColor + u_xlat16_2;
    u_xlat16_3 = u_xlat16_4.xxxx * _SkinColor;
    u_xlat16_3 = u_xlat16_1 * u_xlat16_3;
    u_xlat16_0 = u_xlat16_2 * u_xlat16_0 + u_xlat16_3;
    u_xlat16_4.x = texture(_MatCap, vs_TEXCOORD0.xy).w;
    u_xlat16_11 = texture(_BodyMask, vs_TEXCOORD0.xy).w;
    u_xlat16_6 = u_xlat16_11 + u_xlat16_4.z;
    u_xlat16_2.w = u_xlat16_4.x * u_xlat16_6;
    u_xlat16_2.xyz = u_xlat16_2.www * _EyesColor.xyz;
    u_xlat16_2 = (-u_xlat16_1) + u_xlat16_2;
    u_xlat16_1 = vec4(u_xlat16_11) * u_xlat16_2 + u_xlat16_1;
    u_xlat16_1 = (-u_xlat16_0) + u_xlat16_1;
    SV_Target0 = u_xlat16_4.zzzz * u_xlat16_1 + u_xlat16_0;
    return;
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
SubProgram "gles3 hw_tier00 " {
""
}
SubProgram "gles3 hw_tier01 " {
""
}
SubProgram "gles3 hw_tier02 " {
""
}
}
}
}
Fallback "VertexLit"
}
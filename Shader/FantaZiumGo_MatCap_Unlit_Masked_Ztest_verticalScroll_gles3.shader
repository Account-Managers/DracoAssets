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
_TexScaleY ("Texture Scale: Y", Float) = 1
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
  GpuProgramID 53395
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
in mediump vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
out mediump vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump vec2 u_xlat16_8;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = in_NORMAL0.x * hlslcc_mtx4x4unity_WorldToObject[0].x;
    u_xlat0.y = in_NORMAL0.x * hlslcc_mtx4x4unity_WorldToObject[1].x;
    u_xlat0.z = in_NORMAL0.x * hlslcc_mtx4x4unity_WorldToObject[2].x;
    u_xlat1.x = in_NORMAL0.y * hlslcc_mtx4x4unity_WorldToObject[0].y;
    u_xlat1.y = in_NORMAL0.y * hlslcc_mtx4x4unity_WorldToObject[1].y;
    u_xlat1.z = in_NORMAL0.y * hlslcc_mtx4x4unity_WorldToObject[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.x = in_NORMAL0.z * hlslcc_mtx4x4unity_WorldToObject[0].z;
    u_xlat1.y = in_NORMAL0.z * hlslcc_mtx4x4unity_WorldToObject[1].z;
    u_xlat1.z = in_NORMAL0.z * hlslcc_mtx4x4unity_WorldToObject[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat16_8.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat16_8.y = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat16_2.xy = u_xlat16_8.xy * vec2(0.400000006, 0.400000006) + vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat16_2.xy;
    u_xlat16_2.xy = in_POSITION0.xy;
    u_xlat16_2.z = 1.0;
    u_xlat0.x = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_2.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	mediump float _MatCapIn;
uniform 	mediump vec4 _Color;
uniform 	float _TexScaleX;
uniform 	float _TexScaleY;
uniform 	mediump vec4 _GradientColor;
uniform 	float _GradientIn;
uniform 	float _ScrollSpeed;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _MatCapMask;
uniform lowp sampler2D _MatCap;
uniform lowp sampler2D _GradientMap;
in mediump vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
lowp vec3 u_xlat10_2;
lowp vec4 u_xlat10_3;
vec2 u_xlat4;
bool u_xlatb4;
void main()
{
    u_xlat0.x = _Time.y * _ScrollSpeed;
    u_xlat4.x = u_xlat0.x + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat4.x>=(-u_xlat4.x));
#else
    u_xlatb4 = u_xlat4.x>=(-u_xlat4.x);
#endif
    u_xlat4.xy = (bool(u_xlatb4)) ? vec2(2.0, 0.5) : vec2(-2.0, -0.5);
    u_xlat0.x = u_xlat4.y * u_xlat0.x;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat1.xy = vs_TEXCOORD2.xy * vec2(_TexScaleX, _TexScaleY);
    u_xlat1.z = u_xlat4.x * u_xlat0.x + u_xlat1.y;
    u_xlat10_0.xyz = texture(_GradientMap, u_xlat1.xz).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * _GradientColor.xyz;
    u_xlat0.xyz = (-u_xlat10_0.xyz) * vec3(_GradientIn) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(_GradientIn);
    u_xlat1.xyz = u_xlat1.xyz + u_xlat1.xyz;
    u_xlat10_2.xyz = texture(_MatCap, vs_TEXCOORD1.xy).xyz;
    u_xlat10_3 = texture(_MatCapMask, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat10_2.xyz * u_xlat10_3.xyz;
    u_xlat16_2.w = u_xlat10_3.w;
    u_xlat16_2 = u_xlat16_2 * vec4(_MatCapIn);
    u_xlat10_3 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2 = u_xlat16_2 * u_xlat10_3;
    u_xlat16_2 = u_xlat16_2 * _Color;
    u_xlat0.xyz = u_xlat16_2.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = u_xlat16_2.w;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
in mediump vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
out mediump vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump vec2 u_xlat16_8;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = in_NORMAL0.x * hlslcc_mtx4x4unity_WorldToObject[0].x;
    u_xlat0.y = in_NORMAL0.x * hlslcc_mtx4x4unity_WorldToObject[1].x;
    u_xlat0.z = in_NORMAL0.x * hlslcc_mtx4x4unity_WorldToObject[2].x;
    u_xlat1.x = in_NORMAL0.y * hlslcc_mtx4x4unity_WorldToObject[0].y;
    u_xlat1.y = in_NORMAL0.y * hlslcc_mtx4x4unity_WorldToObject[1].y;
    u_xlat1.z = in_NORMAL0.y * hlslcc_mtx4x4unity_WorldToObject[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.x = in_NORMAL0.z * hlslcc_mtx4x4unity_WorldToObject[0].z;
    u_xlat1.y = in_NORMAL0.z * hlslcc_mtx4x4unity_WorldToObject[1].z;
    u_xlat1.z = in_NORMAL0.z * hlslcc_mtx4x4unity_WorldToObject[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat16_8.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat16_8.y = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat16_2.xy = u_xlat16_8.xy * vec2(0.400000006, 0.400000006) + vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat16_2.xy;
    u_xlat16_2.xy = in_POSITION0.xy;
    u_xlat16_2.z = 1.0;
    u_xlat0.x = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_2.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	mediump float _MatCapIn;
uniform 	mediump vec4 _Color;
uniform 	float _TexScaleX;
uniform 	float _TexScaleY;
uniform 	mediump vec4 _GradientColor;
uniform 	float _GradientIn;
uniform 	float _ScrollSpeed;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _MatCapMask;
uniform lowp sampler2D _MatCap;
uniform lowp sampler2D _GradientMap;
in mediump vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
lowp vec3 u_xlat10_2;
lowp vec4 u_xlat10_3;
vec2 u_xlat4;
bool u_xlatb4;
void main()
{
    u_xlat0.x = _Time.y * _ScrollSpeed;
    u_xlat4.x = u_xlat0.x + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat4.x>=(-u_xlat4.x));
#else
    u_xlatb4 = u_xlat4.x>=(-u_xlat4.x);
#endif
    u_xlat4.xy = (bool(u_xlatb4)) ? vec2(2.0, 0.5) : vec2(-2.0, -0.5);
    u_xlat0.x = u_xlat4.y * u_xlat0.x;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat1.xy = vs_TEXCOORD2.xy * vec2(_TexScaleX, _TexScaleY);
    u_xlat1.z = u_xlat4.x * u_xlat0.x + u_xlat1.y;
    u_xlat10_0.xyz = texture(_GradientMap, u_xlat1.xz).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * _GradientColor.xyz;
    u_xlat0.xyz = (-u_xlat10_0.xyz) * vec3(_GradientIn) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(_GradientIn);
    u_xlat1.xyz = u_xlat1.xyz + u_xlat1.xyz;
    u_xlat10_2.xyz = texture(_MatCap, vs_TEXCOORD1.xy).xyz;
    u_xlat10_3 = texture(_MatCapMask, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat10_2.xyz * u_xlat10_3.xyz;
    u_xlat16_2.w = u_xlat10_3.w;
    u_xlat16_2 = u_xlat16_2 * vec4(_MatCapIn);
    u_xlat10_3 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2 = u_xlat16_2 * u_xlat10_3;
    u_xlat16_2 = u_xlat16_2 * _Color;
    u_xlat0.xyz = u_xlat16_2.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = u_xlat16_2.w;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
in mediump vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
out mediump vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump vec2 u_xlat16_8;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = in_NORMAL0.x * hlslcc_mtx4x4unity_WorldToObject[0].x;
    u_xlat0.y = in_NORMAL0.x * hlslcc_mtx4x4unity_WorldToObject[1].x;
    u_xlat0.z = in_NORMAL0.x * hlslcc_mtx4x4unity_WorldToObject[2].x;
    u_xlat1.x = in_NORMAL0.y * hlslcc_mtx4x4unity_WorldToObject[0].y;
    u_xlat1.y = in_NORMAL0.y * hlslcc_mtx4x4unity_WorldToObject[1].y;
    u_xlat1.z = in_NORMAL0.y * hlslcc_mtx4x4unity_WorldToObject[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.x = in_NORMAL0.z * hlslcc_mtx4x4unity_WorldToObject[0].z;
    u_xlat1.y = in_NORMAL0.z * hlslcc_mtx4x4unity_WorldToObject[1].z;
    u_xlat1.z = in_NORMAL0.z * hlslcc_mtx4x4unity_WorldToObject[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat16_8.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat16_8.y = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat16_2.xy = u_xlat16_8.xy * vec2(0.400000006, 0.400000006) + vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat16_2.xy;
    u_xlat16_2.xy = in_POSITION0.xy;
    u_xlat16_2.z = 1.0;
    u_xlat0.x = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_2.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	mediump float _MatCapIn;
uniform 	mediump vec4 _Color;
uniform 	float _TexScaleX;
uniform 	float _TexScaleY;
uniform 	mediump vec4 _GradientColor;
uniform 	float _GradientIn;
uniform 	float _ScrollSpeed;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _MatCapMask;
uniform lowp sampler2D _MatCap;
uniform lowp sampler2D _GradientMap;
in mediump vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
lowp vec3 u_xlat10_2;
lowp vec4 u_xlat10_3;
vec2 u_xlat4;
bool u_xlatb4;
void main()
{
    u_xlat0.x = _Time.y * _ScrollSpeed;
    u_xlat4.x = u_xlat0.x + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat4.x>=(-u_xlat4.x));
#else
    u_xlatb4 = u_xlat4.x>=(-u_xlat4.x);
#endif
    u_xlat4.xy = (bool(u_xlatb4)) ? vec2(2.0, 0.5) : vec2(-2.0, -0.5);
    u_xlat0.x = u_xlat4.y * u_xlat0.x;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat1.xy = vs_TEXCOORD2.xy * vec2(_TexScaleX, _TexScaleY);
    u_xlat1.z = u_xlat4.x * u_xlat0.x + u_xlat1.y;
    u_xlat10_0.xyz = texture(_GradientMap, u_xlat1.xz).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * _GradientColor.xyz;
    u_xlat0.xyz = (-u_xlat10_0.xyz) * vec3(_GradientIn) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(_GradientIn);
    u_xlat1.xyz = u_xlat1.xyz + u_xlat1.xyz;
    u_xlat10_2.xyz = texture(_MatCap, vs_TEXCOORD1.xy).xyz;
    u_xlat10_3 = texture(_MatCapMask, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat10_2.xyz * u_xlat10_3.xyz;
    u_xlat16_2.w = u_xlat10_3.w;
    u_xlat16_2 = u_xlat16_2 * vec4(_MatCapIn);
    u_xlat10_3 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2 = u_xlat16_2 * u_xlat10_3;
    u_xlat16_2 = u_xlat16_2 * _Color;
    u_xlat0.xyz = u_xlat16_2.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = u_xlat16_2.w;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
}
Program "fp" {
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
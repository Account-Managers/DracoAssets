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
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec3 vs_TEXCOORD3;
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
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat1.xy;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * in_POSITION0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	mediump vec4 _EmisCol;
uniform 	mediump float _EmisIn;
uniform 	mediump vec4 _TimeColor;
uniform 	float _TexScaleX;
uniform 	float _TexScaleY;
uniform 	mediump vec4 _GradientColor;
uniform 	float _GradientIn;
uniform 	float _ScrollSpeed;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _EmisMask;
uniform lowp sampler2D _MatCap;
uniform lowp sampler2D _GradientMap;
in mediump vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in mediump vec3 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
mediump float u_xlat16_5;
vec2 u_xlat6;
bool u_xlatb6;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD2.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = vs_TEXCOORD2.xyz * (-u_xlat0.xxx) + vs_TEXCOORD1.xyz;
    u_xlat16_1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_5 = u_xlat0.z + 1.0;
    u_xlat16_1.x = u_xlat16_5 * u_xlat16_5 + u_xlat16_1.x;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat0.xy = u_xlat0.xy / u_xlat16_1.xx;
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat10_0 = texture(_MatCap, u_xlat0.xy);
    u_xlat16_0 = u_xlat10_0 * vec4(_EmisIn);
    u_xlat2.x = _Time.x * 40.0;
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat10_1 = texture(_EmisMask, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_1 * _EmisCol;
    u_xlat1 = u_xlat2.xxxx * u_xlat16_1;
    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2 = u_xlat10_2 * _TimeColor;
    u_xlat1 = u_xlat1 * u_xlat16_2;
    u_xlat16_0 = u_xlat16_2 * u_xlat16_0 + u_xlat1;
    u_xlat2.x = _Time.y * _ScrollSpeed;
    u_xlat6.x = u_xlat2.x + u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat6.x>=(-u_xlat6.x));
#else
    u_xlatb6 = u_xlat6.x>=(-u_xlat6.x);
#endif
    u_xlat6.xy = (bool(u_xlatb6)) ? vec2(2.0, 0.5) : vec2(-2.0, -0.5);
    u_xlat2.x = u_xlat6.y * u_xlat2.x;
    u_xlat2.x = fract(u_xlat2.x);
    u_xlat3.xy = vs_TEXCOORD3.xy * vec2(_TexScaleX, _TexScaleY);
    u_xlat3.z = u_xlat6.x * u_xlat2.x + u_xlat3.y;
    u_xlat10_2.xyz = texture(_GradientMap, u_xlat3.xz).xyz;
    u_xlat16_2.xyz = u_xlat10_2.xyz * _GradientColor.xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(_GradientIn) + u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    SV_Target0.xyz = u_xlat2.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec3 vs_TEXCOORD3;
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
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat1.xy;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * in_POSITION0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	mediump vec4 _EmisCol;
uniform 	mediump float _EmisIn;
uniform 	mediump vec4 _TimeColor;
uniform 	float _TexScaleX;
uniform 	float _TexScaleY;
uniform 	mediump vec4 _GradientColor;
uniform 	float _GradientIn;
uniform 	float _ScrollSpeed;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _EmisMask;
uniform lowp sampler2D _MatCap;
uniform lowp sampler2D _GradientMap;
in mediump vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in mediump vec3 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
mediump float u_xlat16_5;
vec2 u_xlat6;
bool u_xlatb6;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD2.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = vs_TEXCOORD2.xyz * (-u_xlat0.xxx) + vs_TEXCOORD1.xyz;
    u_xlat16_1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_5 = u_xlat0.z + 1.0;
    u_xlat16_1.x = u_xlat16_5 * u_xlat16_5 + u_xlat16_1.x;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat0.xy = u_xlat0.xy / u_xlat16_1.xx;
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat10_0 = texture(_MatCap, u_xlat0.xy);
    u_xlat16_0 = u_xlat10_0 * vec4(_EmisIn);
    u_xlat2.x = _Time.x * 40.0;
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat10_1 = texture(_EmisMask, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_1 * _EmisCol;
    u_xlat1 = u_xlat2.xxxx * u_xlat16_1;
    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2 = u_xlat10_2 * _TimeColor;
    u_xlat1 = u_xlat1 * u_xlat16_2;
    u_xlat16_0 = u_xlat16_2 * u_xlat16_0 + u_xlat1;
    u_xlat2.x = _Time.y * _ScrollSpeed;
    u_xlat6.x = u_xlat2.x + u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat6.x>=(-u_xlat6.x));
#else
    u_xlatb6 = u_xlat6.x>=(-u_xlat6.x);
#endif
    u_xlat6.xy = (bool(u_xlatb6)) ? vec2(2.0, 0.5) : vec2(-2.0, -0.5);
    u_xlat2.x = u_xlat6.y * u_xlat2.x;
    u_xlat2.x = fract(u_xlat2.x);
    u_xlat3.xy = vs_TEXCOORD3.xy * vec2(_TexScaleX, _TexScaleY);
    u_xlat3.z = u_xlat6.x * u_xlat2.x + u_xlat3.y;
    u_xlat10_2.xyz = texture(_GradientMap, u_xlat3.xz).xyz;
    u_xlat16_2.xyz = u_xlat10_2.xyz * _GradientColor.xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(_GradientIn) + u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    SV_Target0.xyz = u_xlat2.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec3 vs_TEXCOORD3;
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
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat1.xy;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * in_POSITION0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	mediump vec4 _EmisCol;
uniform 	mediump float _EmisIn;
uniform 	mediump vec4 _TimeColor;
uniform 	float _TexScaleX;
uniform 	float _TexScaleY;
uniform 	mediump vec4 _GradientColor;
uniform 	float _GradientIn;
uniform 	float _ScrollSpeed;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _EmisMask;
uniform lowp sampler2D _MatCap;
uniform lowp sampler2D _GradientMap;
in mediump vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in mediump vec3 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
mediump float u_xlat16_5;
vec2 u_xlat6;
bool u_xlatb6;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD2.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = vs_TEXCOORD2.xyz * (-u_xlat0.xxx) + vs_TEXCOORD1.xyz;
    u_xlat16_1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_5 = u_xlat0.z + 1.0;
    u_xlat16_1.x = u_xlat16_5 * u_xlat16_5 + u_xlat16_1.x;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat0.xy = u_xlat0.xy / u_xlat16_1.xx;
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat10_0 = texture(_MatCap, u_xlat0.xy);
    u_xlat16_0 = u_xlat10_0 * vec4(_EmisIn);
    u_xlat2.x = _Time.x * 40.0;
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat10_1 = texture(_EmisMask, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_1 * _EmisCol;
    u_xlat1 = u_xlat2.xxxx * u_xlat16_1;
    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2 = u_xlat10_2 * _TimeColor;
    u_xlat1 = u_xlat1 * u_xlat16_2;
    u_xlat16_0 = u_xlat16_2 * u_xlat16_0 + u_xlat1;
    u_xlat2.x = _Time.y * _ScrollSpeed;
    u_xlat6.x = u_xlat2.x + u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat6.x>=(-u_xlat6.x));
#else
    u_xlatb6 = u_xlat6.x>=(-u_xlat6.x);
#endif
    u_xlat6.xy = (bool(u_xlatb6)) ? vec2(2.0, 0.5) : vec2(-2.0, -0.5);
    u_xlat2.x = u_xlat6.y * u_xlat2.x;
    u_xlat2.x = fract(u_xlat2.x);
    u_xlat3.xy = vs_TEXCOORD3.xy * vec2(_TexScaleX, _TexScaleY);
    u_xlat3.z = u_xlat6.x * u_xlat2.x + u_xlat3.y;
    u_xlat10_2.xyz = texture(_GradientMap, u_xlat3.xz).xyz;
    u_xlat16_2.xyz = u_xlat10_2.xyz * _GradientColor.xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(_GradientIn) + u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    SV_Target0.xyz = u_xlat2.xyz;
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
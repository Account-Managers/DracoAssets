//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "FantaZiumGo/MatCap/Unlit_verticalScroll" {
Properties {
_Color ("Main Color", Color) = (1,1,1,1)
_MainTex ("Texture", 2D) = "white" { }
[Space(10)] [Header(Matcap)] _MatCap ("MatCap (RGB)", 2D) = "grey" { }
_MatCapIn ("Matcap Intensity", Range(1, 10)) = 1.5
[Space(10)] [Header(Gradient)] _GradientMap ("GradientMap (RGB)", 2D) = "white" { }
_TexScaleX ("Texture Scale: X", Float) = 1
_TexScaleY ("Texture Scale: Y", Float) = 0.1
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
  Cull Off
  GpuProgramID 16402
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec3 vs_TEXCOORD4;
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
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4glstate_matrix_projection[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4glstate_matrix_projection[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4glstate_matrix_projection[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4glstate_matrix_projection[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
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
uniform lowp sampler2D _MatCap;
uniform lowp sampler2D _GradientMap;
in mediump vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in mediump vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec3 u_xlat10_1;
mediump float u_xlat16_2;
lowp vec4 u_xlat10_2;
vec2 u_xlat3;
bool u_xlatb3;
mediump float u_xlat16_5;
float u_xlat9;
void main()
{
    u_xlat0.x = _Time.y * _ScrollSpeed;
    u_xlat3.x = u_xlat0.x + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat3.x>=(-u_xlat3.x));
#else
    u_xlatb3 = u_xlat3.x>=(-u_xlat3.x);
#endif
    u_xlat3.xy = (bool(u_xlatb3)) ? vec2(2.0, 0.5) : vec2(-2.0, -0.5);
    u_xlat0.x = u_xlat3.y * u_xlat0.x;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat1.xy = vs_TEXCOORD4.xy * vec2(_TexScaleX, _TexScaleY);
    u_xlat1.z = u_xlat3.x * u_xlat0.x + u_xlat1.y;
    u_xlat10_0.xyz = texture(_GradientMap, u_xlat1.xz).xyz;
    u_xlat16_0.xyz = u_xlat10_0.xyz * _GradientColor.xyz;
    u_xlat9 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD2.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = vs_TEXCOORD2.xyz * (-vec3(u_xlat9)) + vs_TEXCOORD1.xyz;
    u_xlat16_2 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat16_5 = u_xlat1.z + 1.0;
    u_xlat16_2 = u_xlat16_5 * u_xlat16_5 + u_xlat16_2;
    u_xlat16_2 = sqrt(u_xlat16_2);
    u_xlat16_2 = u_xlat16_2 + u_xlat16_2;
    u_xlat1.xy = u_xlat1.xy / vec2(u_xlat16_2);
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat10_1.xyz = texture(_MatCap, u_xlat1.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_1.xyz * vec3(_MatCapIn);
    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.w = _MatCapIn;
    u_xlat16_1 = u_xlat16_1 * u_xlat10_2;
    u_xlat16_1 = u_xlat16_1 * _Color;
    u_xlat0.xyz = u_xlat16_0.xyz * vec3(_GradientIn) + u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_1.w;
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
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec3 vs_TEXCOORD4;
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
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4glstate_matrix_projection[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4glstate_matrix_projection[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4glstate_matrix_projection[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4glstate_matrix_projection[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
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
uniform lowp sampler2D _MatCap;
uniform lowp sampler2D _GradientMap;
in mediump vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in mediump vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec3 u_xlat10_1;
mediump float u_xlat16_2;
lowp vec4 u_xlat10_2;
vec2 u_xlat3;
bool u_xlatb3;
mediump float u_xlat16_5;
float u_xlat9;
void main()
{
    u_xlat0.x = _Time.y * _ScrollSpeed;
    u_xlat3.x = u_xlat0.x + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat3.x>=(-u_xlat3.x));
#else
    u_xlatb3 = u_xlat3.x>=(-u_xlat3.x);
#endif
    u_xlat3.xy = (bool(u_xlatb3)) ? vec2(2.0, 0.5) : vec2(-2.0, -0.5);
    u_xlat0.x = u_xlat3.y * u_xlat0.x;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat1.xy = vs_TEXCOORD4.xy * vec2(_TexScaleX, _TexScaleY);
    u_xlat1.z = u_xlat3.x * u_xlat0.x + u_xlat1.y;
    u_xlat10_0.xyz = texture(_GradientMap, u_xlat1.xz).xyz;
    u_xlat16_0.xyz = u_xlat10_0.xyz * _GradientColor.xyz;
    u_xlat9 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD2.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = vs_TEXCOORD2.xyz * (-vec3(u_xlat9)) + vs_TEXCOORD1.xyz;
    u_xlat16_2 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat16_5 = u_xlat1.z + 1.0;
    u_xlat16_2 = u_xlat16_5 * u_xlat16_5 + u_xlat16_2;
    u_xlat16_2 = sqrt(u_xlat16_2);
    u_xlat16_2 = u_xlat16_2 + u_xlat16_2;
    u_xlat1.xy = u_xlat1.xy / vec2(u_xlat16_2);
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat10_1.xyz = texture(_MatCap, u_xlat1.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_1.xyz * vec3(_MatCapIn);
    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.w = _MatCapIn;
    u_xlat16_1 = u_xlat16_1 * u_xlat10_2;
    u_xlat16_1 = u_xlat16_1 * _Color;
    u_xlat0.xyz = u_xlat16_0.xyz * vec3(_GradientIn) + u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_1.w;
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
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec3 vs_TEXCOORD4;
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
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4glstate_matrix_projection[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4glstate_matrix_projection[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4glstate_matrix_projection[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4glstate_matrix_projection[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
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
uniform lowp sampler2D _MatCap;
uniform lowp sampler2D _GradientMap;
in mediump vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in mediump vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec3 u_xlat10_1;
mediump float u_xlat16_2;
lowp vec4 u_xlat10_2;
vec2 u_xlat3;
bool u_xlatb3;
mediump float u_xlat16_5;
float u_xlat9;
void main()
{
    u_xlat0.x = _Time.y * _ScrollSpeed;
    u_xlat3.x = u_xlat0.x + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat3.x>=(-u_xlat3.x));
#else
    u_xlatb3 = u_xlat3.x>=(-u_xlat3.x);
#endif
    u_xlat3.xy = (bool(u_xlatb3)) ? vec2(2.0, 0.5) : vec2(-2.0, -0.5);
    u_xlat0.x = u_xlat3.y * u_xlat0.x;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat1.xy = vs_TEXCOORD4.xy * vec2(_TexScaleX, _TexScaleY);
    u_xlat1.z = u_xlat3.x * u_xlat0.x + u_xlat1.y;
    u_xlat10_0.xyz = texture(_GradientMap, u_xlat1.xz).xyz;
    u_xlat16_0.xyz = u_xlat10_0.xyz * _GradientColor.xyz;
    u_xlat9 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD2.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = vs_TEXCOORD2.xyz * (-vec3(u_xlat9)) + vs_TEXCOORD1.xyz;
    u_xlat16_2 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat16_5 = u_xlat1.z + 1.0;
    u_xlat16_2 = u_xlat16_5 * u_xlat16_5 + u_xlat16_2;
    u_xlat16_2 = sqrt(u_xlat16_2);
    u_xlat16_2 = u_xlat16_2 + u_xlat16_2;
    u_xlat1.xy = u_xlat1.xy / vec2(u_xlat16_2);
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat10_1.xyz = texture(_MatCap, u_xlat1.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_1.xyz * vec3(_MatCapIn);
    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.w = _MatCapIn;
    u_xlat16_1 = u_xlat16_1 * u_xlat10_2;
    u_xlat16_1 = u_xlat16_1 * _Color;
    u_xlat0.xyz = u_xlat16_0.xyz * vec3(_GradientIn) + u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_1.w;
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
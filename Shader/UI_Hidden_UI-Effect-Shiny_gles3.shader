//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "UI/Hidden/UI-Effect-Shiny" {
Properties {
_MainTex ("Main Texture", 2D) = "white" { }
_Color ("Tint", Color) = (1,1,1,1)
_StencilComp ("Stencil Comparison", Float) = 8
_Stencil ("Stencil ID", Float) = 0
_StencilOp ("Stencil Operation", Float) = 0
_StencilWriteMask ("Stencil Write Mask", Float) = 255
_StencilReadMask ("Stencil Read Mask", Float) = 255
_ColorMask ("Color Mask", Float) = 15
[Toggle(UNITY_UI_ALPHACLIP)] _UseUIAlphaClip ("Use Alpha Clip", Float) = 0
_ParamTex ("Parameter Texture", 2D) = "white" { }
}
SubShader {
 Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Name "DEFAULT"
  Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZTest Off
  ZWrite Off
  Cull Off
  GpuProgramID 72
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_2;
out mediump vec2 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
bvec4 u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
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
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    u_xlat0 = in_TEXCOORD0.xxyy * vec4(4096.0, 0.000244140625, 4096.0, 0.000244140625);
    u_xlat3.xz = floor(u_xlat0.yw);
    u_xlatb1 = greaterThanEqual(u_xlat0.xxzz, (-u_xlat0.xxzz));
    u_xlat1.x = (u_xlatb1.x) ? float(4096.0) : float(-4096.0);
    u_xlat1.y = (u_xlatb1.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat1.z = (u_xlatb1.z) ? float(4096.0) : float(-4096.0);
    u_xlat1.w = (u_xlatb1.w) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat2 = u_xlat3.xxzz * vec4(4096.0, 4096.0, 4096.0, 4096.0);
    u_xlatb2 = greaterThanEqual(u_xlat2, (-u_xlat2.yyww));
    u_xlat2.x = (u_xlatb2.x) ? float(4096.0) : float(-4096.0);
    u_xlat2.y = (u_xlatb2.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat2.z = (u_xlatb2.z) ? float(4096.0) : float(-4096.0);
    u_xlat2.w = (u_xlatb2.w) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat0.xy = vec2(u_xlat3.x * u_xlat2.y, u_xlat3.z * u_xlat2.w);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.xz;
    u_xlat0.yw = u_xlat0.xy * vec2(0.000244200259, 0.000244200259);
    u_xlat4.xz = vec2(u_xlat1.y * in_TEXCOORD0.x, u_xlat1.w * in_TEXCOORD0.y);
    u_xlat4.xz = fract(u_xlat4.xz);
    u_xlat1.xy = u_xlat4.xz * u_xlat1.xz;
    u_xlat0.xz = u_xlat1.xy * vec2(0.000244200259, 0.000244200259);
    phase0_Output0_2 = u_xlat0;
    vs_TEXCOORD1 = in_POSITION0;
vs_TEXCOORD0 = phase0_Output0_2.xy;
vs_TEXCOORD2 = phase0_Output0_2.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _ParamTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
bvec2 u_xlatb1;
lowp float u_xlat10_2;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec3 u_xlat16_4;
vec2 u_xlat6;
bvec2 u_xlatb6;
void main()
{
    u_xlat16_0.x = float(0.25);
    u_xlat16_0.z = float(0.75);
    u_xlat16_0.yw = vs_TEXCOORD2.yy;
    u_xlat10_1 = texture(_ParamTex, u_xlat16_0.xy);
    u_xlat10_2 = texture(_ParamTex, u_xlat16_0.zw).x;
    u_xlat16_0.x = u_xlat10_1.x * 2.0 + -0.5;
    u_xlat16_0.x = (-u_xlat16_0.x) + vs_TEXCOORD2.x;
    u_xlat16_0.x = u_xlat16_0.x / u_xlat10_1.y;
    u_xlat16_0.x = min(abs(u_xlat16_0.x), 1.0);
    u_xlat16_0.x = (-u_xlat16_0.x) + 1.0;
    u_xlat16_4.x = u_xlat10_1.z + u_xlat10_1.z;
    u_xlat16_4.x = float(1.0) / u_xlat16_4.x;
    u_xlat16_0.x = u_xlat16_4.x * u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat16_0.x * -2.0 + 3.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_4.x;
    u_xlat16_0.x = u_xlat16_0.x * 0.5;
    u_xlatb1.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlat1.xy = mix(vec2(0.0, 0.0), vec2(1.0, 1.0), vec2(u_xlatb1.xy));
    u_xlatb6.xy = greaterThanEqual(_ClipRect.zwzz, vs_TEXCOORD1.xyxx).xy;
    u_xlat6.xy = mix(vec2(0.0, 0.0), vec2(1.0, 1.0), vec2(u_xlatb6.xy));
    u_xlat1.xy = u_xlat1.xy * u_xlat6.xy;
    u_xlat1.x = u_xlat1.y * u_xlat1.x;
    u_xlat10_3 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3 = u_xlat10_3 + _TextureSampleAdd;
    u_xlat16_3 = u_xlat16_3 * vs_COLOR0;
    u_xlat1.x = u_xlat1.x * u_xlat16_3.w;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat1.x;
    SV_Target0.w = u_xlat1.x;
    u_xlat16_0.x = u_xlat10_1.w * u_xlat16_0.x;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(10.0, 10.0, 10.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = vec3(u_xlat10_2) * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    SV_Target0.xyz = u_xlat16_0.xxx * u_xlat16_4.xyz + u_xlat16_3.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_2;
out mediump vec2 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
bvec4 u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
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
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    u_xlat0 = in_TEXCOORD0.xxyy * vec4(4096.0, 0.000244140625, 4096.0, 0.000244140625);
    u_xlat3.xz = floor(u_xlat0.yw);
    u_xlatb1 = greaterThanEqual(u_xlat0.xxzz, (-u_xlat0.xxzz));
    u_xlat1.x = (u_xlatb1.x) ? float(4096.0) : float(-4096.0);
    u_xlat1.y = (u_xlatb1.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat1.z = (u_xlatb1.z) ? float(4096.0) : float(-4096.0);
    u_xlat1.w = (u_xlatb1.w) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat2 = u_xlat3.xxzz * vec4(4096.0, 4096.0, 4096.0, 4096.0);
    u_xlatb2 = greaterThanEqual(u_xlat2, (-u_xlat2.yyww));
    u_xlat2.x = (u_xlatb2.x) ? float(4096.0) : float(-4096.0);
    u_xlat2.y = (u_xlatb2.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat2.z = (u_xlatb2.z) ? float(4096.0) : float(-4096.0);
    u_xlat2.w = (u_xlatb2.w) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat0.xy = vec2(u_xlat3.x * u_xlat2.y, u_xlat3.z * u_xlat2.w);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.xz;
    u_xlat0.yw = u_xlat0.xy * vec2(0.000244200259, 0.000244200259);
    u_xlat4.xz = vec2(u_xlat1.y * in_TEXCOORD0.x, u_xlat1.w * in_TEXCOORD0.y);
    u_xlat4.xz = fract(u_xlat4.xz);
    u_xlat1.xy = u_xlat4.xz * u_xlat1.xz;
    u_xlat0.xz = u_xlat1.xy * vec2(0.000244200259, 0.000244200259);
    phase0_Output0_2 = u_xlat0;
    vs_TEXCOORD1 = in_POSITION0;
vs_TEXCOORD0 = phase0_Output0_2.xy;
vs_TEXCOORD2 = phase0_Output0_2.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _ParamTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
bvec2 u_xlatb1;
lowp float u_xlat10_2;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec3 u_xlat16_4;
vec2 u_xlat6;
bvec2 u_xlatb6;
void main()
{
    u_xlat16_0.x = float(0.25);
    u_xlat16_0.z = float(0.75);
    u_xlat16_0.yw = vs_TEXCOORD2.yy;
    u_xlat10_1 = texture(_ParamTex, u_xlat16_0.xy);
    u_xlat10_2 = texture(_ParamTex, u_xlat16_0.zw).x;
    u_xlat16_0.x = u_xlat10_1.x * 2.0 + -0.5;
    u_xlat16_0.x = (-u_xlat16_0.x) + vs_TEXCOORD2.x;
    u_xlat16_0.x = u_xlat16_0.x / u_xlat10_1.y;
    u_xlat16_0.x = min(abs(u_xlat16_0.x), 1.0);
    u_xlat16_0.x = (-u_xlat16_0.x) + 1.0;
    u_xlat16_4.x = u_xlat10_1.z + u_xlat10_1.z;
    u_xlat16_4.x = float(1.0) / u_xlat16_4.x;
    u_xlat16_0.x = u_xlat16_4.x * u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat16_0.x * -2.0 + 3.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_4.x;
    u_xlat16_0.x = u_xlat16_0.x * 0.5;
    u_xlatb1.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlat1.xy = mix(vec2(0.0, 0.0), vec2(1.0, 1.0), vec2(u_xlatb1.xy));
    u_xlatb6.xy = greaterThanEqual(_ClipRect.zwzz, vs_TEXCOORD1.xyxx).xy;
    u_xlat6.xy = mix(vec2(0.0, 0.0), vec2(1.0, 1.0), vec2(u_xlatb6.xy));
    u_xlat1.xy = u_xlat1.xy * u_xlat6.xy;
    u_xlat1.x = u_xlat1.y * u_xlat1.x;
    u_xlat10_3 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3 = u_xlat10_3 + _TextureSampleAdd;
    u_xlat16_3 = u_xlat16_3 * vs_COLOR0;
    u_xlat1.x = u_xlat1.x * u_xlat16_3.w;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat1.x;
    SV_Target0.w = u_xlat1.x;
    u_xlat16_0.x = u_xlat10_1.w * u_xlat16_0.x;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(10.0, 10.0, 10.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = vec3(u_xlat10_2) * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    SV_Target0.xyz = u_xlat16_0.xxx * u_xlat16_4.xyz + u_xlat16_3.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_2;
out mediump vec2 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
bvec4 u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
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
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    u_xlat0 = in_TEXCOORD0.xxyy * vec4(4096.0, 0.000244140625, 4096.0, 0.000244140625);
    u_xlat3.xz = floor(u_xlat0.yw);
    u_xlatb1 = greaterThanEqual(u_xlat0.xxzz, (-u_xlat0.xxzz));
    u_xlat1.x = (u_xlatb1.x) ? float(4096.0) : float(-4096.0);
    u_xlat1.y = (u_xlatb1.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat1.z = (u_xlatb1.z) ? float(4096.0) : float(-4096.0);
    u_xlat1.w = (u_xlatb1.w) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat2 = u_xlat3.xxzz * vec4(4096.0, 4096.0, 4096.0, 4096.0);
    u_xlatb2 = greaterThanEqual(u_xlat2, (-u_xlat2.yyww));
    u_xlat2.x = (u_xlatb2.x) ? float(4096.0) : float(-4096.0);
    u_xlat2.y = (u_xlatb2.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat2.z = (u_xlatb2.z) ? float(4096.0) : float(-4096.0);
    u_xlat2.w = (u_xlatb2.w) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat0.xy = vec2(u_xlat3.x * u_xlat2.y, u_xlat3.z * u_xlat2.w);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.xz;
    u_xlat0.yw = u_xlat0.xy * vec2(0.000244200259, 0.000244200259);
    u_xlat4.xz = vec2(u_xlat1.y * in_TEXCOORD0.x, u_xlat1.w * in_TEXCOORD0.y);
    u_xlat4.xz = fract(u_xlat4.xz);
    u_xlat1.xy = u_xlat4.xz * u_xlat1.xz;
    u_xlat0.xz = u_xlat1.xy * vec2(0.000244200259, 0.000244200259);
    phase0_Output0_2 = u_xlat0;
    vs_TEXCOORD1 = in_POSITION0;
vs_TEXCOORD0 = phase0_Output0_2.xy;
vs_TEXCOORD2 = phase0_Output0_2.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _ParamTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
bvec2 u_xlatb1;
lowp float u_xlat10_2;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec3 u_xlat16_4;
vec2 u_xlat6;
bvec2 u_xlatb6;
void main()
{
    u_xlat16_0.x = float(0.25);
    u_xlat16_0.z = float(0.75);
    u_xlat16_0.yw = vs_TEXCOORD2.yy;
    u_xlat10_1 = texture(_ParamTex, u_xlat16_0.xy);
    u_xlat10_2 = texture(_ParamTex, u_xlat16_0.zw).x;
    u_xlat16_0.x = u_xlat10_1.x * 2.0 + -0.5;
    u_xlat16_0.x = (-u_xlat16_0.x) + vs_TEXCOORD2.x;
    u_xlat16_0.x = u_xlat16_0.x / u_xlat10_1.y;
    u_xlat16_0.x = min(abs(u_xlat16_0.x), 1.0);
    u_xlat16_0.x = (-u_xlat16_0.x) + 1.0;
    u_xlat16_4.x = u_xlat10_1.z + u_xlat10_1.z;
    u_xlat16_4.x = float(1.0) / u_xlat16_4.x;
    u_xlat16_0.x = u_xlat16_4.x * u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat16_0.x * -2.0 + 3.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_4.x;
    u_xlat16_0.x = u_xlat16_0.x * 0.5;
    u_xlatb1.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlat1.xy = mix(vec2(0.0, 0.0), vec2(1.0, 1.0), vec2(u_xlatb1.xy));
    u_xlatb6.xy = greaterThanEqual(_ClipRect.zwzz, vs_TEXCOORD1.xyxx).xy;
    u_xlat6.xy = mix(vec2(0.0, 0.0), vec2(1.0, 1.0), vec2(u_xlatb6.xy));
    u_xlat1.xy = u_xlat1.xy * u_xlat6.xy;
    u_xlat1.x = u_xlat1.y * u_xlat1.x;
    u_xlat10_3 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3 = u_xlat10_3 + _TextureSampleAdd;
    u_xlat16_3 = u_xlat16_3 * vs_COLOR0;
    u_xlat1.x = u_xlat1.x * u_xlat16_3.w;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat1.x;
    SV_Target0.w = u_xlat1.x;
    u_xlat16_0.x = u_xlat10_1.w * u_xlat16_0.x;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(10.0, 10.0, 10.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = vec3(u_xlat10_2) * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    SV_Target0.xyz = u_xlat16_0.xxx * u_xlat16_4.xyz + u_xlat16_3.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "UNITY_UI_ALPHACLIP" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_2;
out mediump vec2 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
bvec4 u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
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
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    u_xlat0 = in_TEXCOORD0.xxyy * vec4(4096.0, 0.000244140625, 4096.0, 0.000244140625);
    u_xlat3.xz = floor(u_xlat0.yw);
    u_xlatb1 = greaterThanEqual(u_xlat0.xxzz, (-u_xlat0.xxzz));
    u_xlat1.x = (u_xlatb1.x) ? float(4096.0) : float(-4096.0);
    u_xlat1.y = (u_xlatb1.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat1.z = (u_xlatb1.z) ? float(4096.0) : float(-4096.0);
    u_xlat1.w = (u_xlatb1.w) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat2 = u_xlat3.xxzz * vec4(4096.0, 4096.0, 4096.0, 4096.0);
    u_xlatb2 = greaterThanEqual(u_xlat2, (-u_xlat2.yyww));
    u_xlat2.x = (u_xlatb2.x) ? float(4096.0) : float(-4096.0);
    u_xlat2.y = (u_xlatb2.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat2.z = (u_xlatb2.z) ? float(4096.0) : float(-4096.0);
    u_xlat2.w = (u_xlatb2.w) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat0.xy = vec2(u_xlat3.x * u_xlat2.y, u_xlat3.z * u_xlat2.w);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.xz;
    u_xlat0.yw = u_xlat0.xy * vec2(0.000244200259, 0.000244200259);
    u_xlat4.xz = vec2(u_xlat1.y * in_TEXCOORD0.x, u_xlat1.w * in_TEXCOORD0.y);
    u_xlat4.xz = fract(u_xlat4.xz);
    u_xlat1.xy = u_xlat4.xz * u_xlat1.xz;
    u_xlat0.xz = u_xlat1.xy * vec2(0.000244200259, 0.000244200259);
    phase0_Output0_2 = u_xlat0;
    vs_TEXCOORD1 = in_POSITION0;
vs_TEXCOORD0 = phase0_Output0_2.xy;
vs_TEXCOORD2 = phase0_Output0_2.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _ParamTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bvec4 u_xlatb0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_3;
lowp float u_xlat10_4;
bool u_xlatb4;
mediump vec3 u_xlat16_6;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlatb0.zw = greaterThanEqual(_ClipRect.zzzw, vs_TEXCOORD1.xxxy).zw;
    u_xlat0 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb0));
    u_xlat0.xy = vec2(u_xlat0.z * u_xlat0.x, u_xlat0.w * u_xlat0.y);
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_1 + _TextureSampleAdd;
    u_xlat16_1 = u_xlat16_1 * vs_COLOR0;
    u_xlat16_2.x = u_xlat16_1.w * u_xlat0.x + -0.00100000005;
    u_xlat0.x = u_xlat0.x * u_xlat16_1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb4 = u_xlat16_2.x<0.0;
#endif
    if((int(u_xlatb4) * int(0xffffffffu))!=0){discard;}
    u_xlat16_2.x = float(0.25);
    u_xlat16_2.z = float(0.75);
    u_xlat16_2.yw = vs_TEXCOORD2.yy;
    u_xlat10_3 = texture(_ParamTex, u_xlat16_2.xy);
    u_xlat10_4 = texture(_ParamTex, u_xlat16_2.zw).x;
    u_xlat16_2.x = u_xlat10_3.x * 2.0 + -0.5;
    u_xlat16_2.x = (-u_xlat16_2.x) + vs_TEXCOORD2.x;
    u_xlat16_2.x = u_xlat16_2.x / u_xlat10_3.y;
    u_xlat16_2.x = min(abs(u_xlat16_2.x), 1.0);
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    u_xlat16_6.x = u_xlat10_3.z + u_xlat10_3.z;
    u_xlat16_6.x = float(1.0) / u_xlat16_6.x;
    u_xlat16_2.x = u_xlat16_6.x * u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_2.x * -2.0 + 3.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_6.x;
    u_xlat16_2.x = u_xlat16_2.x * 0.5;
    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x;
    SV_Target0.w = u_xlat0.x;
    u_xlat16_2.x = u_xlat10_3.w * u_xlat16_2.x;
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(10.0, 10.0, 10.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6.xyz = vec3(u_xlat10_4) * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
    SV_Target0.xyz = u_xlat16_2.xxx * u_xlat16_6.xyz + u_xlat16_1.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "UNITY_UI_ALPHACLIP" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_2;
out mediump vec2 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
bvec4 u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
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
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    u_xlat0 = in_TEXCOORD0.xxyy * vec4(4096.0, 0.000244140625, 4096.0, 0.000244140625);
    u_xlat3.xz = floor(u_xlat0.yw);
    u_xlatb1 = greaterThanEqual(u_xlat0.xxzz, (-u_xlat0.xxzz));
    u_xlat1.x = (u_xlatb1.x) ? float(4096.0) : float(-4096.0);
    u_xlat1.y = (u_xlatb1.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat1.z = (u_xlatb1.z) ? float(4096.0) : float(-4096.0);
    u_xlat1.w = (u_xlatb1.w) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat2 = u_xlat3.xxzz * vec4(4096.0, 4096.0, 4096.0, 4096.0);
    u_xlatb2 = greaterThanEqual(u_xlat2, (-u_xlat2.yyww));
    u_xlat2.x = (u_xlatb2.x) ? float(4096.0) : float(-4096.0);
    u_xlat2.y = (u_xlatb2.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat2.z = (u_xlatb2.z) ? float(4096.0) : float(-4096.0);
    u_xlat2.w = (u_xlatb2.w) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat0.xy = vec2(u_xlat3.x * u_xlat2.y, u_xlat3.z * u_xlat2.w);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.xz;
    u_xlat0.yw = u_xlat0.xy * vec2(0.000244200259, 0.000244200259);
    u_xlat4.xz = vec2(u_xlat1.y * in_TEXCOORD0.x, u_xlat1.w * in_TEXCOORD0.y);
    u_xlat4.xz = fract(u_xlat4.xz);
    u_xlat1.xy = u_xlat4.xz * u_xlat1.xz;
    u_xlat0.xz = u_xlat1.xy * vec2(0.000244200259, 0.000244200259);
    phase0_Output0_2 = u_xlat0;
    vs_TEXCOORD1 = in_POSITION0;
vs_TEXCOORD0 = phase0_Output0_2.xy;
vs_TEXCOORD2 = phase0_Output0_2.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _ParamTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bvec4 u_xlatb0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_3;
lowp float u_xlat10_4;
bool u_xlatb4;
mediump vec3 u_xlat16_6;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlatb0.zw = greaterThanEqual(_ClipRect.zzzw, vs_TEXCOORD1.xxxy).zw;
    u_xlat0 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb0));
    u_xlat0.xy = vec2(u_xlat0.z * u_xlat0.x, u_xlat0.w * u_xlat0.y);
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_1 + _TextureSampleAdd;
    u_xlat16_1 = u_xlat16_1 * vs_COLOR0;
    u_xlat16_2.x = u_xlat16_1.w * u_xlat0.x + -0.00100000005;
    u_xlat0.x = u_xlat0.x * u_xlat16_1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb4 = u_xlat16_2.x<0.0;
#endif
    if((int(u_xlatb4) * int(0xffffffffu))!=0){discard;}
    u_xlat16_2.x = float(0.25);
    u_xlat16_2.z = float(0.75);
    u_xlat16_2.yw = vs_TEXCOORD2.yy;
    u_xlat10_3 = texture(_ParamTex, u_xlat16_2.xy);
    u_xlat10_4 = texture(_ParamTex, u_xlat16_2.zw).x;
    u_xlat16_2.x = u_xlat10_3.x * 2.0 + -0.5;
    u_xlat16_2.x = (-u_xlat16_2.x) + vs_TEXCOORD2.x;
    u_xlat16_2.x = u_xlat16_2.x / u_xlat10_3.y;
    u_xlat16_2.x = min(abs(u_xlat16_2.x), 1.0);
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    u_xlat16_6.x = u_xlat10_3.z + u_xlat10_3.z;
    u_xlat16_6.x = float(1.0) / u_xlat16_6.x;
    u_xlat16_2.x = u_xlat16_6.x * u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_2.x * -2.0 + 3.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_6.x;
    u_xlat16_2.x = u_xlat16_2.x * 0.5;
    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x;
    SV_Target0.w = u_xlat0.x;
    u_xlat16_2.x = u_xlat10_3.w * u_xlat16_2.x;
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(10.0, 10.0, 10.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6.xyz = vec3(u_xlat10_4) * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
    SV_Target0.xyz = u_xlat16_2.xxx * u_xlat16_6.xyz + u_xlat16_1.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "UNITY_UI_ALPHACLIP" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_2;
out mediump vec2 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
bvec4 u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
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
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    u_xlat0 = in_TEXCOORD0.xxyy * vec4(4096.0, 0.000244140625, 4096.0, 0.000244140625);
    u_xlat3.xz = floor(u_xlat0.yw);
    u_xlatb1 = greaterThanEqual(u_xlat0.xxzz, (-u_xlat0.xxzz));
    u_xlat1.x = (u_xlatb1.x) ? float(4096.0) : float(-4096.0);
    u_xlat1.y = (u_xlatb1.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat1.z = (u_xlatb1.z) ? float(4096.0) : float(-4096.0);
    u_xlat1.w = (u_xlatb1.w) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat2 = u_xlat3.xxzz * vec4(4096.0, 4096.0, 4096.0, 4096.0);
    u_xlatb2 = greaterThanEqual(u_xlat2, (-u_xlat2.yyww));
    u_xlat2.x = (u_xlatb2.x) ? float(4096.0) : float(-4096.0);
    u_xlat2.y = (u_xlatb2.y) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat2.z = (u_xlatb2.z) ? float(4096.0) : float(-4096.0);
    u_xlat2.w = (u_xlatb2.w) ? float(0.000244140625) : float(-0.000244140625);
    u_xlat0.xy = vec2(u_xlat3.x * u_xlat2.y, u_xlat3.z * u_xlat2.w);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.xz;
    u_xlat0.yw = u_xlat0.xy * vec2(0.000244200259, 0.000244200259);
    u_xlat4.xz = vec2(u_xlat1.y * in_TEXCOORD0.x, u_xlat1.w * in_TEXCOORD0.y);
    u_xlat4.xz = fract(u_xlat4.xz);
    u_xlat1.xy = u_xlat4.xz * u_xlat1.xz;
    u_xlat0.xz = u_xlat1.xy * vec2(0.000244200259, 0.000244200259);
    phase0_Output0_2 = u_xlat0;
    vs_TEXCOORD1 = in_POSITION0;
vs_TEXCOORD0 = phase0_Output0_2.xy;
vs_TEXCOORD2 = phase0_Output0_2.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _ParamTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bvec4 u_xlatb0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_3;
lowp float u_xlat10_4;
bool u_xlatb4;
mediump vec3 u_xlat16_6;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlatb0.zw = greaterThanEqual(_ClipRect.zzzw, vs_TEXCOORD1.xxxy).zw;
    u_xlat0 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb0));
    u_xlat0.xy = vec2(u_xlat0.z * u_xlat0.x, u_xlat0.w * u_xlat0.y);
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_1 + _TextureSampleAdd;
    u_xlat16_1 = u_xlat16_1 * vs_COLOR0;
    u_xlat16_2.x = u_xlat16_1.w * u_xlat0.x + -0.00100000005;
    u_xlat0.x = u_xlat0.x * u_xlat16_1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb4 = u_xlat16_2.x<0.0;
#endif
    if((int(u_xlatb4) * int(0xffffffffu))!=0){discard;}
    u_xlat16_2.x = float(0.25);
    u_xlat16_2.z = float(0.75);
    u_xlat16_2.yw = vs_TEXCOORD2.yy;
    u_xlat10_3 = texture(_ParamTex, u_xlat16_2.xy);
    u_xlat10_4 = texture(_ParamTex, u_xlat16_2.zw).x;
    u_xlat16_2.x = u_xlat10_3.x * 2.0 + -0.5;
    u_xlat16_2.x = (-u_xlat16_2.x) + vs_TEXCOORD2.x;
    u_xlat16_2.x = u_xlat16_2.x / u_xlat10_3.y;
    u_xlat16_2.x = min(abs(u_xlat16_2.x), 1.0);
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    u_xlat16_6.x = u_xlat10_3.z + u_xlat10_3.z;
    u_xlat16_6.x = float(1.0) / u_xlat16_6.x;
    u_xlat16_2.x = u_xlat16_6.x * u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_2.x * -2.0 + 3.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_6.x;
    u_xlat16_2.x = u_xlat16_2.x * 0.5;
    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x;
    SV_Target0.w = u_xlat0.x;
    u_xlat16_2.x = u_xlat10_3.w * u_xlat16_2.x;
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(10.0, 10.0, 10.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6.xyz = vec3(u_xlat10_4) * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
    SV_Target0.xyz = u_xlat16_2.xxx * u_xlat16_6.xyz + u_xlat16_1.xyz;
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
SubProgram "gles3 hw_tier00 " {
Keywords { "UNITY_UI_ALPHACLIP" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "UNITY_UI_ALPHACLIP" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "UNITY_UI_ALPHACLIP" }
""
}
}
}
}
}
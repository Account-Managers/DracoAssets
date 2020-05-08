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
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD3.xyz = in_NORMAL0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	float _TexScale;
uniform 	mediump vec4 _MainCol;
uniform 	mediump vec4 _WaveCol;
uniform 	mediump vec4 _FresCol;
uniform 	float _Fade;
uniform 	float _WaveDecay;
uniform 	float _Freq;
uniform 	float _Amp;
uniform 	float _FresnelPower;
uniform lowp sampler2D _WigTex;
uniform lowp sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec2 u_xlat6;
lowp vec2 u_xlat10_6;
float u_xlat10;
void main()
{
    u_xlat0.xy = _Time.xy + vec2(25.0, 25.0);
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_Freq, _Freq));
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat6.xy = vs_TEXCOORD0.xy / vec2(_TexScale);
    u_xlat10_6.xy = texture(_WigTex, u_xlat6.xy).xy;
    u_xlat1.xy = u_xlat10_6.xy * vec2(vec2(_Amp, _Amp)) + (-vs_TEXCOORD0.yx);
    u_xlat6.xy = u_xlat10_6.xy * vec2(vec2(_Amp, _Amp)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = (-u_xlat0.xy) * vec2(200.0, 200.0) + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy / vec2(_TexScale);
    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_1 = u_xlat10_1 * _WaveCol;
    u_xlat0.xy = _Time.xy * vec2(vec2(_Freq, _Freq));
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(200.0, 200.0) + u_xlat6.xy;
    u_xlat0.xy = u_xlat0.xy / vec2(_TexScale);
    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = u_xlat10_0 * _WaveCol;
    u_xlat0 = u_xlat16_0 * vec4(vec4(_WaveDecay, _WaveDecay, _WaveDecay, _WaveDecay)) + _MainCol;
    u_xlat0 = u_xlat16_1 * vec4(vec4(_WaveDecay, _WaveDecay, _WaveDecay, _WaveDecay)) + u_xlat0;
    u_xlat0 = u_xlat0 * vec4(_Fade);
    u_xlat0 = u_xlat0 * vec4(5.0, 5.0, 5.0, 5.0);
    u_xlat1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD2.xyz;
    u_xlat10 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat2.xyz = vec3(u_xlat10) * vs_TEXCOORD3.xyz;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat16_2 = (-_MainCol) + _FresCol;
    u_xlat1 = u_xlat1.xxxx * u_xlat16_2 + _MainCol;
    u_xlat2.x = (-u_xlat1.z) + 1.0;
    u_xlat2.x = u_xlat2.x * _Fade;
    u_xlat0 = u_xlat0 * u_xlat2.xxxx + u_xlat1;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD3.xyz = in_NORMAL0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	float _TexScale;
uniform 	mediump vec4 _MainCol;
uniform 	mediump vec4 _WaveCol;
uniform 	mediump vec4 _FresCol;
uniform 	float _Fade;
uniform 	float _WaveDecay;
uniform 	float _Freq;
uniform 	float _Amp;
uniform 	float _FresnelPower;
uniform lowp sampler2D _WigTex;
uniform lowp sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec2 u_xlat6;
lowp vec2 u_xlat10_6;
float u_xlat10;
void main()
{
    u_xlat0.xy = _Time.xy + vec2(25.0, 25.0);
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_Freq, _Freq));
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat6.xy = vs_TEXCOORD0.xy / vec2(_TexScale);
    u_xlat10_6.xy = texture(_WigTex, u_xlat6.xy).xy;
    u_xlat1.xy = u_xlat10_6.xy * vec2(vec2(_Amp, _Amp)) + (-vs_TEXCOORD0.yx);
    u_xlat6.xy = u_xlat10_6.xy * vec2(vec2(_Amp, _Amp)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = (-u_xlat0.xy) * vec2(200.0, 200.0) + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy / vec2(_TexScale);
    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_1 = u_xlat10_1 * _WaveCol;
    u_xlat0.xy = _Time.xy * vec2(vec2(_Freq, _Freq));
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(200.0, 200.0) + u_xlat6.xy;
    u_xlat0.xy = u_xlat0.xy / vec2(_TexScale);
    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = u_xlat10_0 * _WaveCol;
    u_xlat0 = u_xlat16_0 * vec4(vec4(_WaveDecay, _WaveDecay, _WaveDecay, _WaveDecay)) + _MainCol;
    u_xlat0 = u_xlat16_1 * vec4(vec4(_WaveDecay, _WaveDecay, _WaveDecay, _WaveDecay)) + u_xlat0;
    u_xlat0 = u_xlat0 * vec4(_Fade);
    u_xlat0 = u_xlat0 * vec4(5.0, 5.0, 5.0, 5.0);
    u_xlat1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD2.xyz;
    u_xlat10 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat2.xyz = vec3(u_xlat10) * vs_TEXCOORD3.xyz;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat16_2 = (-_MainCol) + _FresCol;
    u_xlat1 = u_xlat1.xxxx * u_xlat16_2 + _MainCol;
    u_xlat2.x = (-u_xlat1.z) + 1.0;
    u_xlat2.x = u_xlat2.x * _Fade;
    u_xlat0 = u_xlat0 * u_xlat2.xxxx + u_xlat1;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD3.xyz = in_NORMAL0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	float _TexScale;
uniform 	mediump vec4 _MainCol;
uniform 	mediump vec4 _WaveCol;
uniform 	mediump vec4 _FresCol;
uniform 	float _Fade;
uniform 	float _WaveDecay;
uniform 	float _Freq;
uniform 	float _Amp;
uniform 	float _FresnelPower;
uniform lowp sampler2D _WigTex;
uniform lowp sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec2 u_xlat6;
lowp vec2 u_xlat10_6;
float u_xlat10;
void main()
{
    u_xlat0.xy = _Time.xy + vec2(25.0, 25.0);
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_Freq, _Freq));
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat6.xy = vs_TEXCOORD0.xy / vec2(_TexScale);
    u_xlat10_6.xy = texture(_WigTex, u_xlat6.xy).xy;
    u_xlat1.xy = u_xlat10_6.xy * vec2(vec2(_Amp, _Amp)) + (-vs_TEXCOORD0.yx);
    u_xlat6.xy = u_xlat10_6.xy * vec2(vec2(_Amp, _Amp)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = (-u_xlat0.xy) * vec2(200.0, 200.0) + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy / vec2(_TexScale);
    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_1 = u_xlat10_1 * _WaveCol;
    u_xlat0.xy = _Time.xy * vec2(vec2(_Freq, _Freq));
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(200.0, 200.0) + u_xlat6.xy;
    u_xlat0.xy = u_xlat0.xy / vec2(_TexScale);
    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = u_xlat10_0 * _WaveCol;
    u_xlat0 = u_xlat16_0 * vec4(vec4(_WaveDecay, _WaveDecay, _WaveDecay, _WaveDecay)) + _MainCol;
    u_xlat0 = u_xlat16_1 * vec4(vec4(_WaveDecay, _WaveDecay, _WaveDecay, _WaveDecay)) + u_xlat0;
    u_xlat0 = u_xlat0 * vec4(_Fade);
    u_xlat0 = u_xlat0 * vec4(5.0, 5.0, 5.0, 5.0);
    u_xlat1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD2.xyz;
    u_xlat10 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat2.xyz = vec3(u_xlat10) * vs_TEXCOORD3.xyz;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat16_2 = (-_MainCol) + _FresCol;
    u_xlat1 = u_xlat1.xxxx * u_xlat16_2 + _MainCol;
    u_xlat2.x = (-u_xlat1.z) + 1.0;
    u_xlat2.x = u_xlat2.x * _Fade;
    u_xlat0 = u_xlat0 * u_xlat2.xxxx + u_xlat1;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "FOG_LINEAR" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp float vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD1 = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD3.xyz = in_NORMAL0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	mediump vec4 unity_FogColor;
uniform 	float _TexScale;
uniform 	mediump vec4 _MainCol;
uniform 	mediump vec4 _WaveCol;
uniform 	mediump vec4 _FresCol;
uniform 	float _Fade;
uniform 	float _WaveDecay;
uniform 	float _Freq;
uniform 	float _Amp;
uniform 	float _FresnelPower;
uniform lowp sampler2D _WigTex;
uniform lowp sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp float vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec2 u_xlat6;
lowp vec2 u_xlat10_6;
float u_xlat10;
void main()
{
    u_xlat0.xy = _Time.xy + vec2(25.0, 25.0);
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_Freq, _Freq));
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat6.xy = vs_TEXCOORD0.xy / vec2(_TexScale);
    u_xlat10_6.xy = texture(_WigTex, u_xlat6.xy).xy;
    u_xlat1.xy = u_xlat10_6.xy * vec2(vec2(_Amp, _Amp)) + (-vs_TEXCOORD0.yx);
    u_xlat6.xy = u_xlat10_6.xy * vec2(vec2(_Amp, _Amp)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = (-u_xlat0.xy) * vec2(200.0, 200.0) + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy / vec2(_TexScale);
    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_1 = u_xlat10_1 * _WaveCol;
    u_xlat0.xy = _Time.xy * vec2(vec2(_Freq, _Freq));
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(200.0, 200.0) + u_xlat6.xy;
    u_xlat0.xy = u_xlat0.xy / vec2(_TexScale);
    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = u_xlat10_0 * _WaveCol;
    u_xlat0 = u_xlat16_0 * vec4(vec4(_WaveDecay, _WaveDecay, _WaveDecay, _WaveDecay)) + _MainCol;
    u_xlat0 = u_xlat16_1 * vec4(vec4(_WaveDecay, _WaveDecay, _WaveDecay, _WaveDecay)) + u_xlat0;
    u_xlat0 = u_xlat0 * vec4(_Fade);
    u_xlat0 = u_xlat0 * vec4(5.0, 5.0, 5.0, 5.0);
    u_xlat1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD2.xyz;
    u_xlat10 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat2.xyz = vec3(u_xlat10) * vs_TEXCOORD3.xyz;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat16_2 = (-_MainCol) + _FresCol;
    u_xlat1 = u_xlat1.xxxx * u_xlat16_2 + _MainCol;
    u_xlat2.x = (-u_xlat1.z) + 1.0;
    u_xlat2.x = u_xlat2.x * _Fade;
    u_xlat0 = u_xlat0 * u_xlat2.xxxx + u_xlat1;
    u_xlat1.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
    u_xlat10 = vs_TEXCOORD1;
#ifdef UNITY_ADRENO_ES3
    u_xlat10 = min(max(u_xlat10, 0.0), 1.0);
#else
    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
#endif
    u_xlat0.xyz = vec3(u_xlat10) * u_xlat1.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "FOG_LINEAR" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp float vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD1 = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD3.xyz = in_NORMAL0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	mediump vec4 unity_FogColor;
uniform 	float _TexScale;
uniform 	mediump vec4 _MainCol;
uniform 	mediump vec4 _WaveCol;
uniform 	mediump vec4 _FresCol;
uniform 	float _Fade;
uniform 	float _WaveDecay;
uniform 	float _Freq;
uniform 	float _Amp;
uniform 	float _FresnelPower;
uniform lowp sampler2D _WigTex;
uniform lowp sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp float vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec2 u_xlat6;
lowp vec2 u_xlat10_6;
float u_xlat10;
void main()
{
    u_xlat0.xy = _Time.xy + vec2(25.0, 25.0);
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_Freq, _Freq));
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat6.xy = vs_TEXCOORD0.xy / vec2(_TexScale);
    u_xlat10_6.xy = texture(_WigTex, u_xlat6.xy).xy;
    u_xlat1.xy = u_xlat10_6.xy * vec2(vec2(_Amp, _Amp)) + (-vs_TEXCOORD0.yx);
    u_xlat6.xy = u_xlat10_6.xy * vec2(vec2(_Amp, _Amp)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = (-u_xlat0.xy) * vec2(200.0, 200.0) + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy / vec2(_TexScale);
    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_1 = u_xlat10_1 * _WaveCol;
    u_xlat0.xy = _Time.xy * vec2(vec2(_Freq, _Freq));
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(200.0, 200.0) + u_xlat6.xy;
    u_xlat0.xy = u_xlat0.xy / vec2(_TexScale);
    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = u_xlat10_0 * _WaveCol;
    u_xlat0 = u_xlat16_0 * vec4(vec4(_WaveDecay, _WaveDecay, _WaveDecay, _WaveDecay)) + _MainCol;
    u_xlat0 = u_xlat16_1 * vec4(vec4(_WaveDecay, _WaveDecay, _WaveDecay, _WaveDecay)) + u_xlat0;
    u_xlat0 = u_xlat0 * vec4(_Fade);
    u_xlat0 = u_xlat0 * vec4(5.0, 5.0, 5.0, 5.0);
    u_xlat1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD2.xyz;
    u_xlat10 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat2.xyz = vec3(u_xlat10) * vs_TEXCOORD3.xyz;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat16_2 = (-_MainCol) + _FresCol;
    u_xlat1 = u_xlat1.xxxx * u_xlat16_2 + _MainCol;
    u_xlat2.x = (-u_xlat1.z) + 1.0;
    u_xlat2.x = u_xlat2.x * _Fade;
    u_xlat0 = u_xlat0 * u_xlat2.xxxx + u_xlat1;
    u_xlat1.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
    u_xlat10 = vs_TEXCOORD1;
#ifdef UNITY_ADRENO_ES3
    u_xlat10 = min(max(u_xlat10, 0.0), 1.0);
#else
    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
#endif
    u_xlat0.xyz = vec3(u_xlat10) * u_xlat1.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "FOG_LINEAR" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp float vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD1 = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD3.xyz = in_NORMAL0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	mediump vec4 unity_FogColor;
uniform 	float _TexScale;
uniform 	mediump vec4 _MainCol;
uniform 	mediump vec4 _WaveCol;
uniform 	mediump vec4 _FresCol;
uniform 	float _Fade;
uniform 	float _WaveDecay;
uniform 	float _Freq;
uniform 	float _Amp;
uniform 	float _FresnelPower;
uniform lowp sampler2D _WigTex;
uniform lowp sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp float vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec2 u_xlat6;
lowp vec2 u_xlat10_6;
float u_xlat10;
void main()
{
    u_xlat0.xy = _Time.xy + vec2(25.0, 25.0);
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_Freq, _Freq));
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat6.xy = vs_TEXCOORD0.xy / vec2(_TexScale);
    u_xlat10_6.xy = texture(_WigTex, u_xlat6.xy).xy;
    u_xlat1.xy = u_xlat10_6.xy * vec2(vec2(_Amp, _Amp)) + (-vs_TEXCOORD0.yx);
    u_xlat6.xy = u_xlat10_6.xy * vec2(vec2(_Amp, _Amp)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = (-u_xlat0.xy) * vec2(200.0, 200.0) + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy / vec2(_TexScale);
    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_1 = u_xlat10_1 * _WaveCol;
    u_xlat0.xy = _Time.xy * vec2(vec2(_Freq, _Freq));
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(200.0, 200.0) + u_xlat6.xy;
    u_xlat0.xy = u_xlat0.xy / vec2(_TexScale);
    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = u_xlat10_0 * _WaveCol;
    u_xlat0 = u_xlat16_0 * vec4(vec4(_WaveDecay, _WaveDecay, _WaveDecay, _WaveDecay)) + _MainCol;
    u_xlat0 = u_xlat16_1 * vec4(vec4(_WaveDecay, _WaveDecay, _WaveDecay, _WaveDecay)) + u_xlat0;
    u_xlat0 = u_xlat0 * vec4(_Fade);
    u_xlat0 = u_xlat0 * vec4(5.0, 5.0, 5.0, 5.0);
    u_xlat1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD2.xyz;
    u_xlat10 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat2.xyz = vec3(u_xlat10) * vs_TEXCOORD3.xyz;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat16_2 = (-_MainCol) + _FresCol;
    u_xlat1 = u_xlat1.xxxx * u_xlat16_2 + _MainCol;
    u_xlat2.x = (-u_xlat1.z) + 1.0;
    u_xlat2.x = u_xlat2.x * _Fade;
    u_xlat0 = u_xlat0 * u_xlat2.xxxx + u_xlat1;
    u_xlat1.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
    u_xlat10 = vs_TEXCOORD1;
#ifdef UNITY_ADRENO_ES3
    u_xlat10 = min(max(u_xlat10, 0.0), 1.0);
#else
    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
#endif
    u_xlat0.xyz = vec3(u_xlat10) * u_xlat1.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat0;
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
Keywords { "FOG_LINEAR" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "FOG_LINEAR" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "FOG_LINEAR" }
""
}
}
}
}
}
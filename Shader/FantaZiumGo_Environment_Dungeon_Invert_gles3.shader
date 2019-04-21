//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "FantaZiumGo/Environment/Dungeon_Invert" {
Properties {
_OutlineCol ("Outline Color", Color) = (1,1,1,1)
}
SubShader {
 Pass {
  Name "OUTLINE"
  Tags { "RenderType" = "Opaque" }
  ZWrite Off
  Cull Front
  GpuProgramID 13103
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in mediump vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
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
    vs_COLOR0 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	mediump vec4 _OutlineCol;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0.xyz = vs_COLOR0.xyz * _OutlineCol.xyz;
    SV_Target0.w = vs_COLOR0.w;
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
in mediump vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
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
    vs_COLOR0 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	mediump vec4 _OutlineCol;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0.xyz = vs_COLOR0.xyz * _OutlineCol.xyz;
    SV_Target0.w = vs_COLOR0.w;
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
in mediump vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
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
    vs_COLOR0 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	mediump vec4 _OutlineCol;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0.xyz = vs_COLOR0.xyz * _OutlineCol.xyz;
    SV_Target0.w = vs_COLOR0.w;
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
 GrabPass {
  "_BackgroundTexture"
}
 Pass {
  Name "INVERT"
  Tags { "RenderType" = "Opaque" }
  GpuProgramID 113099
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in mediump vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
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
    u_xlat1.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    u_xlat1.xy = u_xlat1.zz + u_xlat1.xy;
    u_xlat1.zw = u_xlat0.zw;
    gl_Position = u_xlat0;
    vs_TEXCOORD0 = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform lowp sampler2D _BackgroundTexture;
in mediump vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec2 u_xlat16_0;
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat10_0 = texture(_BackgroundTexture, u_xlat16_0.xy);
    SV_Target0.xyz = (-u_xlat10_0.xyz) + vec3(1.39999998, 1.0, 0.800000012);
    SV_Target0.w = u_xlat10_0.w;
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
in mediump vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
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
    u_xlat1.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    u_xlat1.xy = u_xlat1.zz + u_xlat1.xy;
    u_xlat1.zw = u_xlat0.zw;
    gl_Position = u_xlat0;
    vs_TEXCOORD0 = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform lowp sampler2D _BackgroundTexture;
in mediump vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec2 u_xlat16_0;
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat10_0 = texture(_BackgroundTexture, u_xlat16_0.xy);
    SV_Target0.xyz = (-u_xlat10_0.xyz) + vec3(1.39999998, 1.0, 0.800000012);
    SV_Target0.w = u_xlat10_0.w;
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
in mediump vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
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
    u_xlat1.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    u_xlat1.xy = u_xlat1.zz + u_xlat1.xy;
    u_xlat1.zw = u_xlat0.zw;
    gl_Position = u_xlat0;
    vs_TEXCOORD0 = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform lowp sampler2D _BackgroundTexture;
in mediump vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec2 u_xlat16_0;
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat10_0 = texture(_BackgroundTexture, u_xlat16_0.xy);
    SV_Target0.xyz = (-u_xlat10_0.xyz) + vec3(1.39999998, 1.0, 0.800000012);
    SV_Target0.w = u_xlat10_0.w;
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
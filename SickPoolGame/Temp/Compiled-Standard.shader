// Compiled shader for Tizen, uncompressed size: 141.6KB

// Skipping shader variants that would not be included into build of current scene.

Shader "Standard" {
Properties {
 _Color ("Color", Color) = (1,1,1,1)
 _MainTex ("Albedo", 2D) = "white" { }
 _Cutoff ("Alpha Cutoff", Range(0,1)) = 0.5
 _Glossiness ("Smoothness", Range(0,1)) = 0.5
[Gamma]  _Metallic ("Metallic", Range(0,1)) = 0
 _MetallicGlossMap ("Metallic", 2D) = "white" { }
 _BumpScale ("Scale", Float) = 1
 _BumpMap ("Normal Map", 2D) = "bump" { }
 _Parallax ("Height Scale", Range(0.005,0.08)) = 0.02
 _ParallaxMap ("Height Map", 2D) = "black" { }
 _OcclusionStrength ("Strength", Range(0,1)) = 1
 _OcclusionMap ("Occlusion", 2D) = "white" { }
 _EmissionColor ("Color", Color) = (0,0,0,1)
 _EmissionMap ("Emission", 2D) = "white" { }
 _DetailMask ("Detail Mask", 2D) = "white" { }
 _DetailAlbedoMap ("Detail Albedo x2", 2D) = "grey" { }
 _DetailNormalMapScale ("Scale", Float) = 1
 _DetailNormalMap ("Normal Map", 2D) = "bump" { }
[Enum(UV0,0,UV1,1)]  _UVSec ("UV Set for secondary textures", Float) = 0
[HideInInspector]  _Mode ("__mode", Float) = 0
[HideInInspector]  _SrcBlend ("__src", Float) = 1
[HideInInspector]  _DstBlend ("__dst", Float) = 0
[HideInInspector]  _ZWrite ("__zw", Float) = 1
}
SubShader { 
 LOD 300
 Tags { "RenderType"="Opaque" "PerformanceChecks"="False" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" "RenderType"="Opaque" "PerformanceChecks"="False" }
  ZWrite [_ZWrite]
  Blend [_SrcBlend] [_DstBlend]
  GpuProgramID 19283
Program "vp" {
}
Program "fp" {
}
 }
 Pass {
  Name "FORWARD_DELTA"
  Tags { "LIGHTMODE"="ForwardAdd" "SHADOWSUPPORT"="true" "RenderType"="Opaque" "PerformanceChecks"="False" }
  ZWrite Off
  Blend [_SrcBlend] One
  GpuProgramID 115835
Program "vp" {
}
Program "fp" {
}
 }
 Pass {
  Name "SHADOWCASTER"
  Tags { "LIGHTMODE"="SHADOWCASTER" "SHADOWSUPPORT"="true" "RenderType"="Opaque" "PerformanceChecks"="False" }
  GpuProgramID 133839
Program "vp" {
}
Program "fp" {
}
 }
 Pass {
  Name "DEFERRED"
  Tags { "LIGHTMODE"="Deferred" "RenderType"="Opaque" "PerformanceChecks"="False" }
  GpuProgramID 200435
Program "vp" {
}
Program "fp" {
}
 }
}
SubShader { 
 LOD 150
 Tags { "RenderType"="Opaque" "PerformanceChecks"="False" }


 // Stats for Vertex shader:
 //        gles : 48 avg math (45..50), 4 avg texture (4..5)
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" "RenderType"="Opaque" "PerformanceChecks"="False" }
  ZWrite [_ZWrite]
  Blend [_SrcBlend] [_DstBlend]
  GpuProgramID 374778
Program "vp" {
SubProgram "gles " {
// Stats: 45 math, 4 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"!!GLES
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  highp vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (_Object2World * _glesVertex);
  tmpvar_4 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 texcoord_9;
  texcoord_9.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_10;
  if ((_UVSec == 0.0)) {
    tmpvar_10 = tmpvar_2;
  } else {
    tmpvar_10 = tmpvar_3;
  };
  texcoord_9.zw = ((tmpvar_10 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 n_11;
  n_11 = (tmpvar_8.xyz - _WorldSpaceCameraPos);
  highp vec3 norm_12;
  norm_12 = tmpvar_1;
  highp vec4 v_13;
  v_13.x = _World2Object[0].x;
  v_13.y = _World2Object[1].x;
  v_13.z = _World2Object[2].x;
  v_13.w = _World2Object[3].x;
  highp vec4 v_14;
  v_14.x = _World2Object[0].y;
  v_14.y = _World2Object[1].y;
  v_14.z = _World2Object[2].y;
  v_14.w = _World2Object[3].y;
  highp vec4 v_15;
  v_15.x = _World2Object[0].z;
  v_15.y = _World2Object[1].z;
  v_15.z = _World2Object[2].z;
  v_15.w = _World2Object[3].z;
  highp vec3 tmpvar_16;
  tmpvar_16 = normalize(((
    (v_13.xyz * norm_12.x)
   + 
    (v_14.xyz * norm_12.y)
  ) + (v_15.xyz * norm_12.z)));
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_7.xyz = tmpvar_16;
  mediump vec3 normalWorld_17;
  normalWorld_17 = tmpvar_16;
  mediump vec4 ambientOrLightmapUV_18;
  ambientOrLightmapUV_18.w = 0.0;
  mediump vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = normalWorld_17;
  mediump vec3 x2_20;
  mediump vec3 x1_21;
  x1_21.x = dot (unity_SHAr, tmpvar_19);
  x1_21.y = dot (unity_SHAg, tmpvar_19);
  x1_21.z = dot (unity_SHAb, tmpvar_19);
  mediump vec4 tmpvar_22;
  tmpvar_22 = (normalWorld_17.xyzz * normalWorld_17.yzzx);
  x2_20.x = dot (unity_SHBr, tmpvar_22);
  x2_20.y = dot (unity_SHBg, tmpvar_22);
  x2_20.z = dot (unity_SHBb, tmpvar_22);
  ambientOrLightmapUV_18.xyz = ((x2_20 + (unity_SHC.xyz * 
    ((normalWorld_17.x * normalWorld_17.x) - (normalWorld_17.y * normalWorld_17.y))
  )) + x1_21);
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = texcoord_9;
  xlv_TEXCOORD1 = normalize(n_11);
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD2_1 = tmpvar_6;
  xlv_TEXCOORD2_2 = tmpvar_7;
  xlv_TEXCOORD5 = ambientOrLightmapUV_18;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp samplerCube unity_SpecCube0;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform mediump vec4 unity_ColorSpaceDielectricSpec;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _OcclusionMap;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec4 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_3;
  tmpvar_3 = (_Color.xyz * tmpvar_2.xyz);
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  tmpvar_5 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_3, vec3(_Metallic));
  mediump float tmpvar_6;
  tmpvar_6 = (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w));
  tmpvar_4 = (tmpvar_3 * tmpvar_6);
  mediump vec3 tmpvar_7;
  tmpvar_7 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_8;
  tmpvar_8 = _LightColor0.xyz;
  mediump float tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy);
  tmpvar_9 = tmpvar_10.y;
  highp vec4 tmpvar_11;
  tmpvar_11 = unity_SpecCube0_HDR;
  mediump vec3 tmpvar_12;
  tmpvar_12 = (xlv_TEXCOORD1 - (2.0 * (
    dot (tmpvar_7, xlv_TEXCOORD1)
   * tmpvar_7)));
  mediump vec4 hdr_13;
  hdr_13 = tmpvar_11;
  mediump vec4 tmpvar_14;
  tmpvar_14.xyz = tmpvar_12;
  mediump float tmpvar_15;
  tmpvar_15 = (1.0 - _Glossiness);
  tmpvar_14.w = (tmpvar_15 * 7.0);
  lowp vec4 tmpvar_16;
  tmpvar_16 = textureCube (unity_SpecCube0, tmpvar_12, tmpvar_14.w);
  mediump vec4 tmpvar_17;
  tmpvar_17 = tmpvar_16;
  mediump vec3 viewDir_18;
  viewDir_18 = -(xlv_TEXCOORD1);
  mediump vec3 color_19;
  mediump vec2 tmpvar_20;
  tmpvar_20.x = dot ((viewDir_18 - (2.0 * 
    (dot (tmpvar_7, viewDir_18) * tmpvar_7)
  )), _WorldSpaceLightPos0.xyz);
  tmpvar_20.y = (1.0 - clamp (dot (tmpvar_7, viewDir_18), 0.0, 1.0));
  mediump vec2 tmpvar_21;
  tmpvar_21 = ((tmpvar_20 * tmpvar_20) * (tmpvar_20 * tmpvar_20));
  mediump vec2 tmpvar_22;
  tmpvar_22.x = tmpvar_21.x;
  tmpvar_22.y = tmpvar_15;
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (unity_NHxRoughness, tmpvar_22);
  color_19 = ((tmpvar_4 + (
    (tmpvar_23.w * 16.0)
   * tmpvar_5)) * (tmpvar_8 * clamp (
    dot (tmpvar_7, _WorldSpaceLightPos0.xyz)
  , 0.0, 1.0)));
  color_19 = (color_19 + ((
    (xlv_TEXCOORD5.xyz * tmpvar_9)
   * tmpvar_4) + (
    (((tmpvar_17.w * hdr_13.x) * tmpvar_17.xyz) * tmpvar_9)
   * 
    mix (tmpvar_5, vec3(clamp ((_Glossiness + (1.0 - tmpvar_6)), 0.0, 1.0)), tmpvar_21.yyy)
  )));
  mediump vec4 tmpvar_24;
  tmpvar_24.w = 1.0;
  tmpvar_24.xyz = color_19;
  c_1.w = tmpvar_24.w;
  c_1.xyz = color_19;
  c_1.xyz = c_1.xyz;
  mediump vec4 xlat_varoutput_25;
  xlat_varoutput_25.xyz = c_1.xyz;
  xlat_varoutput_25.w = 1.0;
  gl_FragData[0] = xlat_varoutput_25;
}


#endif
"
}
SubProgram "gles " {
// Stats: 50 math, 5 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"!!GLES
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
varying mediump vec4 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  highp vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  mediump vec4 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (_Object2World * _glesVertex);
  tmpvar_4 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 texcoord_10;
  texcoord_10.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_11;
  if ((_UVSec == 0.0)) {
    tmpvar_11 = tmpvar_2;
  } else {
    tmpvar_11 = tmpvar_3;
  };
  texcoord_10.zw = ((tmpvar_11 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 n_12;
  n_12 = (tmpvar_9.xyz - _WorldSpaceCameraPos);
  highp vec3 norm_13;
  norm_13 = tmpvar_1;
  highp vec4 v_14;
  v_14.x = _World2Object[0].x;
  v_14.y = _World2Object[1].x;
  v_14.z = _World2Object[2].x;
  v_14.w = _World2Object[3].x;
  highp vec4 v_15;
  v_15.x = _World2Object[0].y;
  v_15.y = _World2Object[1].y;
  v_15.z = _World2Object[2].y;
  v_15.w = _World2Object[3].y;
  highp vec4 v_16;
  v_16.x = _World2Object[0].z;
  v_16.y = _World2Object[1].z;
  v_16.z = _World2Object[2].z;
  v_16.w = _World2Object[3].z;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize(((
    (v_14.xyz * norm_13.x)
   + 
    (v_15.xyz * norm_13.y)
  ) + (v_16.xyz * norm_13.z)));
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_7.xyz = tmpvar_17;
  tmpvar_8 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
  mediump vec3 normalWorld_18;
  normalWorld_18 = tmpvar_17;
  mediump vec4 ambientOrLightmapUV_19;
  ambientOrLightmapUV_19.w = 0.0;
  mediump vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = normalWorld_18;
  mediump vec3 x2_21;
  mediump vec3 x1_22;
  x1_22.x = dot (unity_SHAr, tmpvar_20);
  x1_22.y = dot (unity_SHAg, tmpvar_20);
  x1_22.z = dot (unity_SHAb, tmpvar_20);
  mediump vec4 tmpvar_23;
  tmpvar_23 = (normalWorld_18.xyzz * normalWorld_18.yzzx);
  x2_21.x = dot (unity_SHBr, tmpvar_23);
  x2_21.y = dot (unity_SHBg, tmpvar_23);
  x2_21.z = dot (unity_SHBb, tmpvar_23);
  ambientOrLightmapUV_19.xyz = ((x2_21 + (unity_SHC.xyz * 
    ((normalWorld_18.x * normalWorld_18.x) - (normalWorld_18.y * normalWorld_18.y))
  )) + x1_22);
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = texcoord_10;
  xlv_TEXCOORD1 = normalize(n_12);
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD2_1 = tmpvar_6;
  xlv_TEXCOORD2_2 = tmpvar_7;
  xlv_TEXCOORD5 = ambientOrLightmapUV_19;
  xlv_TEXCOORD6 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 _LightShadowData;
uniform lowp samplerCube unity_SpecCube0;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform mediump vec4 unity_ColorSpaceDielectricSpec;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
varying mediump vec4 xlv_TEXCOORD6;
void main ()
{
  mediump vec4 c_1;
  mediump float atten_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * tmpvar_3.xyz);
  mediump vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_4, vec3(_Metallic));
  mediump float tmpvar_7;
  tmpvar_7 = (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w));
  tmpvar_5 = (tmpvar_4 * tmpvar_7);
  mediump vec3 tmpvar_8;
  tmpvar_8 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_9;
  tmpvar_9 = _LightColor0.xyz;
  lowp float tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = max (float((texture2DProj (_ShadowMapTexture, xlv_TEXCOORD6).x > 
    (xlv_TEXCOORD6.z / xlv_TEXCOORD6.w)
  )), _LightShadowData.x);
  tmpvar_10 = tmpvar_11;
  atten_2 = tmpvar_10;
  mediump float tmpvar_12;
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy);
  tmpvar_12 = tmpvar_13.y;
  highp vec4 tmpvar_14;
  tmpvar_14 = unity_SpecCube0_HDR;
  mediump vec3 tmpvar_15;
  tmpvar_15 = (xlv_TEXCOORD1 - (2.0 * (
    dot (tmpvar_8, xlv_TEXCOORD1)
   * tmpvar_8)));
  mediump vec4 hdr_16;
  hdr_16 = tmpvar_14;
  mediump vec4 tmpvar_17;
  tmpvar_17.xyz = tmpvar_15;
  mediump float tmpvar_18;
  tmpvar_18 = (1.0 - _Glossiness);
  tmpvar_17.w = (tmpvar_18 * 7.0);
  lowp vec4 tmpvar_19;
  tmpvar_19 = textureCube (unity_SpecCube0, tmpvar_15, tmpvar_17.w);
  mediump vec4 tmpvar_20;
  tmpvar_20 = tmpvar_19;
  mediump vec3 viewDir_21;
  viewDir_21 = -(xlv_TEXCOORD1);
  mediump vec3 color_22;
  mediump vec2 tmpvar_23;
  tmpvar_23.x = dot ((viewDir_21 - (2.0 * 
    (dot (tmpvar_8, viewDir_21) * tmpvar_8)
  )), _WorldSpaceLightPos0.xyz);
  tmpvar_23.y = (1.0 - clamp (dot (tmpvar_8, viewDir_21), 0.0, 1.0));
  mediump vec2 tmpvar_24;
  tmpvar_24 = ((tmpvar_23 * tmpvar_23) * (tmpvar_23 * tmpvar_23));
  mediump vec2 tmpvar_25;
  tmpvar_25.x = tmpvar_24.x;
  tmpvar_25.y = tmpvar_18;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (unity_NHxRoughness, tmpvar_25);
  color_22 = ((tmpvar_5 + (
    (tmpvar_26.w * 16.0)
   * tmpvar_6)) * ((tmpvar_9 * atten_2) * clamp (
    dot (tmpvar_8, _WorldSpaceLightPos0.xyz)
  , 0.0, 1.0)));
  color_22 = (color_22 + ((
    (xlv_TEXCOORD5.xyz * tmpvar_12)
   * tmpvar_5) + (
    (((tmpvar_20.w * hdr_16.x) * tmpvar_20.xyz) * tmpvar_12)
   * 
    mix (tmpvar_6, vec3(clamp ((_Glossiness + (1.0 - tmpvar_7)), 0.0, 1.0)), tmpvar_24.yyy)
  )));
  mediump vec4 tmpvar_27;
  tmpvar_27.w = 1.0;
  tmpvar_27.xyz = color_22;
  c_1.w = tmpvar_27.w;
  c_1.xyz = color_22;
  c_1.xyz = c_1.xyz;
  mediump vec4 xlat_varoutput_28;
  xlat_varoutput_28.xyz = c_1.xyz;
  xlat_varoutput_28.w = 1.0;
  gl_FragData[0] = xlat_varoutput_28;
}


#endif
"
}
SubProgram "gles " {
// Stats: 45 math, 4 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"!!GLES
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  highp vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (_Object2World * _glesVertex);
  tmpvar_4 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 texcoord_9;
  texcoord_9.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_10;
  if ((_UVSec == 0.0)) {
    tmpvar_10 = tmpvar_2;
  } else {
    tmpvar_10 = tmpvar_3;
  };
  texcoord_9.zw = ((tmpvar_10 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 n_11;
  n_11 = (tmpvar_8.xyz - _WorldSpaceCameraPos);
  highp vec3 norm_12;
  norm_12 = tmpvar_1;
  highp vec4 v_13;
  v_13.x = _World2Object[0].x;
  v_13.y = _World2Object[1].x;
  v_13.z = _World2Object[2].x;
  v_13.w = _World2Object[3].x;
  highp vec4 v_14;
  v_14.x = _World2Object[0].y;
  v_14.y = _World2Object[1].y;
  v_14.z = _World2Object[2].y;
  v_14.w = _World2Object[3].y;
  highp vec4 v_15;
  v_15.x = _World2Object[0].z;
  v_15.y = _World2Object[1].z;
  v_15.z = _World2Object[2].z;
  v_15.w = _World2Object[3].z;
  highp vec3 tmpvar_16;
  tmpvar_16 = normalize(((
    (v_13.xyz * norm_12.x)
   + 
    (v_14.xyz * norm_12.y)
  ) + (v_15.xyz * norm_12.z)));
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_7.xyz = tmpvar_16;
  mediump vec3 normalWorld_17;
  normalWorld_17 = tmpvar_16;
  mediump vec4 ambientOrLightmapUV_18;
  ambientOrLightmapUV_18.w = 0.0;
  mediump vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = normalWorld_17;
  mediump vec3 x2_20;
  mediump vec3 x1_21;
  x1_21.x = dot (unity_SHAr, tmpvar_19);
  x1_21.y = dot (unity_SHAg, tmpvar_19);
  x1_21.z = dot (unity_SHAb, tmpvar_19);
  mediump vec4 tmpvar_22;
  tmpvar_22 = (normalWorld_17.xyzz * normalWorld_17.yzzx);
  x2_20.x = dot (unity_SHBr, tmpvar_22);
  x2_20.y = dot (unity_SHBg, tmpvar_22);
  x2_20.z = dot (unity_SHBb, tmpvar_22);
  ambientOrLightmapUV_18.xyz = ((x2_20 + (unity_SHC.xyz * 
    ((normalWorld_17.x * normalWorld_17.x) - (normalWorld_17.y * normalWorld_17.y))
  )) + x1_21);
  highp vec3 lightColor0_23;
  lightColor0_23 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_24;
  lightColor1_24 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_25;
  lightColor2_25 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_26;
  lightColor3_26 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_27;
  lightAttenSq_27 = unity_4LightAtten0;
  highp vec3 normal_28;
  normal_28 = normalWorld_17;
  highp vec3 col_29;
  highp vec4 ndotl_30;
  highp vec4 lengthSq_31;
  highp vec4 tmpvar_32;
  tmpvar_32 = (unity_4LightPosX0 - tmpvar_8.x);
  highp vec4 tmpvar_33;
  tmpvar_33 = (unity_4LightPosY0 - tmpvar_8.y);
  highp vec4 tmpvar_34;
  tmpvar_34 = (unity_4LightPosZ0 - tmpvar_8.z);
  lengthSq_31 = (tmpvar_32 * tmpvar_32);
  lengthSq_31 = (lengthSq_31 + (tmpvar_33 * tmpvar_33));
  lengthSq_31 = (lengthSq_31 + (tmpvar_34 * tmpvar_34));
  ndotl_30 = (tmpvar_32 * normal_28.x);
  ndotl_30 = (ndotl_30 + (tmpvar_33 * normal_28.y));
  ndotl_30 = (ndotl_30 + (tmpvar_34 * normal_28.z));
  highp vec4 tmpvar_35;
  tmpvar_35 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_30 * inversesqrt(lengthSq_31)));
  ndotl_30 = tmpvar_35;
  highp vec4 tmpvar_36;
  tmpvar_36 = (tmpvar_35 * (1.0/((1.0 + 
    (lengthSq_31 * lightAttenSq_27)
  ))));
  col_29 = (lightColor0_23 * tmpvar_36.x);
  col_29 = (col_29 + (lightColor1_24 * tmpvar_36.y));
  col_29 = (col_29 + (lightColor2_25 * tmpvar_36.z));
  col_29 = (col_29 + (lightColor3_26 * tmpvar_36.w));
  ambientOrLightmapUV_18.xyz = (ambientOrLightmapUV_18.xyz + col_29);
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = texcoord_9;
  xlv_TEXCOORD1 = normalize(n_11);
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD2_1 = tmpvar_6;
  xlv_TEXCOORD2_2 = tmpvar_7;
  xlv_TEXCOORD5 = ambientOrLightmapUV_18;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp samplerCube unity_SpecCube0;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform mediump vec4 unity_ColorSpaceDielectricSpec;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _OcclusionMap;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec4 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_3;
  tmpvar_3 = (_Color.xyz * tmpvar_2.xyz);
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  tmpvar_5 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_3, vec3(_Metallic));
  mediump float tmpvar_6;
  tmpvar_6 = (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w));
  tmpvar_4 = (tmpvar_3 * tmpvar_6);
  mediump vec3 tmpvar_7;
  tmpvar_7 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_8;
  tmpvar_8 = _LightColor0.xyz;
  mediump float tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy);
  tmpvar_9 = tmpvar_10.y;
  highp vec4 tmpvar_11;
  tmpvar_11 = unity_SpecCube0_HDR;
  mediump vec3 tmpvar_12;
  tmpvar_12 = (xlv_TEXCOORD1 - (2.0 * (
    dot (tmpvar_7, xlv_TEXCOORD1)
   * tmpvar_7)));
  mediump vec4 hdr_13;
  hdr_13 = tmpvar_11;
  mediump vec4 tmpvar_14;
  tmpvar_14.xyz = tmpvar_12;
  mediump float tmpvar_15;
  tmpvar_15 = (1.0 - _Glossiness);
  tmpvar_14.w = (tmpvar_15 * 7.0);
  lowp vec4 tmpvar_16;
  tmpvar_16 = textureCube (unity_SpecCube0, tmpvar_12, tmpvar_14.w);
  mediump vec4 tmpvar_17;
  tmpvar_17 = tmpvar_16;
  mediump vec3 viewDir_18;
  viewDir_18 = -(xlv_TEXCOORD1);
  mediump vec3 color_19;
  mediump vec2 tmpvar_20;
  tmpvar_20.x = dot ((viewDir_18 - (2.0 * 
    (dot (tmpvar_7, viewDir_18) * tmpvar_7)
  )), _WorldSpaceLightPos0.xyz);
  tmpvar_20.y = (1.0 - clamp (dot (tmpvar_7, viewDir_18), 0.0, 1.0));
  mediump vec2 tmpvar_21;
  tmpvar_21 = ((tmpvar_20 * tmpvar_20) * (tmpvar_20 * tmpvar_20));
  mediump vec2 tmpvar_22;
  tmpvar_22.x = tmpvar_21.x;
  tmpvar_22.y = tmpvar_15;
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (unity_NHxRoughness, tmpvar_22);
  color_19 = ((tmpvar_4 + (
    (tmpvar_23.w * 16.0)
   * tmpvar_5)) * (tmpvar_8 * clamp (
    dot (tmpvar_7, _WorldSpaceLightPos0.xyz)
  , 0.0, 1.0)));
  color_19 = (color_19 + ((
    (xlv_TEXCOORD5.xyz * tmpvar_9)
   * tmpvar_4) + (
    (((tmpvar_17.w * hdr_13.x) * tmpvar_17.xyz) * tmpvar_9)
   * 
    mix (tmpvar_5, vec3(clamp ((_Glossiness + (1.0 - tmpvar_6)), 0.0, 1.0)), tmpvar_21.yyy)
  )));
  mediump vec4 tmpvar_24;
  tmpvar_24.w = 1.0;
  tmpvar_24.xyz = color_19;
  c_1.w = tmpvar_24.w;
  c_1.xyz = color_19;
  c_1.xyz = c_1.xyz;
  mediump vec4 xlat_varoutput_25;
  xlat_varoutput_25.xyz = c_1.xyz;
  xlat_varoutput_25.w = 1.0;
  gl_FragData[0] = xlat_varoutput_25;
}


#endif
"
}
SubProgram "gles " {
// Stats: 50 math, 5 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"!!GLES
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
varying mediump vec4 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  highp vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  mediump vec4 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (_Object2World * _glesVertex);
  tmpvar_4 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 texcoord_10;
  texcoord_10.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_11;
  if ((_UVSec == 0.0)) {
    tmpvar_11 = tmpvar_2;
  } else {
    tmpvar_11 = tmpvar_3;
  };
  texcoord_10.zw = ((tmpvar_11 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 n_12;
  n_12 = (tmpvar_9.xyz - _WorldSpaceCameraPos);
  highp vec3 norm_13;
  norm_13 = tmpvar_1;
  highp vec4 v_14;
  v_14.x = _World2Object[0].x;
  v_14.y = _World2Object[1].x;
  v_14.z = _World2Object[2].x;
  v_14.w = _World2Object[3].x;
  highp vec4 v_15;
  v_15.x = _World2Object[0].y;
  v_15.y = _World2Object[1].y;
  v_15.z = _World2Object[2].y;
  v_15.w = _World2Object[3].y;
  highp vec4 v_16;
  v_16.x = _World2Object[0].z;
  v_16.y = _World2Object[1].z;
  v_16.z = _World2Object[2].z;
  v_16.w = _World2Object[3].z;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize(((
    (v_14.xyz * norm_13.x)
   + 
    (v_15.xyz * norm_13.y)
  ) + (v_16.xyz * norm_13.z)));
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_7.xyz = tmpvar_17;
  tmpvar_8 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
  mediump vec3 normalWorld_18;
  normalWorld_18 = tmpvar_17;
  mediump vec4 ambientOrLightmapUV_19;
  ambientOrLightmapUV_19.w = 0.0;
  mediump vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = normalWorld_18;
  mediump vec3 x2_21;
  mediump vec3 x1_22;
  x1_22.x = dot (unity_SHAr, tmpvar_20);
  x1_22.y = dot (unity_SHAg, tmpvar_20);
  x1_22.z = dot (unity_SHAb, tmpvar_20);
  mediump vec4 tmpvar_23;
  tmpvar_23 = (normalWorld_18.xyzz * normalWorld_18.yzzx);
  x2_21.x = dot (unity_SHBr, tmpvar_23);
  x2_21.y = dot (unity_SHBg, tmpvar_23);
  x2_21.z = dot (unity_SHBb, tmpvar_23);
  ambientOrLightmapUV_19.xyz = ((x2_21 + (unity_SHC.xyz * 
    ((normalWorld_18.x * normalWorld_18.x) - (normalWorld_18.y * normalWorld_18.y))
  )) + x1_22);
  highp vec3 lightColor0_24;
  lightColor0_24 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_25;
  lightColor1_25 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_26;
  lightColor2_26 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_27;
  lightColor3_27 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_28;
  lightAttenSq_28 = unity_4LightAtten0;
  highp vec3 normal_29;
  normal_29 = normalWorld_18;
  highp vec3 col_30;
  highp vec4 ndotl_31;
  highp vec4 lengthSq_32;
  highp vec4 tmpvar_33;
  tmpvar_33 = (unity_4LightPosX0 - tmpvar_9.x);
  highp vec4 tmpvar_34;
  tmpvar_34 = (unity_4LightPosY0 - tmpvar_9.y);
  highp vec4 tmpvar_35;
  tmpvar_35 = (unity_4LightPosZ0 - tmpvar_9.z);
  lengthSq_32 = (tmpvar_33 * tmpvar_33);
  lengthSq_32 = (lengthSq_32 + (tmpvar_34 * tmpvar_34));
  lengthSq_32 = (lengthSq_32 + (tmpvar_35 * tmpvar_35));
  ndotl_31 = (tmpvar_33 * normal_29.x);
  ndotl_31 = (ndotl_31 + (tmpvar_34 * normal_29.y));
  ndotl_31 = (ndotl_31 + (tmpvar_35 * normal_29.z));
  highp vec4 tmpvar_36;
  tmpvar_36 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_31 * inversesqrt(lengthSq_32)));
  ndotl_31 = tmpvar_36;
  highp vec4 tmpvar_37;
  tmpvar_37 = (tmpvar_36 * (1.0/((1.0 + 
    (lengthSq_32 * lightAttenSq_28)
  ))));
  col_30 = (lightColor0_24 * tmpvar_37.x);
  col_30 = (col_30 + (lightColor1_25 * tmpvar_37.y));
  col_30 = (col_30 + (lightColor2_26 * tmpvar_37.z));
  col_30 = (col_30 + (lightColor3_27 * tmpvar_37.w));
  ambientOrLightmapUV_19.xyz = (ambientOrLightmapUV_19.xyz + col_30);
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = texcoord_10;
  xlv_TEXCOORD1 = normalize(n_12);
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD2_1 = tmpvar_6;
  xlv_TEXCOORD2_2 = tmpvar_7;
  xlv_TEXCOORD5 = ambientOrLightmapUV_19;
  xlv_TEXCOORD6 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 _LightShadowData;
uniform lowp samplerCube unity_SpecCube0;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform mediump vec4 unity_ColorSpaceDielectricSpec;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
varying mediump vec4 xlv_TEXCOORD6;
void main ()
{
  mediump vec4 c_1;
  mediump float atten_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * tmpvar_3.xyz);
  mediump vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_4, vec3(_Metallic));
  mediump float tmpvar_7;
  tmpvar_7 = (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w));
  tmpvar_5 = (tmpvar_4 * tmpvar_7);
  mediump vec3 tmpvar_8;
  tmpvar_8 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_9;
  tmpvar_9 = _LightColor0.xyz;
  lowp float tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = max (float((texture2DProj (_ShadowMapTexture, xlv_TEXCOORD6).x > 
    (xlv_TEXCOORD6.z / xlv_TEXCOORD6.w)
  )), _LightShadowData.x);
  tmpvar_10 = tmpvar_11;
  atten_2 = tmpvar_10;
  mediump float tmpvar_12;
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy);
  tmpvar_12 = tmpvar_13.y;
  highp vec4 tmpvar_14;
  tmpvar_14 = unity_SpecCube0_HDR;
  mediump vec3 tmpvar_15;
  tmpvar_15 = (xlv_TEXCOORD1 - (2.0 * (
    dot (tmpvar_8, xlv_TEXCOORD1)
   * tmpvar_8)));
  mediump vec4 hdr_16;
  hdr_16 = tmpvar_14;
  mediump vec4 tmpvar_17;
  tmpvar_17.xyz = tmpvar_15;
  mediump float tmpvar_18;
  tmpvar_18 = (1.0 - _Glossiness);
  tmpvar_17.w = (tmpvar_18 * 7.0);
  lowp vec4 tmpvar_19;
  tmpvar_19 = textureCube (unity_SpecCube0, tmpvar_15, tmpvar_17.w);
  mediump vec4 tmpvar_20;
  tmpvar_20 = tmpvar_19;
  mediump vec3 viewDir_21;
  viewDir_21 = -(xlv_TEXCOORD1);
  mediump vec3 color_22;
  mediump vec2 tmpvar_23;
  tmpvar_23.x = dot ((viewDir_21 - (2.0 * 
    (dot (tmpvar_8, viewDir_21) * tmpvar_8)
  )), _WorldSpaceLightPos0.xyz);
  tmpvar_23.y = (1.0 - clamp (dot (tmpvar_8, viewDir_21), 0.0, 1.0));
  mediump vec2 tmpvar_24;
  tmpvar_24 = ((tmpvar_23 * tmpvar_23) * (tmpvar_23 * tmpvar_23));
  mediump vec2 tmpvar_25;
  tmpvar_25.x = tmpvar_24.x;
  tmpvar_25.y = tmpvar_18;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (unity_NHxRoughness, tmpvar_25);
  color_22 = ((tmpvar_5 + (
    (tmpvar_26.w * 16.0)
   * tmpvar_6)) * ((tmpvar_9 * atten_2) * clamp (
    dot (tmpvar_8, _WorldSpaceLightPos0.xyz)
  , 0.0, 1.0)));
  color_22 = (color_22 + ((
    (xlv_TEXCOORD5.xyz * tmpvar_12)
   * tmpvar_5) + (
    (((tmpvar_20.w * hdr_16.x) * tmpvar_20.xyz) * tmpvar_12)
   * 
    mix (tmpvar_6, vec3(clamp ((_Glossiness + (1.0 - tmpvar_7)), 0.0, 1.0)), tmpvar_24.yyy)
  )));
  mediump vec4 tmpvar_27;
  tmpvar_27.w = 1.0;
  tmpvar_27.xyz = color_22;
  c_1.w = tmpvar_27.w;
  c_1.xyz = color_22;
  c_1.xyz = c_1.xyz;
  mediump vec4 xlat_varoutput_28;
  xlat_varoutput_28.xyz = c_1.xyz;
  xlat_varoutput_28.w = 1.0;
  gl_FragData[0] = xlat_varoutput_28;
}


#endif
"
}
SubProgram "gles " {
// Stats: 49 math, 5 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"!!GLES
#version 100

#ifdef VERTEX
#extension GL_EXT_shadow_samplers : enable
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
varying mediump vec4 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  highp vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  mediump vec4 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (_Object2World * _glesVertex);
  tmpvar_4 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 texcoord_10;
  texcoord_10.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_11;
  if ((_UVSec == 0.0)) {
    tmpvar_11 = tmpvar_2;
  } else {
    tmpvar_11 = tmpvar_3;
  };
  texcoord_10.zw = ((tmpvar_11 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 n_12;
  n_12 = (tmpvar_9.xyz - _WorldSpaceCameraPos);
  highp vec3 norm_13;
  norm_13 = tmpvar_1;
  highp vec4 v_14;
  v_14.x = _World2Object[0].x;
  v_14.y = _World2Object[1].x;
  v_14.z = _World2Object[2].x;
  v_14.w = _World2Object[3].x;
  highp vec4 v_15;
  v_15.x = _World2Object[0].y;
  v_15.y = _World2Object[1].y;
  v_15.z = _World2Object[2].y;
  v_15.w = _World2Object[3].y;
  highp vec4 v_16;
  v_16.x = _World2Object[0].z;
  v_16.y = _World2Object[1].z;
  v_16.z = _World2Object[2].z;
  v_16.w = _World2Object[3].z;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize(((
    (v_14.xyz * norm_13.x)
   + 
    (v_15.xyz * norm_13.y)
  ) + (v_16.xyz * norm_13.z)));
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_7.xyz = tmpvar_17;
  tmpvar_8 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
  mediump vec3 normalWorld_18;
  normalWorld_18 = tmpvar_17;
  mediump vec4 ambientOrLightmapUV_19;
  ambientOrLightmapUV_19.w = 0.0;
  mediump vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = normalWorld_18;
  mediump vec3 x2_21;
  mediump vec3 x1_22;
  x1_22.x = dot (unity_SHAr, tmpvar_20);
  x1_22.y = dot (unity_SHAg, tmpvar_20);
  x1_22.z = dot (unity_SHAb, tmpvar_20);
  mediump vec4 tmpvar_23;
  tmpvar_23 = (normalWorld_18.xyzz * normalWorld_18.yzzx);
  x2_21.x = dot (unity_SHBr, tmpvar_23);
  x2_21.y = dot (unity_SHBg, tmpvar_23);
  x2_21.z = dot (unity_SHBb, tmpvar_23);
  ambientOrLightmapUV_19.xyz = ((x2_21 + (unity_SHC.xyz * 
    ((normalWorld_18.x * normalWorld_18.x) - (normalWorld_18.y * normalWorld_18.y))
  )) + x1_22);
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = texcoord_10;
  xlv_TEXCOORD1 = normalize(n_12);
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD2_1 = tmpvar_6;
  xlv_TEXCOORD2_2 = tmpvar_7;
  xlv_TEXCOORD5 = ambientOrLightmapUV_19;
  xlv_TEXCOORD6 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shadow_samplers : enable
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 _LightShadowData;
uniform lowp samplerCube unity_SpecCube0;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform mediump vec4 unity_ColorSpaceDielectricSpec;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform lowp sampler2DShadow _ShadowMapTexture;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
varying mediump vec4 xlv_TEXCOORD6;
void main ()
{
  mediump vec4 c_1;
  mediump float atten_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * tmpvar_3.xyz);
  mediump vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_4, vec3(_Metallic));
  mediump float tmpvar_7;
  tmpvar_7 = (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w));
  tmpvar_5 = (tmpvar_4 * tmpvar_7);
  mediump vec3 tmpvar_8;
  tmpvar_8 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_9;
  tmpvar_9 = _LightColor0.xyz;
  lowp float shadow_10;
  shadow_10 = (_LightShadowData.x + (shadow2DEXT (_ShadowMapTexture, xlv_TEXCOORD6.xyz) * (1.0 - _LightShadowData.x)));
  atten_2 = shadow_10;
  mediump float tmpvar_11;
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy);
  tmpvar_11 = tmpvar_12.y;
  highp vec4 tmpvar_13;
  tmpvar_13 = unity_SpecCube0_HDR;
  mediump vec3 tmpvar_14;
  tmpvar_14 = (xlv_TEXCOORD1 - (2.0 * (
    dot (tmpvar_8, xlv_TEXCOORD1)
   * tmpvar_8)));
  mediump vec4 hdr_15;
  hdr_15 = tmpvar_13;
  mediump vec4 tmpvar_16;
  tmpvar_16.xyz = tmpvar_14;
  mediump float tmpvar_17;
  tmpvar_17 = (1.0 - _Glossiness);
  tmpvar_16.w = (tmpvar_17 * 7.0);
  lowp vec4 tmpvar_18;
  tmpvar_18 = textureCube (unity_SpecCube0, tmpvar_14, tmpvar_16.w);
  mediump vec4 tmpvar_19;
  tmpvar_19 = tmpvar_18;
  mediump vec3 viewDir_20;
  viewDir_20 = -(xlv_TEXCOORD1);
  mediump vec3 color_21;
  mediump vec2 tmpvar_22;
  tmpvar_22.x = dot ((viewDir_20 - (2.0 * 
    (dot (tmpvar_8, viewDir_20) * tmpvar_8)
  )), _WorldSpaceLightPos0.xyz);
  tmpvar_22.y = (1.0 - clamp (dot (tmpvar_8, viewDir_20), 0.0, 1.0));
  mediump vec2 tmpvar_23;
  tmpvar_23 = ((tmpvar_22 * tmpvar_22) * (tmpvar_22 * tmpvar_22));
  mediump vec2 tmpvar_24;
  tmpvar_24.x = tmpvar_23.x;
  tmpvar_24.y = tmpvar_17;
  lowp vec4 tmpvar_25;
  tmpvar_25 = texture2D (unity_NHxRoughness, tmpvar_24);
  color_21 = ((tmpvar_5 + (
    (tmpvar_25.w * 16.0)
   * tmpvar_6)) * ((tmpvar_9 * atten_2) * clamp (
    dot (tmpvar_8, _WorldSpaceLightPos0.xyz)
  , 0.0, 1.0)));
  color_21 = (color_21 + ((
    (xlv_TEXCOORD5.xyz * tmpvar_11)
   * tmpvar_5) + (
    (((tmpvar_19.w * hdr_15.x) * tmpvar_19.xyz) * tmpvar_11)
   * 
    mix (tmpvar_6, vec3(clamp ((_Glossiness + (1.0 - tmpvar_7)), 0.0, 1.0)), tmpvar_23.yyy)
  )));
  mediump vec4 tmpvar_26;
  tmpvar_26.w = 1.0;
  tmpvar_26.xyz = color_21;
  c_1.w = tmpvar_26.w;
  c_1.xyz = color_21;
  c_1.xyz = c_1.xyz;
  mediump vec4 xlat_varoutput_27;
  xlat_varoutput_27.xyz = c_1.xyz;
  xlat_varoutput_27.w = 1.0;
  gl_FragData[0] = xlat_varoutput_27;
}


#endif
"
}
SubProgram "gles " {
// Stats: 49 math, 5 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"!!GLES
#version 100

#ifdef VERTEX
#extension GL_EXT_shadow_samplers : enable
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
varying mediump vec4 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  highp vec4 tmpvar_4;
  mediump vec4 tmpvar_5;
  mediump vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  mediump vec4 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (_Object2World * _glesVertex);
  tmpvar_4 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 texcoord_10;
  texcoord_10.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_11;
  if ((_UVSec == 0.0)) {
    tmpvar_11 = tmpvar_2;
  } else {
    tmpvar_11 = tmpvar_3;
  };
  texcoord_10.zw = ((tmpvar_11 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 n_12;
  n_12 = (tmpvar_9.xyz - _WorldSpaceCameraPos);
  highp vec3 norm_13;
  norm_13 = tmpvar_1;
  highp vec4 v_14;
  v_14.x = _World2Object[0].x;
  v_14.y = _World2Object[1].x;
  v_14.z = _World2Object[2].x;
  v_14.w = _World2Object[3].x;
  highp vec4 v_15;
  v_15.x = _World2Object[0].y;
  v_15.y = _World2Object[1].y;
  v_15.z = _World2Object[2].y;
  v_15.w = _World2Object[3].y;
  highp vec4 v_16;
  v_16.x = _World2Object[0].z;
  v_16.y = _World2Object[1].z;
  v_16.z = _World2Object[2].z;
  v_16.w = _World2Object[3].z;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize(((
    (v_14.xyz * norm_13.x)
   + 
    (v_15.xyz * norm_13.y)
  ) + (v_16.xyz * norm_13.z)));
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_7.xyz = tmpvar_17;
  tmpvar_8 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
  mediump vec3 normalWorld_18;
  normalWorld_18 = tmpvar_17;
  mediump vec4 ambientOrLightmapUV_19;
  ambientOrLightmapUV_19.w = 0.0;
  mediump vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = normalWorld_18;
  mediump vec3 x2_21;
  mediump vec3 x1_22;
  x1_22.x = dot (unity_SHAr, tmpvar_20);
  x1_22.y = dot (unity_SHAg, tmpvar_20);
  x1_22.z = dot (unity_SHAb, tmpvar_20);
  mediump vec4 tmpvar_23;
  tmpvar_23 = (normalWorld_18.xyzz * normalWorld_18.yzzx);
  x2_21.x = dot (unity_SHBr, tmpvar_23);
  x2_21.y = dot (unity_SHBg, tmpvar_23);
  x2_21.z = dot (unity_SHBb, tmpvar_23);
  ambientOrLightmapUV_19.xyz = ((x2_21 + (unity_SHC.xyz * 
    ((normalWorld_18.x * normalWorld_18.x) - (normalWorld_18.y * normalWorld_18.y))
  )) + x1_22);
  highp vec3 lightColor0_24;
  lightColor0_24 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_25;
  lightColor1_25 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_26;
  lightColor2_26 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_27;
  lightColor3_27 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_28;
  lightAttenSq_28 = unity_4LightAtten0;
  highp vec3 normal_29;
  normal_29 = normalWorld_18;
  highp vec3 col_30;
  highp vec4 ndotl_31;
  highp vec4 lengthSq_32;
  highp vec4 tmpvar_33;
  tmpvar_33 = (unity_4LightPosX0 - tmpvar_9.x);
  highp vec4 tmpvar_34;
  tmpvar_34 = (unity_4LightPosY0 - tmpvar_9.y);
  highp vec4 tmpvar_35;
  tmpvar_35 = (unity_4LightPosZ0 - tmpvar_9.z);
  lengthSq_32 = (tmpvar_33 * tmpvar_33);
  lengthSq_32 = (lengthSq_32 + (tmpvar_34 * tmpvar_34));
  lengthSq_32 = (lengthSq_32 + (tmpvar_35 * tmpvar_35));
  ndotl_31 = (tmpvar_33 * normal_29.x);
  ndotl_31 = (ndotl_31 + (tmpvar_34 * normal_29.y));
  ndotl_31 = (ndotl_31 + (tmpvar_35 * normal_29.z));
  highp vec4 tmpvar_36;
  tmpvar_36 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_31 * inversesqrt(lengthSq_32)));
  ndotl_31 = tmpvar_36;
  highp vec4 tmpvar_37;
  tmpvar_37 = (tmpvar_36 * (1.0/((1.0 + 
    (lengthSq_32 * lightAttenSq_28)
  ))));
  col_30 = (lightColor0_24 * tmpvar_37.x);
  col_30 = (col_30 + (lightColor1_25 * tmpvar_37.y));
  col_30 = (col_30 + (lightColor2_26 * tmpvar_37.z));
  col_30 = (col_30 + (lightColor3_27 * tmpvar_37.w));
  ambientOrLightmapUV_19.xyz = (ambientOrLightmapUV_19.xyz + col_30);
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = texcoord_10;
  xlv_TEXCOORD1 = normalize(n_12);
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD2_1 = tmpvar_6;
  xlv_TEXCOORD2_2 = tmpvar_7;
  xlv_TEXCOORD5 = ambientOrLightmapUV_19;
  xlv_TEXCOORD6 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shadow_samplers : enable
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 _LightShadowData;
uniform lowp samplerCube unity_SpecCube0;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform mediump vec4 unity_ColorSpaceDielectricSpec;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform lowp sampler2DShadow _ShadowMapTexture;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
varying mediump vec4 xlv_TEXCOORD6;
void main ()
{
  mediump vec4 c_1;
  mediump float atten_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * tmpvar_3.xyz);
  mediump vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_4, vec3(_Metallic));
  mediump float tmpvar_7;
  tmpvar_7 = (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w));
  tmpvar_5 = (tmpvar_4 * tmpvar_7);
  mediump vec3 tmpvar_8;
  tmpvar_8 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_9;
  tmpvar_9 = _LightColor0.xyz;
  lowp float shadow_10;
  shadow_10 = (_LightShadowData.x + (shadow2DEXT (_ShadowMapTexture, xlv_TEXCOORD6.xyz) * (1.0 - _LightShadowData.x)));
  atten_2 = shadow_10;
  mediump float tmpvar_11;
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy);
  tmpvar_11 = tmpvar_12.y;
  highp vec4 tmpvar_13;
  tmpvar_13 = unity_SpecCube0_HDR;
  mediump vec3 tmpvar_14;
  tmpvar_14 = (xlv_TEXCOORD1 - (2.0 * (
    dot (tmpvar_8, xlv_TEXCOORD1)
   * tmpvar_8)));
  mediump vec4 hdr_15;
  hdr_15 = tmpvar_13;
  mediump vec4 tmpvar_16;
  tmpvar_16.xyz = tmpvar_14;
  mediump float tmpvar_17;
  tmpvar_17 = (1.0 - _Glossiness);
  tmpvar_16.w = (tmpvar_17 * 7.0);
  lowp vec4 tmpvar_18;
  tmpvar_18 = textureCube (unity_SpecCube0, tmpvar_14, tmpvar_16.w);
  mediump vec4 tmpvar_19;
  tmpvar_19 = tmpvar_18;
  mediump vec3 viewDir_20;
  viewDir_20 = -(xlv_TEXCOORD1);
  mediump vec3 color_21;
  mediump vec2 tmpvar_22;
  tmpvar_22.x = dot ((viewDir_20 - (2.0 * 
    (dot (tmpvar_8, viewDir_20) * tmpvar_8)
  )), _WorldSpaceLightPos0.xyz);
  tmpvar_22.y = (1.0 - clamp (dot (tmpvar_8, viewDir_20), 0.0, 1.0));
  mediump vec2 tmpvar_23;
  tmpvar_23 = ((tmpvar_22 * tmpvar_22) * (tmpvar_22 * tmpvar_22));
  mediump vec2 tmpvar_24;
  tmpvar_24.x = tmpvar_23.x;
  tmpvar_24.y = tmpvar_17;
  lowp vec4 tmpvar_25;
  tmpvar_25 = texture2D (unity_NHxRoughness, tmpvar_24);
  color_21 = ((tmpvar_5 + (
    (tmpvar_25.w * 16.0)
   * tmpvar_6)) * ((tmpvar_9 * atten_2) * clamp (
    dot (tmpvar_8, _WorldSpaceLightPos0.xyz)
  , 0.0, 1.0)));
  color_21 = (color_21 + ((
    (xlv_TEXCOORD5.xyz * tmpvar_11)
   * tmpvar_5) + (
    (((tmpvar_19.w * hdr_15.x) * tmpvar_19.xyz) * tmpvar_11)
   * 
    mix (tmpvar_6, vec3(clamp ((_Glossiness + (1.0 - tmpvar_7)), 0.0, 1.0)), tmpvar_23.yyy)
  )));
  mediump vec4 tmpvar_26;
  tmpvar_26.w = 1.0;
  tmpvar_26.xyz = color_21;
  c_1.w = tmpvar_26.w;
  c_1.xyz = color_21;
  c_1.xyz = c_1.xyz;
  mediump vec4 xlat_varoutput_27;
  xlat_varoutput_27.xyz = c_1.xyz;
  xlat_varoutput_27.w = 1.0;
  gl_FragData[0] = xlat_varoutput_27;
}


#endif
"
}
}
Program "fp" {
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"!!GLES"
}
}
 }


 // Stats for Vertex shader:
 //        gles : 34 avg math (28..40), 3 avg texture (2..5), 0 avg branch (0..1)
 Pass {
  Name "FORWARD_DELTA"
  Tags { "LIGHTMODE"="ForwardAdd" "SHADOWSUPPORT"="true" "RenderType"="Opaque" "PerformanceChecks"="False" }
  ZWrite Off
  Blend [_SrcBlend] One
  GpuProgramID 456985
Program "vp" {
SubProgram "gles " {
// Stats: 30 math, 3 textures
Keywords { "POINT" "SHADOWS_OFF" }
"!!GLES
#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_WorldTransformParams;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
uniform mediump mat4 _LightMatrix0;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  tmpvar_4 = _glesTANGENT;
  highp vec3 lightDir_5;
  highp mat3 tangentToWorld_6;
  highp vec4 tmpvar_7;
  mediump vec4 tmpvar_8;
  mediump vec4 tmpvar_9;
  mediump vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11 = (_Object2World * _glesVertex);
  tmpvar_7 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 n_14;
  n_14 = (tmpvar_11.xyz - _WorldSpaceCameraPos);
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp vec4 v_16;
  v_16.x = _World2Object[0].x;
  v_16.y = _World2Object[1].x;
  v_16.z = _World2Object[2].x;
  v_16.w = _World2Object[3].x;
  highp vec4 v_17;
  v_17.x = _World2Object[0].y;
  v_17.y = _World2Object[1].y;
  v_17.z = _World2Object[2].y;
  v_17.w = _World2Object[3].y;
  highp vec4 v_18;
  v_18.x = _World2Object[0].z;
  v_18.y = _World2Object[1].z;
  v_18.z = _World2Object[2].z;
  v_18.w = _World2Object[3].z;
  highp vec3 tmpvar_19;
  tmpvar_19 = normalize(((
    (v_16.xyz * norm_15.x)
   + 
    (v_17.xyz * norm_15.y)
  ) + (v_18.xyz * norm_15.z)));
  highp vec3 dir_20;
  dir_20 = tmpvar_4.xyz;
  highp mat3 tmpvar_21;
  tmpvar_21[0] = _Object2World[0].xyz;
  tmpvar_21[1] = _Object2World[1].xyz;
  tmpvar_21[2] = _Object2World[2].xyz;
  highp vec4 tmpvar_22;
  tmpvar_22.xyz = normalize((tmpvar_21 * dir_20));
  tmpvar_22.w = tmpvar_4.w;
  mediump vec3 normal_23;
  normal_23 = tmpvar_19;
  mediump vec3 tangent_24;
  tangent_24 = tmpvar_22.xyz;
  mediump float tangentSign_25;
  tangentSign_25 = tmpvar_22.w;
  mediump float sign_26;
  highp float tmpvar_27;
  tmpvar_27 = (tangentSign_25 * unity_WorldTransformParams.w);
  sign_26 = tmpvar_27;
  mediump vec3 tmpvar_28;
  tmpvar_28 = (((normal_23.yzx * tangent_24.zxy) - (normal_23.zxy * tangent_24.yzx)) * sign_26);
  mediump mat3 tmpvar_29;
  tmpvar_29[0].x = tangent_24.x;
  tmpvar_29[0].y = tmpvar_28.x;
  tmpvar_29[0].z = normal_23.x;
  tmpvar_29[1].x = tangent_24.y;
  tmpvar_29[1].y = tmpvar_28.y;
  tmpvar_29[1].z = normal_23.y;
  tmpvar_29[2].x = tangent_24.z;
  tmpvar_29[2].y = tmpvar_28.z;
  tmpvar_29[2].z = normal_23.z;
  tangentToWorld_6 = tmpvar_29;
  highp vec3 v_30;
  v_30.x = tangentToWorld_6[0].x;
  v_30.y = tangentToWorld_6[1].x;
  v_30.z = tangentToWorld_6[2].x;
  tmpvar_8.xyz = v_30;
  highp vec3 v_31;
  v_31.x = tangentToWorld_6[0].y;
  v_31.y = tangentToWorld_6[1].y;
  v_31.z = tangentToWorld_6[2].y;
  tmpvar_9.xyz = v_31;
  highp vec3 v_32;
  v_32.x = tangentToWorld_6[0].z;
  v_32.y = tangentToWorld_6[1].z;
  v_32.z = tangentToWorld_6[2].z;
  tmpvar_10.xyz = v_32;
  highp vec3 tmpvar_33;
  tmpvar_33 = (_WorldSpaceLightPos0.xyz - (tmpvar_11.xyz * _WorldSpaceLightPos0.w));
  mediump vec3 n_34;
  n_34 = tmpvar_33;
  mediump vec3 tmpvar_35;
  tmpvar_35 = normalize(n_34);
  lightDir_5 = tmpvar_35;
  tmpvar_8.w = lightDir_5.x;
  tmpvar_9.w = lightDir_5.y;
  tmpvar_10.w = lightDir_5.z;
  gl_Position = tmpvar_7;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = normalize(n_14);
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD2_1 = tmpvar_9;
  xlv_TEXCOORD2_2 = tmpvar_10;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 unity_ColorSpaceDielectricSpec;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _LightTexture0;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_2;
  tmpvar_2 = (_Color.xyz * tmpvar_1.xyz);
  mediump vec3 tmpvar_3;
  tmpvar_3 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_4;
  tmpvar_4.x = xlv_TEXCOORD2.w;
  tmpvar_4.y = xlv_TEXCOORD2_1.w;
  tmpvar_4.z = xlv_TEXCOORD2_2.w;
  highp float tmpvar_5;
  tmpvar_5 = dot (xlv_TEXCOORD5, xlv_TEXCOORD5);
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_LightTexture0, vec2(tmpvar_5));
  mediump float atten_7;
  atten_7 = tmpvar_6.w;
  mediump vec3 tmpvar_8;
  tmpvar_8 = _LightColor0.xyz;
  tmpvar_8 = (tmpvar_8 * atten_7);
  mediump vec3 viewDir_9;
  viewDir_9 = -(xlv_TEXCOORD1);
  mediump vec2 tmpvar_10;
  tmpvar_10.x = dot ((viewDir_9 - (2.0 * 
    (dot (tmpvar_3, viewDir_9) * tmpvar_3)
  )), tmpvar_4);
  tmpvar_10.y = (1.0 - clamp (dot (tmpvar_3, viewDir_9), 0.0, 1.0));
  mediump vec2 tmpvar_11;
  tmpvar_11.x = ((tmpvar_10 * tmpvar_10) * (tmpvar_10 * tmpvar_10)).x;
  tmpvar_11.y = (1.0 - _Glossiness);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (unity_NHxRoughness, tmpvar_11);
  mediump vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = (((tmpvar_2 * 
    (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w))
  ) + (
    (tmpvar_12.w * 16.0)
   * 
    mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, vec3(_Metallic))
  )) * (tmpvar_8 * clamp (
    dot (tmpvar_3, tmpvar_4)
  , 0.0, 1.0)));
  mediump vec4 xlat_varoutput_14;
  xlat_varoutput_14.xyz = tmpvar_13.xyz;
  xlat_varoutput_14.w = 1.0;
  gl_FragData[0] = xlat_varoutput_14;
}


#endif
"
}
SubProgram "gles " {
// Stats: 28 math, 2 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
"!!GLES
#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_WorldTransformParams;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  tmpvar_4 = _glesTANGENT;
  highp mat3 tangentToWorld_5;
  highp vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  mediump vec4 tmpvar_8;
  mediump vec4 tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10 = (_Object2World * _glesVertex);
  tmpvar_6 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 texcoord_11;
  texcoord_11.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_12;
  if ((_UVSec == 0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 n_13;
  n_13 = (tmpvar_10.xyz - _WorldSpaceCameraPos);
  highp vec3 norm_14;
  norm_14 = tmpvar_1;
  highp vec4 v_15;
  v_15.x = _World2Object[0].x;
  v_15.y = _World2Object[1].x;
  v_15.z = _World2Object[2].x;
  v_15.w = _World2Object[3].x;
  highp vec4 v_16;
  v_16.x = _World2Object[0].y;
  v_16.y = _World2Object[1].y;
  v_16.z = _World2Object[2].y;
  v_16.w = _World2Object[3].y;
  highp vec4 v_17;
  v_17.x = _World2Object[0].z;
  v_17.y = _World2Object[1].z;
  v_17.z = _World2Object[2].z;
  v_17.w = _World2Object[3].z;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize(((
    (v_15.xyz * norm_14.x)
   + 
    (v_16.xyz * norm_14.y)
  ) + (v_17.xyz * norm_14.z)));
  highp vec3 dir_19;
  dir_19 = tmpvar_4.xyz;
  highp mat3 tmpvar_20;
  tmpvar_20[0] = _Object2World[0].xyz;
  tmpvar_20[1] = _Object2World[1].xyz;
  tmpvar_20[2] = _Object2World[2].xyz;
  highp vec4 tmpvar_21;
  tmpvar_21.xyz = normalize((tmpvar_20 * dir_19));
  tmpvar_21.w = tmpvar_4.w;
  mediump vec3 normal_22;
  normal_22 = tmpvar_18;
  mediump vec3 tangent_23;
  tangent_23 = tmpvar_21.xyz;
  mediump float tangentSign_24;
  tangentSign_24 = tmpvar_21.w;
  mediump float sign_25;
  highp float tmpvar_26;
  tmpvar_26 = (tangentSign_24 * unity_WorldTransformParams.w);
  sign_25 = tmpvar_26;
  mediump vec3 tmpvar_27;
  tmpvar_27 = (((normal_22.yzx * tangent_23.zxy) - (normal_22.zxy * tangent_23.yzx)) * sign_25);
  mediump mat3 tmpvar_28;
  tmpvar_28[0].x = tangent_23.x;
  tmpvar_28[0].y = tmpvar_27.x;
  tmpvar_28[0].z = normal_22.x;
  tmpvar_28[1].x = tangent_23.y;
  tmpvar_28[1].y = tmpvar_27.y;
  tmpvar_28[1].z = normal_22.y;
  tmpvar_28[2].x = tangent_23.z;
  tmpvar_28[2].y = tmpvar_27.z;
  tmpvar_28[2].z = normal_22.z;
  tangentToWorld_5 = tmpvar_28;
  highp vec3 v_29;
  v_29.x = tangentToWorld_5[0].x;
  v_29.y = tangentToWorld_5[1].x;
  v_29.z = tangentToWorld_5[2].x;
  tmpvar_7.xyz = v_29;
  highp vec3 v_30;
  v_30.x = tangentToWorld_5[0].y;
  v_30.y = tangentToWorld_5[1].y;
  v_30.z = tangentToWorld_5[2].y;
  tmpvar_8.xyz = v_30;
  highp vec3 v_31;
  v_31.x = tangentToWorld_5[0].z;
  v_31.y = tangentToWorld_5[1].z;
  v_31.z = tangentToWorld_5[2].z;
  tmpvar_9.xyz = v_31;
  highp vec3 tmpvar_32;
  tmpvar_32 = (_WorldSpaceLightPos0.xyz - (tmpvar_10.xyz * _WorldSpaceLightPos0.w));
  tmpvar_7.w = tmpvar_32.x;
  tmpvar_8.w = tmpvar_32.y;
  tmpvar_9.w = tmpvar_32.z;
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = texcoord_11;
  xlv_TEXCOORD1 = normalize(n_13);
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD2_1 = tmpvar_8;
  xlv_TEXCOORD2_2 = tmpvar_9;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 unity_ColorSpaceDielectricSpec;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_2;
  tmpvar_2 = (_Color.xyz * tmpvar_1.xyz);
  mediump vec3 tmpvar_3;
  tmpvar_3 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_4;
  tmpvar_4.x = xlv_TEXCOORD2.w;
  tmpvar_4.y = xlv_TEXCOORD2_1.w;
  tmpvar_4.z = xlv_TEXCOORD2_2.w;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _LightColor0.xyz;
  mediump vec3 viewDir_6;
  viewDir_6 = -(xlv_TEXCOORD1);
  mediump vec2 tmpvar_7;
  tmpvar_7.x = dot ((viewDir_6 - (2.0 * 
    (dot (tmpvar_3, viewDir_6) * tmpvar_3)
  )), tmpvar_4);
  tmpvar_7.y = (1.0 - clamp (dot (tmpvar_3, viewDir_6), 0.0, 1.0));
  mediump vec2 tmpvar_8;
  tmpvar_8.x = ((tmpvar_7 * tmpvar_7) * (tmpvar_7 * tmpvar_7)).x;
  tmpvar_8.y = (1.0 - _Glossiness);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (unity_NHxRoughness, tmpvar_8);
  mediump vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = (((tmpvar_2 * 
    (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w))
  ) + (
    (tmpvar_9.w * 16.0)
   * 
    mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, vec3(_Metallic))
  )) * (tmpvar_5 * clamp (
    dot (tmpvar_3, tmpvar_4)
  , 0.0, 1.0)));
  mediump vec4 xlat_varoutput_11;
  xlat_varoutput_11.xyz = tmpvar_10.xyz;
  xlat_varoutput_11.w = 1.0;
  gl_FragData[0] = xlat_varoutput_11;
}


#endif
"
}
SubProgram "gles " {
// Stats: 36 math, 4 textures
Keywords { "SPOT" "SHADOWS_OFF" }
"!!GLES
#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_WorldTransformParams;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
uniform mediump mat4 _LightMatrix0;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  tmpvar_4 = _glesTANGENT;
  highp vec3 lightDir_5;
  highp mat3 tangentToWorld_6;
  highp vec4 tmpvar_7;
  mediump vec4 tmpvar_8;
  mediump vec4 tmpvar_9;
  mediump vec4 tmpvar_10;
  mediump vec4 tmpvar_11;
  highp vec4 tmpvar_12;
  tmpvar_12 = (_Object2World * _glesVertex);
  tmpvar_7 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 texcoord_13;
  texcoord_13.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_14;
  if ((_UVSec == 0.0)) {
    tmpvar_14 = tmpvar_2;
  } else {
    tmpvar_14 = tmpvar_3;
  };
  texcoord_13.zw = ((tmpvar_14 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 n_15;
  n_15 = (tmpvar_12.xyz - _WorldSpaceCameraPos);
  highp vec3 norm_16;
  norm_16 = tmpvar_1;
  highp vec4 v_17;
  v_17.x = _World2Object[0].x;
  v_17.y = _World2Object[1].x;
  v_17.z = _World2Object[2].x;
  v_17.w = _World2Object[3].x;
  highp vec4 v_18;
  v_18.x = _World2Object[0].y;
  v_18.y = _World2Object[1].y;
  v_18.z = _World2Object[2].y;
  v_18.w = _World2Object[3].y;
  highp vec4 v_19;
  v_19.x = _World2Object[0].z;
  v_19.y = _World2Object[1].z;
  v_19.z = _World2Object[2].z;
  v_19.w = _World2Object[3].z;
  highp vec3 tmpvar_20;
  tmpvar_20 = normalize(((
    (v_17.xyz * norm_16.x)
   + 
    (v_18.xyz * norm_16.y)
  ) + (v_19.xyz * norm_16.z)));
  highp vec3 dir_21;
  dir_21 = tmpvar_4.xyz;
  highp mat3 tmpvar_22;
  tmpvar_22[0] = _Object2World[0].xyz;
  tmpvar_22[1] = _Object2World[1].xyz;
  tmpvar_22[2] = _Object2World[2].xyz;
  highp vec4 tmpvar_23;
  tmpvar_23.xyz = normalize((tmpvar_22 * dir_21));
  tmpvar_23.w = tmpvar_4.w;
  mediump vec3 normal_24;
  normal_24 = tmpvar_20;
  mediump vec3 tangent_25;
  tangent_25 = tmpvar_23.xyz;
  mediump float tangentSign_26;
  tangentSign_26 = tmpvar_23.w;
  mediump float sign_27;
  highp float tmpvar_28;
  tmpvar_28 = (tangentSign_26 * unity_WorldTransformParams.w);
  sign_27 = tmpvar_28;
  mediump vec3 tmpvar_29;
  tmpvar_29 = (((normal_24.yzx * tangent_25.zxy) - (normal_24.zxy * tangent_25.yzx)) * sign_27);
  mediump mat3 tmpvar_30;
  tmpvar_30[0].x = tangent_25.x;
  tmpvar_30[0].y = tmpvar_29.x;
  tmpvar_30[0].z = normal_24.x;
  tmpvar_30[1].x = tangent_25.y;
  tmpvar_30[1].y = tmpvar_29.y;
  tmpvar_30[1].z = normal_24.y;
  tmpvar_30[2].x = tangent_25.z;
  tmpvar_30[2].y = tmpvar_29.z;
  tmpvar_30[2].z = normal_24.z;
  tangentToWorld_6 = tmpvar_30;
  highp vec3 v_31;
  v_31.x = tangentToWorld_6[0].x;
  v_31.y = tangentToWorld_6[1].x;
  v_31.z = tangentToWorld_6[2].x;
  tmpvar_8.xyz = v_31;
  highp vec3 v_32;
  v_32.x = tangentToWorld_6[0].y;
  v_32.y = tangentToWorld_6[1].y;
  v_32.z = tangentToWorld_6[2].y;
  tmpvar_9.xyz = v_32;
  highp vec3 v_33;
  v_33.x = tangentToWorld_6[0].z;
  v_33.y = tangentToWorld_6[1].z;
  v_33.z = tangentToWorld_6[2].z;
  tmpvar_10.xyz = v_33;
  tmpvar_11 = (_LightMatrix0 * (_Object2World * _glesVertex));
  highp vec3 tmpvar_34;
  tmpvar_34 = (_WorldSpaceLightPos0.xyz - (tmpvar_12.xyz * _WorldSpaceLightPos0.w));
  mediump vec3 n_35;
  n_35 = tmpvar_34;
  mediump vec3 tmpvar_36;
  tmpvar_36 = normalize(n_35);
  lightDir_5 = tmpvar_36;
  tmpvar_8.w = lightDir_5.x;
  tmpvar_9.w = lightDir_5.y;
  tmpvar_10.w = lightDir_5.z;
  gl_Position = tmpvar_7;
  xlv_TEXCOORD0 = texcoord_13;
  xlv_TEXCOORD1 = normalize(n_15);
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD2_1 = tmpvar_9;
  xlv_TEXCOORD2_2 = tmpvar_10;
  xlv_TEXCOORD5 = tmpvar_11;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 unity_ColorSpaceDielectricSpec;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _LightTexture0;
uniform sampler2D _LightTextureB0;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_2;
  tmpvar_2 = (_Color.xyz * tmpvar_1.xyz);
  mediump vec3 tmpvar_3;
  tmpvar_3 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_4;
  tmpvar_4.x = xlv_TEXCOORD2.w;
  tmpvar_4.y = xlv_TEXCOORD2_1.w;
  tmpvar_4.z = xlv_TEXCOORD2_2.w;
  lowp vec4 tmpvar_5;
  mediump vec2 P_6;
  P_6 = ((xlv_TEXCOORD5.xy / xlv_TEXCOORD5.w) + 0.5);
  tmpvar_5 = texture2D (_LightTexture0, P_6);
  highp vec3 LightCoord_7;
  LightCoord_7 = xlv_TEXCOORD5.xyz;
  highp float tmpvar_8;
  tmpvar_8 = dot (LightCoord_7, LightCoord_7);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_LightTextureB0, vec2(tmpvar_8));
  mediump vec3 tmpvar_10;
  tmpvar_10 = _LightColor0.xyz;
  tmpvar_10 = (tmpvar_10 * ((
    float((xlv_TEXCOORD5.z > 0.0))
   * tmpvar_5.w) * tmpvar_9.w));
  mediump vec3 viewDir_11;
  viewDir_11 = -(xlv_TEXCOORD1);
  mediump vec2 tmpvar_12;
  tmpvar_12.x = dot ((viewDir_11 - (2.0 * 
    (dot (tmpvar_3, viewDir_11) * tmpvar_3)
  )), tmpvar_4);
  tmpvar_12.y = (1.0 - clamp (dot (tmpvar_3, viewDir_11), 0.0, 1.0));
  mediump vec2 tmpvar_13;
  tmpvar_13.x = ((tmpvar_12 * tmpvar_12) * (tmpvar_12 * tmpvar_12)).x;
  tmpvar_13.y = (1.0 - _Glossiness);
  lowp vec4 tmpvar_14;
  tmpvar_14 = texture2D (unity_NHxRoughness, tmpvar_13);
  mediump vec4 tmpvar_15;
  tmpvar_15.w = 1.0;
  tmpvar_15.xyz = (((tmpvar_2 * 
    (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w))
  ) + (
    (tmpvar_14.w * 16.0)
   * 
    mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, vec3(_Metallic))
  )) * (tmpvar_10 * clamp (
    dot (tmpvar_3, tmpvar_4)
  , 0.0, 1.0)));
  mediump vec4 xlat_varoutput_16;
  xlat_varoutput_16.xyz = tmpvar_15.xyz;
  xlat_varoutput_16.w = 1.0;
  gl_FragData[0] = xlat_varoutput_16;
}


#endif
"
}
SubProgram "gles " {
// Stats: 31 math, 4 textures
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
"!!GLES
#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_WorldTransformParams;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
uniform mediump mat4 _LightMatrix0;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  tmpvar_4 = _glesTANGENT;
  highp vec3 lightDir_5;
  highp mat3 tangentToWorld_6;
  highp vec4 tmpvar_7;
  mediump vec4 tmpvar_8;
  mediump vec4 tmpvar_9;
  mediump vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11 = (_Object2World * _glesVertex);
  tmpvar_7 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 n_14;
  n_14 = (tmpvar_11.xyz - _WorldSpaceCameraPos);
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp vec4 v_16;
  v_16.x = _World2Object[0].x;
  v_16.y = _World2Object[1].x;
  v_16.z = _World2Object[2].x;
  v_16.w = _World2Object[3].x;
  highp vec4 v_17;
  v_17.x = _World2Object[0].y;
  v_17.y = _World2Object[1].y;
  v_17.z = _World2Object[2].y;
  v_17.w = _World2Object[3].y;
  highp vec4 v_18;
  v_18.x = _World2Object[0].z;
  v_18.y = _World2Object[1].z;
  v_18.z = _World2Object[2].z;
  v_18.w = _World2Object[3].z;
  highp vec3 tmpvar_19;
  tmpvar_19 = normalize(((
    (v_16.xyz * norm_15.x)
   + 
    (v_17.xyz * norm_15.y)
  ) + (v_18.xyz * norm_15.z)));
  highp vec3 dir_20;
  dir_20 = tmpvar_4.xyz;
  highp mat3 tmpvar_21;
  tmpvar_21[0] = _Object2World[0].xyz;
  tmpvar_21[1] = _Object2World[1].xyz;
  tmpvar_21[2] = _Object2World[2].xyz;
  highp vec4 tmpvar_22;
  tmpvar_22.xyz = normalize((tmpvar_21 * dir_20));
  tmpvar_22.w = tmpvar_4.w;
  mediump vec3 normal_23;
  normal_23 = tmpvar_19;
  mediump vec3 tangent_24;
  tangent_24 = tmpvar_22.xyz;
  mediump float tangentSign_25;
  tangentSign_25 = tmpvar_22.w;
  mediump float sign_26;
  highp float tmpvar_27;
  tmpvar_27 = (tangentSign_25 * unity_WorldTransformParams.w);
  sign_26 = tmpvar_27;
  mediump vec3 tmpvar_28;
  tmpvar_28 = (((normal_23.yzx * tangent_24.zxy) - (normal_23.zxy * tangent_24.yzx)) * sign_26);
  mediump mat3 tmpvar_29;
  tmpvar_29[0].x = tangent_24.x;
  tmpvar_29[0].y = tmpvar_28.x;
  tmpvar_29[0].z = normal_23.x;
  tmpvar_29[1].x = tangent_24.y;
  tmpvar_29[1].y = tmpvar_28.y;
  tmpvar_29[1].z = normal_23.y;
  tmpvar_29[2].x = tangent_24.z;
  tmpvar_29[2].y = tmpvar_28.z;
  tmpvar_29[2].z = normal_23.z;
  tangentToWorld_6 = tmpvar_29;
  highp vec3 v_30;
  v_30.x = tangentToWorld_6[0].x;
  v_30.y = tangentToWorld_6[1].x;
  v_30.z = tangentToWorld_6[2].x;
  tmpvar_8.xyz = v_30;
  highp vec3 v_31;
  v_31.x = tangentToWorld_6[0].y;
  v_31.y = tangentToWorld_6[1].y;
  v_31.z = tangentToWorld_6[2].y;
  tmpvar_9.xyz = v_31;
  highp vec3 v_32;
  v_32.x = tangentToWorld_6[0].z;
  v_32.y = tangentToWorld_6[1].z;
  v_32.z = tangentToWorld_6[2].z;
  tmpvar_10.xyz = v_32;
  highp vec3 tmpvar_33;
  tmpvar_33 = (_WorldSpaceLightPos0.xyz - (tmpvar_11.xyz * _WorldSpaceLightPos0.w));
  mediump vec3 n_34;
  n_34 = tmpvar_33;
  mediump vec3 tmpvar_35;
  tmpvar_35 = normalize(n_34);
  lightDir_5 = tmpvar_35;
  tmpvar_8.w = lightDir_5.x;
  tmpvar_9.w = lightDir_5.y;
  tmpvar_10.w = lightDir_5.z;
  gl_Position = tmpvar_7;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = normalize(n_14);
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD2_1 = tmpvar_9;
  xlv_TEXCOORD2_2 = tmpvar_10;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 unity_ColorSpaceDielectricSpec;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform lowp samplerCube _LightTexture0;
uniform sampler2D _LightTextureB0;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_2;
  tmpvar_2 = (_Color.xyz * tmpvar_1.xyz);
  mediump vec3 tmpvar_3;
  tmpvar_3 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_4;
  tmpvar_4.x = xlv_TEXCOORD2.w;
  tmpvar_4.y = xlv_TEXCOORD2_1.w;
  tmpvar_4.z = xlv_TEXCOORD2_2.w;
  highp float tmpvar_5;
  tmpvar_5 = dot (xlv_TEXCOORD5, xlv_TEXCOORD5);
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_LightTextureB0, vec2(tmpvar_5));
  lowp vec4 tmpvar_7;
  tmpvar_7 = textureCube (_LightTexture0, xlv_TEXCOORD5);
  mediump float atten_8;
  atten_8 = (tmpvar_6.w * tmpvar_7.w);
  mediump vec3 tmpvar_9;
  tmpvar_9 = _LightColor0.xyz;
  tmpvar_9 = (tmpvar_9 * atten_8);
  mediump vec3 viewDir_10;
  viewDir_10 = -(xlv_TEXCOORD1);
  mediump vec2 tmpvar_11;
  tmpvar_11.x = dot ((viewDir_10 - (2.0 * 
    (dot (tmpvar_3, viewDir_10) * tmpvar_3)
  )), tmpvar_4);
  tmpvar_11.y = (1.0 - clamp (dot (tmpvar_3, viewDir_10), 0.0, 1.0));
  mediump vec2 tmpvar_12;
  tmpvar_12.x = ((tmpvar_11 * tmpvar_11) * (tmpvar_11 * tmpvar_11)).x;
  tmpvar_12.y = (1.0 - _Glossiness);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (unity_NHxRoughness, tmpvar_12);
  mediump vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = (((tmpvar_2 * 
    (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w))
  ) + (
    (tmpvar_13.w * 16.0)
   * 
    mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, vec3(_Metallic))
  )) * (tmpvar_9 * clamp (
    dot (tmpvar_3, tmpvar_4)
  , 0.0, 1.0)));
  mediump vec4 xlat_varoutput_15;
  xlat_varoutput_15.xyz = tmpvar_14.xyz;
  xlat_varoutput_15.w = 1.0;
  gl_FragData[0] = xlat_varoutput_15;
}


#endif
"
}
SubProgram "gles " {
// Stats: 29 math, 3 textures
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
"!!GLES
#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_WorldTransformParams;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
uniform mediump mat4 _LightMatrix0;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  tmpvar_4 = _glesTANGENT;
  highp mat3 tangentToWorld_5;
  highp vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  mediump vec4 tmpvar_8;
  mediump vec4 tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10 = (_Object2World * _glesVertex);
  tmpvar_6 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 texcoord_11;
  texcoord_11.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_12;
  if ((_UVSec == 0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 n_13;
  n_13 = (tmpvar_10.xyz - _WorldSpaceCameraPos);
  highp vec3 norm_14;
  norm_14 = tmpvar_1;
  highp vec4 v_15;
  v_15.x = _World2Object[0].x;
  v_15.y = _World2Object[1].x;
  v_15.z = _World2Object[2].x;
  v_15.w = _World2Object[3].x;
  highp vec4 v_16;
  v_16.x = _World2Object[0].y;
  v_16.y = _World2Object[1].y;
  v_16.z = _World2Object[2].y;
  v_16.w = _World2Object[3].y;
  highp vec4 v_17;
  v_17.x = _World2Object[0].z;
  v_17.y = _World2Object[1].z;
  v_17.z = _World2Object[2].z;
  v_17.w = _World2Object[3].z;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize(((
    (v_15.xyz * norm_14.x)
   + 
    (v_16.xyz * norm_14.y)
  ) + (v_17.xyz * norm_14.z)));
  highp vec3 dir_19;
  dir_19 = tmpvar_4.xyz;
  highp mat3 tmpvar_20;
  tmpvar_20[0] = _Object2World[0].xyz;
  tmpvar_20[1] = _Object2World[1].xyz;
  tmpvar_20[2] = _Object2World[2].xyz;
  highp vec4 tmpvar_21;
  tmpvar_21.xyz = normalize((tmpvar_20 * dir_19));
  tmpvar_21.w = tmpvar_4.w;
  mediump vec3 normal_22;
  normal_22 = tmpvar_18;
  mediump vec3 tangent_23;
  tangent_23 = tmpvar_21.xyz;
  mediump float tangentSign_24;
  tangentSign_24 = tmpvar_21.w;
  mediump float sign_25;
  highp float tmpvar_26;
  tmpvar_26 = (tangentSign_24 * unity_WorldTransformParams.w);
  sign_25 = tmpvar_26;
  mediump vec3 tmpvar_27;
  tmpvar_27 = (((normal_22.yzx * tangent_23.zxy) - (normal_22.zxy * tangent_23.yzx)) * sign_25);
  mediump mat3 tmpvar_28;
  tmpvar_28[0].x = tangent_23.x;
  tmpvar_28[0].y = tmpvar_27.x;
  tmpvar_28[0].z = normal_22.x;
  tmpvar_28[1].x = tangent_23.y;
  tmpvar_28[1].y = tmpvar_27.y;
  tmpvar_28[1].z = normal_22.y;
  tmpvar_28[2].x = tangent_23.z;
  tmpvar_28[2].y = tmpvar_27.z;
  tmpvar_28[2].z = normal_22.z;
  tangentToWorld_5 = tmpvar_28;
  highp vec3 v_29;
  v_29.x = tangentToWorld_5[0].x;
  v_29.y = tangentToWorld_5[1].x;
  v_29.z = tangentToWorld_5[2].x;
  tmpvar_7.xyz = v_29;
  highp vec3 v_30;
  v_30.x = tangentToWorld_5[0].y;
  v_30.y = tangentToWorld_5[1].y;
  v_30.z = tangentToWorld_5[2].y;
  tmpvar_8.xyz = v_30;
  highp vec3 v_31;
  v_31.x = tangentToWorld_5[0].z;
  v_31.y = tangentToWorld_5[1].z;
  v_31.z = tangentToWorld_5[2].z;
  tmpvar_9.xyz = v_31;
  highp vec3 tmpvar_32;
  tmpvar_32 = (_WorldSpaceLightPos0.xyz - (tmpvar_10.xyz * _WorldSpaceLightPos0.w));
  tmpvar_7.w = tmpvar_32.x;
  tmpvar_8.w = tmpvar_32.y;
  tmpvar_9.w = tmpvar_32.z;
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = texcoord_11;
  xlv_TEXCOORD1 = normalize(n_13);
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD2_1 = tmpvar_8;
  xlv_TEXCOORD2_2 = tmpvar_9;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xy;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 unity_ColorSpaceDielectricSpec;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform sampler2D _LightTexture0;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_2;
  tmpvar_2 = (_Color.xyz * tmpvar_1.xyz);
  mediump vec3 tmpvar_3;
  tmpvar_3 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_4;
  tmpvar_4.x = xlv_TEXCOORD2.w;
  tmpvar_4.y = xlv_TEXCOORD2_1.w;
  tmpvar_4.z = xlv_TEXCOORD2_2.w;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_LightTexture0, xlv_TEXCOORD5);
  mediump float atten_6;
  atten_6 = tmpvar_5.w;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _LightColor0.xyz;
  tmpvar_7 = (tmpvar_7 * atten_6);
  mediump vec3 viewDir_8;
  viewDir_8 = -(xlv_TEXCOORD1);
  mediump vec2 tmpvar_9;
  tmpvar_9.x = dot ((viewDir_8 - (2.0 * 
    (dot (tmpvar_3, viewDir_8) * tmpvar_3)
  )), tmpvar_4);
  tmpvar_9.y = (1.0 - clamp (dot (tmpvar_3, viewDir_8), 0.0, 1.0));
  mediump vec2 tmpvar_10;
  tmpvar_10.x = ((tmpvar_9 * tmpvar_9) * (tmpvar_9 * tmpvar_9)).x;
  tmpvar_10.y = (1.0 - _Glossiness);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (unity_NHxRoughness, tmpvar_10);
  mediump vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = (((tmpvar_2 * 
    (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w))
  ) + (
    (tmpvar_11.w * 16.0)
   * 
    mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, vec3(_Metallic))
  )) * (tmpvar_7 * clamp (
    dot (tmpvar_3, tmpvar_4)
  , 0.0, 1.0)));
  mediump vec4 xlat_varoutput_13;
  xlat_varoutput_13.xyz = tmpvar_12.xyz;
  xlat_varoutput_13.w = 1.0;
  gl_FragData[0] = xlat_varoutput_13;
}


#endif
"
}
SubProgram "gles " {
// Stats: 40 math, 5 textures, 1 branches
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NONATIVE" }
"!!GLES
#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_WorldTransformParams;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
uniform mediump mat4 _LightMatrix0;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
varying mediump vec4 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  tmpvar_4 = _glesTANGENT;
  highp vec3 lightDir_5;
  highp mat3 tangentToWorld_6;
  highp vec4 tmpvar_7;
  mediump vec4 tmpvar_8;
  mediump vec4 tmpvar_9;
  mediump vec4 tmpvar_10;
  mediump vec4 tmpvar_11;
  mediump vec4 tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13 = (_Object2World * _glesVertex);
  tmpvar_7 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 texcoord_14;
  texcoord_14.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_15;
  if ((_UVSec == 0.0)) {
    tmpvar_15 = tmpvar_2;
  } else {
    tmpvar_15 = tmpvar_3;
  };
  texcoord_14.zw = ((tmpvar_15 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 n_16;
  n_16 = (tmpvar_13.xyz - _WorldSpaceCameraPos);
  highp vec3 norm_17;
  norm_17 = tmpvar_1;
  highp vec4 v_18;
  v_18.x = _World2Object[0].x;
  v_18.y = _World2Object[1].x;
  v_18.z = _World2Object[2].x;
  v_18.w = _World2Object[3].x;
  highp vec4 v_19;
  v_19.x = _World2Object[0].y;
  v_19.y = _World2Object[1].y;
  v_19.z = _World2Object[2].y;
  v_19.w = _World2Object[3].y;
  highp vec4 v_20;
  v_20.x = _World2Object[0].z;
  v_20.y = _World2Object[1].z;
  v_20.z = _World2Object[2].z;
  v_20.w = _World2Object[3].z;
  highp vec3 tmpvar_21;
  tmpvar_21 = normalize(((
    (v_18.xyz * norm_17.x)
   + 
    (v_19.xyz * norm_17.y)
  ) + (v_20.xyz * norm_17.z)));
  highp vec3 dir_22;
  dir_22 = tmpvar_4.xyz;
  highp mat3 tmpvar_23;
  tmpvar_23[0] = _Object2World[0].xyz;
  tmpvar_23[1] = _Object2World[1].xyz;
  tmpvar_23[2] = _Object2World[2].xyz;
  highp vec4 tmpvar_24;
  tmpvar_24.xyz = normalize((tmpvar_23 * dir_22));
  tmpvar_24.w = tmpvar_4.w;
  mediump vec3 normal_25;
  normal_25 = tmpvar_21;
  mediump vec3 tangent_26;
  tangent_26 = tmpvar_24.xyz;
  mediump float tangentSign_27;
  tangentSign_27 = tmpvar_24.w;
  mediump float sign_28;
  highp float tmpvar_29;
  tmpvar_29 = (tangentSign_27 * unity_WorldTransformParams.w);
  sign_28 = tmpvar_29;
  mediump vec3 tmpvar_30;
  tmpvar_30 = (((normal_25.yzx * tangent_26.zxy) - (normal_25.zxy * tangent_26.yzx)) * sign_28);
  mediump mat3 tmpvar_31;
  tmpvar_31[0].x = tangent_26.x;
  tmpvar_31[0].y = tmpvar_30.x;
  tmpvar_31[0].z = normal_25.x;
  tmpvar_31[1].x = tangent_26.y;
  tmpvar_31[1].y = tmpvar_30.y;
  tmpvar_31[1].z = normal_25.y;
  tmpvar_31[2].x = tangent_26.z;
  tmpvar_31[2].y = tmpvar_30.z;
  tmpvar_31[2].z = normal_25.z;
  tangentToWorld_6 = tmpvar_31;
  highp vec3 v_32;
  v_32.x = tangentToWorld_6[0].x;
  v_32.y = tangentToWorld_6[1].x;
  v_32.z = tangentToWorld_6[2].x;
  tmpvar_8.xyz = v_32;
  highp vec3 v_33;
  v_33.x = tangentToWorld_6[0].y;
  v_33.y = tangentToWorld_6[1].y;
  v_33.z = tangentToWorld_6[2].y;
  tmpvar_9.xyz = v_33;
  highp vec3 v_34;
  v_34.x = tangentToWorld_6[0].z;
  v_34.y = tangentToWorld_6[1].z;
  v_34.z = tangentToWorld_6[2].z;
  tmpvar_10.xyz = v_34;
  highp vec4 tmpvar_35;
  tmpvar_35 = (_Object2World * _glesVertex);
  tmpvar_11 = (_LightMatrix0 * tmpvar_35);
  tmpvar_12 = (unity_World2Shadow[0] * tmpvar_35);
  highp vec3 tmpvar_36;
  tmpvar_36 = (_WorldSpaceLightPos0.xyz - (tmpvar_13.xyz * _WorldSpaceLightPos0.w));
  mediump vec3 n_37;
  n_37 = tmpvar_36;
  mediump vec3 tmpvar_38;
  tmpvar_38 = normalize(n_37);
  lightDir_5 = tmpvar_38;
  tmpvar_8.w = lightDir_5.x;
  tmpvar_9.w = lightDir_5.y;
  tmpvar_10.w = lightDir_5.z;
  gl_Position = tmpvar_7;
  xlv_TEXCOORD0 = texcoord_14;
  xlv_TEXCOORD1 = normalize(n_16);
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD2_1 = tmpvar_9;
  xlv_TEXCOORD2_2 = tmpvar_10;
  xlv_TEXCOORD5 = tmpvar_11;
  xlv_TEXCOORD6 = tmpvar_12;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform mediump vec4 unity_ColorSpaceDielectricSpec;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _LightTexture0;
uniform sampler2D _LightTextureB0;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
varying mediump vec4 xlv_TEXCOORD6;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_2;
  tmpvar_2 = (_Color.xyz * tmpvar_1.xyz);
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  tmpvar_4 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, vec3(_Metallic));
  tmpvar_3 = (tmpvar_2 * (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w)));
  mediump vec3 tmpvar_5;
  tmpvar_5 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_6;
  tmpvar_6.x = xlv_TEXCOORD2.w;
  tmpvar_6.y = xlv_TEXCOORD2_1.w;
  tmpvar_6.z = xlv_TEXCOORD2_2.w;
  lowp vec4 tmpvar_7;
  mediump vec2 P_8;
  P_8 = ((xlv_TEXCOORD5.xy / xlv_TEXCOORD5.w) + 0.5);
  tmpvar_7 = texture2D (_LightTexture0, P_8);
  highp vec3 LightCoord_9;
  LightCoord_9 = xlv_TEXCOORD5.xyz;
  highp float tmpvar_10;
  tmpvar_10 = dot (LightCoord_9, LightCoord_9);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_LightTextureB0, vec2(tmpvar_10));
  lowp float tmpvar_12;
  highp vec4 shadowCoord_13;
  shadowCoord_13 = xlv_TEXCOORD6;
  highp vec4 tmpvar_14;
  tmpvar_14 = texture2DProj (_ShadowMapTexture, shadowCoord_13);
  mediump float tmpvar_15;
  if ((tmpvar_14.x < (shadowCoord_13.z / shadowCoord_13.w))) {
    tmpvar_15 = _LightShadowData.x;
  } else {
    tmpvar_15 = 1.0;
  };
  tmpvar_12 = tmpvar_15;
  mediump vec3 tmpvar_16;
  tmpvar_16 = _LightColor0.xyz;
  tmpvar_16 = (tmpvar_16 * ((
    (float((xlv_TEXCOORD5.z > 0.0)) * tmpvar_7.w)
   * tmpvar_11.w) * tmpvar_12));
  mediump vec3 viewDir_17;
  viewDir_17 = -(xlv_TEXCOORD1);
  mediump vec2 tmpvar_18;
  tmpvar_18.x = dot ((viewDir_17 - (2.0 * 
    (dot (tmpvar_5, viewDir_17) * tmpvar_5)
  )), tmpvar_6);
  tmpvar_18.y = (1.0 - clamp (dot (tmpvar_5, viewDir_17), 0.0, 1.0));
  mediump vec2 tmpvar_19;
  tmpvar_19.x = ((tmpvar_18 * tmpvar_18) * (tmpvar_18 * tmpvar_18)).x;
  tmpvar_19.y = (1.0 - _Glossiness);
  lowp vec4 tmpvar_20;
  tmpvar_20 = texture2D (unity_NHxRoughness, tmpvar_19);
  mediump vec4 tmpvar_21;
  tmpvar_21.w = 1.0;
  tmpvar_21.xyz = ((tmpvar_3 + (
    (tmpvar_20.w * 16.0)
   * tmpvar_4)) * (tmpvar_16 * clamp (
    dot (tmpvar_5, tmpvar_6)
  , 0.0, 1.0)));
  mediump vec4 xlat_varoutput_22;
  xlat_varoutput_22.xyz = tmpvar_21.xyz;
  xlat_varoutput_22.w = 1.0;
  gl_FragData[0] = xlat_varoutput_22;
}


#endif
"
}
SubProgram "gles " {
// Stats: 40 math, 5 textures
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
"!!GLES
#version 100

#ifdef VERTEX
#extension GL_EXT_shadow_samplers : enable
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_WorldTransformParams;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
uniform mediump mat4 _LightMatrix0;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
varying mediump vec4 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  tmpvar_4 = _glesTANGENT;
  highp vec3 lightDir_5;
  highp mat3 tangentToWorld_6;
  highp vec4 tmpvar_7;
  mediump vec4 tmpvar_8;
  mediump vec4 tmpvar_9;
  mediump vec4 tmpvar_10;
  mediump vec4 tmpvar_11;
  mediump vec4 tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13 = (_Object2World * _glesVertex);
  tmpvar_7 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 texcoord_14;
  texcoord_14.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_15;
  if ((_UVSec == 0.0)) {
    tmpvar_15 = tmpvar_2;
  } else {
    tmpvar_15 = tmpvar_3;
  };
  texcoord_14.zw = ((tmpvar_15 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 n_16;
  n_16 = (tmpvar_13.xyz - _WorldSpaceCameraPos);
  highp vec3 norm_17;
  norm_17 = tmpvar_1;
  highp vec4 v_18;
  v_18.x = _World2Object[0].x;
  v_18.y = _World2Object[1].x;
  v_18.z = _World2Object[2].x;
  v_18.w = _World2Object[3].x;
  highp vec4 v_19;
  v_19.x = _World2Object[0].y;
  v_19.y = _World2Object[1].y;
  v_19.z = _World2Object[2].y;
  v_19.w = _World2Object[3].y;
  highp vec4 v_20;
  v_20.x = _World2Object[0].z;
  v_20.y = _World2Object[1].z;
  v_20.z = _World2Object[2].z;
  v_20.w = _World2Object[3].z;
  highp vec3 tmpvar_21;
  tmpvar_21 = normalize(((
    (v_18.xyz * norm_17.x)
   + 
    (v_19.xyz * norm_17.y)
  ) + (v_20.xyz * norm_17.z)));
  highp vec3 dir_22;
  dir_22 = tmpvar_4.xyz;
  highp mat3 tmpvar_23;
  tmpvar_23[0] = _Object2World[0].xyz;
  tmpvar_23[1] = _Object2World[1].xyz;
  tmpvar_23[2] = _Object2World[2].xyz;
  highp vec4 tmpvar_24;
  tmpvar_24.xyz = normalize((tmpvar_23 * dir_22));
  tmpvar_24.w = tmpvar_4.w;
  mediump vec3 normal_25;
  normal_25 = tmpvar_21;
  mediump vec3 tangent_26;
  tangent_26 = tmpvar_24.xyz;
  mediump float tangentSign_27;
  tangentSign_27 = tmpvar_24.w;
  mediump float sign_28;
  highp float tmpvar_29;
  tmpvar_29 = (tangentSign_27 * unity_WorldTransformParams.w);
  sign_28 = tmpvar_29;
  mediump vec3 tmpvar_30;
  tmpvar_30 = (((normal_25.yzx * tangent_26.zxy) - (normal_25.zxy * tangent_26.yzx)) * sign_28);
  mediump mat3 tmpvar_31;
  tmpvar_31[0].x = tangent_26.x;
  tmpvar_31[0].y = tmpvar_30.x;
  tmpvar_31[0].z = normal_25.x;
  tmpvar_31[1].x = tangent_26.y;
  tmpvar_31[1].y = tmpvar_30.y;
  tmpvar_31[1].z = normal_25.y;
  tmpvar_31[2].x = tangent_26.z;
  tmpvar_31[2].y = tmpvar_30.z;
  tmpvar_31[2].z = normal_25.z;
  tangentToWorld_6 = tmpvar_31;
  highp vec3 v_32;
  v_32.x = tangentToWorld_6[0].x;
  v_32.y = tangentToWorld_6[1].x;
  v_32.z = tangentToWorld_6[2].x;
  tmpvar_8.xyz = v_32;
  highp vec3 v_33;
  v_33.x = tangentToWorld_6[0].y;
  v_33.y = tangentToWorld_6[1].y;
  v_33.z = tangentToWorld_6[2].y;
  tmpvar_9.xyz = v_33;
  highp vec3 v_34;
  v_34.x = tangentToWorld_6[0].z;
  v_34.y = tangentToWorld_6[1].z;
  v_34.z = tangentToWorld_6[2].z;
  tmpvar_10.xyz = v_34;
  highp vec4 tmpvar_35;
  tmpvar_35 = (_Object2World * _glesVertex);
  tmpvar_11 = (_LightMatrix0 * tmpvar_35);
  tmpvar_12 = (unity_World2Shadow[0] * tmpvar_35);
  highp vec3 tmpvar_36;
  tmpvar_36 = (_WorldSpaceLightPos0.xyz - (tmpvar_13.xyz * _WorldSpaceLightPos0.w));
  mediump vec3 n_37;
  n_37 = tmpvar_36;
  mediump vec3 tmpvar_38;
  tmpvar_38 = normalize(n_37);
  lightDir_5 = tmpvar_38;
  tmpvar_8.w = lightDir_5.x;
  tmpvar_9.w = lightDir_5.y;
  tmpvar_10.w = lightDir_5.z;
  gl_Position = tmpvar_7;
  xlv_TEXCOORD0 = texcoord_14;
  xlv_TEXCOORD1 = normalize(n_16);
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD2_1 = tmpvar_9;
  xlv_TEXCOORD2_2 = tmpvar_10;
  xlv_TEXCOORD5 = tmpvar_11;
  xlv_TEXCOORD6 = tmpvar_12;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shadow_samplers : enable
uniform mediump vec4 _LightShadowData;
uniform mediump vec4 unity_ColorSpaceDielectricSpec;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform lowp sampler2DShadow _ShadowMapTexture;
uniform sampler2D _LightTexture0;
uniform sampler2D _LightTextureB0;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
varying mediump vec4 xlv_TEXCOORD6;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_2;
  tmpvar_2 = (_Color.xyz * tmpvar_1.xyz);
  mediump vec3 tmpvar_3;
  tmpvar_3 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_4;
  tmpvar_4.x = xlv_TEXCOORD2.w;
  tmpvar_4.y = xlv_TEXCOORD2_1.w;
  tmpvar_4.z = xlv_TEXCOORD2_2.w;
  lowp vec4 tmpvar_5;
  mediump vec2 P_6;
  P_6 = ((xlv_TEXCOORD5.xy / xlv_TEXCOORD5.w) + 0.5);
  tmpvar_5 = texture2D (_LightTexture0, P_6);
  mediump float tmpvar_7;
  tmpvar_7 = dot (xlv_TEXCOORD5.xyz, xlv_TEXCOORD5.xyz);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_LightTextureB0, vec2(tmpvar_7));
  lowp float tmpvar_9;
  highp vec4 shadowCoord_10;
  shadowCoord_10 = xlv_TEXCOORD6;
  mediump float shadow_11;
  lowp float tmpvar_12;
  tmpvar_12 = shadow2DProjEXT (_ShadowMapTexture, shadowCoord_10);
  mediump float tmpvar_13;
  tmpvar_13 = tmpvar_12;
  shadow_11 = (_LightShadowData.x + (tmpvar_13 * (1.0 - _LightShadowData.x)));
  tmpvar_9 = shadow_11;
  mediump vec3 tmpvar_14;
  tmpvar_14 = _LightColor0.xyz;
  tmpvar_14 = (tmpvar_14 * ((
    (float((xlv_TEXCOORD5.z > 0.0)) * tmpvar_5.w)
   * tmpvar_8.w) * tmpvar_9));
  mediump vec3 viewDir_15;
  viewDir_15 = -(xlv_TEXCOORD1);
  mediump vec2 tmpvar_16;
  tmpvar_16.x = dot ((viewDir_15 - (2.0 * 
    (dot (tmpvar_3, viewDir_15) * tmpvar_3)
  )), tmpvar_4);
  tmpvar_16.y = (1.0 - clamp (dot (tmpvar_3, viewDir_15), 0.0, 1.0));
  mediump vec2 tmpvar_17;
  tmpvar_17.x = ((tmpvar_16 * tmpvar_16) * (tmpvar_16 * tmpvar_16)).x;
  tmpvar_17.y = (1.0 - _Glossiness);
  lowp vec4 tmpvar_18;
  tmpvar_18 = texture2D (unity_NHxRoughness, tmpvar_17);
  mediump vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = (((tmpvar_2 * 
    (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w))
  ) + (
    (tmpvar_18.w * 16.0)
   * 
    mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, vec3(_Metallic))
  )) * (tmpvar_14 * clamp (
    dot (tmpvar_3, tmpvar_4)
  , 0.0, 1.0)));
  mediump vec4 xlat_varoutput_20;
  xlat_varoutput_20.xyz = tmpvar_19.xyz;
  xlat_varoutput_20.w = 1.0;
  gl_FragData[0] = xlat_varoutput_20;
}


#endif
"
}
SubProgram "gles " {
// Stats: 33 math, 3 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"!!GLES
#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_WorldTransformParams;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  tmpvar_4 = _glesTANGENT;
  highp mat3 tangentToWorld_5;
  highp vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  mediump vec4 tmpvar_8;
  mediump vec4 tmpvar_9;
  mediump vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11 = (_Object2World * _glesVertex);
  tmpvar_6 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 n_14;
  n_14 = (tmpvar_11.xyz - _WorldSpaceCameraPos);
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp vec4 v_16;
  v_16.x = _World2Object[0].x;
  v_16.y = _World2Object[1].x;
  v_16.z = _World2Object[2].x;
  v_16.w = _World2Object[3].x;
  highp vec4 v_17;
  v_17.x = _World2Object[0].y;
  v_17.y = _World2Object[1].y;
  v_17.z = _World2Object[2].y;
  v_17.w = _World2Object[3].y;
  highp vec4 v_18;
  v_18.x = _World2Object[0].z;
  v_18.y = _World2Object[1].z;
  v_18.z = _World2Object[2].z;
  v_18.w = _World2Object[3].z;
  highp vec3 tmpvar_19;
  tmpvar_19 = normalize(((
    (v_16.xyz * norm_15.x)
   + 
    (v_17.xyz * norm_15.y)
  ) + (v_18.xyz * norm_15.z)));
  highp vec3 dir_20;
  dir_20 = tmpvar_4.xyz;
  highp mat3 tmpvar_21;
  tmpvar_21[0] = _Object2World[0].xyz;
  tmpvar_21[1] = _Object2World[1].xyz;
  tmpvar_21[2] = _Object2World[2].xyz;
  highp vec4 tmpvar_22;
  tmpvar_22.xyz = normalize((tmpvar_21 * dir_20));
  tmpvar_22.w = tmpvar_4.w;
  mediump vec3 normal_23;
  normal_23 = tmpvar_19;
  mediump vec3 tangent_24;
  tangent_24 = tmpvar_22.xyz;
  mediump float tangentSign_25;
  tangentSign_25 = tmpvar_22.w;
  mediump float sign_26;
  highp float tmpvar_27;
  tmpvar_27 = (tangentSign_25 * unity_WorldTransformParams.w);
  sign_26 = tmpvar_27;
  mediump vec3 tmpvar_28;
  tmpvar_28 = (((normal_23.yzx * tangent_24.zxy) - (normal_23.zxy * tangent_24.yzx)) * sign_26);
  mediump mat3 tmpvar_29;
  tmpvar_29[0].x = tangent_24.x;
  tmpvar_29[0].y = tmpvar_28.x;
  tmpvar_29[0].z = normal_23.x;
  tmpvar_29[1].x = tangent_24.y;
  tmpvar_29[1].y = tmpvar_28.y;
  tmpvar_29[1].z = normal_23.y;
  tmpvar_29[2].x = tangent_24.z;
  tmpvar_29[2].y = tmpvar_28.z;
  tmpvar_29[2].z = normal_23.z;
  tangentToWorld_5 = tmpvar_29;
  highp vec3 v_30;
  v_30.x = tangentToWorld_5[0].x;
  v_30.y = tangentToWorld_5[1].x;
  v_30.z = tangentToWorld_5[2].x;
  tmpvar_7.xyz = v_30;
  highp vec3 v_31;
  v_31.x = tangentToWorld_5[0].y;
  v_31.y = tangentToWorld_5[1].y;
  v_31.z = tangentToWorld_5[2].y;
  tmpvar_8.xyz = v_31;
  highp vec3 v_32;
  v_32.x = tangentToWorld_5[0].z;
  v_32.y = tangentToWorld_5[1].z;
  v_32.z = tangentToWorld_5[2].z;
  tmpvar_9.xyz = v_32;
  tmpvar_10 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
  highp vec3 tmpvar_33;
  tmpvar_33 = (_WorldSpaceLightPos0.xyz - (tmpvar_11.xyz * _WorldSpaceLightPos0.w));
  tmpvar_7.w = tmpvar_33.x;
  tmpvar_8.w = tmpvar_33.y;
  tmpvar_9.w = tmpvar_33.z;
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = normalize(n_14);
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD2_1 = tmpvar_8;
  xlv_TEXCOORD2_2 = tmpvar_9;
  xlv_TEXCOORD5 = tmpvar_10;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform mediump vec4 unity_ColorSpaceDielectricSpec;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_2;
  tmpvar_2 = (_Color.xyz * tmpvar_1.xyz);
  mediump vec3 tmpvar_3;
  tmpvar_3 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_4;
  tmpvar_4.x = xlv_TEXCOORD2.w;
  tmpvar_4.y = xlv_TEXCOORD2_1.w;
  tmpvar_4.z = xlv_TEXCOORD2_2.w;
  lowp float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = max (float((texture2DProj (_ShadowMapTexture, xlv_TEXCOORD5).x > 
    (xlv_TEXCOORD5.z / xlv_TEXCOORD5.w)
  )), _LightShadowData.x);
  tmpvar_5 = tmpvar_6;
  mediump float atten_7;
  atten_7 = tmpvar_5;
  mediump vec3 tmpvar_8;
  tmpvar_8 = _LightColor0.xyz;
  tmpvar_8 = (tmpvar_8 * atten_7);
  mediump vec3 viewDir_9;
  viewDir_9 = -(xlv_TEXCOORD1);
  mediump vec2 tmpvar_10;
  tmpvar_10.x = dot ((viewDir_9 - (2.0 * 
    (dot (tmpvar_3, viewDir_9) * tmpvar_3)
  )), tmpvar_4);
  tmpvar_10.y = (1.0 - clamp (dot (tmpvar_3, viewDir_9), 0.0, 1.0));
  mediump vec2 tmpvar_11;
  tmpvar_11.x = ((tmpvar_10 * tmpvar_10) * (tmpvar_10 * tmpvar_10)).x;
  tmpvar_11.y = (1.0 - _Glossiness);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (unity_NHxRoughness, tmpvar_11);
  mediump vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = (((tmpvar_2 * 
    (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w))
  ) + (
    (tmpvar_12.w * 16.0)
   * 
    mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, vec3(_Metallic))
  )) * (tmpvar_8 * clamp (
    dot (tmpvar_3, tmpvar_4)
  , 0.0, 1.0)));
  mediump vec4 xlat_varoutput_14;
  xlat_varoutput_14.xyz = tmpvar_13.xyz;
  xlat_varoutput_14.w = 1.0;
  gl_FragData[0] = xlat_varoutput_14;
}


#endif
"
}
SubProgram "gles " {
// Stats: 34 math, 4 textures
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
"!!GLES
#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_WorldTransformParams;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
uniform mediump mat4 _LightMatrix0;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec2 xlv_TEXCOORD5;
varying mediump vec4 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  tmpvar_4 = _glesTANGENT;
  highp mat3 tangentToWorld_5;
  highp vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  mediump vec4 tmpvar_8;
  mediump vec4 tmpvar_9;
  mediump vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11 = (_Object2World * _glesVertex);
  tmpvar_6 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 n_14;
  n_14 = (tmpvar_11.xyz - _WorldSpaceCameraPos);
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp vec4 v_16;
  v_16.x = _World2Object[0].x;
  v_16.y = _World2Object[1].x;
  v_16.z = _World2Object[2].x;
  v_16.w = _World2Object[3].x;
  highp vec4 v_17;
  v_17.x = _World2Object[0].y;
  v_17.y = _World2Object[1].y;
  v_17.z = _World2Object[2].y;
  v_17.w = _World2Object[3].y;
  highp vec4 v_18;
  v_18.x = _World2Object[0].z;
  v_18.y = _World2Object[1].z;
  v_18.z = _World2Object[2].z;
  v_18.w = _World2Object[3].z;
  highp vec3 tmpvar_19;
  tmpvar_19 = normalize(((
    (v_16.xyz * norm_15.x)
   + 
    (v_17.xyz * norm_15.y)
  ) + (v_18.xyz * norm_15.z)));
  highp vec3 dir_20;
  dir_20 = tmpvar_4.xyz;
  highp mat3 tmpvar_21;
  tmpvar_21[0] = _Object2World[0].xyz;
  tmpvar_21[1] = _Object2World[1].xyz;
  tmpvar_21[2] = _Object2World[2].xyz;
  highp vec4 tmpvar_22;
  tmpvar_22.xyz = normalize((tmpvar_21 * dir_20));
  tmpvar_22.w = tmpvar_4.w;
  mediump vec3 normal_23;
  normal_23 = tmpvar_19;
  mediump vec3 tangent_24;
  tangent_24 = tmpvar_22.xyz;
  mediump float tangentSign_25;
  tangentSign_25 = tmpvar_22.w;
  mediump float sign_26;
  highp float tmpvar_27;
  tmpvar_27 = (tangentSign_25 * unity_WorldTransformParams.w);
  sign_26 = tmpvar_27;
  mediump vec3 tmpvar_28;
  tmpvar_28 = (((normal_23.yzx * tangent_24.zxy) - (normal_23.zxy * tangent_24.yzx)) * sign_26);
  mediump mat3 tmpvar_29;
  tmpvar_29[0].x = tangent_24.x;
  tmpvar_29[0].y = tmpvar_28.x;
  tmpvar_29[0].z = normal_23.x;
  tmpvar_29[1].x = tangent_24.y;
  tmpvar_29[1].y = tmpvar_28.y;
  tmpvar_29[1].z = normal_23.y;
  tmpvar_29[2].x = tangent_24.z;
  tmpvar_29[2].y = tmpvar_28.z;
  tmpvar_29[2].z = normal_23.z;
  tangentToWorld_5 = tmpvar_29;
  highp vec3 v_30;
  v_30.x = tangentToWorld_5[0].x;
  v_30.y = tangentToWorld_5[1].x;
  v_30.z = tangentToWorld_5[2].x;
  tmpvar_7.xyz = v_30;
  highp vec3 v_31;
  v_31.x = tangentToWorld_5[0].y;
  v_31.y = tangentToWorld_5[1].y;
  v_31.z = tangentToWorld_5[2].y;
  tmpvar_8.xyz = v_31;
  highp vec3 v_32;
  v_32.x = tangentToWorld_5[0].z;
  v_32.y = tangentToWorld_5[1].z;
  v_32.z = tangentToWorld_5[2].z;
  tmpvar_9.xyz = v_32;
  highp vec4 tmpvar_33;
  tmpvar_33 = (_Object2World * _glesVertex);
  tmpvar_10 = (unity_World2Shadow[0] * tmpvar_33);
  highp vec3 tmpvar_34;
  tmpvar_34 = (_WorldSpaceLightPos0.xyz - (tmpvar_11.xyz * _WorldSpaceLightPos0.w));
  tmpvar_7.w = tmpvar_34.x;
  tmpvar_8.w = tmpvar_34.y;
  tmpvar_9.w = tmpvar_34.z;
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = normalize(n_14);
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD2_1 = tmpvar_8;
  xlv_TEXCOORD2_2 = tmpvar_9;
  xlv_TEXCOORD5 = (_LightMatrix0 * tmpvar_33).xy;
  xlv_TEXCOORD6 = tmpvar_10;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform mediump vec4 unity_ColorSpaceDielectricSpec;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _LightTexture0;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec2 xlv_TEXCOORD5;
varying mediump vec4 xlv_TEXCOORD6;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_2;
  tmpvar_2 = (_Color.xyz * tmpvar_1.xyz);
  mediump vec3 tmpvar_3;
  tmpvar_3 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_4;
  tmpvar_4.x = xlv_TEXCOORD2.w;
  tmpvar_4.y = xlv_TEXCOORD2_1.w;
  tmpvar_4.z = xlv_TEXCOORD2_2.w;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_LightTexture0, xlv_TEXCOORD5);
  lowp float tmpvar_6;
  highp float tmpvar_7;
  tmpvar_7 = max (float((texture2DProj (_ShadowMapTexture, xlv_TEXCOORD6).x > 
    (xlv_TEXCOORD6.z / xlv_TEXCOORD6.w)
  )), _LightShadowData.x);
  tmpvar_6 = tmpvar_7;
  mediump float atten_8;
  atten_8 = (tmpvar_5.w * tmpvar_6);
  mediump vec3 tmpvar_9;
  tmpvar_9 = _LightColor0.xyz;
  tmpvar_9 = (tmpvar_9 * atten_8);
  mediump vec3 viewDir_10;
  viewDir_10 = -(xlv_TEXCOORD1);
  mediump vec2 tmpvar_11;
  tmpvar_11.x = dot ((viewDir_10 - (2.0 * 
    (dot (tmpvar_3, viewDir_10) * tmpvar_3)
  )), tmpvar_4);
  tmpvar_11.y = (1.0 - clamp (dot (tmpvar_3, viewDir_10), 0.0, 1.0));
  mediump vec2 tmpvar_12;
  tmpvar_12.x = ((tmpvar_11 * tmpvar_11) * (tmpvar_11 * tmpvar_11)).x;
  tmpvar_12.y = (1.0 - _Glossiness);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (unity_NHxRoughness, tmpvar_12);
  mediump vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = (((tmpvar_2 * 
    (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w))
  ) + (
    (tmpvar_13.w * 16.0)
   * 
    mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, vec3(_Metallic))
  )) * (tmpvar_9 * clamp (
    dot (tmpvar_3, tmpvar_4)
  , 0.0, 1.0)));
  mediump vec4 xlat_varoutput_15;
  xlat_varoutput_15.xyz = tmpvar_14.xyz;
  xlat_varoutput_15.w = 1.0;
  gl_FragData[0] = xlat_varoutput_15;
}


#endif
"
}
SubProgram "gles " {
// Stats: 38 math, 4 textures, 1 branches
Keywords { "POINT" "SHADOWS_CUBE" }
"!!GLES
#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec4 _LightPositionRange;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_WorldTransformParams;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
uniform mediump mat4 _LightMatrix0;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  tmpvar_4 = _glesTANGENT;
  highp vec3 lightDir_5;
  highp mat3 tangentToWorld_6;
  highp vec4 tmpvar_7;
  mediump vec4 tmpvar_8;
  mediump vec4 tmpvar_9;
  mediump vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11 = (_Object2World * _glesVertex);
  tmpvar_7 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 n_14;
  n_14 = (tmpvar_11.xyz - _WorldSpaceCameraPos);
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp vec4 v_16;
  v_16.x = _World2Object[0].x;
  v_16.y = _World2Object[1].x;
  v_16.z = _World2Object[2].x;
  v_16.w = _World2Object[3].x;
  highp vec4 v_17;
  v_17.x = _World2Object[0].y;
  v_17.y = _World2Object[1].y;
  v_17.z = _World2Object[2].y;
  v_17.w = _World2Object[3].y;
  highp vec4 v_18;
  v_18.x = _World2Object[0].z;
  v_18.y = _World2Object[1].z;
  v_18.z = _World2Object[2].z;
  v_18.w = _World2Object[3].z;
  highp vec3 tmpvar_19;
  tmpvar_19 = normalize(((
    (v_16.xyz * norm_15.x)
   + 
    (v_17.xyz * norm_15.y)
  ) + (v_18.xyz * norm_15.z)));
  highp vec3 dir_20;
  dir_20 = tmpvar_4.xyz;
  highp mat3 tmpvar_21;
  tmpvar_21[0] = _Object2World[0].xyz;
  tmpvar_21[1] = _Object2World[1].xyz;
  tmpvar_21[2] = _Object2World[2].xyz;
  highp vec4 tmpvar_22;
  tmpvar_22.xyz = normalize((tmpvar_21 * dir_20));
  tmpvar_22.w = tmpvar_4.w;
  mediump vec3 normal_23;
  normal_23 = tmpvar_19;
  mediump vec3 tangent_24;
  tangent_24 = tmpvar_22.xyz;
  mediump float tangentSign_25;
  tangentSign_25 = tmpvar_22.w;
  mediump float sign_26;
  highp float tmpvar_27;
  tmpvar_27 = (tangentSign_25 * unity_WorldTransformParams.w);
  sign_26 = tmpvar_27;
  mediump vec3 tmpvar_28;
  tmpvar_28 = (((normal_23.yzx * tangent_24.zxy) - (normal_23.zxy * tangent_24.yzx)) * sign_26);
  mediump mat3 tmpvar_29;
  tmpvar_29[0].x = tangent_24.x;
  tmpvar_29[0].y = tmpvar_28.x;
  tmpvar_29[0].z = normal_23.x;
  tmpvar_29[1].x = tangent_24.y;
  tmpvar_29[1].y = tmpvar_28.y;
  tmpvar_29[1].z = normal_23.y;
  tmpvar_29[2].x = tangent_24.z;
  tmpvar_29[2].y = tmpvar_28.z;
  tmpvar_29[2].z = normal_23.z;
  tangentToWorld_6 = tmpvar_29;
  highp vec3 v_30;
  v_30.x = tangentToWorld_6[0].x;
  v_30.y = tangentToWorld_6[1].x;
  v_30.z = tangentToWorld_6[2].x;
  tmpvar_8.xyz = v_30;
  highp vec3 v_31;
  v_31.x = tangentToWorld_6[0].y;
  v_31.y = tangentToWorld_6[1].y;
  v_31.z = tangentToWorld_6[2].y;
  tmpvar_9.xyz = v_31;
  highp vec3 v_32;
  v_32.x = tangentToWorld_6[0].z;
  v_32.y = tangentToWorld_6[1].z;
  v_32.z = tangentToWorld_6[2].z;
  tmpvar_10.xyz = v_32;
  highp vec3 tmpvar_33;
  tmpvar_33 = (_WorldSpaceLightPos0.xyz - (tmpvar_11.xyz * _WorldSpaceLightPos0.w));
  mediump vec3 n_34;
  n_34 = tmpvar_33;
  mediump vec3 tmpvar_35;
  tmpvar_35 = normalize(n_34);
  lightDir_5 = tmpvar_35;
  tmpvar_8.w = lightDir_5.x;
  tmpvar_9.w = lightDir_5.y;
  tmpvar_10.w = lightDir_5.z;
  gl_Position = tmpvar_7;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = normalize(n_14);
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD2_1 = tmpvar_9;
  xlv_TEXCOORD2_2 = tmpvar_10;
  highp vec4 tmpvar_36;
  tmpvar_36 = (_Object2World * _glesVertex);
  xlv_TEXCOORD5 = (_LightMatrix0 * tmpvar_36).xyz;
  xlv_TEXCOORD6 = (tmpvar_36.xyz - _LightPositionRange.xyz);
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _LightPositionRange;
uniform mediump vec4 _LightShadowData;
uniform mediump vec4 unity_ColorSpaceDielectricSpec;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform highp samplerCube _ShadowMapTexture;
uniform sampler2D _LightTexture0;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_2;
  tmpvar_2 = (_Color.xyz * tmpvar_1.xyz);
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  tmpvar_4 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, vec3(_Metallic));
  tmpvar_3 = (tmpvar_2 * (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w)));
  mediump vec3 tmpvar_5;
  tmpvar_5 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_6;
  tmpvar_6.x = xlv_TEXCOORD2.w;
  tmpvar_6.y = xlv_TEXCOORD2_1.w;
  tmpvar_6.z = xlv_TEXCOORD2_2.w;
  highp float tmpvar_7;
  tmpvar_7 = dot (xlv_TEXCOORD5, xlv_TEXCOORD5);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_LightTexture0, vec2(tmpvar_7));
  highp float mydist_9;
  mydist_9 = ((sqrt(
    dot (xlv_TEXCOORD6, xlv_TEXCOORD6)
  ) * _LightPositionRange.w) * 0.97);
  highp float tmpvar_10;
  tmpvar_10 = dot (textureCube (_ShadowMapTexture, xlv_TEXCOORD6), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  mediump float tmpvar_11;
  if ((tmpvar_10 < mydist_9)) {
    tmpvar_11 = _LightShadowData.x;
  } else {
    tmpvar_11 = 1.0;
  };
  mediump vec3 tmpvar_12;
  tmpvar_12 = _LightColor0.xyz;
  tmpvar_12 = (tmpvar_12 * (tmpvar_8.w * tmpvar_11));
  mediump vec3 viewDir_13;
  viewDir_13 = -(xlv_TEXCOORD1);
  mediump vec2 tmpvar_14;
  tmpvar_14.x = dot ((viewDir_13 - (2.0 * 
    (dot (tmpvar_5, viewDir_13) * tmpvar_5)
  )), tmpvar_6);
  tmpvar_14.y = (1.0 - clamp (dot (tmpvar_5, viewDir_13), 0.0, 1.0));
  mediump vec2 tmpvar_15;
  tmpvar_15.x = ((tmpvar_14 * tmpvar_14) * (tmpvar_14 * tmpvar_14)).x;
  tmpvar_15.y = (1.0 - _Glossiness);
  lowp vec4 tmpvar_16;
  tmpvar_16 = texture2D (unity_NHxRoughness, tmpvar_15);
  mediump vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = ((tmpvar_3 + (
    (tmpvar_16.w * 16.0)
   * tmpvar_4)) * (tmpvar_12 * clamp (
    dot (tmpvar_5, tmpvar_6)
  , 0.0, 1.0)));
  mediump vec4 xlat_varoutput_18;
  xlat_varoutput_18.xyz = tmpvar_17.xyz;
  xlat_varoutput_18.w = 1.0;
  gl_FragData[0] = xlat_varoutput_18;
}


#endif
"
}
SubProgram "gles " {
// Stats: 39 math, 5 textures, 1 branches
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
"!!GLES
#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec4 _LightPositionRange;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_WorldTransformParams;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
uniform mediump mat4 _LightMatrix0;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  tmpvar_4 = _glesTANGENT;
  highp vec3 lightDir_5;
  highp mat3 tangentToWorld_6;
  highp vec4 tmpvar_7;
  mediump vec4 tmpvar_8;
  mediump vec4 tmpvar_9;
  mediump vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11 = (_Object2World * _glesVertex);
  tmpvar_7 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 n_14;
  n_14 = (tmpvar_11.xyz - _WorldSpaceCameraPos);
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp vec4 v_16;
  v_16.x = _World2Object[0].x;
  v_16.y = _World2Object[1].x;
  v_16.z = _World2Object[2].x;
  v_16.w = _World2Object[3].x;
  highp vec4 v_17;
  v_17.x = _World2Object[0].y;
  v_17.y = _World2Object[1].y;
  v_17.z = _World2Object[2].y;
  v_17.w = _World2Object[3].y;
  highp vec4 v_18;
  v_18.x = _World2Object[0].z;
  v_18.y = _World2Object[1].z;
  v_18.z = _World2Object[2].z;
  v_18.w = _World2Object[3].z;
  highp vec3 tmpvar_19;
  tmpvar_19 = normalize(((
    (v_16.xyz * norm_15.x)
   + 
    (v_17.xyz * norm_15.y)
  ) + (v_18.xyz * norm_15.z)));
  highp vec3 dir_20;
  dir_20 = tmpvar_4.xyz;
  highp mat3 tmpvar_21;
  tmpvar_21[0] = _Object2World[0].xyz;
  tmpvar_21[1] = _Object2World[1].xyz;
  tmpvar_21[2] = _Object2World[2].xyz;
  highp vec4 tmpvar_22;
  tmpvar_22.xyz = normalize((tmpvar_21 * dir_20));
  tmpvar_22.w = tmpvar_4.w;
  mediump vec3 normal_23;
  normal_23 = tmpvar_19;
  mediump vec3 tangent_24;
  tangent_24 = tmpvar_22.xyz;
  mediump float tangentSign_25;
  tangentSign_25 = tmpvar_22.w;
  mediump float sign_26;
  highp float tmpvar_27;
  tmpvar_27 = (tangentSign_25 * unity_WorldTransformParams.w);
  sign_26 = tmpvar_27;
  mediump vec3 tmpvar_28;
  tmpvar_28 = (((normal_23.yzx * tangent_24.zxy) - (normal_23.zxy * tangent_24.yzx)) * sign_26);
  mediump mat3 tmpvar_29;
  tmpvar_29[0].x = tangent_24.x;
  tmpvar_29[0].y = tmpvar_28.x;
  tmpvar_29[0].z = normal_23.x;
  tmpvar_29[1].x = tangent_24.y;
  tmpvar_29[1].y = tmpvar_28.y;
  tmpvar_29[1].z = normal_23.y;
  tmpvar_29[2].x = tangent_24.z;
  tmpvar_29[2].y = tmpvar_28.z;
  tmpvar_29[2].z = normal_23.z;
  tangentToWorld_6 = tmpvar_29;
  highp vec3 v_30;
  v_30.x = tangentToWorld_6[0].x;
  v_30.y = tangentToWorld_6[1].x;
  v_30.z = tangentToWorld_6[2].x;
  tmpvar_8.xyz = v_30;
  highp vec3 v_31;
  v_31.x = tangentToWorld_6[0].y;
  v_31.y = tangentToWorld_6[1].y;
  v_31.z = tangentToWorld_6[2].y;
  tmpvar_9.xyz = v_31;
  highp vec3 v_32;
  v_32.x = tangentToWorld_6[0].z;
  v_32.y = tangentToWorld_6[1].z;
  v_32.z = tangentToWorld_6[2].z;
  tmpvar_10.xyz = v_32;
  highp vec3 tmpvar_33;
  tmpvar_33 = (_WorldSpaceLightPos0.xyz - (tmpvar_11.xyz * _WorldSpaceLightPos0.w));
  mediump vec3 n_34;
  n_34 = tmpvar_33;
  mediump vec3 tmpvar_35;
  tmpvar_35 = normalize(n_34);
  lightDir_5 = tmpvar_35;
  tmpvar_8.w = lightDir_5.x;
  tmpvar_9.w = lightDir_5.y;
  tmpvar_10.w = lightDir_5.z;
  gl_Position = tmpvar_7;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = normalize(n_14);
  xlv_TEXCOORD2 = tmpvar_8;
  xlv_TEXCOORD2_1 = tmpvar_9;
  xlv_TEXCOORD2_2 = tmpvar_10;
  highp vec4 tmpvar_36;
  tmpvar_36 = (_Object2World * _glesVertex);
  xlv_TEXCOORD5 = (_LightMatrix0 * tmpvar_36).xyz;
  xlv_TEXCOORD6 = (tmpvar_36.xyz - _LightPositionRange.xyz);
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _LightPositionRange;
uniform mediump vec4 _LightShadowData;
uniform mediump vec4 unity_ColorSpaceDielectricSpec;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform highp samplerCube _ShadowMapTexture;
uniform lowp samplerCube _LightTexture0;
uniform sampler2D _LightTextureB0;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_2;
  tmpvar_2 = (_Color.xyz * tmpvar_1.xyz);
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  tmpvar_4 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, vec3(_Metallic));
  tmpvar_3 = (tmpvar_2 * (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w)));
  mediump vec3 tmpvar_5;
  tmpvar_5 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_6;
  tmpvar_6.x = xlv_TEXCOORD2.w;
  tmpvar_6.y = xlv_TEXCOORD2_1.w;
  tmpvar_6.z = xlv_TEXCOORD2_2.w;
  highp float tmpvar_7;
  tmpvar_7 = dot (xlv_TEXCOORD5, xlv_TEXCOORD5);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_LightTextureB0, vec2(tmpvar_7));
  lowp vec4 tmpvar_9;
  tmpvar_9 = textureCube (_LightTexture0, xlv_TEXCOORD5);
  highp float mydist_10;
  mydist_10 = ((sqrt(
    dot (xlv_TEXCOORD6, xlv_TEXCOORD6)
  ) * _LightPositionRange.w) * 0.97);
  highp float tmpvar_11;
  tmpvar_11 = dot (textureCube (_ShadowMapTexture, xlv_TEXCOORD6), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  mediump float tmpvar_12;
  if ((tmpvar_11 < mydist_10)) {
    tmpvar_12 = _LightShadowData.x;
  } else {
    tmpvar_12 = 1.0;
  };
  mediump vec3 tmpvar_13;
  tmpvar_13 = _LightColor0.xyz;
  tmpvar_13 = (tmpvar_13 * ((tmpvar_8.w * tmpvar_9.w) * tmpvar_12));
  mediump vec3 viewDir_14;
  viewDir_14 = -(xlv_TEXCOORD1);
  mediump vec2 tmpvar_15;
  tmpvar_15.x = dot ((viewDir_14 - (2.0 * 
    (dot (tmpvar_5, viewDir_14) * tmpvar_5)
  )), tmpvar_6);
  tmpvar_15.y = (1.0 - clamp (dot (tmpvar_5, viewDir_14), 0.0, 1.0));
  mediump vec2 tmpvar_16;
  tmpvar_16.x = ((tmpvar_15 * tmpvar_15) * (tmpvar_15 * tmpvar_15)).x;
  tmpvar_16.y = (1.0 - _Glossiness);
  lowp vec4 tmpvar_17;
  tmpvar_17 = texture2D (unity_NHxRoughness, tmpvar_16);
  mediump vec4 tmpvar_18;
  tmpvar_18.w = 1.0;
  tmpvar_18.xyz = ((tmpvar_3 + (
    (tmpvar_17.w * 16.0)
   * tmpvar_4)) * (tmpvar_13 * clamp (
    dot (tmpvar_5, tmpvar_6)
  , 0.0, 1.0)));
  mediump vec4 xlat_varoutput_19;
  xlat_varoutput_19.xyz = tmpvar_18.xyz;
  xlat_varoutput_19.w = 1.0;
  gl_FragData[0] = xlat_varoutput_19;
}


#endif
"
}
SubProgram "gles " {
// Stats: 32 math, 3 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" }
"!!GLES
#version 100

#ifdef VERTEX
#extension GL_EXT_shadow_samplers : enable
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_WorldTransformParams;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  tmpvar_4 = _glesTANGENT;
  highp mat3 tangentToWorld_5;
  highp vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  mediump vec4 tmpvar_8;
  mediump vec4 tmpvar_9;
  mediump vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11 = (_Object2World * _glesVertex);
  tmpvar_6 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 texcoord_12;
  texcoord_12.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_13;
  if ((_UVSec == 0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 n_14;
  n_14 = (tmpvar_11.xyz - _WorldSpaceCameraPos);
  highp vec3 norm_15;
  norm_15 = tmpvar_1;
  highp vec4 v_16;
  v_16.x = _World2Object[0].x;
  v_16.y = _World2Object[1].x;
  v_16.z = _World2Object[2].x;
  v_16.w = _World2Object[3].x;
  highp vec4 v_17;
  v_17.x = _World2Object[0].y;
  v_17.y = _World2Object[1].y;
  v_17.z = _World2Object[2].y;
  v_17.w = _World2Object[3].y;
  highp vec4 v_18;
  v_18.x = _World2Object[0].z;
  v_18.y = _World2Object[1].z;
  v_18.z = _World2Object[2].z;
  v_18.w = _World2Object[3].z;
  highp vec3 tmpvar_19;
  tmpvar_19 = normalize(((
    (v_16.xyz * norm_15.x)
   + 
    (v_17.xyz * norm_15.y)
  ) + (v_18.xyz * norm_15.z)));
  highp vec3 dir_20;
  dir_20 = tmpvar_4.xyz;
  highp mat3 tmpvar_21;
  tmpvar_21[0] = _Object2World[0].xyz;
  tmpvar_21[1] = _Object2World[1].xyz;
  tmpvar_21[2] = _Object2World[2].xyz;
  highp vec4 tmpvar_22;
  tmpvar_22.xyz = normalize((tmpvar_21 * dir_20));
  tmpvar_22.w = tmpvar_4.w;
  mediump vec3 normal_23;
  normal_23 = tmpvar_19;
  mediump vec3 tangent_24;
  tangent_24 = tmpvar_22.xyz;
  mediump float tangentSign_25;
  tangentSign_25 = tmpvar_22.w;
  mediump float sign_26;
  highp float tmpvar_27;
  tmpvar_27 = (tangentSign_25 * unity_WorldTransformParams.w);
  sign_26 = tmpvar_27;
  mediump vec3 tmpvar_28;
  tmpvar_28 = (((normal_23.yzx * tangent_24.zxy) - (normal_23.zxy * tangent_24.yzx)) * sign_26);
  mediump mat3 tmpvar_29;
  tmpvar_29[0].x = tangent_24.x;
  tmpvar_29[0].y = tmpvar_28.x;
  tmpvar_29[0].z = normal_23.x;
  tmpvar_29[1].x = tangent_24.y;
  tmpvar_29[1].y = tmpvar_28.y;
  tmpvar_29[1].z = normal_23.y;
  tmpvar_29[2].x = tangent_24.z;
  tmpvar_29[2].y = tmpvar_28.z;
  tmpvar_29[2].z = normal_23.z;
  tangentToWorld_5 = tmpvar_29;
  highp vec3 v_30;
  v_30.x = tangentToWorld_5[0].x;
  v_30.y = tangentToWorld_5[1].x;
  v_30.z = tangentToWorld_5[2].x;
  tmpvar_7.xyz = v_30;
  highp vec3 v_31;
  v_31.x = tangentToWorld_5[0].y;
  v_31.y = tangentToWorld_5[1].y;
  v_31.z = tangentToWorld_5[2].y;
  tmpvar_8.xyz = v_31;
  highp vec3 v_32;
  v_32.x = tangentToWorld_5[0].z;
  v_32.y = tangentToWorld_5[1].z;
  v_32.z = tangentToWorld_5[2].z;
  tmpvar_9.xyz = v_32;
  tmpvar_10 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
  highp vec3 tmpvar_33;
  tmpvar_33 = (_WorldSpaceLightPos0.xyz - (tmpvar_11.xyz * _WorldSpaceLightPos0.w));
  tmpvar_7.w = tmpvar_33.x;
  tmpvar_8.w = tmpvar_33.y;
  tmpvar_9.w = tmpvar_33.z;
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = texcoord_12;
  xlv_TEXCOORD1 = normalize(n_14);
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD2_1 = tmpvar_8;
  xlv_TEXCOORD2_2 = tmpvar_9;
  xlv_TEXCOORD5 = tmpvar_10;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shadow_samplers : enable
uniform mediump vec4 _LightShadowData;
uniform mediump vec4 unity_ColorSpaceDielectricSpec;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform lowp sampler2DShadow _ShadowMapTexture;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_2;
  tmpvar_2 = (_Color.xyz * tmpvar_1.xyz);
  mediump vec3 tmpvar_3;
  tmpvar_3 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_4;
  tmpvar_4.x = xlv_TEXCOORD2.w;
  tmpvar_4.y = xlv_TEXCOORD2_1.w;
  tmpvar_4.z = xlv_TEXCOORD2_2.w;
  lowp float shadow_5;
  shadow_5 = (_LightShadowData.x + (shadow2DEXT (_ShadowMapTexture, xlv_TEXCOORD5.xyz) * (1.0 - _LightShadowData.x)));
  mediump float atten_6;
  atten_6 = shadow_5;
  mediump vec3 tmpvar_7;
  tmpvar_7 = _LightColor0.xyz;
  tmpvar_7 = (tmpvar_7 * atten_6);
  mediump vec3 viewDir_8;
  viewDir_8 = -(xlv_TEXCOORD1);
  mediump vec2 tmpvar_9;
  tmpvar_9.x = dot ((viewDir_8 - (2.0 * 
    (dot (tmpvar_3, viewDir_8) * tmpvar_3)
  )), tmpvar_4);
  tmpvar_9.y = (1.0 - clamp (dot (tmpvar_3, viewDir_8), 0.0, 1.0));
  mediump vec2 tmpvar_10;
  tmpvar_10.x = ((tmpvar_9 * tmpvar_9) * (tmpvar_9 * tmpvar_9)).x;
  tmpvar_10.y = (1.0 - _Glossiness);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (unity_NHxRoughness, tmpvar_10);
  mediump vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = (((tmpvar_2 * 
    (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w))
  ) + (
    (tmpvar_11.w * 16.0)
   * 
    mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, vec3(_Metallic))
  )) * (tmpvar_7 * clamp (
    dot (tmpvar_3, tmpvar_4)
  , 0.0, 1.0)));
  mediump vec4 xlat_varoutput_13;
  xlat_varoutput_13.xyz = tmpvar_12.xyz;
  xlat_varoutput_13.w = 1.0;
  gl_FragData[0] = xlat_varoutput_13;
}


#endif
"
}
SubProgram "gles " {
// Stats: 33 math, 4 textures
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "SHADOWS_NATIVE" }
"!!GLES
#version 100

#ifdef VERTEX
#extension GL_EXT_shadow_samplers : enable
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_WorldTransformParams;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DetailAlbedoMap_ST;
uniform mediump float _UVSec;
uniform mediump mat4 _LightMatrix0;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec2 xlv_TEXCOORD5;
varying mediump vec4 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec2 tmpvar_3;
  tmpvar_3 = _glesMultiTexCoord1.xy;
  mediump vec4 tmpvar_4;
  tmpvar_4 = _glesTANGENT;
  highp mat3 tangentToWorld_5;
  highp vec4 tmpvar_6;
  mediump vec4 tmpvar_7;
  mediump vec4 tmpvar_8;
  mediump vec4 tmpvar_9;
  mediump vec2 tmpvar_10;
  mediump vec4 tmpvar_11;
  highp vec4 tmpvar_12;
  tmpvar_12 = (_Object2World * _glesVertex);
  tmpvar_6 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 texcoord_13;
  texcoord_13.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec2 tmpvar_14;
  if ((_UVSec == 0.0)) {
    tmpvar_14 = tmpvar_2;
  } else {
    tmpvar_14 = tmpvar_3;
  };
  texcoord_13.zw = ((tmpvar_14 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  mediump vec3 n_15;
  n_15 = (tmpvar_12.xyz - _WorldSpaceCameraPos);
  highp vec3 norm_16;
  norm_16 = tmpvar_1;
  highp vec4 v_17;
  v_17.x = _World2Object[0].x;
  v_17.y = _World2Object[1].x;
  v_17.z = _World2Object[2].x;
  v_17.w = _World2Object[3].x;
  highp vec4 v_18;
  v_18.x = _World2Object[0].y;
  v_18.y = _World2Object[1].y;
  v_18.z = _World2Object[2].y;
  v_18.w = _World2Object[3].y;
  highp vec4 v_19;
  v_19.x = _World2Object[0].z;
  v_19.y = _World2Object[1].z;
  v_19.z = _World2Object[2].z;
  v_19.w = _World2Object[3].z;
  highp vec3 tmpvar_20;
  tmpvar_20 = normalize(((
    (v_17.xyz * norm_16.x)
   + 
    (v_18.xyz * norm_16.y)
  ) + (v_19.xyz * norm_16.z)));
  highp vec3 dir_21;
  dir_21 = tmpvar_4.xyz;
  highp mat3 tmpvar_22;
  tmpvar_22[0] = _Object2World[0].xyz;
  tmpvar_22[1] = _Object2World[1].xyz;
  tmpvar_22[2] = _Object2World[2].xyz;
  highp vec4 tmpvar_23;
  tmpvar_23.xyz = normalize((tmpvar_22 * dir_21));
  tmpvar_23.w = tmpvar_4.w;
  mediump vec3 normal_24;
  normal_24 = tmpvar_20;
  mediump vec3 tangent_25;
  tangent_25 = tmpvar_23.xyz;
  mediump float tangentSign_26;
  tangentSign_26 = tmpvar_23.w;
  mediump float sign_27;
  highp float tmpvar_28;
  tmpvar_28 = (tangentSign_26 * unity_WorldTransformParams.w);
  sign_27 = tmpvar_28;
  mediump vec3 tmpvar_29;
  tmpvar_29 = (((normal_24.yzx * tangent_25.zxy) - (normal_24.zxy * tangent_25.yzx)) * sign_27);
  mediump mat3 tmpvar_30;
  tmpvar_30[0].x = tangent_25.x;
  tmpvar_30[0].y = tmpvar_29.x;
  tmpvar_30[0].z = normal_24.x;
  tmpvar_30[1].x = tangent_25.y;
  tmpvar_30[1].y = tmpvar_29.y;
  tmpvar_30[1].z = normal_24.y;
  tmpvar_30[2].x = tangent_25.z;
  tmpvar_30[2].y = tmpvar_29.z;
  tmpvar_30[2].z = normal_24.z;
  tangentToWorld_5 = tmpvar_30;
  highp vec3 v_31;
  v_31.x = tangentToWorld_5[0].x;
  v_31.y = tangentToWorld_5[1].x;
  v_31.z = tangentToWorld_5[2].x;
  tmpvar_7.xyz = v_31;
  highp vec3 v_32;
  v_32.x = tangentToWorld_5[0].y;
  v_32.y = tangentToWorld_5[1].y;
  v_32.z = tangentToWorld_5[2].y;
  tmpvar_8.xyz = v_32;
  highp vec3 v_33;
  v_33.x = tangentToWorld_5[0].z;
  v_33.y = tangentToWorld_5[1].z;
  v_33.z = tangentToWorld_5[2].z;
  tmpvar_9.xyz = v_33;
  highp vec4 tmpvar_34;
  tmpvar_34 = (_Object2World * _glesVertex);
  tmpvar_10 = (_LightMatrix0 * tmpvar_34).xy;
  tmpvar_11 = (unity_World2Shadow[0] * tmpvar_34);
  highp vec3 tmpvar_35;
  tmpvar_35 = (_WorldSpaceLightPos0.xyz - (tmpvar_12.xyz * _WorldSpaceLightPos0.w));
  tmpvar_7.w = tmpvar_35.x;
  tmpvar_8.w = tmpvar_35.y;
  tmpvar_9.w = tmpvar_35.z;
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = texcoord_13;
  xlv_TEXCOORD1 = normalize(n_15);
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD2_1 = tmpvar_8;
  xlv_TEXCOORD2_2 = tmpvar_9;
  xlv_TEXCOORD5 = tmpvar_10;
  xlv_TEXCOORD6 = tmpvar_11;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shadow_samplers : enable
uniform mediump vec4 _LightShadowData;
uniform mediump vec4 unity_ColorSpaceDielectricSpec;
uniform lowp vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform mediump vec4 _Color;
uniform sampler2D _MainTex;
uniform mediump float _Metallic;
uniform mediump float _Glossiness;
uniform lowp sampler2DShadow _ShadowMapTexture;
uniform sampler2D _LightTexture0;
varying highp vec4 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
varying mediump vec4 xlv_TEXCOORD2_1;
varying mediump vec4 xlv_TEXCOORD2_2;
varying mediump vec2 xlv_TEXCOORD5;
varying mediump vec4 xlv_TEXCOORD6;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  mediump vec3 tmpvar_2;
  tmpvar_2 = (_Color.xyz * tmpvar_1.xyz);
  mediump vec3 tmpvar_3;
  tmpvar_3 = normalize(xlv_TEXCOORD2_2.xyz);
  mediump vec3 tmpvar_4;
  tmpvar_4.x = xlv_TEXCOORD2.w;
  tmpvar_4.y = xlv_TEXCOORD2_1.w;
  tmpvar_4.z = xlv_TEXCOORD2_2.w;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_LightTexture0, xlv_TEXCOORD5);
  lowp float shadow_6;
  shadow_6 = (_LightShadowData.x + (shadow2DEXT (_ShadowMapTexture, xlv_TEXCOORD6.xyz) * (1.0 - _LightShadowData.x)));
  mediump float atten_7;
  atten_7 = (tmpvar_5.w * shadow_6);
  mediump vec3 tmpvar_8;
  tmpvar_8 = _LightColor0.xyz;
  tmpvar_8 = (tmpvar_8 * atten_7);
  mediump vec3 viewDir_9;
  viewDir_9 = -(xlv_TEXCOORD1);
  mediump vec2 tmpvar_10;
  tmpvar_10.x = dot ((viewDir_9 - (2.0 * 
    (dot (tmpvar_3, viewDir_9) * tmpvar_3)
  )), tmpvar_4);
  tmpvar_10.y = (1.0 - clamp (dot (tmpvar_3, viewDir_9), 0.0, 1.0));
  mediump vec2 tmpvar_11;
  tmpvar_11.x = ((tmpvar_10 * tmpvar_10) * (tmpvar_10 * tmpvar_10)).x;
  tmpvar_11.y = (1.0 - _Glossiness);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (unity_NHxRoughness, tmpvar_11);
  mediump vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = (((tmpvar_2 * 
    (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w))
  ) + (
    (tmpvar_12.w * 16.0)
   * 
    mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, vec3(_Metallic))
  )) * (tmpvar_8 * clamp (
    dot (tmpvar_3, tmpvar_4)
  , 0.0, 1.0)));
  mediump vec4 xlat_varoutput_14;
  xlat_varoutput_14.xyz = tmpvar_13.xyz;
  xlat_varoutput_14.w = 1.0;
  gl_FragData[0] = xlat_varoutput_14;
}


#endif
"
}
}
Program "fp" {
SubProgram "gles " {
Keywords { "POINT" "SHADOWS_OFF" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "SPOT" "SHADOWS_OFF" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NONATIVE" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "POINT" "SHADOWS_CUBE" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "SHADOWS_NATIVE" }
"!!GLES"
}
}
 }


 // Stats for Vertex shader:
 //        gles : 4 avg math (1..8)
 Pass {
  Name "SHADOWCASTER"
  Tags { "LIGHTMODE"="SHADOWCASTER" "SHADOWSUPPORT"="true" "RenderType"="Opaque" "PerformanceChecks"="False" }
  GpuProgramID 502614
Program "vp" {
SubProgram "gles " {
// Stats: 1 math
Keywords { "SHADOWS_DEPTH" }
"!!GLES
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec4 unity_LightShadowBias;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp mat4 unity_MatrixVP;
void main ()
{
  highp vec3 vertex_1;
  vertex_1 = _glesVertex.xyz;
  highp vec4 clipPos_2;
  if ((unity_LightShadowBias.z != 0.0)) {
    highp vec4 tmpvar_3;
    tmpvar_3.w = 1.0;
    tmpvar_3.xyz = vertex_1;
    highp vec3 tmpvar_4;
    tmpvar_4 = (_Object2World * tmpvar_3).xyz;
    highp vec4 v_5;
    v_5.x = _World2Object[0].x;
    v_5.y = _World2Object[1].x;
    v_5.z = _World2Object[2].x;
    v_5.w = _World2Object[3].x;
    highp vec4 v_6;
    v_6.x = _World2Object[0].y;
    v_6.y = _World2Object[1].y;
    v_6.z = _World2Object[2].y;
    v_6.w = _World2Object[3].y;
    highp vec4 v_7;
    v_7.x = _World2Object[0].z;
    v_7.y = _World2Object[1].z;
    v_7.z = _World2Object[2].z;
    v_7.w = _World2Object[3].z;
    highp vec3 tmpvar_8;
    tmpvar_8 = normalize(((
      (v_5.xyz * _glesNormal.x)
     + 
      (v_6.xyz * _glesNormal.y)
    ) + (v_7.xyz * _glesNormal.z)));
    highp float tmpvar_9;
    tmpvar_9 = dot (tmpvar_8, normalize((_WorldSpaceLightPos0.xyz - 
      (tmpvar_4 * _WorldSpaceLightPos0.w)
    )));
    highp vec4 tmpvar_10;
    tmpvar_10.w = 1.0;
    tmpvar_10.xyz = (tmpvar_4 - (tmpvar_8 * (unity_LightShadowBias.z * 
      sqrt((1.0 - (tmpvar_9 * tmpvar_9)))
    )));
    clipPos_2 = (unity_MatrixVP * tmpvar_10);
  } else {
    highp vec4 tmpvar_11;
    tmpvar_11.w = 1.0;
    tmpvar_11.xyz = vertex_1;
    clipPos_2 = (glstate_matrix_mvp * tmpvar_11);
  };
  highp vec4 clipPos_12;
  clipPos_12.xyw = clipPos_2.xyw;
  clipPos_12.z = (clipPos_2.z + clamp ((unity_LightShadowBias.x / clipPos_2.w), 0.0, 1.0));
  clipPos_12.z = mix (clipPos_12.z, max (clipPos_12.z, -(clipPos_2.w)), unity_LightShadowBias.y);
  gl_Position = clipPos_12;
}


#endif
#ifdef FRAGMENT
void main ()
{
  gl_FragData[0] = vec4(0.0, 0.0, 0.0, 0.0);
}


#endif
"
}
SubProgram "gles " {
// Stats: 8 math
Keywords { "SHADOWS_CUBE" }
"!!GLES
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
uniform highp vec4 _LightPositionRange;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
varying highp vec3 xlv_TEXCOORD0;
void main ()
{
  xlv_TEXCOORD0 = ((_Object2World * _glesVertex).xyz - _LightPositionRange.xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _LightPositionRange;
varying highp vec3 xlv_TEXCOORD0;
void main ()
{
  mediump vec4 tmpvar_1;
  highp vec4 enc_2;
  highp vec4 tmpvar_3;
  tmpvar_3 = fract((vec4(1.0, 255.0, 65025.0, 1.658138e+07) * min (
    (sqrt(dot (xlv_TEXCOORD0, xlv_TEXCOORD0)) * _LightPositionRange.w)
  , 0.999)));
  enc_2 = (tmpvar_3 - (tmpvar_3.yzww * 0.003921569));
  tmpvar_1 = enc_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
}
Program "fp" {
SubProgram "gles " {
Keywords { "SHADOWS_DEPTH" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "SHADOWS_CUBE" }
"!!GLES"
}
}
 }
}
Fallback "VertexLit"
}
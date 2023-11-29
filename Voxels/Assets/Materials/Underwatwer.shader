// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:1,grmd:0,uamb:True,mssp:True,bkdf:True,hqlp:False,rprd:True,enco:False,rmgx:True,imps:False,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:1,spxs:False,tesm:0,olmd:1,culm:1,bsrc:0,bdst:1,dpts:6,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:False,igpj:True,qofs:1,qpre:4,rntp:5,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:True,fnfb:True,fsmp:False;n:type:ShaderForge.SFN_Final,id:2865,x:32740,y:33254,varname:node_2865,prsc:2|emission-2155-OUT;n:type:ShaderForge.SFN_SceneColor,id:8240,x:32026,y:33204,varname:node_8240,prsc:2;n:type:ShaderForge.SFN_DepthBlend,id:2979,x:31825,y:33710,varname:node_2979,prsc:2;n:type:ShaderForge.SFN_Lerp,id:2155,x:32518,y:33321,varname:node_2155,prsc:2|A-8240-RGB,B-4814-OUT,T-9579-OUT;n:type:ShaderForge.SFN_Color,id:5918,x:30926,y:32666,ptovrint:False,ptlb:color1,ptin:_color1,varname:node_5918,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Add,id:6918,x:32239,y:33506,varname:node_6918,prsc:2|A-8150-OUT,B-8361-OUT;n:type:ShaderForge.SFN_Multiply,id:8361,x:32020,y:33613,varname:node_8361,prsc:2|A-2652-OUT,B-2979-OUT;n:type:ShaderForge.SFN_ValueProperty,id:2652,x:31825,y:33613,ptovrint:False,ptlb:multiply,ptin:_multiply,varname:node_2652,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:8150,x:32069,y:33524,ptovrint:False,ptlb:offset,ptin:_offset,varname:node_8150,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Clamp01,id:9579,x:32439,y:33537,varname:node_9579,prsc:2|IN-6918-OUT;n:type:ShaderForge.SFN_LightVector,id:8977,x:30909,y:33328,varname:node_8977,prsc:2;n:type:ShaderForge.SFN_ViewVector,id:10,x:30909,y:33445,varname:node_10,prsc:2;n:type:ShaderForge.SFN_Dot,id:5591,x:31180,y:33374,varname:node_5591,prsc:2,dt:4|A-8977-OUT,B-10-OUT;n:type:ShaderForge.SFN_Lerp,id:4814,x:31485,y:33355,varname:node_4814,prsc:2|A-5918-RGB,B-3788-RGB,T-5591-OUT;n:type:ShaderForge.SFN_Color,id:3788,x:30861,y:32819,ptovrint:False,ptlb:color2,ptin:_color2,varname:node_3788,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;proporder:7542-5918-2652-8150-3788;pass:END;sub:END;*/

Shader "Shader Forge/Underwatwer" {
    Properties {
        _node_7845 ("node_7845", 2D) = "white" {}
        _color1 ("color1", Color) = (0.5,0.5,0.5,1)
        _multiply ("multiply", Float ) = 0
        _offset ("offset", Float ) = 0
        _color2 ("color2", Color) = (0.5,0.5,0.5,1)
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Overlay+1"
            "RenderType"="Overlay"
        }
        GrabPass{ }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Cull Front
            ZTest Always
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define _GLOSSYENV 1
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdbase
            #pragma target 3.0
            uniform sampler2D _GrabTexture;
            uniform sampler2D _CameraDepthTexture;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _color1)
                UNITY_DEFINE_INSTANCED_PROP( float, _multiply)
                UNITY_DEFINE_INSTANCED_PROP( float, _offset)
                UNITY_DEFINE_INSTANCED_PROP( float4, _color2)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 posWorld : TEXCOORD0;
                float4 projPos : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float sceneZ = max(0,LinearEyeDepth (UNITY_SAMPLE_DEPTH(tex2Dproj(_CameraDepthTexture, UNITY_PROJ_COORD(i.projPos)))) - _ProjectionParams.g);
                float partZ = max(0,i.projPos.z - _ProjectionParams.g);
                float2 sceneUVs = (i.projPos.xy / i.projPos.w);
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
////// Emissive:
                float4 _color1_var = UNITY_ACCESS_INSTANCED_PROP( Props, _color1 );
                float4 _color2_var = UNITY_ACCESS_INSTANCED_PROP( Props, _color2 );
                float _offset_var = UNITY_ACCESS_INSTANCED_PROP( Props, _offset );
                float _multiply_var = UNITY_ACCESS_INSTANCED_PROP( Props, _multiply );
                float3 emissive = lerp(sceneColor.rgb,lerp(_color1_var.rgb,_color2_var.rgb,(0.5*dot(lightDirection,viewDirection)+0.5)),saturate((_offset_var+(_multiply_var*saturate((sceneZ-partZ))))));
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            Cull Front
            ZTest Always
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define _GLOSSYENV 1
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdadd
            #pragma target 3.0
            uniform sampler2D _GrabTexture;
            uniform sampler2D _CameraDepthTexture;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _color1)
                UNITY_DEFINE_INSTANCED_PROP( float, _multiply)
                UNITY_DEFINE_INSTANCED_PROP( float, _offset)
                UNITY_DEFINE_INSTANCED_PROP( float4, _color2)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 posWorld : TEXCOORD0;
                float4 projPos : TEXCOORD1;
                LIGHTING_COORDS(2,3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float sceneZ = max(0,LinearEyeDepth (UNITY_SAMPLE_DEPTH(tex2Dproj(_CameraDepthTexture, UNITY_PROJ_COORD(i.projPos)))) - _ProjectionParams.g);
                float partZ = max(0,i.projPos.z - _ProjectionParams.g);
                float2 sceneUVs = (i.projPos.xy / i.projPos.w);
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
////// Lighting:
                float3 finalColor = 0;
                return fixed4(finalColor,0);
            }
            ENDCG
        }
    }
    CustomEditor "ShaderForgeMaterialInspector"
}

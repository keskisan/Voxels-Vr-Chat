// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:3,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33230,y:32843,varname:node_3138,prsc:2|diff-9430-OUT,diffpow-7406-OUT,spec-5121-OUT,gloss-2722-OUT,normal-7500-OUT,alpha-8345-OUT,clip-4787-OUT;n:type:ShaderForge.SFN_Color,id:7241,x:31744,y:32192,ptovrint:False,ptlb:ColorTop,ptin:_ColorTop,varname:node_7241,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.07843138,c2:0.3921569,c3:0.7843137,c4:1;n:type:ShaderForge.SFN_FaceSign,id:979,x:32186,y:32640,varname:node_979,prsc:2,fstp:0;n:type:ShaderForge.SFN_Lerp,id:9430,x:32345,y:32435,varname:node_9430,prsc:2|A-8042-RGB,B-8346-OUT,T-979-VFACE;n:type:ShaderForge.SFN_Slider,id:5121,x:32623,y:32575,ptovrint:False,ptlb:Metalic,ptin:_Metalic,varname:node_5121,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Slider,id:7406,x:32623,y:32493,ptovrint:False,ptlb:Diffuse,ptin:_Diffuse,varname:node_7406,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Slider,id:2722,x:32623,y:32390,ptovrint:False,ptlb:Gloss,ptin:_Gloss,varname:node_2722,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Tex2d,id:9022,x:31504,y:32794,ptovrint:False,ptlb:WaterNrml,ptin:_WaterNrml,varname:node_9022,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:3,isnm:False|UVIN-6392-UVOUT;n:type:ShaderForge.SFN_FragmentPosition,id:6039,x:30428,y:32825,varname:node_6039,prsc:2;n:type:ShaderForge.SFN_Append,id:8811,x:30616,y:32836,varname:node_8811,prsc:2|A-6039-X,B-6039-Z;n:type:ShaderForge.SFN_Multiply,id:7891,x:30804,y:32806,varname:node_7891,prsc:2|A-5284-OUT,B-8811-OUT;n:type:ShaderForge.SFN_ValueProperty,id:5284,x:30616,y:32734,ptovrint:False,ptlb:TextureScale,ptin:_TextureScale,varname:node_5284,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Cubemap,id:8042,x:31782,y:32377,ptovrint:False,ptlb:node_8042,ptin:_node_8042,varname:node_8042,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,pvfc:0;n:type:ShaderForge.SFN_ViewVector,id:4638,x:31020,y:32366,varname:node_4638,prsc:2;n:type:ShaderForge.SFN_NormalVector,id:6184,x:31020,y:32567,prsc:2,pt:False;n:type:ShaderForge.SFN_Dot,id:6592,x:31186,y:32479,varname:node_6592,prsc:2,dt:3|A-4638-OUT,B-6184-OUT;n:type:ShaderForge.SFN_OneMinus,id:8960,x:31349,y:32479,varname:node_8960,prsc:2|IN-6592-OUT;n:type:ShaderForge.SFN_Multiply,id:7019,x:31549,y:32479,varname:node_7019,prsc:2|A-8356-OUT,B-8960-OUT;n:type:ShaderForge.SFN_Clamp01,id:918,x:31966,y:32511,varname:node_918,prsc:2|IN-5320-OUT;n:type:ShaderForge.SFN_ValueProperty,id:8356,x:31349,y:32377,ptovrint:False,ptlb:NormalScale,ptin:_NormalScale,varname:node_8356,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Add,id:5320,x:31759,y:32533,varname:node_5320,prsc:2|A-1645-OUT,B-7019-OUT;n:type:ShaderForge.SFN_ValueProperty,id:1645,x:31529,y:32377,ptovrint:False,ptlb:NormalOffset,ptin:_NormalOffset,varname:node_1645,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Multiply,id:2943,x:31825,y:33237,varname:node_2943,prsc:2|A-9718-OUT,B-960-OUT;n:type:ShaderForge.SFN_ValueProperty,id:960,x:31637,y:33403,ptovrint:False,ptlb: Depth Scale,ptin:_DepthScale,varname:node_960,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Clamp01,id:8345,x:32816,y:33139,varname:node_8345,prsc:2|IN-1706-OUT;n:type:ShaderForge.SFN_ValueProperty,id:2873,x:31839,y:33422,ptovrint:False,ptlb:depth offset,ptin:_depthoffset,varname:node_2873,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Add,id:1927,x:32018,y:33266,varname:node_1927,prsc:2|A-2943-OUT,B-2873-OUT;n:type:ShaderForge.SFN_DepthBlend,id:9718,x:31637,y:33222,varname:node_9718,prsc:2;n:type:ShaderForge.SFN_Lerp,id:8346,x:32161,y:32463,varname:node_8346,prsc:2|A-7241-RGB,B-8042-RGB,T-918-OUT;n:type:ShaderForge.SFN_Lerp,id:1706,x:32573,y:33126,varname:node_1706,prsc:2|A-5967-OUT,B-1019-OUT,T-979-VFACE;n:type:ShaderForge.SFN_ValueProperty,id:5967,x:32128,y:33163,ptovrint:False,ptlb:underneathTransparency,ptin:_underneathTransparency,varname:node_5967,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Add,id:1019,x:32273,y:33237,varname:node_1019,prsc:2|A-918-OUT,B-1927-OUT;n:type:ShaderForge.SFN_Tex2d,id:5744,x:31515,y:32981,ptovrint:False,ptlb:WaterNrm1l,ptin:_WaterNrm1l,varname:node_5744,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-549-OUT;n:type:ShaderForge.SFN_Rotator,id:6392,x:31222,y:32803,varname:node_6392,prsc:2|UVIN-4504-OUT,ANG-1582-OUT;n:type:ShaderForge.SFN_ValueProperty,id:1582,x:31127,y:33063,ptovrint:False,ptlb:Rotate,ptin:_Rotate,varname:node_1582,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Add,id:4504,x:30998,y:32803,varname:node_4504,prsc:2|A-7891-OUT,B-4689-OUT;n:type:ShaderForge.SFN_ValueProperty,id:3972,x:30483,y:33025,ptovrint:False,ptlb:TimeScale,ptin:_TimeScale,varname:node_3972,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Time,id:8194,x:30483,y:33096,varname:node_8194,prsc:2;n:type:ShaderForge.SFN_Multiply,id:4689,x:30732,y:33025,varname:node_4689,prsc:2|A-3972-OUT,B-8194-T;n:type:ShaderForge.SFN_Add,id:7500,x:31800,y:32869,varname:node_7500,prsc:2|A-9022-RGB,B-5744-RGB;n:type:ShaderForge.SFN_Multiply,id:5651,x:30836,y:33192,varname:node_5651,prsc:2|A-8811-OUT,B-8429-OUT;n:type:ShaderForge.SFN_ValueProperty,id:8429,x:30445,y:33359,ptovrint:False,ptlb:TextureScale1,ptin:_TextureScale1,varname:node_8429,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Add,id:549,x:31042,y:33185,varname:node_549,prsc:2|A-5651-OUT,B-2587-OUT;n:type:ShaderForge.SFN_Multiply,id:2587,x:30817,y:33372,varname:node_2587,prsc:2|A-8194-T,B-6778-OUT;n:type:ShaderForge.SFN_ValueProperty,id:6778,x:30501,y:33588,ptovrint:False,ptlb:TimeScale1,ptin:_TimeScale1,varname:node_6778,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Distance,id:6463,x:32767,y:33401,varname:node_6463,prsc:2|A-4209-XYZ,B-3652-XYZ;n:type:ShaderForge.SFN_FragmentPosition,id:3652,x:32477,y:33448,varname:node_3652,prsc:2;n:type:ShaderForge.SFN_ObjectPosition,id:4209,x:32573,y:33264,varname:node_4209,prsc:2;n:type:ShaderForge.SFN_Add,id:3191,x:32971,y:33506,varname:node_3191,prsc:2|A-9854-OUT,B-6463-OUT;n:type:ShaderForge.SFN_ValueProperty,id:9854,x:32735,y:33613,ptovrint:False,ptlb:ClipOffset,ptin:_ClipOffset,varname:node_9854,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_OneMinus,id:4787,x:33016,y:33247,varname:node_4787,prsc:2|IN-3191-OUT;proporder:7241-5121-7406-2722-9022-5284-8042-8356-1645-960-2873-5967-1582-3972-5744-8429-6778-9854;pass:END;sub:END;*/

Shader "Shader Forge/waterShader" {
    Properties {
        _ColorTop ("ColorTop", Color) = (0.07843138,0.3921569,0.7843137,1)
        _Metalic ("Metalic", Range(0, 1)) = 1
        _Diffuse ("Diffuse", Range(0, 1)) = 1
        _Gloss ("Gloss", Range(0, 1)) = 1
        _WaterNrml ("WaterNrml", 2D) = "bump" {}
        _TextureScale ("TextureScale", Float ) = 1
        _node_8042 ("node_8042", Cube) = "_Skybox" {}
        _NormalScale ("NormalScale", Float ) = 0
        _NormalOffset ("NormalOffset", Float ) = 0
        _DepthScale (" Depth Scale", Float ) = 0
        _depthoffset ("depth offset", Float ) = 0
        _underneathTransparency ("underneathTransparency", Float ) = 0
        _Rotate ("Rotate", Float ) = 0
        _TimeScale ("TimeScale", Float ) = 0
        _WaterNrm1l ("WaterNrm1l", 2D) = "white" {}
        _TextureScale1 ("TextureScale1", Float ) = 0
        _TimeScale1 ("TimeScale1", Float ) = 0
        _ClipOffset ("ClipOffset", Float ) = 0
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            Cull Off
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdbase
            #pragma target 3.0
            uniform sampler2D _CameraDepthTexture;
            uniform sampler2D _WaterNrml; uniform float4 _WaterNrml_ST;
            uniform samplerCUBE _node_8042;
            uniform sampler2D _WaterNrm1l; uniform float4 _WaterNrm1l_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _ColorTop)
                UNITY_DEFINE_INSTANCED_PROP( float, _Metalic)
                UNITY_DEFINE_INSTANCED_PROP( float, _Diffuse)
                UNITY_DEFINE_INSTANCED_PROP( float, _Gloss)
                UNITY_DEFINE_INSTANCED_PROP( float, _TextureScale)
                UNITY_DEFINE_INSTANCED_PROP( float, _NormalScale)
                UNITY_DEFINE_INSTANCED_PROP( float, _NormalOffset)
                UNITY_DEFINE_INSTANCED_PROP( float, _DepthScale)
                UNITY_DEFINE_INSTANCED_PROP( float, _depthoffset)
                UNITY_DEFINE_INSTANCED_PROP( float, _underneathTransparency)
                UNITY_DEFINE_INSTANCED_PROP( float, _Rotate)
                UNITY_DEFINE_INSTANCED_PROP( float, _TimeScale)
                UNITY_DEFINE_INSTANCED_PROP( float, _TextureScale1)
                UNITY_DEFINE_INSTANCED_PROP( float, _TimeScale1)
                UNITY_DEFINE_INSTANCED_PROP( float, _ClipOffset)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                float3 tangentDir : TEXCOORD2;
                float3 bitangentDir : TEXCOORD3;
                float4 projPos : TEXCOORD4;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                i.normalDir = normalize(i.normalDir);
                i.normalDir *= faceSign;
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float _Rotate_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Rotate );
                float node_6392_ang = _Rotate_var;
                float node_6392_spd = 1.0;
                float node_6392_cos = cos(node_6392_spd*node_6392_ang);
                float node_6392_sin = sin(node_6392_spd*node_6392_ang);
                float2 node_6392_piv = float2(0.5,0.5);
                float _TextureScale_var = UNITY_ACCESS_INSTANCED_PROP( Props, _TextureScale );
                float2 node_8811 = float2(i.posWorld.r,i.posWorld.b);
                float _TimeScale_var = UNITY_ACCESS_INSTANCED_PROP( Props, _TimeScale );
                float4 node_8194 = _Time;
                float2 node_6392 = (mul(((_TextureScale_var*node_8811)+(_TimeScale_var*node_8194.g))-node_6392_piv,float2x2( node_6392_cos, -node_6392_sin, node_6392_sin, node_6392_cos))+node_6392_piv);
                float4 _WaterNrml_var = tex2D(_WaterNrml,TRANSFORM_TEX(node_6392, _WaterNrml));
                float _TextureScale1_var = UNITY_ACCESS_INSTANCED_PROP( Props, _TextureScale1 );
                float _TimeScale1_var = UNITY_ACCESS_INSTANCED_PROP( Props, _TimeScale1 );
                float2 node_549 = ((node_8811*_TextureScale1_var)+(node_8194.g*_TimeScale1_var));
                float4 _WaterNrm1l_var = tex2D(_WaterNrm1l,TRANSFORM_TEX(node_549, _WaterNrm1l));
                float3 node_7500 = (_WaterNrml_var.rgb+_WaterNrm1l_var.rgb);
                float3 normalLocal = node_7500;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float sceneZ = max(0,LinearEyeDepth (UNITY_SAMPLE_DEPTH(tex2Dproj(_CameraDepthTexture, UNITY_PROJ_COORD(i.projPos)))) - _ProjectionParams.g);
                float partZ = max(0,i.projPos.z - _ProjectionParams.g);
                float _ClipOffset_var = UNITY_ACCESS_INSTANCED_PROP( Props, _ClipOffset );
                clip((1.0 - (_ClipOffset_var+distance(objPos.rgb,i.posWorld.rgb))) - 0.5);
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = 1;
                float3 attenColor = attenuation * _LightColor0.xyz;
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
///////// Gloss:
                float _Gloss_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Gloss );
                float gloss = _Gloss_var;
                float perceptualRoughness = 1.0 - _Gloss_var;
                float roughness = perceptualRoughness * perceptualRoughness;
                float specPow = exp2( gloss * 10.0 + 1.0 );
/////// GI Data:
                UnityLight light;
                #ifdef LIGHTMAP_OFF
                    light.color = lightColor;
                    light.dir = lightDirection;
                    light.ndotl = LambertTerm (normalDirection, light.dir);
                #else
                    light.color = half3(0.f, 0.f, 0.f);
                    light.ndotl = 0.0f;
                    light.dir = half3(0.f, 0.f, 0.f);
                #endif
                UnityGIInput d;
                d.light = light;
                d.worldPos = i.posWorld.xyz;
                d.worldViewDir = viewDirection;
                d.atten = attenuation;
                Unity_GlossyEnvironmentData ugls_en_data;
                ugls_en_data.roughness = 1.0 - gloss;
                ugls_en_data.reflUVW = viewReflectDirection;
                UnityGI gi = UnityGlobalIllumination(d, 1, normalDirection, ugls_en_data );
                lightDirection = gi.light.dir;
                lightColor = gi.light.color;
////// Specular:
                float NdotL = saturate(dot( normalDirection, lightDirection ));
                float LdotH = saturate(dot(lightDirection, halfDirection));
                float _Metalic_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Metalic );
                float3 specularColor = _Metalic_var;
                float specularMonochrome;
                float4 _node_8042_var = texCUBE(_node_8042,viewReflectDirection);
                float4 _ColorTop_var = UNITY_ACCESS_INSTANCED_PROP( Props, _ColorTop );
                float _NormalOffset_var = UNITY_ACCESS_INSTANCED_PROP( Props, _NormalOffset );
                float _NormalScale_var = UNITY_ACCESS_INSTANCED_PROP( Props, _NormalScale );
                float node_918 = saturate((_NormalOffset_var+(_NormalScale_var*(1.0 - abs(dot(viewDirection,i.normalDir))))));
                float3 diffuseColor = lerp(_node_8042_var.rgb,lerp(_ColorTop_var.rgb,_node_8042_var.rgb,node_918),isFrontFace); // Need this for specular when using metallic
                diffuseColor = DiffuseAndSpecularFromMetallic( diffuseColor, specularColor, specularColor, specularMonochrome );
                specularMonochrome = 1.0-specularMonochrome;
                float NdotV = abs(dot( normalDirection, viewDirection ));
                float NdotH = saturate(dot( normalDirection, halfDirection ));
                float VdotH = saturate(dot( viewDirection, halfDirection ));
                float visTerm = SmithJointGGXVisibilityTerm( NdotL, NdotV, roughness );
                float normTerm = GGXTerm(NdotH, roughness);
                float specularPBL = (visTerm*normTerm) * UNITY_PI;
                #ifdef UNITY_COLORSPACE_GAMMA
                    specularPBL = sqrt(max(1e-4h, specularPBL));
                #endif
                specularPBL = max(0, specularPBL * NdotL);
                #if defined(_SPECULARHIGHLIGHTS_OFF)
                    specularPBL = 0.0;
                #endif
                specularPBL *= any(specularColor) ? 1.0 : 0.0;
                float3 directSpecular = attenColor*specularPBL*FresnelTerm(specularColor, LdotH);
                float3 specular = directSpecular;
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                half fd90 = 0.5 + 2 * LdotH * LdotH * (1-gloss);
                float nlPow5 = Pow5(1-NdotL);
                float nvPow5 = Pow5(1-NdotV);
                float3 directDiffuse = ((1 +(fd90 - 1)*nlPow5) * (1 + (fd90 - 1)*nvPow5) * NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse + specular;
                float _underneathTransparency_var = UNITY_ACCESS_INSTANCED_PROP( Props, _underneathTransparency );
                float _DepthScale_var = UNITY_ACCESS_INSTANCED_PROP( Props, _DepthScale );
                float _depthoffset_var = UNITY_ACCESS_INSTANCED_PROP( Props, _depthoffset );
                return fixed4(finalColor,saturate(lerp(_underneathTransparency_var,(node_918+((saturate((sceneZ-partZ))*_DepthScale_var)+_depthoffset_var)),isFrontFace)));
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            Cull Off
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdadd
            #pragma target 3.0
            uniform sampler2D _CameraDepthTexture;
            uniform sampler2D _WaterNrml; uniform float4 _WaterNrml_ST;
            uniform samplerCUBE _node_8042;
            uniform sampler2D _WaterNrm1l; uniform float4 _WaterNrm1l_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _ColorTop)
                UNITY_DEFINE_INSTANCED_PROP( float, _Metalic)
                UNITY_DEFINE_INSTANCED_PROP( float, _Diffuse)
                UNITY_DEFINE_INSTANCED_PROP( float, _Gloss)
                UNITY_DEFINE_INSTANCED_PROP( float, _TextureScale)
                UNITY_DEFINE_INSTANCED_PROP( float, _NormalScale)
                UNITY_DEFINE_INSTANCED_PROP( float, _NormalOffset)
                UNITY_DEFINE_INSTANCED_PROP( float, _DepthScale)
                UNITY_DEFINE_INSTANCED_PROP( float, _depthoffset)
                UNITY_DEFINE_INSTANCED_PROP( float, _underneathTransparency)
                UNITY_DEFINE_INSTANCED_PROP( float, _Rotate)
                UNITY_DEFINE_INSTANCED_PROP( float, _TimeScale)
                UNITY_DEFINE_INSTANCED_PROP( float, _TextureScale1)
                UNITY_DEFINE_INSTANCED_PROP( float, _TimeScale1)
                UNITY_DEFINE_INSTANCED_PROP( float, _ClipOffset)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                float3 tangentDir : TEXCOORD2;
                float3 bitangentDir : TEXCOORD3;
                float4 projPos : TEXCOORD4;
                LIGHTING_COORDS(5,6)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                i.normalDir = normalize(i.normalDir);
                i.normalDir *= faceSign;
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float _Rotate_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Rotate );
                float node_6392_ang = _Rotate_var;
                float node_6392_spd = 1.0;
                float node_6392_cos = cos(node_6392_spd*node_6392_ang);
                float node_6392_sin = sin(node_6392_spd*node_6392_ang);
                float2 node_6392_piv = float2(0.5,0.5);
                float _TextureScale_var = UNITY_ACCESS_INSTANCED_PROP( Props, _TextureScale );
                float2 node_8811 = float2(i.posWorld.r,i.posWorld.b);
                float _TimeScale_var = UNITY_ACCESS_INSTANCED_PROP( Props, _TimeScale );
                float4 node_8194 = _Time;
                float2 node_6392 = (mul(((_TextureScale_var*node_8811)+(_TimeScale_var*node_8194.g))-node_6392_piv,float2x2( node_6392_cos, -node_6392_sin, node_6392_sin, node_6392_cos))+node_6392_piv);
                float4 _WaterNrml_var = tex2D(_WaterNrml,TRANSFORM_TEX(node_6392, _WaterNrml));
                float _TextureScale1_var = UNITY_ACCESS_INSTANCED_PROP( Props, _TextureScale1 );
                float _TimeScale1_var = UNITY_ACCESS_INSTANCED_PROP( Props, _TimeScale1 );
                float2 node_549 = ((node_8811*_TextureScale1_var)+(node_8194.g*_TimeScale1_var));
                float4 _WaterNrm1l_var = tex2D(_WaterNrm1l,TRANSFORM_TEX(node_549, _WaterNrm1l));
                float3 node_7500 = (_WaterNrml_var.rgb+_WaterNrm1l_var.rgb);
                float3 normalLocal = node_7500;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float sceneZ = max(0,LinearEyeDepth (UNITY_SAMPLE_DEPTH(tex2Dproj(_CameraDepthTexture, UNITY_PROJ_COORD(i.projPos)))) - _ProjectionParams.g);
                float partZ = max(0,i.projPos.z - _ProjectionParams.g);
                float _ClipOffset_var = UNITY_ACCESS_INSTANCED_PROP( Props, _ClipOffset );
                clip((1.0 - (_ClipOffset_var+distance(objPos.rgb,i.posWorld.rgb))) - 0.5);
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
///////// Gloss:
                float _Gloss_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Gloss );
                float gloss = _Gloss_var;
                float perceptualRoughness = 1.0 - _Gloss_var;
                float roughness = perceptualRoughness * perceptualRoughness;
                float specPow = exp2( gloss * 10.0 + 1.0 );
////// Specular:
                float NdotL = saturate(dot( normalDirection, lightDirection ));
                float LdotH = saturate(dot(lightDirection, halfDirection));
                float _Metalic_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Metalic );
                float3 specularColor = _Metalic_var;
                float specularMonochrome;
                float4 _node_8042_var = texCUBE(_node_8042,viewReflectDirection);
                float4 _ColorTop_var = UNITY_ACCESS_INSTANCED_PROP( Props, _ColorTop );
                float _NormalOffset_var = UNITY_ACCESS_INSTANCED_PROP( Props, _NormalOffset );
                float _NormalScale_var = UNITY_ACCESS_INSTANCED_PROP( Props, _NormalScale );
                float node_918 = saturate((_NormalOffset_var+(_NormalScale_var*(1.0 - abs(dot(viewDirection,i.normalDir))))));
                float3 diffuseColor = lerp(_node_8042_var.rgb,lerp(_ColorTop_var.rgb,_node_8042_var.rgb,node_918),isFrontFace); // Need this for specular when using metallic
                diffuseColor = DiffuseAndSpecularFromMetallic( diffuseColor, specularColor, specularColor, specularMonochrome );
                specularMonochrome = 1.0-specularMonochrome;
                float NdotV = abs(dot( normalDirection, viewDirection ));
                float NdotH = saturate(dot( normalDirection, halfDirection ));
                float VdotH = saturate(dot( viewDirection, halfDirection ));
                float visTerm = SmithJointGGXVisibilityTerm( NdotL, NdotV, roughness );
                float normTerm = GGXTerm(NdotH, roughness);
                float specularPBL = (visTerm*normTerm) * UNITY_PI;
                #ifdef UNITY_COLORSPACE_GAMMA
                    specularPBL = sqrt(max(1e-4h, specularPBL));
                #endif
                specularPBL = max(0, specularPBL * NdotL);
                #if defined(_SPECULARHIGHLIGHTS_OFF)
                    specularPBL = 0.0;
                #endif
                specularPBL *= any(specularColor) ? 1.0 : 0.0;
                float3 directSpecular = attenColor*specularPBL*FresnelTerm(specularColor, LdotH);
                float3 specular = directSpecular;
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                half fd90 = 0.5 + 2 * LdotH * LdotH * (1-gloss);
                float nlPow5 = Pow5(1-NdotL);
                float nvPow5 = Pow5(1-NdotV);
                float3 directDiffuse = ((1 +(fd90 - 1)*nlPow5) * (1 + (fd90 - 1)*nvPow5) * NdotL) * attenColor;
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse + specular;
                float _underneathTransparency_var = UNITY_ACCESS_INSTANCED_PROP( Props, _underneathTransparency );
                float _DepthScale_var = UNITY_ACCESS_INSTANCED_PROP( Props, _DepthScale );
                float _depthoffset_var = UNITY_ACCESS_INSTANCED_PROP( Props, _depthoffset );
                return fixed4(finalColor * saturate(lerp(_underneathTransparency_var,(node_918+((saturate((sceneZ-partZ))*_DepthScale_var)+_depthoffset_var)),isFrontFace)),0);
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            Cull Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma target 3.0
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _ClipOffset)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 posWorld : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                float _ClipOffset_var = UNITY_ACCESS_INSTANCED_PROP( Props, _ClipOffset );
                clip((1.0 - (_ClipOffset_var+distance(objPos.rgb,i.posWorld.rgb))) - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}

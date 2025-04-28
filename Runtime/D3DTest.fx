//--------------------------------------------------------------------------------------
// Constant Buffer Variables
//--------------------------------------------------------------------------------------
cbuffer ConstantBuffer : register(b0)
{
	matrix World;
	matrix Projection;
	float4 UVParams;
	float4 PalParams;
	float4 Color;
	float4 Extra;
}

//--------------------------------------------------------------------------------------
struct VS_OUTPUT
{
	float4 pos : SV_POSITION;
	float2 uv  : TEXCOORD0;
};

Texture2D palette : register(t0);
Texture2D pixels  : register(t1);
Texture2D tfilter  : register(t2);
Texture2D pixels8 : register(t3);

SamplerState PointSampler  : register(s0);
SamplerState LinearSamplerW : register(s1);
SamplerState LinearSamplerC : register(s2);

//--------------------------------------------------------------------------------------
// Vertex Shader
//--------------------------------------------------------------------------------------
VS_OUTPUT VS(float4 pos : POSITION, float2 uv : TEXCOORD)
{
	VS_OUTPUT output = (VS_OUTPUT)0;
	output.pos = mul(pos, World);
	output.pos = mul(output.pos, Projection);
	output.uv = uv * UVParams.zw + UVParams.xy;
	return output;
}


float4 pallookup(float2 uv)
{
	float  index = pixels.Sample(PointSampler, uv).x;
	return palette.Sample(PointSampler, float2(index, Extra.y));
}

#if UPSCALE >= 4
	float4 lookup(float2 uv)
	{
		return pallookup(uv);
	}

#else
	float4 lookup(float2 uv)
	{
		return pixels.Sample(PointSampler, uv);
	}
#endif

	float4 linlookup(float2 uv)
	{
		return pixels.Sample(LinearSamplerW, uv);
	}


float4 hq2x(float2 uv)
{
	const float mx = 0.325;      // start smoothing wt.
	const float k = -0.250;      // wt. decrease factor
	const float max_w = 0.25;    // max filter weigth
	const float min_w = -0.05;    // min filter weigth
	const float lum_add = 0.25;  // effects smoothing

	float2 dg1 = 0.5 / float2(416,256);
	float2 dg2 = float2(-dg1.x, dg1.y);
	float2 dx = float2(dg1.x, 0.0);
	float2 dy = float2(0.0, dg1.y);

	float2 t0 = uv;
	float4 t1 = float4(uv - dg1, uv - dy);
	float4 t2 = float4(uv - dg2, uv + dx);
	float4 t3 = float4(uv + dg1, uv + dy);
	float4 t4 = float4(uv + dg2, uv - dx);

	float4 color = lookup(t0);

	float3 c00 = lookup(t1.xy).xyz;
	float3 c10 = lookup(t1.zw).xyz;
	float3 c20 = lookup(t2.xy).xyz;
	float3 c01 = lookup(t4.zw).xyz;
	float3 c11 = color.xyz;
	float3 c21 = lookup(t2.zw).xyz;
	float3 c02 = lookup(t4.xy).xyz;
	float3 c12 = lookup(t3.zw).xyz;
	float3 c22 = lookup(t3.xy).xyz;
	float3 dt = float3(1.0, 1.0, 1.0);

	float md1 = dot(abs(c00 - c22), dt);
	float md2 = dot(abs(c02 - c20), dt);

	float w1 = dot(abs(c22 - c11), dt) * md2;
	float w2 = dot(abs(c02 - c11), dt) * md1;
	float w3 = dot(abs(c00 - c11), dt) * md2;
	float w4 = dot(abs(c20 - c11), dt) * md1;

	float tt1 = w1 + w3;
	float tt2 = w2 + w4;
	float ww = max(tt1, tt2) + 0.001;

	c11 = (w1 * c00 + w2 * c20 + w3 * c22 + w4 * c02 + ww * c11) / (tt1 + tt2 + ww);

	float lc1 = k / (0.12 * dot(c10 + c12 + c11, dt) + lum_add);
	float lc2 = k / (0.12 * dot(c01 + c21 + c11, dt) + lum_add);

	w1 = clamp(lc1 * dot(abs(c11 - c10), dt) + mx, min_w, max_w);
	w2 = clamp(lc2 * dot(abs(c11 - c21), dt) + mx, min_w, max_w);
	w3 = clamp(lc1 * dot(abs(c11 - c12), dt) + mx, min_w, max_w);
	w4 = clamp(lc2 * dot(abs(c11 - c01), dt) + mx, min_w, max_w);

	return float4(w1 * c10 + w2 * c21 + w3 * c12 + w4 * c01 + (1.0 - w1 - w2 - w3 - w4) * c11, color.w);


	return 0;
}

float4 hq4x(float2 uv)
{
	float mx = 1.0; // start smoothing wt.
	const float k = -1.10; // wt. decrease factor
	const float max_w = 0.75; // max filter weigth
	const float min_w = 0.03; // min filter weigth
	const float lum_add = 0.33; // effects smoothing

	float4 color = lookup(uv);
	float3 c = color.xyz;

	float x = 0.51 * (1.0 / 320);
	float y = 0.51 * (1.0 / 240);

	const float3 dt = 1.0 * float3(1.0, 1.0, 1.0);

	float2 dg1 = float2(x, y);
	float2 dg2 = float2(-x, y);

	float2 sd1 = dg1 * 0.5;
	float2 sd2 = dg2 * 0.5;

	float2 ddx = float2(x, 0.0);
	float2 ddy = float2(0.0, y);

	float4 t1 = float4(uv - sd1, uv - ddy);
	float4 t2 = float4(uv - sd2, uv + ddx);
	float4 t3 = float4(uv + sd1, uv + ddy);
	float4 t4 = float4(uv + sd2, uv - ddx);
	float4 t5 = float4(uv - dg1, uv - dg2);
	float4 t6 = float4(uv + dg1, uv + dg2);

	float3 i1 = lookup(t1.xy).xyz;
	float3 i2 = lookup(t2.xy).xyz;
	float3 i3 = lookup(t3.xy).xyz;
	float3 i4 = lookup(t4.xy).xyz;
	float3 o1 = lookup(t5.xy).xyz;
	float3 o3 = lookup(t6.xy).xyz;
	float3 o2 = lookup(t5.zw).xyz;
	float3 o4 = lookup(t6.zw).xyz;
	float3 s1 = lookup(t1.zw).xyz;
	float3 s2 = lookup(t2.zw).xyz;
	float3 s3 = lookup(t3.zw).xyz;
	float3 s4 = lookup(t4.zw).xyz;

	float ko1 = dot(abs(o1 - c), dt);
	float ko2 = dot(abs(o2 - c), dt);
	float ko3 = dot(abs(o3 - c), dt);
	float ko4 = dot(abs(o4 - c), dt);

	float k1 = min(dot(abs(i1 - i3), dt), max(ko1, ko3));
	float k2 = min(dot(abs(i2 - i4), dt), max(ko2, ko4));

	float w1 = k2; if (ko3 < ko1) w1 *= ko3 / ko1;
	float w2 = k1; if (ko4 < ko2) w2 *= ko4 / ko2;
	float w3 = k2; if (ko1 < ko3) w3 *= ko1 / ko3;
	float w4 = k1; if (ko2 < ko4) w4 *= ko2 / ko4;

	c = (w1 * o1 + w2 * o2 + w3 * o3 + w4 * o4 + 0.001 * c) / (w1 + w2 + w3 + w4 + 0.001);
	w1 = k * dot(abs(i1 - c) + abs(i3 - c), dt) / (0.125 * dot(i1 + i3, dt) + lum_add);
	w2 = k * dot(abs(i2 - c) + abs(i4 - c), dt) / (0.125 * dot(i2 + i4, dt) + lum_add);
	w3 = k * dot(abs(s1 - c) + abs(s3 - c), dt) / (0.125 * dot(s1 + s3, dt) + lum_add);
	w4 = k * dot(abs(s2 - c) + abs(s4 - c), dt) / (0.125 * dot(s2 + s4, dt) + lum_add);

	w1 = clamp(w1 + mx, min_w, max_w);
	w2 = clamp(w2 + mx, min_w, max_w);
	w3 = clamp(w3 + mx, min_w, max_w);
	w4 = clamp(w4 + mx, min_w, max_w);

	return float4((w1 * (i1 + i3) + w2 * (i2 + i4) + w3 * (s1 + s3) + w4 * (s2 + s4) + c) / (2.0 * (w1 + w2 + w3 + w4) + 1.0), color.w);
}

float4 Blur1(float2 vTex, float s)
{
	float4 theResult = 0;
	float2 dg1 = s / float2(1400, 900);

	for (float aU = -3; aU <= 2; aU++)
	{
		theResult += linlookup(float2(vTex.x + dg1.x * aU, vTex.y));
		theResult += linlookup(float2(vTex.x - dg1.x * aU, vTex.y));
		theResult += linlookup(float2(vTex.x, vTex.y - dg1.y * aU));
		theResult += linlookup(float2(vTex.x, vTex.y + dg1.y * aU));
	}
	return theResult / 20;
}

float4 Blur2(float2 uv,float sca)
{
	float2 dg1 = sca / float2(1600, 900);
	float2 dx = float2(dg1.x, 0.0);
	float2 dy = float2(0.0, dg1.y);

	float4 i0 = linlookup(uv);
	float4 i1 = linlookup(uv - dx);
	float4 i2 = linlookup(uv + dx);
	float4 i3 = linlookup(uv - dy);
	float4 i4 = linlookup(uv + dy);
				
	float4 i5 = linlookup(uv - dx + dy);
	float4 i6 = linlookup(uv + dx - dy);
	float4 i7 = linlookup(uv - dy - dx);
	float4 i8 = linlookup(uv + dy + dx);

	float4 fc = (i1 + i2 + i3 + i4 + i5 + i6 + i7 + i8);
	return fc/7.5f;

}

float4 Blur3(float2 uv, float s)
{
	float Offsets[11] =
	{
	  -5,
	  -4,
	  -3,
	  -2,
	  -1,
	  0,
	  1,
	  2,
	  3,
	  4,
	  5,
	};

	float Weights[11][11] =
	{
	  {0.007959,0.008049,0.00812,0.008171,0.008202,0.008212,0.008202,0.008171,0.00812,0.008049,0.007959},
	  {0.008049,0.00814,0.008212,0.008263,0.008294,0.008305,0.008294,0.008263,0.008212,0.00814,0.008049},
	  {0.00812,0.008212,0.008284,0.008336,0.008367,0.008378,0.008367,0.008336,0.008284,0.008212,0.00812},
	  {0.008171,0.008263,0.008336,0.008388,0.00842,0.00843,0.00842,0.008388,0.008336,0.008263,0.008171},
	  {0.008202,0.008294,0.008367,0.00842,0.008451,0.008462,0.008451,0.00842,0.008367,0.008294,0.008202},
	  {0.008212,0.008305,0.008378,0.00843,0.008462,0.008473,0.008462,0.00843,0.008378,0.008305,0.008212},
	  {0.008202,0.008294,0.008367,0.00842,0.008451,0.008462,0.008451,0.00842,0.008367,0.008294,0.008202},
	  {0.008171,0.008263,0.008336,0.008388,0.00842,0.00843,0.00842,0.008388,0.008336,0.008263,0.008171},
	  {0.00812,0.008212,0.008284,0.008336,0.008367,0.008378,0.008367,0.008336,0.008284,0.008212,0.00812},
	  {0.008049,0.00814,0.008212,0.008263,0.008294,0.008305,0.008294,0.008263,0.008212,0.00814,0.008049},
	  {0.007959,0.008049,0.00812,0.008171,0.008202,0.008212,0.008202,0.008171,0.00812,0.008049,0.007959},
	};

	float2 dg1 = s / float2(1400, 900);

	float4 Color = { 0, 0, 0, 0 };

	float2 Blur;

	for (int x = 0; x < 11; x++)
	{
		Blur.x = uv.x + Offsets[x] * dg1.x;
		for (int y = 0; y < 11; y++)
		{
			Blur.y = uv.y + Offsets[y] * dg1.y;
			Color += linlookup(Blur)* Weights[x][y];
		}
	}

	return Color;
}


//--------------------------------------------------------------------------------------
// Pixel Shader
//--------------------------------------------------------------------------------------
float4 PS_RAW8(VS_OUTPUT input) : SV_Target
{
	return pallookup(input.uv);
	//return pixels.Sample(PointSampler, input.uv);
}

float4 PS_UP(VS_OUTPUT input) : SV_Target
{
	float4 tcolor = Blur3(input.uv,0.4f);
	float4 filter = tfilter.Sample(LinearSamplerW, float2(input.pos.x / 6.0f, input.pos.y / 6.0f));
	tcolor.w = 1;
	float4 flt = pow(filter, 1.2f);
	flt.w = 1;
	return tcolor*flt;
}

float4 PS(VS_OUTPUT input) : SV_Target
{
#if UPSCALE >= 4
	float4 tcolor = hq4x(input.uv);
#else
	float4 tcolor = pallookup(input.uv);
#endif
	
	tcolor = lerp(Color, pow(tcolor, 1.1f), Extra.z);
	tcolor.w *= Extra.w;

	float4 filter = tfilter.Sample(LinearSamplerW, float2(input.pos.x / 4.f, input.pos.y / 4.f));
	float4 flt = pow(filter, 1.8f);
	flt.w = 1;
	return tcolor*flt;
}


float3 rgb2hsv(float3 c)
{
    float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
    float4 p = lerp(float4(c.bg, K.wz), float4(c.gb, K.xy), step(c.b, c.g));
    float4 q = lerp(float4(p.xyw, c.r), float4(c.r, p.yzx), step(p.x, c.r));

    float d = q.x - min(q.w, q.y);
    float e = 1.0e-10;
    return float3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
}

float3 hsv2rgb(float3 c)
{
    float4 K = float4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    float3 p = abs(frac(c.xxx + K.xyz) * 6.0 - K.www);
    return c.z * lerp(K.xxx, saturate(p - K.xxx), c.y);
}

float4 hsvreplace(float2 uv, float3 shift)
{
	// LinearSamplerC
    float4 srccolor = pixels.Sample(LinearSamplerC, uv);
    float3 hsv = rgb2hsv(srccolor.xyz);
		
    const float px = 1.0 / 512.0;
	
    float2 kernel[] =
    {
		float2(0,0),
        float2( - px,  0),
		float2( + px,  0),
		float2(    0,  + px),
		float2(    0,  - px),
		float2(-px, -px),
		float2(+px, -px),
		float2(-px, +px),
		float2(+px, +px),
    };
	
    for (int i = 0; i < 5;i++)
    {
        float expalind = pixels8.Sample(PointSampler, uv + kernel[i]).x;
		
        float paldist = expalind - PalParams.x;
		
        if (paldist >= 0 && paldist < PalParams.y)
        {			
            hsv.x = (hsv.x + shift.x) % 1.0;
            hsv.yz = saturate(hsv.yz + shift.yz);
            return float4(hsv2rgb(hsv), srccolor.w);
        }
    }
	
	
    return srccolor;
}

float4 PS_BG(VS_OUTPUT input) : SV_Target
{
    float4 tcolor = pixels.Sample(PointSampler, input.uv);
    float4 gs = Extra.x;
    tcolor = lerp(Color, tcolor, Extra.z);
    tcolor.xyz *= gs;
    tcolor.w *= Extra.w;
    return tcolor;
}

float4 PS4X(VS_OUTPUT input) : SV_Target
{
    float4 tcolor = pixels.Sample(LinearSamplerC, input.uv);
    float4 gs = Extra.x;

    tcolor = lerp(Color, tcolor, Extra.z);
    tcolor.xyz *= gs;
    tcolor.w *= Extra.w;
    return tcolor;
}

float4 PS4X_P1(VS_OUTPUT input) : SV_Target
{    
    float4 tcolor = hsvreplace(input.uv, float3(PalParams.z, 0, -0.15));
	float4 gs = Extra.x;
	
    tcolor = lerp(Color, tcolor, Extra.z);
    tcolor.xyz *= gs;
    tcolor.w *= Extra.w;
    return tcolor;
}

float4 PS_RAW32(VS_OUTPUT input) : SV_Target
{
	return pixels.Sample(LinearSamplerC, input.uv);
}

float4 PS1(VS_OUTPUT input) : SV_Target
{

#if UPSCALE >= 4
	float4 tcolor = hq4x(input.uv);
#elif UPSCALE == 3
	float4 tcolor = hq2x(input.uv);
#elif UPSCALE == 2
	float4 tcolor = hq2x(input.uv);
#else
	float4 tcolor = lookup(input.uv);
#endif

	float4 filter = tfilter.Sample(LinearSamplerW, float2(input.pos.x / 6.f, input.pos.y / 4.f));
	float4 flt = pow(filter, 2.8f);
	flt.w = 1;
	return flt * pow(tcolor,1.13f);
}

float4 PS0(VS_OUTPUT input) : SV_Target
{
	float4 tcolor = pixels.Sample(LinearSamplerC, input.uv);
	//float4 tcolor = hq4x(input.uv);
	float4 filter = tfilter.Sample(LinearSamplerW, float2(input.pos.x / 4.f, input.pos.y / 4.f));
	float4 flt = pow(filter, 2.1f);
	flt.w = 1;
	return flt*pow(tcolor,1.1f);
}





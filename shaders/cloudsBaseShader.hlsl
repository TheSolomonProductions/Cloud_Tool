Texture2D    CloudTex     : register(t0);
SamplerState CloudSampler : register(s0);

cbuffer CloudParams : register(b0)
{
    float3 RedColor;    float _pad0;
    float3 GreenColor;  float _pad1;
    float3 BlueColor;   float _pad2;
};

float3 CloudColor(float2 uv)
{
    float3 mask = CloudTex.Sample(CloudSampler, uv).rgb;

    return RedColor   * mask.r
         + GreenColor * mask.g
         + BlueColor  * mask.b;
}

float4 PSMain(float4 pos : SV_Position, float2 uv : TEXCOORD0) : SV_Target
{
    return float4(CloudColor(uv), 1.0);
}
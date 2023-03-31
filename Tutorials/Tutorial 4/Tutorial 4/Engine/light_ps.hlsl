// Light pixel shader
// Calculate diffuse lighting for a single directional light(also texturing)

cbuffer LightBuffer : register(b0)
{
	float4 ambientColor;//to add in a way to take ambient light data
    float4 diffuseColor;
    float3 lightDirection;
    float padding;
};

struct InputType
{
    float4 position : SV_POSITION;
    float2 tex : TEXCOORD0;
    float3 normal : NORMAL;
};

float4 main(InputType input) : SV_TARGET
{
    float3	lightDir;
    float	lightIntensity;
    float4	color;
	
	// set color to ambient color
	color = ambientColor;

	// Invert the light direction for calculations.
    lightDir = -lightDirection;

    // Calculate the amount of light on this pixel.
    lightIntensity = saturate(dot(input.normal, lightDir));

	// Determine the final amount of diffuse color based on the diffuse color combined with the light intensity.
    //comment below line when doing ambientlighting
	//color = saturate(diffuseColor * lightIntensity);

	//ambient light conditions
	if (lightIntensity > 0.0f) {
		color += (diffuseColor * lightIntensity);
	}

    return color;
}


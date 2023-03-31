// Colour pixel/fragment shader
// Basic fragment shader outputting a colour

struct InputType
{
	float4 position : SV_POSITION;
	float4 colour : COLOR;
	float4 screenPosition : SCREEN_POSITION;
};


float4 main(InputType input) : SV_TARGET
{
	//version 1
	input.colour = float4(1.0f, 1.0f, 1.0f, 1.0f);
	float4 screen_pos = float4(input.screenPosition.x, input.screenPosition.y, input.screenPosition.z, 1.0f);
	float4 finalCalc = input.colour * screen_pos;

	// version 2 where we normalise and it blends the colours
	//float4 finalCalc = normalize(input.colour * screen_pos);
	
	// version 3 simple use inbuilt screen position and input changes depending on where triangle is
	//input.colour = input.screenPosition;
	return finalCalc;
	//return input.colour;
}
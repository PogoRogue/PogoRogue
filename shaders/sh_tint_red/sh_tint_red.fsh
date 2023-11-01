//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    gl_FragColor = vec4(1.0, 0.4, 0.4, 1.0) * texture2D( gm_BaseTexture, v_vTexcoord );
}
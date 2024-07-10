varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3 colors[4];
uniform float invert;

void main() {
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	float index = floor(gl_FragColor.r * 3.0);
	vec3 col = colors[int(index)];
	vec3 colInvert = colors[int(3.0 - index)];
	gl_FragColor.rgb = mix(col, colInvert, invert);
}

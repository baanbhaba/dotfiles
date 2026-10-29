#version 300 es
precision highp float;

in vec2 v_texcoord;
uniform sampler2D tex;
out vec4 fragColor;

void main() {
    vec4 pixColor = texture(tex, v_texcoord);
    // Warm color temperature filter (reducing blue, soothing amber tone)
    vec3 warmColor = vec3(
        pixColor.r * 1.0,
        pixColor.g * 0.88,
        pixColor.b * 0.65
    );
    fragColor = vec4(warmColor, pixColor.a);
}

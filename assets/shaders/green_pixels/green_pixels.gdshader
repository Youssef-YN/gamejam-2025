shader_type canvas_item;

void fragment() {
    vec4 tex_color = texture(TEXTURE, UV);
    COLOR = tex_color * vec4(0.0, 1.0, 0.0, 1.0);
}

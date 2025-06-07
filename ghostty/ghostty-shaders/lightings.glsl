#define BLACK_BLEND_THRESHOLD .4 // This is controls the dim of the screen
const float timeMultiplier = 0.1f;

void mainImage(out vec4 o, vec2 u)
{
    vec2 termUV = u.xy / iResolution.xy;
    vec2 v = iResolution.xy;
    u = .2 * (u + u - v) / v.y;

    vec4 z = o = vec4(1, 2, 3, 0);

    for (float a = .5, t = iTime * timeMultiplier, i;
        ++i < 19.;
        o += (1. + cos(z + t))
                / length((1. + i * dot(v, v))
                        * sin(1.5 * u / (.5 - dot(u, u)) - 9. * u.yx + t))
    )
        v = cos(++t - 7. * u * pow(a += .03, i)) - 5. * u,
        // use stanh here if shader has black artifacts
        //   vvvv
        u += tanh(40. * dot(u *= mat2(cos(i + .02 * t - vec4(0, 11, 33, 0))), u)
                    * cos(1e2 * u.yx + t)) / 2e2
                + .2 * a * u
                + cos(4. / exp(dot(o, o) / 1e2) + t) / 3e2;

    o = 25.6 / (min(o, 13.) + 164. / o)
            - dot(u, u) / 250.;

    vec4 terminalColor = texture(iChannel0, termUV);

    float alpha = step(length(terminalColor.rgb), BLACK_BLEND_THRESHOLD);
    vec3 blendedColor = mix(terminalColor.rgb, o.rgb * 0.2, alpha);

    o = vec4(blendedColor, terminalColor.a);
}

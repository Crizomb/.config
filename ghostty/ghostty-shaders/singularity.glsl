
/*
    "Singularity" by @XorDev

    A whirling blackhole.
    Feel free to code golf!

    FabriceNeyret2: -19
    dean_the_coder: -12
    iq: -4
*/

#define BLACK_BLEND_THRESHOLD .4 // This is controls the dim of the screen
const float timeMultiplier = 0.1f;
const float diagonaleBand = 0.35f;

void mainImage(out vec4 O, in vec2 F)
{
    vec2 uv = F.xy / iResolution.xy;
    vec4 col = vec4(0.0);
    // Avoid useless calcul for performance
    if (uv.x < uv.y + diagonaleBand && uv.x > uv.y - diagonaleBand) {
        //Iterator and attenuation (distance-squared)
        float i = .2, a;
        //Resolution for scaling and centering
        vec2 r = iResolution.xy,
        //Centered ratio-corrected coordinates
        p = (F + F - r) / r.y / .7,
        //Diagonal vector for skewing
        d = vec2(-1, 1),
        //Blackhole center
        b = p - i * d,
        //Rotate and apply perspective
        c = p * mat2(1, 1, d / (.1 + i / dot(b, b))),
        //Rotate into spiraling coordinates
        v = c * mat2(cos(.5 * log(a = dot(c, c)) + iTime * i + vec4(0, 33, 11, 0))) / i,
        //Waves cumulative total for coloring
        w;

        //Loop through waves
        for (; i++ < 9.; w += 1. + sin(v))
            //Distort coordinates
            v += .7 * sin(v.yx * i + iTime) / i + .5;
        //Acretion disk radius
        i = length(sin(v / .3) * .4 + c * (3. + d));
        //Red/blue gradient
        O = 1. - exp(-exp(c.x * vec4(.6, -.4, -1, 0.0))
                        //Wave coloring
                        / w.xyyx
                        //Acretion disk brightness
                        / (2. + i * i / 4. - i)
                        //Center darkness
                        / (.5 + 1. / a)
                        //Rim highlight
                        / (.03 + abs(length(p) - .7))
                );
        col = O;
    }
    vec2 fragCoord = F;

    vec2 termUV = fragCoord.xy / iResolution.xy;
    vec4 terminalColor = texture(iChannel0, termUV);

    float alpha = step(length(terminalColor.rgb), BLACK_BLEND_THRESHOLD);
    vec3 blendedColor = mix(terminalColor.rgb * 1.0, col.rgb * 0.3, alpha);

    O = vec4(blendedColor, terminalColor.a);
}

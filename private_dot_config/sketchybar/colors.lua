return {
  black = 0xff24273a,
  white = 0xffcad3f5,
  red = 0xffed8796,
  green = 0xffa6da95,
  blue = 0xff8aadf4,
  yellow = 0xffeed49f,
  orange = 0xfff39660,
  magenta = 0xffb39df3,
  grey = 0xff8087a2,
  transparent = 0x00000000,

  bar = {
    bg = 0,
    border = 0xff24273a,
  },
  popup = {
    bg = 0xff24273a,
    border = 0xff24273a
  },
  bg1 = 0xff24273a,
  bg2 = 0xff24273a,

  with_alpha = function(color, alpha)
    if alpha > 1.0 or alpha < 0.0 then return color end
    return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
  end,
}

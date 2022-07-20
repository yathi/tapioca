# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `ansi` gem.
# Please instead update this file by running `bin/tapioca gem ansi`.

# ANSI namespace module contains all the ANSI related classes.
#
# source://ansi-1.5.0/lib/ansi/code.rb:1
module ANSI
  extend ::ANSI::Constants
  extend ::ANSI::Code
end

# Table of codes used throughout the system.
#
# @see http://en.wikipedia.org/wiki/ANSI_escape_code
#
# source://ansi-1.5.0/lib/ansi/chart.rb:6
ANSI::CHART = T.let(T.unsafe(nil), Hash)

# ANSI Codes
#
# Ansi::Code module makes it very easy to use ANSI codes.
# These are especially nice for beautifying shell output.
#
#   Ansi::Code.red + "Hello" + Ansi::Code.blue + "World"
#   => "\e[31mHello\e[34mWorld"
#
#   Ansi::Code.red{ "Hello" } + Ansi::Code.blue{ "World" }
#   => "\e[31mHello\e[0m\e[34mWorld\e[0m"
#
# IMPORTANT! Do not mixin Ansi::Code, instead use {ANSI::Mixin}.
#
# See {ANSI::CHART} for list of all supported codes.
#
# source://ansi-1.5.0/lib/ansi/code.rb:37
module ANSI::Code
  include ::ANSI::Constants
  extend ::ANSI::Constants
  extend ::ANSI::Code

  # Return ANSI code given a list of symbolic names.
  #
  # source://ansi-1.5.0/lib/ansi/code.rb:60
  def [](*codes); end

  # Apply ANSI codes to a first argument or block value.
  #
  # @example
  #   ansi("Valentine", :red, :on_white)
  # @example
  #   ansi(:red, :on_white){ "Valentine" }
  # @return [String] String wrapped ANSI code.
  #
  # source://ansi-1.5.0/lib/ansi/code.rb:176
  def ansi(*codes); end

  # Move cursor left a specified number of spaces.
  #
  # source://ansi-1.5.0/lib/ansi/code.rb:149
  def back(spaces = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def black_on_black(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def black_on_blue(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def black_on_cyan(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def black_on_green(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def black_on_magenta(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def black_on_red(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def black_on_white(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def black_on_yellow(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def blue_on_black(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def blue_on_blue(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def blue_on_cyan(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def blue_on_green(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def blue_on_magenta(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def blue_on_red(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def blue_on_white(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def blue_on_yellow(string = T.unsafe(nil)); end

  # Look-up code from chart, or if Integer simply pass through.
  # Also resolves :random and :on_random.
  #
  # @param codes [Array<Symbol,Integer]
  # Symbols or integers to convert to ANSI code.] odes [Array<Symbol,Integer]
  #   Symbols or integers to convert to ANSI code.
  # @return [String] ANSI code
  #
  # source://ansi-1.5.0/lib/ansi/code.rb:241
  def code(*codes); end

  # Apply ANSI codes to a first argument or block value.
  # Alternate term for #ansi.
  #
  # @deprecated May change in future definition.
  # @example
  #   ansi("Valentine", :red, :on_white)
  # @example
  #   ansi(:red, :on_white){ "Valentine" }
  # @return [String] String wrapped ANSI code.
  #
  # source://ansi-1.5.0/lib/ansi/code.rb:176
  def color(*codes); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def cyan_on_black(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def cyan_on_blue(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def cyan_on_cyan(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def cyan_on_green(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def cyan_on_magenta(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def cyan_on_red(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def cyan_on_white(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def cyan_on_yellow(string = T.unsafe(nil)); end

  # Like +move+ but returns to original position after
  # yielding the block.
  #
  # source://ansi-1.5.0/lib/ansi/code.rb:120
  def display(line, column = T.unsafe(nil)); end

  # Move cursor down a specified number of spaces.
  #
  # source://ansi-1.5.0/lib/ansi/code.rb:144
  def down(spaces = T.unsafe(nil)); end

  # Move cursor right a specified number of spaces.
  #
  # source://ansi-1.5.0/lib/ansi/code.rb:155
  def forward(spaces = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def green_on_black(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def green_on_blue(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def green_on_cyan(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def green_on_green(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def green_on_magenta(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def green_on_red(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def green_on_white(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def green_on_yellow(string = T.unsafe(nil)); end

  # Creates an xterm-256 color code from a CSS-style color string.
  #
  # @param string [String] Hex string in CSS style, .e.g. `#5FA0C2`.
  # @param background [Boolean] Use `true` for background color, otherwise foreground color.
  #
  # source://ansi-1.5.0/lib/ansi/code.rb:325
  def hex_code(string, background = T.unsafe(nil)); end

  # Move cursor left a specified number of spaces.
  #
  # source://ansi-1.5.0/lib/ansi/code.rb:149
  def left(spaces = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def magenta_on_black(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def magenta_on_blue(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def magenta_on_cyan(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def magenta_on_green(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def magenta_on_magenta(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def magenta_on_red(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def magenta_on_white(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def magenta_on_yellow(string = T.unsafe(nil)); end

  # Use method missing to dispatch ANSI code methods.
  #
  # source://ansi-1.5.0/lib/ansi/code.rb:89
  def method_missing(code, *args, &blk); end

  # Move cursor to line and column.
  #
  # source://ansi-1.5.0/lib/ansi/code.rb:134
  def move(line, column = T.unsafe(nil)); end

  # Provides a random primary ANSI color.
  #
  # @param background [Boolean] Use `true` for background color, otherwise foreground color.
  # @return [Integer] ANSI color number
  #
  # source://ansi-1.5.0/lib/ansi/code.rb:274
  def random(background = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def red_on_black(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def red_on_blue(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def red_on_cyan(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def red_on_green(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def red_on_magenta(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def red_on_red(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def red_on_white(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def red_on_yellow(string = T.unsafe(nil)); end

  # Creates an XTerm 256 color escape code from RGB value(s). The
  # RGB value can be three arguments red, green and blue respectively
  # each from 0 to 255, or the RGB value can be a single CSS-style
  # hex string.
  #
  # @param background [Boolean] Use `true` for background color, otherwise foreground color.
  #
  # source://ansi-1.5.0/lib/ansi/code.rb:286
  def rgb(*args); end

  # Given red, green and blue values between 0 and 255, this method
  # returns the closest XTerm 256 color value.
  #
  # @raise [ArgumentError]
  #
  # source://ansi-1.5.0/lib/ansi/code.rb:335
  def rgb_256(r, g, b); end

  # Creates an xterm-256 color from rgb value.
  #
  # @param background [Boolean] Use `true` for background color, otherwise foreground color.
  #
  # source://ansi-1.5.0/lib/ansi/code.rb:313
  def rgb_code(red, green, blue, background = T.unsafe(nil)); end

  # Move cursor right a specified number of spaces.
  #
  # source://ansi-1.5.0/lib/ansi/code.rb:155
  def right(spaces = T.unsafe(nil)); end

  # Apply ANSI codes to a first argument or block value.
  # Alias for #ansi method.
  #
  # @deprecated Here for backward compatibility.
  # @example
  #   ansi("Valentine", :red, :on_white)
  # @example
  #   ansi(:red, :on_white){ "Valentine" }
  # @return [String] String wrapped ANSI code.
  #
  # source://ansi-1.5.0/lib/ansi/code.rb:176
  def style(*codes); end

  # Remove ANSI codes from string or block value.
  #
  # @param string [String] String from which to remove ANSI codes.
  # @return [String] String wrapped ANSI code.
  #
  # source://ansi-1.5.0/lib/ansi/code.rb:201
  def unansi(string = T.unsafe(nil)); end

  # Remove ANSI codes from string or block value.
  # Alias for unansi.
  #
  # @deprecated May change in future definition.
  # @param string [String] String from which to remove ANSI codes.
  # @return [String] String wrapped ANSI code.
  #
  # source://ansi-1.5.0/lib/ansi/code.rb:201
  def uncolor(string = T.unsafe(nil)); end

  # Remove ANSI codes from string or block value.
  # Alias for #unansi method.
  #
  # @deprecated Here for backwards compatibility.
  # @param string [String] String from which to remove ANSI codes.
  # @return [String] String wrapped ANSI code.
  #
  # source://ansi-1.5.0/lib/ansi/code.rb:201
  def unstyle(string = T.unsafe(nil)); end

  # Move cursor up a specified number of spaces.
  #
  # source://ansi-1.5.0/lib/ansi/code.rb:139
  def up(spaces = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def white_on_black(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def white_on_blue(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def white_on_cyan(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def white_on_green(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def white_on_magenta(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def white_on_red(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def white_on_white(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def white_on_yellow(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def yellow_on_black(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def yellow_on_blue(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def yellow_on_cyan(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def yellow_on_green(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def yellow_on_magenta(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def yellow_on_red(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def yellow_on_white(string = T.unsafe(nil)); end

  # source://ansi-1.5.0/lib/ansi/code.rb:70
  def yellow_on_yellow(string = T.unsafe(nil)); end

  class << self
    # List of primary colors.
    #
    # source://ansi-1.5.0/lib/ansi/code.rb:55
    def colors; end

    # List of primary styles.
    #
    # source://ansi-1.5.0/lib/ansi/code.rb:50
    def styles; end
  end
end

# ANSI clear code.
#
# source://ansi-1.5.0/lib/ansi/code.rb:47
ANSI::Code::ENDCODE = T.let(T.unsafe(nil), String)

# Regexp for matching most ANSI codes.
#
# source://ansi-1.5.0/lib/ansi/code.rb:44
ANSI::Code::PATTERN = T.let(T.unsafe(nil), Regexp)

# Converts {CHART} and {SPECIAL_CHART} entries into constants.
# So for example, the CHART entry for :red becomes:
#
#   ANSI::Constants::RED  #=> "\e[31m"
#
# The ANSI Constants are include into ANSI::Code and can be included
# any where will they would be of use.
#
# source://ansi-1.5.0/lib/ansi/constants.rb:13
module ANSI::Constants; end

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::BLACK = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::BLINK = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::BLINK_OFF = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::BLUE = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::BOLD = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::BOLD_OFF = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::BRIGHT = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::BRIGHT_OFF = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::CLEAN = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::CLEAR = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:20
ANSI::Constants::CLEAR_EOL = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:20
ANSI::Constants::CLEAR_LEFT = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:20
ANSI::Constants::CLEAR_LINE = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:20
ANSI::Constants::CLEAR_RIGHT = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:20
ANSI::Constants::CLEAR_SCREEN = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:20
ANSI::Constants::CLR = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:20
ANSI::Constants::CLS = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::CONCEAL = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::CONCEALED = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::CONCEAL_OFF = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::CROSSED_OFF = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::CROSSED_OUT_OFF = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:20
ANSI::Constants::CURSOR_HIDE = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:20
ANSI::Constants::CURSOR_SHOW = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::CYAN = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::DARK = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::DEFAULT_FONT = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::DOUBLE_UNDERLINE = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::ENCIRCLE = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::ENCIRCLE_OFF = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::FAINT = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::FONT0 = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::FONT1 = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::FONT2 = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::FONT3 = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::FONT4 = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::FONT5 = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::FONT6 = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::FONT7 = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::FONT8 = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::FONT9 = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::FONT_DEFAULT = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::FRAKTUR = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::FRAKTUR_OFF = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::FRAME = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::FRAME_OFF = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::GREEN = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::HIDE = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::INVERSE = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::INVERSE_OFF = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::INVERT = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::ITALIC = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::ITALIC_OFF = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::MAGENTA = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::NEGATIVE = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::ON_BLACK = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::ON_BLUE = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::ON_CYAN = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::ON_GREEN = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::ON_MAGENTA = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::ON_RED = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::ON_WHITE = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::ON_YELLOW = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::OVERLINE = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::OVERLINE_OFF = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::POSITIVE = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::RAPID = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::RAPID_BLINK = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::RED = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::RESET = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:20
ANSI::Constants::RESTORE = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::REVEAL = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::REVERSE = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:20
ANSI::Constants::SAVE = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::SHOW = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::SLOW_BLINK = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::STRIKE = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::SWAP = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::UNDERLINE = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::UNDERLINE_OFF = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::UNDERSCORE = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::WHITE = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/constants.rb:16
ANSI::Constants::YELLOW = T.let(T.unsafe(nil), String)

# source://ansi-1.5.0/lib/ansi/chart.rb:86
ANSI::SPECIAL_CHART = T.let(T.unsafe(nil), Hash)

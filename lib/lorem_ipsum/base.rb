module LoremIpsum
  module Base

    class NoMasError < StandardError; end
    class IncorrectFormat < StandardError; end

    def lorem_ipsum(arg)
      if /(\d+)([w|c|s|p])/i.match(arg)
        num = $1.to_i

        case $2.downcase
        when "w" then word(num)
        when "c" then character(num)
        when "s" then sentence(num)
        when "p" then paragraph(num)
        end
      else
        raise IncorrectFormat, "lorem_ipsum understands '1c' for one character, '1w' for one word, '1s' for one sentence, '5p' for five paragraphs, etc."
      end
    end

    private

      def paragraph(num)
        count = Paragraphs.size
        raise NoMasError, "Slow down cowboy, I only have #{count} paragraphs!" if num > count
        p = Paragraphs[0...num].join("</p></p>")
        "<p>#{p}</p>".html_safe
      end

      def sentence(num)
        s = Sentences[0...num].join('. ')
        "#{s}.".html_safe
      end

      def word(num)
        Words[0...num].join(' ').html_safe
      end

      def character(num)
        Words.join(' ').chars.to_a[0...num].join.html_safe
      end

  end
  
  include Base
end
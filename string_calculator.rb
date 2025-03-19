class StringCalculator
    def self.add(str)
        return 0 if str.empty?

        allowed_delimiters = [',', '//', "\n", ';', '-']
        unknown_delimiter = str.scan(/[^0-9#{Regexp.escape(allowed_delimiters.join)}]/)
        if unknown_delimiter.any?
            raise "Unknown delimiter found: #{unknown_delimiter.uniq.join}"
        end

        if(str.match?(/-\d+/))
            negative_num = str.scan(/-\d+/).map(&:to_i)
            raise "negative numbers not allowed #{negative_num.join(',')}"
        end
        new_str = str.gsub(/,|\/\/|\n|;/, "")
        new_str.chars.map(&:to_i).sum
    end
end

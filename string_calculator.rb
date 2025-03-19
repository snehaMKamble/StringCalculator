class StringCalculator
    def self.add(str)
        return 0 if str.empty?

        if(str.match?(/-\d+/))
            negative_num = str.scan(/-\d+/).map(&:to_i)
            raise "negative numbers not allowed #{negative_num.join(',')}"
        end

        if str.match?(/^\d+$/)
            return str.chars.map(&:to_i).sum
        end

        allowed_delimiter = [",", "\n", "//", "*", ";", "%"]
        delimiter_regex = Regexp.union(allowed_delimiter)
        numbers = str.split(delimiter_regex).map(&:to_i).reject { |num| num > 1000 }
        numbers.sum
    end
end
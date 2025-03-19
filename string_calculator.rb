class StringCalculator
    def self.add(str)
        return 0 if str.empty?
        sum = 0
        if(str.match?(/-\d+/))
            negative_num = str.scan(/-\d+/).map(&:to_i)
            raise "negative numbers not allowed #{negative_num.join(',')}"
        else
            new_str = str.gsub(/,|\/\/|\n|;/, "")
            sum = new_str.chars.map(&:to_i).sum
        end
        sum
    end
end


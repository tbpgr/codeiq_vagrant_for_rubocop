# encoding: utf-8
require "spec_helper"
require "answer"

describe Answer do
  context "ソースコードが100文字以下であること" do
    cases = [
      {
        case_no: 1,
        case_title: "check source length",
        max: 100,
      },
    ]

    cases.each do |c|
      it "#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = File.read("./lib/answer.rb")
          puts "%%%%%%%%%%%%%%%%%%%%%%%"
          puts "ソースコードサイズ=#{actual.size}"
          puts "%%%%%%%%%%%%%%%%%%%%%%%"

          # -- then --
          expect(actual.size).to be <= c[:max]
        ensure
          case_after c
        end
      end

      def case_before(c)
        # implement each case before
      end

      def case_after(c)
        # implement each case after
      end
    end
  end

  context "rubocopの警告を出すこと" do
    cases = [
      {
        case_no: 1,
        case_title: "警告6種類で小悪党突破",
        max: 6,
      },
      {
        case_no: 1,
        case_title: "警告12種類で悪党突破",
        max: 12,
      },
      {
        case_no: 1,
        case_title: "警告18種類で極悪人突破",
        max: 18,
      },
      {
        case_no: 1,
        case_title: "警告24種類で獄中王突破",
        max: 24,
      },
    ]

    cases.each do |c|
      it "#{c[:case_title]}" do
        begin
          case_before c

          # -- given --

          # -- when --
          rubocop_stdout = `rubocop ./lib/answer.rb`
          actual = rubocop_stdout.each_line.select {|v|v.count(":") == 4}.map {|v|v.split(":")[4].chop}.uniq
          if c[:case_no] == 4
            puts "%%%%%%%%%%%%%%%%%%%%%%%"
            puts "警告種類=#{actual.size}"
            puts "===警告内容 start==="
            actual.each_with_index {|warning, i|puts "\t#{i+1},#{warning}"}
            puts "===警告内容   end==="
            puts "%%%%%%%%%%%%%%%%%%%%%%%"
          end

          # -- then --
          expect(actual.size).to be >= c[:max]
        ensure
          case_after c
        end
      end

      def case_before(c)
        # implement each case before
      end

      def case_after(c)
        # implement each case after
      end
    end
  end
end

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
        case_title: "警告2種類で初級突破",
        max: 2,
      },
      {
        case_no: 1,
        case_title: "警告4種類で中級突破",
        max: 4,
      },
      {
        case_no: 1,
        case_title: "警告6種類で上級突破",
        max: 6,
      },
      {
        case_no: 1,
        case_title: "警告10種類で神級突破",
        max: 10,
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

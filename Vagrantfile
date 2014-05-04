# -*- mode: ruby -*-
# vi: set ft=ruby :

spec1='
# encoding: utf-8
require "spec_helper"
require "answer"
require "pp"

describe Answer do
  context "ソースコードの長さ" do
    cases = [
      {
        case_no: 1,
        case_title: "文字以下",
        max: 100,
      },
    ]

    cases.each do |c|
      it "#{c[:max]}#{c[:case_title]}" do
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
        case_title: "警告6種類以上で小悪党バッジ取得",
        max: 6,
      },
      {
        case_no: 2,
        case_title: "警告12種類以上で悪党バッジ取得",
        max: 12,
      },
      {
        case_no: 3,
        case_title: "警告18種類以上で極悪人バッジ取得",
        max: 18,
      },
      {
        case_no: 4,
        case_title: "警告24種類以上で獄中王バッジ取得",
        max: 24,
      },
    ]

    cases.each do |c|
      it "#{c[:case_title]}" do
        begin
          case_before c

          # -- given --

          # -- when --
          rubocop_stdout = \`rubocop ./lib/answer.rb\`
          actual = rubocop_stdout.each_line.select {|v|v.count(":") == 4}.map {|v|v.split(":")[4].chop}.sort.uniq
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
EOS
'

spec2='
# encoding: utf-8
require "spec_helper"
require "answer"

describe Answer do
  context "ソースコードの長さ" do
    cases = [
      {
        case_no: 1,
        case_title: "文字以下",
        max: 100,
      },
    ]

    cases.each do |c|
      it "#{c[:max]}#{c[:case_title]}" do
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
        case_title: "警告4種類以上で小悪党バッジ取得",
        max: 4,
      },
      {
        case_no: 2,
        case_title: "警告8種類以上で悪党バッジ取得",
        max: 8,
      },
      {
        case_no: 3,
        case_title: "警告10種類以上で極悪人バッジ取得",
        max: 10,
      },
      {
        case_no: 4,
        case_title: "警告15種類以上で獄中王バッジ取得",
        max: 15,
      },
    ]

    cases.each do |c|
      it "#{c[:case_title]}" do
        begin
          case_before c

          # -- given --

          # -- when --
          rubocop_stdout = \`rubocop ./lib/answer.rb\`
          actual = rubocop_stdout.each_line.select {|v|v.count(":") == 4}.map {|v|v.split(":")[4].chop}.sort.uniq
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
EOS
'

rubocop_yml1 =<<-HOGE

Void:
  Enabled: false
SpaceAroundOperators:
  Enabled: false
UselessAssignment:
  Enabled: false
EOS
HOGE

rubocop_yml2 =<<-HOGE

EmptyLines:
  Enabled: false
EmptyLinesAroundBody:
  Enabled: false
FinalNewline:
  Enabled: false
IndentationWidth:
  Enabled: false
LeadingCommentSpace:
  Enabled: false
SpaceAfterComma:
  Enabled: false
SpaceAroundOperators:
  Enabled: false
SpaceBeforeBlockBraces:
  Enabled: false
SpaceInsideBlockBraces:
  EnforcedStyle: no_space
SpaceInsideParens:
  Enabled: false
Void:
  Enabled: false
SpaceInsideHashLiteralBraces:
  EnforcedStyle: no_space
UselessAssignment:
  Enabled: false
EOS
HOGE

install_tree = 'sudo apt-get install tree'
remove_old_ruby = 'sudo apt-get remove ruby1.8'
install_packages_for_ruby = 'sudo apt-get -y install build-essential zlib1g-dev libssl-dev libreadline6-dev libyaml-dev'
wget_ruby_2_tar = 'wget http://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p451.tar.gz'
extract_ruby_2_tar = 'tar xvzf ruby-2.0.0-p451.tar.gz'
make_ruby =<<-EOS
cd ruby-2.0.0-p451
sudo ./configure --prefix=/usr/local
sudo make
sudo make install
EOS

remove_ruby_2_tmp_files =<<-EOS
rm -rf ruby-2.0.0-p451.tar.gz
rm -rf ruby-2.0.0-p451
EOS

install_gems =<<-EOS
gem install rubocop -v 0.21.0 --no-ri --no-rdoc
gem install rspec -v 2.14.1 --no-ri --no-rdoc
EOS

spec_helper =<<-HOGE

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
end
EOS
HOGE

make_work_dirs_and_files =<<-HOGE
mkdir sample
mkdir level1
mkdir level2
cd /home/vagrant/level1
mkdir lib
rspec -i
cd /home/vagrant/level2
mkdir lib
rspec -i
cd /home/vagrant/sample
mkdir lib
rspec -i
echo '# write your code' > /home/vagrant/level1/lib/answer.rb
echo '# write your code' > /home/vagrant/level2/lib/answer.rb
echo '# write your code' > /home/vagrant/sample/lib/answer.rb
cat <<EOS>/home/vagrant/level1/spec/answer_spec.rb#{spec1}
cat <<EOS>/home/vagrant/level2/spec/answer_spec.rb#{spec2}
cat <<EOS>/home/vagrant/sample/spec/answer_spec.rb#{spec1}
cat <<EOS>/home/vagrant/level1/spec/spec_helper.rb#{spec_helper}
cat <<EOS>/home/vagrant/level2/spec/spec_helper.rb#{spec_helper}
cat <<EOS>/home/vagrant/sample/spec/spec_helper.rb#{spec_helper}
cat <<EOS>/home/vagrant/level1/.rubocop.yml#{rubocop_yml1}
cat <<EOS>/home/vagrant/level2/.rubocop.yml#{rubocop_yml2}
HOGE

$script = <<SCRIPT
WORKING_DIR=`pwd`
#{install_tree}
#{remove_old_ruby}
#{install_packages_for_ruby}
#{wget_ruby_2_tar}
#{extract_ruby_2_tar}
#{make_ruby}
cd $WORKING_DIR
#{remove_ruby_2_tmp_files}
#{install_gems}
#{make_work_dirs_and_files}
chown -R vagrant:vagrant /home/vagrant
SCRIPT

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise64"
  config.vm.box_url = 'http://files.vagrantup.com/precise64.box'

  config.vm.provision "shell", inline: "echo 'start provision'"
  config.vm.provision "shell", inline: $script
  config.vm.provision "shell", inline: "echo 'finish provision'"
end

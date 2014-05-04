# CodeIQ「Ruby警官から警告を受けろ」問題 環境構築用 Vagrant

## 補足
このリポジトリの内容はCodeIQの「Ruby警官から警告を受けろ」問題の挑戦支援ツールです。  
出題開始までの期間に内容が変更される可能性があるので、問題公開前に利用する際は  
問題挑戦開始時に差分があるか確認することを推奨致します。  

## 環境構成

|－－    |項目                 |備考                  |
|:-------|:-------|:-------|
|OS      |Ubuntu 1204 LTS 64bit|--                    |
|Language|Ruby 2.0.0-p451      |rbenvm rvmは未使用    |
|Gem     |rubocop 0.21.0       |--                    |
|Gem     |rspec 2.14.1         |テストにご利用ください|

## 前提
* Vagrantのインストール
* VirtualBoxのインストール

## 動作確認済み環境
* Windows7
* Vagrant 1.5.3
* VirtualBox 4.3.10

## 利用手順
* 当リポジトリをclone

~~~
git clone https://github.com/tbpgr/codeiq_vagrant_for_rubocop.git
~~~

* cloneしたフォルダに移動

* VMを起動

~~~
vagrant up
~~~

※既にUbuntu 1204 LTS 64bitのBOXがあり、box名が異なる場合はVagrantfileのbox指定を変更する

* 数分～十数分程度かかると思いますので、こんなことをしながら待つ  
    ※既にUbuntu 1204 LTS 64bitのBOXがある場合はさほど時間がかからないと思います

    * コーヒーを飲む
    * トイレに行く
    * CodeIQの即答系問題を解く
    * 「rubocop vagrant up なう #CodeIQ #rubocop問題」とつぶやく

* 起動完了を確認(コンソールに「finish provision」と表示されたら完了です)

* SSHで接続します

~~~
vagrant ssh
~~~

* フォルダ構成を確認します

~~~
$ tree
.
|-- level1
|   |-- lib
|   |   `-- answer.rb
|   |-- .rspec
|   |-- .rubocop.yml
|   `-- spec
|       |-- answer_spec.rb
|       `-- spec_helper.rb
|-- level2
|   |-- lib
|   |   `-- answer.rb
|   |-- .rspec
|   |-- .rubocop.yml
|   `-- spec
|       |-- answer_spec.rb
|       `-- spec_helper.rb
|-- postinstall.sh
`-- sample
    |-- lib
    |   `-- answer.rb
    |-- .rspec
    |-- .rubocop.yml
    `-- spec
        |-- answer_spec.rb
        `-- spec_helper.rb
~~~

* 各フォルダについて

    * /home/vagrant/level1 => level1 問題用作業フォルダ
    * /home/vagrant/level2 => level2 問題用作業フォルダ
    * /home/vagrant/sample => 好きにご利用ください

* 各ファイルについて

    * answer.rb => 解答記述用ファイル
    * answer_spec.rb => 採点用テストファイル（内容を変更しないで利用してください）
    * .rubocop.yml => rubocopの規約ルール定義ファイル（内容を変更しないで利用してください）

* rubocopの動作確認をします

~~~
$ cd /home/vagrant/sample/lib
$ # コメントしかないコードに対してRuboCopを実行して警告が出ないことを確認
$ rubocop
Inspecting 1 file
.

1 file inspected, no offenses detected
~~~

/home/vagrant/sample/lib/answer.rbを編集して警告が1個出るコードを作成します  

~~~ruby
# Answer
class Answer
  def a
    "hoge"
  end
end
~~~

rubocopを実行します。  

~~~
$ rubocop
Inspecting 1 file
C

Offenses:

lib/answer.rb:4:5: C: Prefer single-quoted strings when you don't need string interpolation or special symbols.
    "hoge"
    ^^^^^^

1 file inspected, 1 offense detected
~~~

RSpecのテストを動かしてみます。

~~~bash
$ cd /home/vagrant/sample/
$ rspec -fd
Run options: include {:focus=>true}

All examples were filtered out; ignoring {:focus=>true}

Answer
  ソースコードの長さ
%%%%%%%%%%%%%%%%%%%%%%%
ソースコードサイズ=51
%%%%%%%%%%%%%%%%%%%%%%%
    100文字以下
  rubocopの警告を出すこと
    警告6種類以上で小悪党バッジ取得 (FAILED - 1)
    警告12種類以上で悪党バッジ取得 (FAILED - 2)
    警告18種類以上で極悪人バッジ取得 (FAILED - 3)
%%%%%%%%%%%%%%%%%%%%%%%
警告種類=1
===警告内容 start===
        1, Prefer single-quoted strings when you don't need string interpolation or special symbols.
===警告内容   end===
%%%%%%%%%%%%%%%%%%%%%%%
    警告24種類以上で獄中王バッジ取得 (FAILED - 4)

Failures:

  1) Answer rubocopの警告を出すこと 警告6種類以上で小悪党バッジ取得
     Failure/Error: expect(actual.size).to be >= c[:max]
       expected: >= 6
            got:    1
     # ./spec/answer_spec.rb:91:in `block (4 levels) in <top (required)>'

  2) Answer rubocopの警告を出すこと 警告12種類以上で悪党バッジ取得
     Failure/Error: expect(actual.size).to be >= c[:max]
       expected: >= 12
            got:    1
     # ./spec/answer_spec.rb:91:in `block (4 levels) in <top (required)>'

  3) Answer rubocopの警告を出すこと 警告18種類以上で極悪人バッジ取得
     Failure/Error: expect(actual.size).to be >= c[:max]
       expected: >= 18
            got:    1
     # ./spec/answer_spec.rb:91:in `block (4 levels) in <top (required)>'

  4) Answer rubocopの警告を出すこと 警告24種類以上で獄中王バッジ取得
     Failure/Error: expect(actual.size).to be >= c[:max]
       expected: >= 24
            got:    1
     # ./spec/answer_spec.rb:91:in `block (4 levels) in <top (required)>'

Finished in 0.98608 seconds
5 examples, 4 failures

Failed examples:

rspec ./spec/answer_spec.rb:72 # Answer rubocopの警告を出すこと 警告6種類以上で小悪党バッジ取得
rspec ./spec/answer_spec.rb:72 # Answer rubocopの警告を出すこと 警告12種類以上で悪党バッジ取得
rspec ./spec/answer_spec.rb:72 # Answer rubocopの警告を出すこと 警告18種類以上で極悪人バッジ取得
rspec ./spec/answer_spec.rb:72 # Answer rubocopの警告を出すこと 警告24種類以上で獄中王バッジ取得
~~~

※rspec実行時に出力される下記の部分でソースコードの文字数を確認できます。

~~~
%%%%%%%%%%%%%%%%%%%%%%%
ソースコードサイズ=51
%%%%%%%%%%%%%%%%%%%%%%%
~~~

※rspec実行時に出力される下記の部分で警告の種類を確認できます。

~~~
%%%%%%%%%%%%%%%%%%%%%%%
警告種類=1
===警告内容 start===
        1, Missing top-level class documentation comment.
        2, Prefer single-quoted strings when you don't need string interpolation or special symbols.
===警告内容   end===
%%%%%%%%%%%%%%%%%%%%%%%
~~~

* level1, level2それぞれのanswer.rbを編集＋rspecを実行しつつ問題を解く

* CodeIQで解答提出

* 問題へ挑戦が終わったらVMを削除します。  
※VirtualBoxのメニューから削除してもよいです

~~~
$ vagrant destroy
~~~

## Vagrant環境がない場合
当リポジトリをcloneするか、Download ZIPボタンを押してZIPをダウンロードしてください。  
ZIPをダウンロードした場合はZIPを解答してください。  
rootフォルダ以下をご利用ください。  
Ruby 2.0.0-p451,RuboCop 0.21.0,RSpec 2.14.1のインストールは各自でご対応ください。  

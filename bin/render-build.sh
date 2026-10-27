#!/usr/bin/env bash

# エラーが発生したら処理を停止する
set -o errexit

# 本番環境を指定
export RAILS_ENV=production

# 必要なGemをインストール
bundle install

# CSS・JavaScriptなどをコンパイル
bundle exec rails assets:precompile

# 古いアセットを削除
bundle exec rails assets:clean

# データベースのマイグレーションを実行
bundle exec rails db:migrate
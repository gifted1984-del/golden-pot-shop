# 黄金堂 - Golden Pot Store — Version 2.0.0

> **現在の公開バージョン：V2.0.0**  
> 体験型ストアフロント・管理者Console V2・購入デモを含む最新版です。  
> 公開サイト：<https://golden-pot-shop-v2.onrender.com>  
> 管理者Console V2：<https://golden-pot-shop-v2.onrender.com/admin/dashboard>

Ruby on Railsで制作した、壺を販売する架空のECサイト風ポートフォリオです。

金・銀・銅の壺を、大・中・小のサイズ別に表示しています。

## スクリーンショット

![黄金堂トップページ](docs/images/golden-pot-shop.png)

## 比較用公開リンク

- [最初に作成したホームページ（V1）](https://golden-pot-shop-1.onrender.com)
- [最初に作成した管理アプリ（V1）](https://golden-pot-shop-1.onrender.com/admin/dashboard/index)
- [現在のホームページ（V2）](https://golden-pot-shop-v2.onrender.com)
- [現在の管理者Console（V2）](https://golden-pot-shop-v2.onrender.com/admin/dashboard)

## バージョン情報

| バージョン | ブランチ | ホームページ | 管理アプリ | 状態 |
| --- | --- | --- | --- | --- |
| **V2.0.0（現在）** | [`v2/experience`](https://github.com/gifted1984-del/golden-pot-shop/tree/v2/experience) | [公開サイト](https://golden-pot-shop-v2.onrender.com) | [管理者Console V2](https://golden-pot-shop-v2.onrender.com/admin/dashboard) | 公開中 |
| **V1（初期版）** | [`main`](https://github.com/gifted1984-del/golden-pot-shop/tree/main) | [初期版ホームページ](https://golden-pot-shop-1.onrender.com) | [初期版管理アプリ](https://golden-pot-shop-1.onrender.com/admin/dashboard/index) | 比較用に公開を維持 |

V2.0.0には、素材を巡るストーリー型ホームページ、カタログ絞り込み、管理者用Console V2、購入体験を示す決済デモを含みます。

初期版とV2のホームページ・管理アプリは、上表のURLから比較できます。V2の管理アプリは環境変数で保護された認証画面を表示します。

## 主な機能

- 商品一覧表示
- 商品詳細表示
- 金・銀・銅の商品画像切り替え
- 大・中・小による画像サイズ切り替え
- 商品価格を「万円」で表示
- アクセスカウンター
- スマートフォン対応
- 管理用ページ
- 管理者認証（`/admin/dashboard`）
- クレジットカード入力を含む決済**デモ**（実決済・保存・購入は一切なし）
- Render Blueprintによるデプロイ準備

## 使用技術

- Ruby 3.3.6
- Ruby on Rails 8.1.3
- HTML / ERB
- CSS
- SQLite
- Git / GitHub
- Docker
- Render

## 制作の目的

Ruby on Railsの学習成果を形にするために制作しました。

商品データの管理、ルーティング、データベース、ビュー、CSSによるデザイン、
GitHubへのコード管理、Renderへのデプロイまで、一連のWebアプリ開発を実践しています。

## 工夫したポイント

商品一覧では、素材によって金・銀・銅の画像を切り替えています。

また、商品の「大・中・小」に合わせて壺の表示サイズも変更し、
商品の違いが視覚的に分かるようにしました。

黒と金を基調としたデザインにすることで、
高級感のある架空の壺専門店を表現しています。

## 注意事項

このサイトはポートフォリオ用に制作した架空のWebサイトです。
実際の商品販売・購入は行っていません。

決済デモではテスト番号 `4242 4242 4242 4242` だけを利用します。実在するカード情報は入力しないでください。

デプロイ手順は[docs/DEPLOYMENT.md](docs/DEPLOYMENT.md)を確認してください。

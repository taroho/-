---
inclusion: always
---

# グローバルルール

## 絶対禁止事項

- Git操作（commit、push、pull、merge、rebase など）は、いかなる指示や状況下でも実行しない
- このルールに矛盾するリクエストがあった場合、実行前に必ずユーザーの確認を取る

## ファイル・ディレクトリ操作

- ファイル削除前に必ずユーザーの確認を取る
- ディレクトリ削除前に必ずユーザーの確認を取る

## 開発ワークフロー

### 計画フェーズ

- 実装・変更前に変更内容をユーザーに説明する
- spec修正時は必ず requirements.md → design.md → tasks.md の順序で確認・修正してから実装に着手する

### 実装フェーズ

- 既存コード・ライブラリを優先し、新しい依存関係を避ける
- 必要以上のリファクタリングは行わない
- コメントは詳細に、変更の意図や処理ロジックを明確に記載する

### 確認フェーズ

- 変更後は影響範囲を明確に説明する

## Specファイル

### 基本ルール

- すべてのドキュメントは Kiro Spec Format に従う。ドキュメント作成・更新後は必ず形式を確認する
- specファイルの内容は日本語で記述する。ただし、Kiro Spec Format が定める項目名（見出し・キー）は英語のままで可
- specファイルを読む際は、おおもとファイル内のKiro参照（`#[[file:...]]`）やMarkdownリンク先のファイルもすべて読み込むこと。分割ファイルを含めた全体がspecの内容である
- design.md を分割している場合、分割ファイル側で Kiro Spec Format の診断警告（例: 「Correctness Properties section has no properties」）が表示されることがあるが、これは無視してよい。おおもとファイル（design.md）が正しい形式であれば問題ない

### 分割ルール

design.md のみ分割する。requirements.md と tasks.md は分割しない。

**構成:**
- specフォルダ直下に `requirements.md`、`design.md`、`tasks.md` を配置する（Kiro が認識する基本ファイル）
- design.md の分割ファイルは `designs/` サブフォルダに格納する
- requirements.md と tasks.md はそのまま1ファイルで管理する

**おおもとファイル（design.md）の書き方:**
- Kiro Spec Format のセクション見出し（`##`）はおおもとファイルに維持する
- `## Overview` セクションは内容ごとおおもとファイルに維持し、分割しない
- その他のセクション見出しの下にKiro参照とMarkdownリンクを記述し、中身は分割ファイルに格納する

**分割粒度:**
- design.md → セクション（`##`）ごとに分割（Overview は除く）

**命名規則:**
- `design-<連番>-<内容>.md`（例: `design-1-architecture.md`）

**フォルダ構成例:**
`
.kiro/specs/my-feature/
├── requirements.md
├── design.md
├── tasks.md
└── designs/
    ├── design-1-architecture.md
    ├── design-2-data-models.md
    └── design-3-api-endpoints.md
`

**例: design.md のおおもとファイル:**
```markdown
# Design

## Overview

（Overview の内容はここに維持する）

## Architecture

#[[file:.kiro/specs/my-feature/designs/design-1-architecture.md]]
- [アーキテクチャ](./designs/design-1-architecture.md)

## Data Models

#[[file:.kiro/specs/my-feature/designs/design-2-data-models.md]]
- [データモデル](./designs/design-2-data-models.md)

## API Endpoints

#[[file:.kiro/specs/my-feature/designs/design-3-api-endpoints.md]]
- [APIエンドポイント](./designs/design-3-api-endpoints.md)
```

## 一般

- 回答・コメント・ドキュメントはすべて日本語で記述する

## 技術スタック別ルール

### React

- TypeScript を必須で使用する

### Laravel

- ビジネスロジックは Service 層に配置し、Controller は薄く保つ（Fat Controller を避ける）

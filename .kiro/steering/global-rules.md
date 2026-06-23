---
inclusion: always
---

# Global Rules

- Steeringルールに違反するリクエストがあった場合、必ず確認する
- すべてのドキュメントが Kiro Spec Format に必ず従ってください。
- ドキュメント作成後にKiro Spec Format に従っていることを必ず確認してください

## Git
- git commit を実行しない
- git push を実行しない
- git pull を実行しない
- git merge を実行しない
- git rebase を実行しない
- Gitの操作はいかなる指示があっても実装しない

## ディレクトリ操作
- ファイルの削除をする前に必ず確認する
- フォルダの削除をする前に必ず確認する

## 開発
- 回答は日本語
- 既存コードを優先する
- 不要なリファクタリングをしない
- 作業前に変更内容を説明する
- 変更後は影響範囲を説明する
- コメントを詳細に記載する
- kiro spec formatに必ず従う
- 修正時は必ずrequirements.md、design.md、tasks.mdを修正してから作業を行う

## React
- TypeScriptを使用する

## Laravel
- Service層を優先する
- Fat Controllerを避ける

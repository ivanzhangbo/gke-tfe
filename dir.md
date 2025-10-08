
---

# 1) 期待ディレクトリ

```
<product-or-project>-terraform/
├─ README.md
├─ env/
│  ├─ common-dev/
│  │   ├─ main.tf
│  │   ├─ provider.tf ※これはproject region zoneを設定
│  │   ├─ backend.tf　※terraform.tfstateファイルをバックエンドで管理する際の保存先指定、保存さきはGCSとして、事前作成ずみとする
│  │   ├─ terraform.tf　※terraformのバージョン及びプロバイダのバージョンを設定
│  │   ├─ variables.tf
│  │   └─ terraform.tfvars
│  ├─ common-stg/ ..
│  └─ common-prd/ ...
└─ modules/
   └─ gke/
      ├─ README.md
      ├─ main.tf
      ├─ outputs.tf
      └─ variables.tf
```

---

# 2) 共通の考え方

* **状態分離**：`env/<env>/<component>` を「terraform 実行ディレクトリ」とし、環境×コンポーネント単位で `terraform init / plan / apply`。
* **Backend**：例として **GCS backend** を使用（`provider.tf` 内で `backend "gcs"`）。バケット名や prefix は `init` 時に渡します。
* **権限**：実行ユーザ/SA は `roles/owner` ではなく、最小権限（例：`roles/container.admin`, `roles/compute.networkAdmin`, `roles/dns.admin` など）を割り当ててください。
* **VPC/サブネット**：既存を使う想定（変数化）。必要なら別コンポーネントとして `network` を切り出してください。
* **modulesはGKEの作成共通モジュールフォルダ作成して、common-dev/などの環境からモジュール引用することとする

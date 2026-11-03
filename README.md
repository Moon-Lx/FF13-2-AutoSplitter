# FINAL FANTASY XIII-2 Auto Splitter

[日本語](#日本語) | [English](#english)

Steam 版『FINAL FANTASY XIII-2』用の [LiveSplit](https://livesplit.org/) オートスプリッターです。  
An auto splitter for the Steam version of FINAL FANTASY XIII-2 for [LiveSplit](https://livesplit.org/).

---

## 日本語

### 概要

- 対象: Steam 版（`ffxiii2img.exe`）
- Roosta 氏のオートスプリッター（[blakehartley/FFXIII-2_autosplitter](https://github.com/blakehartley/FFXIII-2_autosplitter)）をもとに改修したものです。
- 英語版・日本語版での自動スタートと、ボス撃破などでの自動スプリットに対応しています。

### 主な機能

| 機能 | 内容 |
|---|---|
| 自動スタート | New Game の難易度確定（speedrun.com の計測開始地点）で開始。英語版・日本語版に対応 |
| 自動スプリット | ボス撃破・モンスター捕獲・キチュー入手など。設定画面で項目ごとに ON/OFF |
| 最終スプリット | Jet Bahamut 後のリザルト画面を抜けた時（speedrun.com の計測終了地点） |
| ロード対策 | セーブのロードやタイトル画面への復帰の直後は、誤ってスプリットしない |

### 導入方法

本スクリプトは LiveSplit の公式オートスプリッター一覧に登録されているので、スプリットの編集画面で有効にするだけで使えます。

1. LiveSplit を右クリック →「Edit Splits...」を開きます。
2. 「Game Name」を `Final Fantasy XIII-2` にします。
3. 表示される「Activate」ボタンを押します。本スクリプトが自動でダウンロードされます。
4. 「Settings」を開き、「Start」と「Split」にチェックを入れ、「Advanced」で使うスプリットにチェックを入れます（下の表を参照）。
5. 「OK」を押して、スプリットファイルを保存します。

有効化のたびに（スプリットを開いたときなど）最新版が自動でダウンロードされるので、手動で更新する必要はありません。

#### 手元のファイルを使う場合（改造・テスト用）

1. `FF13-2-AutoSplitter.asl` を任意のフォルダに保存します。
2. LiveSplit を右クリック →「Edit Layout...」→「+」→「Control」→「Scriptable Auto Splitter」を追加し、「Layout Settings」の Script Path に保存した `.asl` を指定します。
3. スプリットの編集画面のオートスプリッターは「Deactivate」にしてください。両方が有効だと、スプリットが二重になります。

> **注意**: スプリットの編集画面側の「Settings」で手元のファイルを指定しても、次に有効化されたときにダウンロード版へ戻ります。手元のファイルを使うときは、上の「Edit Layout」の方法を使ってください。

### スプリット一覧

設定画面の並び順（ルート順）です。

| 設定名 | 検出する内容 | スプリットのタイミング | 既定 |
|---|---|---|---|
| Chaos Bahamut 1 | 序章のカオス・バハムート戦（前半） | リザルト画面を抜けた時 | OFF |
| Chaos Bahamut 2 | 序章のカオス・バハムート戦（後半） | リザルト画面を抜けた時 | OFF |
| Gogmagog Alpha | 撃破 | リザルト画面を抜けた時 | ON |
| Gogmagog Beta | 撃破 | リザルト画面を抜けた時 | ON |
| Paradox Alpha | 撃破 | リザルト画面を抜けた時 | ON |
| Monster Crystal Tutorial | チュートリアルでのモンスター捕獲（`mcr_k273`） | リザルト画面を抜けた時 | OFF |
| Capture Nekton | 捕獲（`mcr_k270`） | リザルト画面を抜けた時 | OFF |
| Atlas | 撃破 | リザルト画面を抜けた時 | ON |
| Aloeidai | 撃破 | リザルト画面を抜けた時 | ON |
| Capture Gahongas | 捕獲（`mcr_k442`） | リザルト画面を抜けた時 | OFF |
| Royal Ripeness | 撃破 | リザルト画面を抜けた時 | ON |
| Miniflans 1 | 撃破 | リザルト画面を抜けた時 | ON |
| Goblin Fragment | 撃破 | リザルト画面を抜けた時 | ON |
| Faeryl | 撃破 | リザルト画面を抜けた時 | ON |
| Mutantomato | 撃破 | リザルト画面を抜けた時 | ON |
| Caius: Oerba | 撃破 | リザルト画面を抜けた時 | ON |
| Capture Chichu | キチューの入手（モーグリ投げ） | **入手した瞬間** | OFF |
| Zenobia | 撃破 | リザルト画面を抜けた時 | ON |
| Fal'cie Adam | 撃破 | リザルト画面を抜けた時 | ON |
| Caius: Beyond | 撃破 | リザルト画面を抜けた時 | ON |
| Gogmagog Gamma | 撃破 | リザルト画面を抜けた時 | ON |
| Pacos Twins | 撃破 | リザルト画面を抜けた時 | ON |
| Chaos Bahamut 3 | 終盤のカオス・バハムート戦 | リザルト画面を抜けた時 | OFF |
| Caius: Deck | カイアス戦（アカデミア） | リザルト画面を抜けた時 | OFF |
| Caius: Beach | カイアス戦（ヴァルハラ） | リザルト画面を抜けた時 | OFF |
| Jet Bahamut (Final) | 最終戦（計測終了） | リザルト画面を抜けた時 | ON |

- 「撃破」はモンスター図鑑に初めて撃破が記録された戦闘、「捕獲」は戦利品に該当するモンスタークリスタルが出た戦闘です。
- 「リザルト画面を抜けた時」は、検知してから一定時間（撃破・捕獲は2.3秒）以上たったあと、リザルト画面を閉じたタイミングです。
- キチューはモーグリ投げで入手するためリザルト画面がなく、入手した瞬間にスプリットします。
- 序章の前半・後半は同じ戦闘IDなので、計測開始後に出てきた順番で 1 / 2 を判定します。

### 既知の制限・注意

- 自動スタートは英語版と日本語版の値にのみ対応しています。その他の言語では開始しない可能性があります（技術メモを参照）。
- 序章の途中から手動でタイマーを開始すると、Chaos Bahamut 1 / 2 の判定がずれることがあります。
- 撃破前のセーブをロードして同じボスを倒し直すと、もう一度スプリットします。
- タイマーをリセットすると、実行待ちのスプリットは破棄されます。
- 元版の設定ID（`chaosSet` など）はそのまま使っているので、元版の設定は引き継がれます。新しい項目（Chaos Bahamut 2 / Capture Chichu）は既定でOFFなので、必要に応じてチェックしてください。
- 動作確認: Steam 版（日本語）＋ FF13Fix 1.6.4。最新版の LiveSplit を推奨します（`onStart` アクションを使用）。

### 技術メモ（メンテナ向け）

| 値 | アドレス | 内容 |
|---|---|---|
| `guiVB` | `[exe+0x3921EC]+0x4`（= `0x0514DE04`） | GUI頂点バッファの使用量（byte）。ゲーム内のデバッグ表示 `GUI VB=%d` と同じ値で、画面上の文字量で決まるため言語によって値が変わる |
| `time` | `[exe+0x1DA2A0]`（= `0x02522EFC`） | `timeGetTime()` の値（ms） |
| `target` | `[exe+0x04D51BC4]+0x3C` | 直近の戦闘リザルトの戦闘ID（915000 = 序章のカオス・バハムート、673000 = Jet Bahamut） |
| `sp1`〜`sp4` | `[exe+0x04D51BC4]+0x78 / 0x90 / 0xA8 / 0xC0` | 戦利品のアイテムID（例: `mcr_k273`） |
| 図鑑 | `[exe+0x04D51F64]+オフセット` | ボスごとの撃破記録（未撃破は0） |
| `chichu` | `[exe+0x04D51F64]+0x1451` のビット3 | キチュー入手フラグ（同時に +0x145D のビット3も立ち、パックに ID `k677` のモンスターが追加される） |
| `saveHead` | `[exe+0x04D51F64]` から 8KB | ロード検知用。ロード時は約480バイト、通常プレイ中は十数バイト以下しか変わらない |

- **Start**: 難易度を確定した瞬間に GUI 表示が 768 バイト減ります（英語版 31872→31104、日本語版 25728→24960）。他の言語に対応するには、その言語での値を計測して `start` に追加します。
- **Split**: 撃破・捕獲を検知すると `vars.time0` に予約し、リザルト画面を抜けた時（`guiVB` が 25600 未満に減る／GUI 非表示／`battle_base` の変化）に実行します。
- **ロード対策**: `saveHead` の 128 バイト以上が一度に変わったらロードとみなし、その後 2 秒間は判定しません。

### 元版からの変更点

- 日本語版で自動スタートしない不具合を修正
- 「Capture Chichu」（キチュー入手）を追加
- 「Chaos Bahamut 1 & 2」を「Chaos Bahamut 1」「Chaos Bahamut 2」に分割し、終盤のものを「Chaos Bahamut 3」に改名
- 最終スプリット（Jet Bahamut）を設定項目として表示
- セーブのロード直後に誤ってスプリットする不具合を修正
- タイマーのリセット後に、実行待ちだったスプリットが誤って実行される不具合を修正
- 捕獲の判定で戦利品の4枠目を見ていなかった不具合を修正
- コードの整理と日英コメントの追加

### クレジット

- 原作: Roosta — [blakehartley/FFXIII-2_autosplitter](https://github.com/blakehartley/FFXIII-2_autosplitter)
- 改修: Moon-Lx
- ライセンス: MIT（[LICENSE](LICENSE)）

---

## English

### Overview

- Target: Steam version (`ffxiii2img.exe`)
- Based on Roosta's auto splitter ([blakehartley/FFXIII-2_autosplitter](https://github.com/blakehartley/FFXIII-2_autosplitter)).
- Auto start for the English and Japanese versions, and auto splits on boss kills and more.

### Features

| Feature | Description |
|---|---|
| Auto start | Starts when the New Game difficulty is confirmed (the speedrun.com start point). English and Japanese |
| Auto split | Boss kills, monster captures, obtaining Chichu and more; each can be toggled in the settings |
| Final split | When the results screen after Jet Bahamut is closed (the speedrun.com end point) |
| Load guard | No false splits right after loading a save or returning to the title screen |

### Installation

This script is registered in LiveSplit's official auto splitter list, so you only need to activate it in the Splits Editor.

1. Right-click LiveSplit → "Edit Splits...".
2. Set "Game Name" to `Final Fantasy XIII-2`.
3. Click the "Activate" button that appears. LiveSplit downloads this script automatically.
4. Open "Settings", tick "Start" and "Split", then choose the splits you use under "Advanced" (see the table below).
5. Click "OK" and save your splits.

LiveSplit downloads the latest version every time the auto splitter is activated (for example when you open your splits), so there is nothing to update manually.

#### Using a local copy (for modding or testing)

1. Save `FF13-2-AutoSplitter.asl` anywhere.
2. Right-click LiveSplit → "Edit Layout..." → "+" → "Control" → "Scriptable Auto Splitter", and set Script Path in its "Layout Settings" to the saved `.asl` file.
3. Deactivate the auto splitter in the Splits Editor; with both active you get double splits.

> **Note**: Pointing the Splits Editor's auto splitter "Settings" at a local file does not last; it switches back to the downloaded script the next time it is activated. Use the "Edit Layout" method above for local files.

### Splits

In settings order (route order).

| Setting | What is detected | When it splits | Default |
|---|---|---|---|
| Chaos Bahamut 1 | Prologue Chaos Bahamut, first half | When the results screen closes | OFF |
| Chaos Bahamut 2 | Prologue Chaos Bahamut, second half | When the results screen closes | OFF |
| Gogmagog Alpha | Kill | When the results screen closes | ON |
| Gogmagog Beta | Kill | When the results screen closes | ON |
| Paradox Alpha | Kill | When the results screen closes | ON |
| Monster Crystal Tutorial | Tutorial capture (`mcr_k273`) | When the results screen closes | OFF |
| Capture Nekton | Capture (`mcr_k270`) | When the results screen closes | OFF |
| Atlas | Kill | When the results screen closes | ON |
| Aloeidai | Kill | When the results screen closes | ON |
| Capture Gahongas | Capture (`mcr_k442`) | When the results screen closes | OFF |
| Royal Ripeness | Kill | When the results screen closes | ON |
| Miniflans 1 | Kill | When the results screen closes | ON |
| Goblin Fragment | Kill | When the results screen closes | ON |
| Faeryl | Kill | When the results screen closes | ON |
| Mutantomato | Kill | When the results screen closes | ON |
| Caius: Oerba | Kill | When the results screen closes | ON |
| Capture Chichu | Obtaining Chichu (Moogle Throw) | **The moment it is obtained** | OFF |
| Zenobia | Kill | When the results screen closes | ON |
| Fal'cie Adam | Kill | When the results screen closes | ON |
| Caius: Beyond | Kill | When the results screen closes | ON |
| Gogmagog Gamma | Kill | When the results screen closes | ON |
| Pacos Twins | Kill | When the results screen closes | ON |
| Chaos Bahamut 3 | Late-game Chaos Bahamut | When the results screen closes | OFF |
| Caius: Deck | Caius (Academia) | When the results screen closes | OFF |
| Caius: Beach | Caius (Valhalla) | When the results screen closes | OFF |
| Jet Bahamut (Final) | Final battle (end of the run) | When the results screen closes | ON |

- "Kill" means the battle in which the bestiary first records a kill; "Capture" means the battle whose spoils include that monster crystal.
- "When the results screen closes" means the results screen is closed after a minimum delay since detection (2.3 s for kills and captures).
- Chichu is obtained with the Moogle Throw, so there is no results screen; it splits the moment Chichu is obtained.
- Both halves of the prologue battle report the same battle id, so 1 and 2 are told apart by the order they appear after the timer starts.

### Known limitations

- Auto start only knows the English and Japanese values; other languages may not start (see the technical notes).
- If you start the timer manually in the middle of the prologue, Chaos Bahamut 1 / 2 may be off by one.
- Loading a save from before a boss and killing it again splits again.
- Resetting the timer discards any pending split.
- The original setting ids (`chaosSet` and so on) are kept, so settings saved with the original script still apply. The new items (Chaos Bahamut 2 / Capture Chichu) are OFF by default; tick them if your route uses them.
- Tested with the Steam version (Japanese) and FF13Fix 1.6.4. A recent LiveSplit is recommended (the script uses the `onStart` action).

### Technical notes (for maintainers)

| Value | Address | Meaning |
|---|---|---|
| `guiVB` | `[exe+0x3921EC]+0x4` (= `0x0514DE04`) | GUI vertex buffer usage in bytes; the same value as the game's debug overlay `GUI VB=%d`. It depends on the on-screen text, so it differs per language |
| `time` | `[exe+0x1DA2A0]` (= `0x02522EFC`) | `timeGetTime()` in milliseconds |
| `target` | `[exe+0x04D51BC4]+0x3C` | Battle id of the latest battle results (915000 = prologue Chaos Bahamut, 673000 = Jet Bahamut) |
| `sp1`–`sp4` | `[exe+0x04D51BC4]+0x78 / 0x90 / 0xA8 / 0xC0` | Spoils item ids (e.g. `mcr_k273`) |
| Bestiary | `[exe+0x04D51F64]+offset` | Kill record per boss (0 = not killed) |
| `chichu` | bit 3 of `[exe+0x04D51F64]+0x1451` | Chichu obtained flag (bit 3 of +0x145D is set at the same time, and a monster with id `k677` is added to the pack) |
| `saveHead` | 8 KB from `[exe+0x04D51F64]` | Load detection; a load changes about 480 bytes, normal play only a dozen or so |

- **Start**: confirming the difficulty drops the GUI usage by 768 bytes (English 31872→31104, Japanese 25728→24960). To support another language, measure its values and add them to `start`.
- **Split**: a kill or capture arms a split in `vars.time0`, which fires when the results screen closes (`guiVB` drops below 25600, no GUI is drawn, or `battle_base` changes).
- **Load guard**: when 128 bytes or more of `saveHead` change at once it is treated as a load, and nothing is checked for the next 2 seconds.

### Changes from the original

- Fixed auto start not working on the Japanese version
- Added "Capture Chichu" (obtaining Chichu)
- Split "Chaos Bahamut 1 & 2" into "Chaos Bahamut 1" and "Chaos Bahamut 2", and renamed the late-game one to "Chaos Bahamut 3"
- The final split (Jet Bahamut) is now shown as a setting
- Fixed false splits right after loading a save
- Fixed a pending split firing after the timer was reset
- Fixed captures ignoring the fourth spoils slot
- Code cleanup and Japanese/English comments

### Credits

- Original: Roosta — [blakehartley/FFXIII-2_autosplitter](https://github.com/blakehartley/FFXIII-2_autosplitter)
- Modified by: Moon-Lx
- License: MIT (see [LICENSE](LICENSE))

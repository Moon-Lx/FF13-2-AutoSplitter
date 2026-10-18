// FINAL FANTASY XIII-2 (Steam版) オートスプリッター
// Auto splitter for FINAL FANTASY XIII-2 (Steam)
// 原作 / Original: Roosta (https://github.com/blakehartley/FFXIII-2_autosplitter)

state("ffxiii2img")
{
	// GUI頂点バッファ使用量(byte)。画面上の文字量で変わるため言語によって値が異なる
	// GUI vertex buffer usage in bytes; depends on the on-screen text, so it differs per language
	int guiVB			: "ffxiii2img.exe", 0x003921EC, 0x4;
	// timeGetTime() の値(ms)
	// timeGetTime() in milliseconds
	uint time			: "ffxiii2img.exe", 0x001DA2A0, 0x0;
	int battle_base		: "ffxiii2img.exe", 0x0211E3E0, 0x14, 0x0, 0x0;
	
	// 直近の戦闘リザルトの戦闘ID
	// Battle id of the latest battle results
	int target			: "ffxiii2img.exe", 0x04D51BC4, 0x3C;
	
	// モンスター図鑑の撃破数
	// Bestiary kill counts
	int faeryl			: "ffxiii2img.exe", 0x04D51F64, 0x7F4;
	int gogmagog1		: "ffxiii2img.exe", 0x04D51F64, 0x7E4;
	int gogmagog2		: "ffxiii2img.exe", 0x04D51F64, 0x7DC;
	int gogmagog3		: "ffxiii2img.exe", 0x04D51F64, 0x7EC;
	int paradox			: "ffxiii2img.exe", 0x04D51F64, 0x864;
	int atlas			: "ffxiii2img.exe", 0x04D51F64, 0x874;
	int aloeidai		: "ffxiii2img.exe", 0x04D51F64, 0x7CC;
	int caius1			: "ffxiii2img.exe", 0x04D51F64, 0x814;
	int adam			: "ffxiii2img.exe", 0x04D51F64, 0x89C;
	int caius2			: "ffxiii2img.exe", 0x04D51F64, 0x81C;
	int pacos			: "ffxiii2img.exe", 0x04D51F64, 0x804;
	int caius3			: "ffxiii2img.exe", 0x04D51F64, 0x82C;
	int caius4			: "ffxiii2img.exe", 0x04D51F64, 0x834;
	
	int royal			: "ffxiii2img.exe", 0x04D51F64, 0x854;
	int miniflan		: "ffxiii2img.exe", 0x04D51F64, 0x4A4;
	int goblin			: "ffxiii2img.exe", 0x04D51F64, 0x324;
	int mutant			: "ffxiii2img.exe", 0x04D51F64, 0x49C;
	int zenobia			: "ffxiii2img.exe", 0x04D51F64, 0x40C;
	
	int chaos			: "ffxiii2img.exe", 0x04D51F64, 0x80C;
	
	// キチュー入手フラグ（ビット3）。モーグリ投げで入手した瞬間に立つ
	// Chichu obtained flag (bit 3); set the moment it is obtained by the Moogle Throw
	byte chichu			: "ffxiii2img.exe", 0x04D51F64, 0x1451;
	
	// セーブデータ先頭8KB（ロード検知用）。ロードやタイトル復帰では数百バイトが一斉に書き換わる
	// First 8 KB of the save data (load detection); loading or returning to the title rewrites hundreds of bytes at once
	byte8192 saveHead	: "ffxiii2img.exe", 0x04D51F64, 0x0;
	
	// 直近の戦闘リザルトの戦利品（アイテムID）
	// Spoils of the latest battle results (item ids)
	string16 sp1				: "ffxiii2img.exe", 0x04D51BC4, 0x78;
	string16 sp2				: "ffxiii2img.exe", 0x04D51BC4, 0x90;
	string16 sp3				: "ffxiii2img.exe", 0x04D51BC4, 0xA8;
	string16 sp4				: "ffxiii2img.exe", 0x04D51BC4, 0xC0;
}

init
{
	// 予約中のSplitの実行可能時刻(ms)。最大値は予約なし
	// Time (ms) after which the armed split may fire; max value means none is armed
	vars.time0 = uint.MaxValue;
}

startup
{
	// 計測ごとの状態。スクリプト再読み込み時は onStart が呼ばれないため、ここでも定義する
	// Per-run state; also defined here because a script reload does not call onStart
	vars.chaosCount = 0;
	vars.chaosTime = 0u;
	vars.loadTime = 0u;
	
	settings.Add("chaosSet", false, "Chaos Bahamut 1");
	settings.Add("chaosBSet", false, "Chaos Bahamut 2");
	settings.Add("gogmagogASet", true, "Gogmagog Alpha");
	settings.Add("gogmagogBSet", true, "Gogmagog Beta");
	settings.Add("paradoxSet", true, "Paradox Alpha");
	settings.Add("caitSet", false, "Monster Crystal Tutorial");
	settings.Add("nektonSet", false, "Capture Nekton");
	settings.Add("atlasSet", true, "Atlas");
	settings.Add("aloeidaiSet", true, "Aloeidai");
	settings.Add("gahongasSet", false, "Capture Gahongas");
	settings.Add("royalSet", true, "Royal Ripeness");
	settings.Add("miniflanSet", true, "Miniflans 1");
	settings.Add("goblinSet", true, "Goblin Fragment");
	settings.Add("faerylSet", true, "Faeryl");
	settings.Add("mutantSet", true, "Mutantomato");
	settings.Add("caius1Set", true, "Caius: Oerba");
	settings.Add("chichuSet", false, "Capture Chichu");
	settings.Add("zenobiaSet", true, "Zenobia");
	settings.Add("adamSet", true, "Fal'cie Adam");
	settings.Add("caius2Set", true, "Caius: Beyond");
	settings.Add("gogmagog3Set", true, "Gogmagog Gamma");
	settings.Add("pacosSet", true, "Pacos Twins");
	settings.Add("chaos2Set", false, "Chaos Bahamut 3");
	settings.Add("caius3Set", false, "Caius: Deck");
	settings.Add("caius4Set", false, "Caius: Beach");
	settings.Add("jetSet", true, "Jet Bahamut (Final)");

}

update
{
	// セーブデータが一斉に書き換わった（ロード・タイトル復帰）時刻を記録する。通常のプレイで変わるのは数バイト程度
	// Remember when the save data is rewritten at once (load / back to title); normal play changes only a few bytes
	byte[] before = old.saveHead, after = current.saveHead;
	if (before != null && after != null && before.Length == after.Length)
	{
		int changed = 0;
		for (int i = 0; i < after.Length; i++)
			if (before[i] != after[i]) changed++;
		if (changed >= 128) vars.loadTime = current.time;
	}
}

start
{
	// New Game の難易度確定で画面のGUIが減る瞬間（表示文字量が違うため言語ごとに値が異なる）
	// GUI VB drop when the New Game difficulty is confirmed (values differ per language because of the text)
	if ((old.guiVB == 31872 && current.guiVB == 31104)		// English
		|| (old.guiVB == 25728 && current.guiVB == 24960))	// 日本語 / Japanese
	{
		return true;
	}
}

onStart
{
	// リセット前に予約されたSplitが新しい計測で実行されないよう破棄する
	// Drop a split armed before the timer was reset so it cannot fire in the new run
	vars.time0 = uint.MaxValue;
	vars.chaosCount = 0;
}

split
{
	// ロード直後（2秒以内）は撃破数やフラグがセーブから復元されているだけなので何もしない
	// Within 2 s of a load, kills and flags are merely being restored from the save, so do nothing
	if (current.time - vars.loadTime < 2000) return false;
	
	// 撃破・捕獲を検知すると vars.time0 にSplitを予約し、リザルト画面を抜けた時にSplitする
	// A kill or capture arms a split in vars.time0; it fires when the results screen closes
	
	// 序章の Chaos Bahamut は前半・後半とも戦闘ID 915000 なので出現順で1/2を区別する（10秒以内の再出現は無視）
	// Prologue Chaos Bahamut: both halves report battle id 915000, so tell 1 and 2 apart by order (ignore repeats within 10 s)
	if (old.target != 915000 && current.target == 915000 && (vars.chaosCount == 0 || current.time - vars.chaosTime > 10000))
	{
		vars.chaosCount++;
		vars.chaosTime = current.time;
		if ((vars.chaosCount == 1 && settings["chaosSet"]) || (vars.chaosCount == 2 && settings["chaosBSet"])) vars.time0 = current.time;
	}
	
	// 図鑑の撃破数が 0 から増えた戦闘。Splitは2.3秒後以降
	// First kill recorded in the bestiary; the split may fire 2.3 s later
	if (settings["gogmagogASet"] && old.gogmagog1 == 0 && current.gogmagog1 != 0) vars.time0 = current.time + 2300;
	if (settings["gogmagogBSet"] && old.gogmagog2 == 0 && current.gogmagog2 != 0) vars.time0 = current.time + 2300;
	if (settings["paradoxSet"] && old.paradox == 0 && current.paradox != 0) vars.time0 = current.time + 2300;
	
	// 戦利品(4枠)にモンスタークリスタルが新しく出た戦闘
	// Battles whose spoils (4 slots) newly include the monster crystal
	Func<string, bool> gotSpoil = id =>
		(current.sp1 == id && old.sp1 != id) || (current.sp2 == id && old.sp2 != id)
		|| (current.sp3 == id && old.sp3 != id) || (current.sp4 == id && old.sp4 != id);
	if (settings["caitSet"] && gotSpoil("mcr_k273")) vars.time0 = current.time + 2300;
	if (settings["nektonSet"] && gotSpoil("mcr_k270")) vars.time0 = current.time + 2300;
	
	if (settings["atlasSet"] && old.atlas == 0 && current.atlas != 0) vars.time0 = current.time + 2300;
	if (settings["aloeidaiSet"] && old.aloeidai == 0 && current.aloeidai != 0) vars.time0 = current.time + 2300;
	
	if (settings["gahongasSet"] && gotSpoil("mcr_k442")) vars.time0 = current.time + 2300;
	
	if (settings["royalSet"] && old.royal == 0 && current.royal != 0) vars.time0 = current.time + 2300;
	if (settings["miniflanSet"] && old.miniflan == 0 && current.miniflan != 0) vars.time0 = current.time + 2300;
	if (settings["goblinSet"] && old.goblin == 0 && current.goblin != 0) vars.time0 = current.time + 2300;
	if (settings["faerylSet"] && old.faeryl == 0 && current.faeryl != 0) vars.time0 = current.time + 2300;
	if (settings["mutantSet"] && old.mutant == 0 && current.mutant != 0) vars.time0 = current.time + 2300;
	if (settings["caius1Set"] && old.caius1 == 0 && current.caius1 != 0) vars.time0 = current.time + 2300;
	
	// キチューはモーグリ投げで入手するためリザルト画面がない。入手した瞬間にSplit
	// Chichu comes from the Moogle Throw with no results screen, so split the moment it is obtained
	if (settings["chichuSet"] && (old.chichu & 0x08) == 0 && (current.chichu & 0x08) != 0) return true;
	
	if (settings["zenobiaSet"] && old.zenobia == 0 && current.zenobia != 0) vars.time0 = current.time + 2300;
	if (settings["adamSet"] && old.adam == 0 && current.adam != 0) vars.time0 = current.time + 2300;
	if (settings["caius2Set"] && old.caius2 == 0 && current.caius2 != 0) vars.time0 = current.time + 2300;
	if (settings["gogmagog3Set"] && old.gogmagog3 == 0 && current.gogmagog3 != 0) vars.time0 = current.time + 2300;
	if (settings["pacosSet"] && old.pacos == 0 && current.pacos != 0) vars.time0 = current.time + 2300;
	if (settings["chaos2Set"] && old.chaos == 0 && current.chaos != 0) vars.time0 = current.time + 2300;
	
	// Jet Bahamut（最終Split、戦闘ID 673000）
	// Jet Bahamut (final split, battle id 673000)
	if (settings["jetSet"] && old.target != 673000 && current.target == 673000) vars.time0 = current.time + 2300;
	
	if (settings["caius3Set"] && old.caius3 == 0 && current.caius3 != 0) vars.time0 = current.time + 2300;
	if (settings["caius4Set"] && old.caius4 == 0 && current.caius4 != 0) vars.time0 = current.time + 2300;
	
	// 予約したSplitを、リザルト画面を抜けた時（GUIの減少・GUI非表示・戦闘の切り替わり）に実行
	// Fire the armed split when the results screen closes (GUI drop, no GUI, or battle change)
	if (current.time > vars.time0
		&& ((old.guiVB >= 25600 && current.guiVB < 25600)
			|| (current.guiVB == 0 && current.time > vars.time0 + 1000)
			|| old.battle_base != current.battle_base))
	{
		vars.time0 = uint.MaxValue;
		return true;
	}
}
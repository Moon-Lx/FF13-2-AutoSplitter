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
	settings.Add("chaosSet", false, "Chaos Bahamut 1 & 2");
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
	settings.Add("zenobiaSet", true, "Zenobia");
	settings.Add("adamSet", true, "Fal'cie Adam");
	settings.Add("caius2Set", true, "Caius: Beyond");
	settings.Add("gogmagog3Set", true, "Gogmagog Gamma");
	settings.Add("pacosSet", true, "Pacos Twins");
	settings.Add("chaos2Set", false, "Chaos Bahamut");
	settings.Add("caius3Set", false, "Caius: Deck");
	settings.Add("caius4Set", false, "Caius: Beach");

}

start
{
	// New Game の難易度確定で画面のGUIが減る瞬間（英語版の値）
	// GUI VB drop when the New Game difficulty is confirmed (English values)
	if (old.guiVB == 31872 && current.guiVB == 31104)
	{
		return true;
	}
}

split
{
	// 撃破・捕獲を検知すると vars.time0 にSplitを予約し、リザルト画面を抜けた時にSplitする
	// A kill or capture arms a split in vars.time0; it fires when the results screen closes
	
	// 序章の Chaos Bahamut（前半・後半とも戦闘ID 915000）
	// Prologue Chaos Bahamut (both halves report battle id 915000)
	if (settings["chaosSet"] && old.target != 915000 && current.target == 915000) vars.time0 = current.time;
	
	// 図鑑の撃破数が 0 から増えた戦闘。Splitは2.3秒後以降
	// First kill recorded in the bestiary; the split may fire 2.3 s later
	if (settings["gogmagogASet"] && old.gogmagog1 == 0 && current.gogmagog1 != 0) vars.time0 = current.time + 2300;
	if (settings["gogmagogBSet"] && old.gogmagog2 == 0 && current.gogmagog2 != 0) vars.time0 = current.time + 2300;
	if (settings["paradoxSet"] && old.paradox == 0 && current.paradox != 0) vars.time0 = current.time + 2300;
	
	// 戦利品にモンスタークリスタルが出た戦闘
	// Battles whose spoils include the monster crystal
	if (settings["caitSet"])
	{
		if (current.sp1 == "mcr_k273" && old.sp1 != "mcr_k273") vars.time0 = current.time + 2300;
		if (current.sp2 == "mcr_k273" && old.sp2 != "mcr_k273") vars.time0 = current.time + 2300;
		if (current.sp3 == "mcr_k273" && old.sp3 != "mcr_k273") vars.time0 = current.time + 2300;
	}
	if (settings["nektonSet"])
	{
		if (current.sp1 == "mcr_k270" && old.sp1 != "mcr_k270") vars.time0 = current.time + 2300;
		if (current.sp2 == "mcr_k270" && old.sp2 != "mcr_k270") vars.time0 = current.time + 2300;
		if (current.sp3 == "mcr_k270" && old.sp3 != "mcr_k270") vars.time0 = current.time + 2300;
	}
	
	if (settings["atlasSet"] && old.atlas == 0 && current.atlas != 0) vars.time0 = current.time + 2300;
	if (settings["aloeidaiSet"] && old.aloeidai == 0 && current.aloeidai != 0) vars.time0 = current.time + 2300;
	
	if (settings["gahongasSet"])
	{
		if (current.sp1 == "mcr_k442" && old.sp1 != "mcr_k442") vars.time0 = current.time + 2300;
		if (current.sp2 == "mcr_k442" && old.sp2 != "mcr_k442") vars.time0 = current.time + 2300;
		if (current.sp3 == "mcr_k442" && old.sp3 != "mcr_k442") vars.time0 = current.time + 2300;
		if (current.sp4 == "mcr_k442" && old.sp4 != "mcr_k442") vars.time0 = current.time + 2300;
	}
	
	if (settings["royalSet"] && old.royal == 0 && current.royal != 0) vars.time0 = current.time + 2300;
	if (settings["miniflanSet"] && old.miniflan == 0 && current.miniflan != 0) vars.time0 = current.time + 2300;
	if (settings["goblinSet"] && old.goblin == 0 && current.goblin != 0) vars.time0 = current.time + 2300;
	if (settings["faerylSet"] && old.faeryl == 0 && current.faeryl != 0) vars.time0 = current.time + 2300;
	if (settings["mutantSet"] && old.mutant == 0 && current.mutant != 0) vars.time0 = current.time + 2300;
	if (settings["caius1Set"] && old.caius1 == 0 && current.caius1 != 0) vars.time0 = current.time + 2300;
	if (settings["zenobiaSet"] && old.zenobia == 0 && current.zenobia != 0) vars.time0 = current.time + 2300;
	if (settings["adamSet"] && old.adam == 0 && current.adam != 0) vars.time0 = current.time + 2300;
	if (settings["caius2Set"] && old.caius2 == 0 && current.caius2 != 0) vars.time0 = current.time + 2300;
	if (settings["gogmagog3Set"] && old.gogmagog3 == 0 && current.gogmagog3 != 0) vars.time0 = current.time + 2300;
	if (settings["pacosSet"] && old.pacos == 0 && current.pacos != 0) vars.time0 = current.time + 2300;
	if (settings["chaos2Set"] && old.chaos == 0 && current.chaos != 0) vars.time0 = current.time + 2300;
	
	// Jet Bahamut（最終Split、戦闘ID 673000）
	// Jet Bahamut (final split, battle id 673000)
	if (old.target != 673000 && current.target == 673000) vars.time0 = current.time + 2300;
	
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
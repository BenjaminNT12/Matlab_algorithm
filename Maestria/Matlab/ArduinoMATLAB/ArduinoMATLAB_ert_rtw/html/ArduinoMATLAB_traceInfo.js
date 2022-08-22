function RTW_rtwnameSIDMap() {
	this.rtwnameHashMap = new Array();
	this.sidHashMap = new Array();
	this.rtwnameHashMap["<Root>"] = {sid: "ArduinoMATLAB"};
	this.sidHashMap["ArduinoMATLAB"] = {rtwname: "<Root>"};
	this.rtwnameHashMap["<Root>/Analog Input"] = {sid: "ArduinoMATLAB:1"};
	this.sidHashMap["ArduinoMATLAB:1"] = {rtwname: "<Root>/Analog Input"};
	this.rtwnameHashMap["<Root>/Scope"] = {sid: "ArduinoMATLAB:2"};
	this.sidHashMap["ArduinoMATLAB:2"] = {rtwname: "<Root>/Scope"};
	this.getSID = function(rtwname) { return this.rtwnameHashMap[rtwname];}
	this.getRtwname = function(sid) { return this.sidHashMap[sid];}
}
RTW_rtwnameSIDMap.instance = new RTW_rtwnameSIDMap();

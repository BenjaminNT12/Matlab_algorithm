function TraceInfoFlag() {
    this.traceFlag = new Array();
}
top.TraceInfoFlag.instance = new TraceInfoFlag();
function TraceInfoLineFlag() {
    this.lineTraceFlag = new Array();
    this.lineTraceFlag["ArduinoMATLAB.c:34"]=1;
    this.lineTraceFlag["ArduinoMATLAB.c:123"]=1;
}
top.TraceInfoLineFlag.instance = new TraceInfoLineFlag();

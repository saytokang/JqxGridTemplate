/**
 * javascript 모듈 실행 시간 측정
 * ex) Timer.start(); .... Timer.stop();  console.log(Timer.elapseTime)
 */
var Timer = {
	startTime : 0,
	elapseTime : 0,
	start : function(){
		this.startTime = new Date().getTime();
	},
	stop : function() {
		this.elapseTime = new Date().getTime() - this.startTime;
	}
}

/*
 * jqxGrid common lib.
 * ex) JQXW.init(그리드 해더칼럼, DB결과칼럼);
 * JQXW.loadData(gridId, url, params);
 * */
var JQXW = (function() {
    var _fields, _columns;

    var gridInit = function(tx_cols, db_cols) {
        _fields = $.map(db_cols, function(v){return {name:v, type:'string'}});
        _columns = $.map(db_cols, function(v,i){return {text: tx_cols[i], datafield:v, width: Math.floor(100/tx_cols.length)+'%', cellsalign:'right'}});
    };

    var jqxDataSource = function(url, params) {
        var source = {
                datatype: "json",
                datafields : _fields,
                type:'POST',
                url: url,
                data: params,
                async: true
            };  
        return source; 
    };

    var jqxLoad = function(jqxid, url, params) {
        $('#'+jqxid).jqxGrid('clear');
        $('#'+jqxid).jqxGrid({
            source: new $.jqx.dataAdapter(jqxDataSource(url, params)),
            columns : _columns,
            width: '99%',
            pageable: true,
            autoheight: true,
            columnsresize: true,
            columnsreorder: true,
            filterable: true
        });        
    };
    return {
        init: gridInit,
        loadData : jqxLoad
    }
})();
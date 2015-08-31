
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title id='Description'>This example shows how to create a Grid from Array data.</title>
    <link rel="stylesheet" href="/jqwidgets/styles/jqx.base.css" type="text/css" />
    <script type="text/javascript" src="/scripts/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="/jqwidgets/jqxcore.js"></script>
    <script type="text/javascript" src="/jqwidgets/jqxdata.js"></script>
    <script type="text/javascript" src="/jqwidgets/jqxbuttons.js"></script>
    <script type="text/javascript" src="/jqwidgets/jqxscrollbar.js"></script>
    <script type="text/javascript" src="/jqwidgets/jqxmenu.js"></script>
    <script type="text/javascript" src="/jqwidgets/jqxgrid.js"></script>
    <script type="text/javascript" src="/jqwidgets/jqxgrid.selection.js"></script>
    <script type="text/javascript" src="/jqwidgets/jqxgrid.pager.js"></script>
    <script type="text/javascript" src="/jqwidgets/jqxlistbox.js"></script>
    <script type="text/javascript" src="/jqwidgets/jqxdropdownlist.js"></script>
    <script type="text/javascript" src="/jqwidgets/jqxgrid.columnsresize.js"></script>
    <script type="text/javascript" src="/jqwidgets/jqxgrid.columnsreorder.js"></script>
    <script type="text/javascript" src="/jqwidgets/jqxgrid.filter.js"></script>
    <script type="text/javascript" src="/jqwidgets/jqxgrid.edit.js"></script>
    <script type="text/javascript" src="/jqwidgets/jqxcheckbox.js"></script>

    <script type="text/javascript" src="/scripts/co_util.js"></script>

    <script type="text/javascript">

    function initGrid() {
        var jqx = $('#jqxgrid');
        var tx_cols = ['우편번호','시도', '구/군', '동', '지번','상세내용'];
        var db_cols = ['zipcode', 'sido', 'gu', 'dong', 'jibun','etc'];
        JQXW.init(tx_cols, db_cols);
        JQXW.loadData(jqx, null, null);
        gridToolbox(jqx);

        function gridToolbox(jqx){
            $('#newRow').click(function() {
                JQXW.addrow(jqx);
            });
           $('#editRow').click(function() {
                jqx.jqxGrid({editable: true});
            });  
           $('#delRow').click(function() {
                JQXW.delrow(jqx);
            });                        
            $('#save').click(function() {
                jqx.jqxGrid({editable: false});
                alert('saved');
            });            
        }   
        function addrow() {
            var url = '/crud.do';
            var datecols = null;
            JQXW.addrow(url, rowid, rowdata, position, commit, datecols);
        }
    }

    $().ready(function(){
        initGrid();

        $('#btn').click(function(){
            search();
        });
        $('#sido').keypress(function(event) {
            var keycode = (event.keyCode ? event.keyCode : event.which);
            if(keycode == 13) {
                search();
            }
        });
    });

    function search() {
        var url = 'crud.do';
        var params = {sido: $('#sido').val()};
        JQXW.loadData('jqxgrid', url, params);
    }
    
    </script>
</head>
<body class='default'>
    <div>
        <span style="float:left"><input type="text" id="sido" name="sido" /><button id="btn">조회</button></span>
        <span style="float:right">
                <input type="button" id="newRow" name="newRow" value="추가"/>
                <input type="button" id="editRow" name="editRow" value="편집"/>
                <input type="button" id="delRow" name="delRow" value="삭제"/>
                <input type="button" id="save" name="save" value="저장"/>
        </span>
    </div>
    <div id='jqxWidget' style="font-size: 13px; font-family: Verdana; float: left; width:100%; height:100%;">
        <div id="jqxgrid"></div>
    </div>
</body>
</html>
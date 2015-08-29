
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
    <script type="text/javascript">
    $().ready(function(){
        $('#btn').click(function(){
            var source = {
                datatype: "json",
                datafields: [{name: 'zipcode', type: 'string'}, 
                             {name: 'sido', type: 'string'}, 
                             {name: 'gu',type: 'string'}, 
                             {name: 'dong',type: 'string'},
                             {name: 'jibun',type: 'string'},
                             {name: 'etc',type: 'string'}
                            ],
                id: 'zipcode',
                url: 'list.do',
                async: true
            };
            var dataAdapter = new $.jqx.dataAdapter(source);

            var pagerrenderer = function () {
                var element = $("<div style='margin-top: 5px; width: 100%; height: 100%;'></div>");
                var paginginfo = $("#jqxgrid").jqxGrid('getpaginginformation');
                for (i = 0; i < paginginfo.pagescount; i++) {
                    // add anchor tag with the page number for each page.
                    var anchor = $("<a style='padding: 5px;' href='#" + i + "'>" + i + "</a>");
                    anchor.appendTo(element);
                    anchor.click(function (event) {
                        // go to a page.
                        var pagenum = parseInt($(event.target).text());
                        $("#jqxgrid").jqxGrid('gotopage', pagenum);
                    });
                }
                return element;
            }

            $("#jqxgrid").jqxGrid({
                width: 850,
                source: dataAdapter,
                pageable: true,
                autoheight: true,
              //  pagerrenderer: pagerrenderer,
                columns: [
                  { text: '우편번호', datafield: 'zipcode', width: 100 },
                  { text: '시도', datafield: 'sido', width: 100 },
                  { text: '구/군', datafield: 'gu', width: 100 },
                  { text: '동', datafield: 'dong', width: 100, cellsalign: 'right' },
                  { text: '지번', datafield: 'jibun', width: 200, cellsalign: 'right'},
                  { text: '세부사항', datafield: 'etc', cellsalign: 'right'}
                ]
            });
        });
    });
    </script>
</head>
<body class='default'>
    <button id="btn">조회</button>
    <div id='jqxWidget' style="font-size: 13px; font-family: Verdana; float: left;">
        <div id="jqxgrid"></div>
    </div>
</body>
</html>
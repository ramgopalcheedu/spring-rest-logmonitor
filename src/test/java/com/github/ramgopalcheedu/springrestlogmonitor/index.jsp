<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%--   <style type="text/css">
           <%@include file="dist/themes/default/style.css"%>
       </style>--%>


    <style type="text/css">
        .thirty {
            width: 30%;
            display: block;
            float: left;
        }
        .seventy {
            width: 70%;
            display: block;
            float: right;
        }
        .no_checkbox>i.jstree-checkbox
        {
            display:none
        }
        .myScrollableBlock {
            display: block;
            height: 400px;
            overflow: auto;
        }

        table.dataTable.select tbody tr,
        table.dataTable thead th:first-child {
            cursor: pointer;
        }

       /* tr.group,
        tr.group:hover {
            background-color: #ddd !important;
        }*/
    </style>

    <!--  <link rel="stylesheet" href="dist/themes/default/style.min.css" /> -->
    <!-- <link rel="stylesheet" href="bootstrap/css/app.css" /> -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/select/1.3.0/js/dataTables.select.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <!--  <script src="dist/jstree.js"></script> -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/select/1.3.0/css/select.dataTables.min.css">

    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <title>Wire Center</title>
</head>
<body>
<div class="container-fluid">
    <nav class="navbar navbar-dark bg-dark">
        <span class="navbar-brand mb-0 h1">WireCenters</span>
    </nav>


    <!-- Modal -->
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Alert</h4>
                </div>
                <div class="modal-body">
                    <p>You Current VSAP Selection is not matching Previous Selection</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>

    <div class="card text-left">
   <%--     <div class="card-header">
            <div class="input-group">
                <input type="text" class="form-control hasclear" id="search-input" placeholder="Search">
                <span class="input-group-btn">
				    <button id="btnCollapse" type="button" class="btn btn-success"> Expand
				    </button>
			    </span>
            </div>
        </div>--%>

       <%-- <div class="card-body myScrollableBlock">
                <div id="treeview"></div>
        </div>--%>

        <div class="card-body">
        <table id="treetable" class="display select" style="width:100%">
            <thead>
            <tr>
                <th></th>
                <th>Pole Number</th>
                <th>Access</th>
                <th>City</th>
                <th>Township</th>
                <th>Location</th>
                <th>VSAP Number</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td></td>
                <td>215454</td>
                <td>down</td>
                <td>Freehold</td>
                <td>Freehold Mall</td>
                <td><a target="_blank" href="http://www.google.com/maps/place/49.46800006494457,17.11514008755796/@49.46800006494457,17.11514008755796,17z">Location</a></td>
                <td>232323244243242</td>
            </tr>
            <tr>
                <td></td>
                <td>215455</td>
                <td>up</td>
                <td>Freehold</td>
                <td>VerizonLane</td>
                <td><a target="_blank" href="http://www.google.com/maps/place/49.46800006494457,17.11514008755796/@49.46800006494457,17.11514008755796,17z">Location</a></td>
                <td>232323244243242</td>
            </tr>
            <tr>
                <td></td>
                <td>215456</td>
                <td>up</td>
                <td>Freehold</td>
                <td>TulipLane</td>
                <td><a target="_blank" href="http://www.google.com/maps/place/49.46800006494457,17.11514008755796/@49.46800006494457,17.11514008755796,17z">Location</a></td>
                <td>232323244243244</td>
            </tr>
            <tr>
                <td></td>
                <td>215456</td>
                <td>up</td>
                <td>Newark</td>
                <td>downtown</td>
                <td><a  target="_blank" href="http://www.google.com/maps/place/49.46800006494457,17.11514008755796/@49.46800006494457,17.11514008755796,17z">Location</a></td>
                <td>121212121212</td>
            </tr>
            <tr>
                <td></td>
                <td>215456</td>
                <td>up</td>
                <td>Newark</td>
                <td>Eastnewark</td>
                <td><a target="_blank" href="http://www.google.com/maps/place/49.46800006494457,17.11514008755796/@49.46800006494457,17.11514008755796,17z">Location</a></td>
                <td>232323244243244</td>
            </tr>
            </tbody>
        </table>
        </div>


        <div class="card-footer">
            <form id="poledata" method="post" action="/update/">
                <div class="form-group">
                    <label for="vsapJobNumber">VSAP Job Number</label>
                    <input type="number" onkeydown="javascript: return event.keyCode === 8 || event.keyCode === 46 ? true : !isNaN(Number(event.key))" class="form-control" name="vsapJobNumber" id="vsapJobNumber" aria-describedby="vsapHelp" placeholder="Enter VSAP JOB NUMBER EX:123456"></input>
                    <small id="vsapHelp" class="form-text text-muted">Please enter VSAP Number associated with selected poles job.</small>
                </div>
                <button type="submit" id="submit" class="btn btn-primary">Submit</button>
                <button id="btnProcess" class="btn btn-primary" type="button" disabled>
                    <span class="spinner-grow spinner-grow-sm" role="status" aria-hidden="true"></span>
                    Processing...
                </button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
<script>
    $(document).ready(function(){

        var rows_selected = [];
        var groupColumn = 3;
        var table = $('#treetable').DataTable({
            /* columnDefs: [ {
               orderable: false,
               className: 'select-checkbox',
               targets:   0
           } ],*/
            'columnDefs': [{
                'targets': 0,
                'searchable': false,
                'orderable': false,
                'className': 'dt-body-center',
                'render': function (data, type, full, meta) {
                    return '<input type="checkbox" class="chkRow" name="id[]" value="' + $('<div/>').text(data).html() + '">';
                }
            }],
            select: {
                style: 'multi',
                selector: 'td:first-child'
            },
            order: [[ 1, 'asc' ]],
            "drawCallback": function(settings) {
                var api = this.api();
                var rows = api.rows({
                    page: 'current'
                }).nodes();

                var last = null;

                api.column(groupColumn, {
                    page: 'current'
                }).data().each(function(group, i) {

                    if (last !== group) {
                        $(rows).eq(i).before(
                            '<tr class="group"><td colspan="7">' + group + '</td></tr>'
                        );

                        last = group;
                    }
                });
            }
        });

        table
            .on( 'user-select', function ( e, dt, type, cell, originalEvent ) {
                if ( originalEvent.target.nodeName.toLowerCase() === 'td' ) {
                    e.preventDefault();
                }
            } );

        // Order by the grouping
        $('#treetable tbody').on('click', function({target}) {
            if (target.parentNode.className !== 'group') return;
            let $next = $(target).parent().next();

            while ($next.length && $next.is('[role=row]')) {
                $next.slideToggle();
                $next = $next.next();
            };

        });

        $(document).on('click', '.chkRow', function () {

            var $row = $(this).closest('tr');

            // Get row data
            var data = table.row($row).data();

            if(data!==undefined){
                // Get row ID and Vsap
                var rowId = data[1];
                var vsap = data[6];

                const vsapcheck = rows_selected.map(e => e.VsapNumber).indexOf(vsap);

                if(rows_selected.length!==0 && vsapcheck===-1){
                   // $("#myModal").modal();
                    alert("You Current VSAP Selection is not matching Previous Selections");
                    $(this).prop('checked', false);
                }

                const index = rows_selected.map(e => e.ID).indexOf(rowId);

                // If checkbox is checked and row ID is not in list of selected row IDs
                if(this.checked && index === -1){
                    rows_selected.push(new PoleData(rowId,vsap));

                // Otherwise, if checkbox is not checked and row ID is in list of selected row IDs
                } else if (!this.checked && index !== -1){
                    rows_selected.splice(index, 1);
                }
            }

            if(rows_selected.length!==0){
                enableform();
            }else{
                disableform();
            }
        });

        function PoleData(id,vsapnumber) {
            this.ID=id;
            this.VsapNumber=vsapnumber;
        }

        hideLoadingBtn();
        disableform();

        $("#search-input").keyup(function () {
            var searchString = $(this).val();
            $('#treeview').jstree('search', searchString);
        });

        $('#poledata').submit( processForm );

        function processForm( e ) {
            e.preventDefault();
            var url = $(this).attr("action"); //get form action url
            var request_method = $(this).attr("method"); //get form GET/POST method
            var formData = {
                'poleid': $('#vsapJobNumber').val()
            };

            hideSubmitBtn();

            $.ajax({
                url: url,
                dataType: 'json',
                type: request_method,
                contentType: 'application/json',
                data: $(this).serialize(),
                success: function (data, textStatus, jQxhr) {
                    clearSelection();
                    },
                error: function (jqXhr, textStatus, errorThrown) {
                    alert("There was an error submitting comment");
                    clearSelection();
                },
                complete: function(){
                    resetform();
                    hideLoadingBtn();
                }
            });
        }

        $('#btnCollapse').click(function(){
            if($('#btnCollapse').text().trim() === 'Expand'){
                $('#btnCollapse').html(' Collapse ');
                $('#treeview').jstree('open_all');
            }else{
                $('#btnCollapse').html(' Expand ');
                $('#treeview').jstree('close_all');
            }
        });


        function hideSubmitBtn(){
            $("#submit").hide();
            $("#btnProcess").show();
        }
        function hideLoadingBtn(){
            $("#btnProcess").hide();
            $("#submit").show();
        }

        function clearSelection(){
            $('#treetable tbody tr td input[type="checkbox"]').each(function(){
                $(this).prop('checked', false);
            });
        }

        function resetform(){ $("#poledata")[0].reset();}
        function disableform(){$('#poledata *').prop('disabled',true);}
        function enableform(){$('#poledata *').prop('disabled',false);}
    });

    function getTree() {

        var jsondata = [
            { "id": "1111", "parent": "#", "text": "Freehold" },
            { "id": "1123", "parent": "#", "text": "NJS" },
            { "id": "1143", "parent": "1111", "text": "Pole1" },
            { "id": "1166", "parent": "1123", "text": "Pole2" },
        ];
        var data = [
            {
                "id": "1234",
                "text": "FreeHold",
                "a_attr": {
                    class: "no_checkbox"
                },
                "state":
                    { "opened": false},
                "children":
                    [
                        {"text": "Pole1"},
                        {"text": "Pole2"},
                        {"text": "pole3"}
                    ]
            },
            {
                "id": "22322",
                "text": "NYSE",
                "a_attr": {
                    class: "no_checkbox"
                },
                "state": { "opened": false },
                "children": [{"test": "Pole5"},
                    {"text": "Pole6"},
                    {"text": "pole7"}]},
            {
                "id": "343434",
                "text": "NJS",
                "a_attr": {
                    class: "no_checkbox"
                },
                "state": { "opened": false },
                "children": [{"text": "Pole1"},
                    {"text": "Pole2"},
                    {"text": "pole3"}]
            },{
                "id": "43434343",
                "text": "Harrison",
                "a_attr": {
                    class: "no_checkbox"
                },
                "state": { "opened": false },
                "children": [{"text": "Pole27"},
                    {"text": "Pole28"},
                    {"text": "pole38"}]
            },
            {
                "id": "354545",
                "text": "Newark",
                "a_attr": {
                    class: "no_checkbox"
                },
                "state": { "opened": false },
                "children": [{"text": "Pole27"},
                    {"text": "Pole28"},
                    {"text": "pole38"}]
            }
        ];
        return data;
    }
</script>

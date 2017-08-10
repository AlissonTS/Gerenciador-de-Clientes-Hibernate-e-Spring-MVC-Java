        $(document).ready(function(){

            $.ajax({
                url : "grafico-mes.html",
                dataType : "JSON",
                success : function (result) {
                    google.charts.load('current', {
                       'packages' : ['corechart']
                    });
                    google.charts.setOnLoadCallback(function () {
                       drawChart(result);
                    });
                }
            });

            function drawChart(result){
                var data = new google.visualization.DataTable();
                data.addColumn('string', 'Mes');
                data.addColumn('number', 'Quantidade');
                var dataArray = [];

                $.each(JSON.parse(result), function(i, obj){
                   dataArray.push([obj.coluna, obj.quantidade]);
                });

                data.addRows(dataArray);

                var piechart_options = {
                    title : 'Grafico de Pizza : Quantidade de clientes por mes do ano (Data de nascimento)',
                    width : 500,
                    height : 300
                };
                var piechart = new google.visualization.PieChart(document.getElementById('piechart_div'));
                piechart.draw(data, piechart_options);

                var barchart_options = {
                    title : 'Grafico de Barras : Quantidade de clientes por mes do ano (Data de nascimento)',
                    width : 500,
                    height : 300,
                    legend : 'none',
                    vAxis: {format : "#"}
                };

                var barchart = new google.visualization.BarChart(document.getElementById('barchart_div'));
                barchart.draw(data, barchart_options);
            }
        });
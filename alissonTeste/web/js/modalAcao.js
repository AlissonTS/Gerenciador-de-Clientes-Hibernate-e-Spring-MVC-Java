        $('#formularioAlterar').on('submit', function(event){
            event.preventDefault();
            $("#confirmAlterar").modal("show");
        });

        $('#yesAlterar').click(function(){
            $('#formularioAlterar').unbind('submit').submit();
        });

        $(document).on('click', '#tblClientes #excluirCliente', function(e) {
            e.preventDefault();

            var id = $(this).closest('tr').find('th[data-idcliente]').data('idcliente');

            $("#id").val(id);
        });
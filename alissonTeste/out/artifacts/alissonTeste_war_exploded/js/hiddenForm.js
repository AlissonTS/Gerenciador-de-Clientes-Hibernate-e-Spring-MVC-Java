        $(document).ready(function(){
            $('#inputOculto').hide();
            $('#inputOculto2').hide();

            $('#avisoDiv').hide();

            $("#senha").prop('required', false);
            $("#senhaN").prop('required', false);

            $('#redefinir').change(function() {
                if ($('#redefinir').val() === 'Sim') {
                    $('#inputOculto').show();
                    $('#inputOculto2').show();
                    $("#senha").prop('required', true);
                    $("#senhaN").prop('required', true);
                } else {
                    $('#inputOculto').hide();
                    $('#inputOculto2').hide();
                    $("#senha").prop('required', false);
                    $("#senhaN").prop('required', false);
                    $('#avisoDiv').hide();
                }
            });

            $("form").submit(function(event){
                event.preventDefault();
                if ($('#senha').val() === $('#senhaN').val() && $('#redefinir').val() === 'Sim') {
                    $("#confirmAlterar").modal("show");
                }else if($('#redefinir').val() !== 'Sim'){
                    $("#confirmAlterar").modal("show");
                }else{
                    $('#avisoDiv').show();
                    $("#avisoContent").html("<Strong> Erro</Strong> Senhas diferentes!");
                    return false;
                }
            });

            $('#yesAlterar').click(function(){
                $('#form').unbind('submit').submit();
            });
        });
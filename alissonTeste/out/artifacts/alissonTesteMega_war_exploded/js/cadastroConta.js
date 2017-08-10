            $(document).ready(function(){
                $('#avisoDiv').hide();

                $("form").submit(function(event){
                    if ($('#senha').val() === $('#senhaN').val()) {
                        return true;
                    }else{
                        $('#avisoDiv').show();
                        $("#avisoContent").html("<Strong> Erro</Strong> Senhas diferentes!");
                        return false;
                    }
                });
            });
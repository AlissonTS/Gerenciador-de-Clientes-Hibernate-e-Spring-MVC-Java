        $(document).ready(function() {

            function limpa_formulario_cep() {
                $("#logradouro").val("");
                $("#bairro").val("");
                $("#municipio").val("");
                $("#estado").val("");
            }

            //Quando o campo cep perde o foco.
            $("#cep").blur(function() {

                //Nova variavel "cep" somente com digitos.
                var cep = $(this).val().replace(/\D/g, '');

                //Verifica se campo cep possui valor informado.
                if (cep != "") {

                    //Expressao regular para validar o CEP.
                    var validacep = /^[0-9]{8}$/;

                    //Valida o formato do CEP.
                    if(validacep.test(cep)) {

                        //Preenche os campos com "..." enquanto consulta webservice.
                        $("#logradouro").val("...");
                        $("#bairro").val("...");
                        $("#municipio").val("...");
                        $("#estado").val("...");

                        //Consulta o webservice viacep.com.br/
                        $.getJSON("//viacep.com.br/ws/"+ cep +"/json/?callback=?", function(dados) {

                            if (!("erro" in dados)) {
                                //Atualiza os campos com os valores da consulta.
                                $("#logradouro").val(dados.logradouro);
                                $("#bairro").val(dados.bairro);
                                $("#municipio").val(dados.localidade);
                                $("#estado").val(dados.uf);
                            } //end if.
                            else {
                                //CEP pesquisado nao foi encontrado.
                                limpa_formulario_cep();
                            }
                        });
                    } //end if.
                    else {
                        //cep invalido.
                        limpa_formulario_cep();
                    }
                } //end if.
                else {
                    //cep sem valor, limpa formulario.
                    limpa_formulario_cep();
                }
            });
        });
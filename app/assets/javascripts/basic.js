$(document).on ("turbolinks:load", function(){
    M.AutoInit();
    $('.datepicker').datepicker({
        format: 'dd/mm/yyyy',
        i18n: {
            months: ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"],
            monthsShort: ["Jan", "Fev", "Mar", "Abr", "Mai", "Jun", "Jul", "Ago", "Set", "Out", "Nov", "Dez"],
            weekdays: ["Segunda","Terça", "Quarta", "Quinta", "Sexta", "Sábado", "Domingo"],
            weekdaysShort: ["Seg","Ter", "Qua", "Qui", "Sex", "Sáb", "Dom"],
            weekdaysAbbrev: ["S","T", "Q", "Q", "S", "S", "D"],
            cancel: "Voltar",
            done: "Confirmar"
        }
    });
});

function addPerson(){
    if ($("#add-person-input").val()==""){
        var msg = '<p style="color: white">Preencha os campos requeridos!</p>';
        M.toast({html: msg, classes: 'red'});
    }else{
        $("#hidden_person").val($("#add-person-input").val());
        $("#hidden_type").val("add");
        $("#hidden-person-add-form").submit();
    }
}

function removePerson(person){
    $("#hidden_person").val(person);
    $("#hidden_type").val("remove");
    $("#hidden-person-add-form").submit();
}
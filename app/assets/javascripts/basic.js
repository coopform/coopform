$(document).on ("turbolinks:load", function(){
    M.AutoInit();
    $('.datepicker').datepicker({
        format: 'dd/mm/yyyy',
        i18n: {
            months: ["Styczeń", "Luty", "Marzec", "Kwiecień", "Maj", "Czerwiec", "Lipiec", "Sierpień", "Wrzesień", "Październik", "Listopad", "Grudzień"],
            monthsShort: ["Sty", "Lut", "Mar", "Kwi", "Maj", "Cze", "Lip", "Sie", "Wrz", "Paź", "Lis", "Gru"],
            weekdays: ["Poniedziałek","Wtorek", "Środa", "Czwartek", "Piątek", "Sobota", "Niedziela"],
            weekdaysShort: ["Pon","Wt", "Śr", "Czw", "Pt", "Sob", "Nd"],
            weekdaysAbbrev: ["P","W", "Ś", "C", "P", "S", "N"],
            cancel: "Wróć",
            done: "Potwierdź"
        }
    });
});

function addPerson(){
    if ($("#add-person-input").val()==""){
        var msg = '<p style="color: white">You need to fill person data!</p>';
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
$('document').ready(function(){
  document.addEventListener("turbolinks:load", function(){
    $("#datepicker").datepicker({
      format: 'dd/mm/yyyy',
      autoclose: true, 
      todayHighlight: true
    });
  });

  document.addEventListener("turbolinks:load", function(){
    $('#brand_id').click(function(){
      var element_id = $(this).data('target');
      // console.log(element_id);
      // var target_id = $("#" + element_id).attr('data-target');
      // if ($("#" + element_id)){
      //   $("#" + element_id).empty();
      // }
      $("#" + element_id).empty();
      if($(this).val() != ""){
        var url = $(this).data('url') + $(this).val();
        $.get(url, function(datas){
          if(datas){
            // $("#" + element_id).empty();
            $.each(datas, function(index, value){
              option_val = value['id'] ? value['id'] : '';
              $("#" + element_id).append(
                "<option value ='" + option_val + "'>" +
                  value['name'] +
                 "</option>"
              );
            }); 
          }
        });
      }
    });
  });
});
$('document').ready(function(){
  document.addEventListener("turbolinks:load", function(){
    $("#datepicker").datepicker({
      format: 'dd/mm/yyyy',
      autoclose: true, 
      todayHighlight: true
    });
  
    $('#brand_id').click(function(){
      var element_id = $(this).data('target');
      $("#" + element_id).empty();
      if($(this).val() != ""){
        var url = $(this).data('url') + $(this).val();
        $.get(url, function(datas){
          if(datas){
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

    $(".autocomplete").each(function() {
      $(this).autocomplete({
        source: $(this).data('url')
      });
    });
  });
});
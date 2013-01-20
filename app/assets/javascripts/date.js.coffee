$(document).on 'focus', '[data-behaviour~="datepicker"]', (event) ->
  $(this).datepicker({ format: 'mm-dd-yyyy', weekStart: 1, autoclose: true })

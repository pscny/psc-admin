$(document).on 'focus', '[data-behaviour~="datepicker"]', ->
  $(this).datepicker({ format: 'mm-dd-yyyy', weekStart: 1, autoclose: true })

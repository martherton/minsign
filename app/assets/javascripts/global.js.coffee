;$(document).on "ready page:load", ->

  $("div.input.file").append("<a class=\"upload_override\">Choose a file</a>")

  $(".upload_override").click (e) ->
    e.preventDefault
    $(@).prev().click()

  $('.flash').delay(5000).slideUp(1000)

  $("#upload_override").click (e) ->
    e.preventDefault
    $('#job_company_logo').click()

  $('select').chosen({disable_search_threshold: 2});


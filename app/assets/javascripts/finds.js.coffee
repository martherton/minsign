# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->

jQuery ->
  $('#find_tag_list_tokens').tokenInput '/finds/tags.json',
    theme: 'facebook'
    minChars: 2
    allowCustomEntry: true
    preventDuplicates: true
    prePopulate: $('#find_tag_list_tokens').data('load')

  $(document).ready(ready)
	$(document).on('page:load', ready)
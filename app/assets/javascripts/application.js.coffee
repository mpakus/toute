#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require nprogress
#= require nprogress-turbolinks
#= require jquery
#= require bootstrap-sprockets
#= require_tree .

$(document).on 'ajax:success', '.delete-comment', ->
  $(@).closest('.list-group-item').slideUp()

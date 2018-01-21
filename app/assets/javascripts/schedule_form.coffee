# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class window.ScheduleForm
  constructor: (selectors, form) ->
    @selectors = selectors
    @form = form

  onChangeSelector: ->
    _self = this
    for selector in @selectors
      selector.addEventListener 'change', (e) ->
        task_kind = this.value
        _self.hideAllKindForms()
        _self.showKindForm(task_kind)

  hideAllKindForms: ->
    for children  in @form.children
      children.classList.add("hidden")

  showKindForm: (task_kind) ->
    form_dom = document.getElementById(task_kind)
    form_dom.classList.remove("hidden")

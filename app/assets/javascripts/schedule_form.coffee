class window.ScheduleForm
  constructor: (selectors, form) ->
    @selectors = selectors
    @form = form

  onChangeSelector: ->
    _self = this
    for selector in @selectors
      selector.addEventListener 'change', (e) ->
        task_kind = this.value
        form_dom = document.getElementById(task_kind)
        _self.hideAllKindForms()
        _self.showKindForm(form_dom)

  hideAllKindForms: ->
    for children  in @form.children
      @hideKindForm(children)

  hideKindForm: (ele) ->
    ele.classList.add("hidden")
    inputs = ele.getElementsByTagName("input")
    for input in inputs
      input.disabled = true

  showKindForm: (ele) ->
    ele.classList.remove("hidden")
    inputs = ele.getElementsByTagName("input")
    for input in inputs
      input.disabled = false

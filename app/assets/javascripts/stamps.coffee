class window.Stamp
  constructor: (button_dom) ->
    @button = button_dom

  onClickButton: () ->
    _self = this
    @button.addEventListener "click", (e) ->
      _self.sendRequest()

  sendRequest: ->
    reportId = @button.getAttribute('data-report-id')
    kind = @button.getAttribute('data-kind')
    axios.post('/stamps.json',
      { report_id: reportId, kind: kind }
    ).then (response) ->
      console.log response
    .catch (error) ->
      console.log error

